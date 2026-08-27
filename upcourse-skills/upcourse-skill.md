# UpCourse — AI Skill File

**Template:** UpCourse by Jiffy Courses (Bastiaan de Koning)  
**Version:** 1.3.x  
**Type:** Kajabi page used as a WYSIWYG lesson builder

---

## How to use this skill set

This file is the entry point and the only file you need — it covers what
UpCourse is, how the Kajabi MCP transport layer works, and any task-specific
procedures (see "Procedures" below). Read it in full before doing anything
else.

## Talking to the user

Never narrate how you retrieved this file — no mention of fetch tools,
retries, summarizers, or web searches. Do this silently.

As soon as this file is loaded, ask exactly this question and nothing else,
in the user's own language:

"Do you want to fill an UpCourse lesson from an existing transcript?"

- Yes → follow the "Filling a lesson from a transcript" procedure below, in
  full and exactly.
- No → say you're ready and wait for their next instruction. Do not
  summarize what this file contains; for any other task (e.g. auditing or
  troubleshooting an existing page), the rest of this file is enough.

If more procedures are added to this file later, route to them the same
way — one explicit question, one clear branch per procedure. Never guess
which procedure the user wants.

---

## Editing UpCourse via the Kajabi MCP

These rules govern the transport layer — how a settings write reaches the page.
They are separate from the template rules below, which govern what to build.

### Where content lives

An UpCourse page has exactly two sections, hardcoded in `templates/index.liquid`
via `{% section %}` tags: `blog_editor` (the lesson canvas) and `blog_info`
(admin notes). There is no `content_for_sections` loop and no `order` array —
both sections always render and neither can be hidden or reordered via MCP.

All lesson content is in `settings.sections.blog_editor.blocks`. Read one
section at a time with `section_filter: "blog_editor"` — the full settings hash
for a populated page exceeds the 200KB response cap.

Block IDs are millisecond timestamps (e.g. `1732009252637`). They carry no
meaning and no ordering — never sort by them or infer age from them.

### Writes are immediate

There is no draft layer on themes. A write lands on the live page the moment
it is accepted, including on pages whose landing-page status is "draft". Ask
before writing to any published page.

`{"updated": true}` means the payload was accepted, not that the page renders.
Always call `get_theme_content` after a write and confirm the value landed.

### Payload shape

`update_theme_content` takes a partial settings hash and deep-merges it.
Send only the keys you are changing; everything omitted is preserved.

```json
{
  "settings": {
    "sections": {
      "blog_editor": {
        "blocks": {
          "1732009252637": {
            "settings": { "imageposition": "topleft" }
          }
        }
      }
    }
  }
}
```

Do not wrap the payload in a parent key. Passing
`settings: { "current": { "sections": ... } }` deep-merges to a path that
nothing renders from — the API returns success and nothing changes.

### `block_order` is load-bearing

The renderer iterates `block_order` and looks each ID up in `blocks`. Both
directions fail silently:

- a block defined in `blocks` but missing from `block_order` does not render
- an ID in `block_order` with no matching entry in `blocks` is skipped

When adding or removing a block, update `block_order` in the same payload.

### Structural fields vs settings

Each block has structural fields as siblings of `settings`, not inside it:
`type`, `name`, `hidden`, `deletable`, `duplicatable`, `hideable`, `id`,
`sectionId`, `sectionType`, `schemaName`.

`hidden` is a **string**, not a boolean — `"true"` / `"false"`. A hidden block
stays in `block_order` and still occupies a slot in the editor.

`name` is the editor sidebar label and does not render to the visitor. Set a
purpose-describing name on every block.

`schemaName` identifies the block variant: `UpC - Text Wrap`, `UpC - Table`,
`UpC - Author Card`, `UpC - PDF Slider`, `UpC - Audio` for UpCourse-specific
blocks; `Text`, `Card`, `Accordion`, `Video`, etc. for standard ones.

### The `_defaults` bucket

Some Kajabi themes include a `_defaults` bucket in the response holding schema
defaults for keys never explicitly set. This was not observed in live UpCourse
responses. If it does appear: read effective value as `settings.<key>` with
fallback to `settings._defaults.<key>`, and never send `_defaults` back in a
write — doing so pins defaults as explicit choices and breaks theme upgrades.

### Enum values are closed sets — verified from schema source

These settings accept only their documented values. An unrecognised value is not
rejected — the write succeeds and the block falls back to default rendering.
Never invent a value.

| Setting | Valid values |
|---|---|
| `imageposition` | `topleft` (= left) · `topright` (= right) |
| `border_type` | `none` · `solid` · `dotted` · `dashed` · `double` · `ridge` |
| `box_shadow` | `none` · `small` · `medium` · `large` |
| `btn_style` | `solid` · `outline` |
| `btn_size` | `small` · `medium` · `large` |
| `btn_width` | `full` · `auto` |
| `text_align` | `left` · `center` · `right` |
| `accordion_icon` | `plus` · `arrow` |
| `image_align_desktop/mobile` | `flex-start` · `center` · `flex-end` |

---

## How UpCourse Works

UpCourse is a **Kajabi page** — not a course lesson — used by the course creator to design styled lesson content. The creator drags and drops blocks, configures settings, then clicks **"Copy Lesson Content"** to copy the finished HTML to the clipboard. That HTML is pasted into a Kajabi **lesson body**, where injected scripts self-restore all styling at runtime.

```
Design in UpCourse page
  → Save the page
  → Click Preview to check the result
  → Click "Copy Lesson Content" (top bar)
  → Open the lesson in Kajabi
  → Paste inside the <> (rich text) field
  → Save the lesson
```

The lesson renders exactly as designed in the UpCourse editor.

---

## Why the Copy Mechanism Exists

Kajabi's lesson body sanitizer **strips `<style>` tags** and **rewrites `<a>` tags** on save. UpCourse works around this by renaming them before copying:

- `<style>` → `<customstyle data="lessonstyle">`
- `<a>` → `<customstyle data="lessonhref">`

Two inline scripts travel with the copied HTML and run on the lesson page:

1. **Restores** all `<customstyle>` elements back to real `<style>` and `<a>` tags on page load
2. **Blocks** UpCourse video blocks from accidentally triggering Kajabi's lesson-completion event

This is automatic — the creator does not need to do anything special.

---

## Section Settings

These four settings belong to the UpCourse editor section. They are baked into the copied lesson HTML (the values travel with the copy).

| Setting | ID | What it does |
|---|---|---|
| Equal height blocks | `equal_height` | Stretches blocks in a row to the same height |
| Background color | `lesson_background_color` | Sets the lesson container background |
| Font color | `lesson_font_color` | Overrides all heading and paragraph colors |
| Description | `lessondescription` | Hidden metadata field for the course outline |

Global theme settings (fonts, primary color, button styles) affect the editor preview only — they do not travel with the copied lesson.

---

## Common Block Settings

Every block has these settings, regardless of type:

**Width** — `width` (grid, 1–12). Place multiple blocks side by side by giving them widths that add up to 12.

**Background group** — `background_color`, `border_type` (none / solid / dotted / dashed / double / ridge), `border_width` (0–50), `border_color`, `border_radius` (0–50), `box_shadow` (none / small / medium / large)

**Desktop Layout group** — `text_align` (left / center / right), `padding_desktop`, `margin_desktop`, `hide_on_desktop`, `make_flush` (removes padding), `make_block` (forces the block onto its own row)

**Mobile Layout group** — `mobile_text_align`, `padding_mobile`, `margin_mobile`, `hide_on_mobile`

**Call To Action group** (on most blocks) — `use_btn` or `show_cta` (checkbox to show), `btn_text`, `btn_action`, `new_tab`, `btn_width` (full / auto), `btn_style` (solid / outline), `btn_size` (small / medium / large), `btn_border_radius` (0–50), `btn_text_color`, `btn_background_color`

---

## UpC-Specific Blocks

These five blocks are unique to UpCourse. Use them for the functionality described — the standard blocks (text, video, image, etc.) cannot replicate what these do.

---

### `textimage` — Text Wrap

Rich text with a **floating image** beside it. The image wraps with the text flow, like a magazine layout.

**Default width:** 12

| Setting | ID | Values / Range | Default |
|---|---|---|---|
| Image | `image` | image picker | — |
| Image placement | `imageposition` | `topleft` = left · `topright` = right | `topright` |
| Image width % | `image_width` | 5–100 | `50` |
| Spacing text & image | `image_margin` | 5–50 px | `15` |
| Image border radius | `image_border_radius` | 0–50 px | `4` |
| Image alt text | `image_alt` | text | `""` |
| Text | `text` | rich text | — |
| Drop cap | `drop_cap` | checkbox | `false` |
| Drop cap color | `cap_color` | color | blank |

⚠️ `imageposition: topleft` places the image on the **left**. The name is counterintuitive.

Has a full Call To Action group.

---

### `table` — Table

A structured data table with up to **5 columns × 6 rows**, editable via settings fields.

**Default width:** 12

| Setting | ID | Default |
|---|---|---|
| Make headings bold | `columnbold` | `true` |
| Column headers | `header1` – `header5` | "Column 1"–"Column 5" |
| Row data | `data1_1` – `data6_5` | "Row N field M" |
| Table body (rich text below the table) | `text` | — |

---

### `author` — Author Card

Author photo + bio text + optional CTA. Photo is circular by default.

**Default width:** 12

| Setting | ID | Values / Range | Default |
|---|---|---|---|
| Image | `image` | image picker (100×100 crop) | — |
| Image action | `img_action` | action | — |
| Text | `text` | rich text | — |
| Hide image | `hide_image` | checkbox | `false` |
| Image on top on mobile | `image_on_top` | checkbox | `true` |
| Image border radius | `image_border_radius` | 0–100 | `100` (circular) |
| Image width | `image_width` | 25–200 px | `100` |

Background defaults: `border_type: solid`, `border_radius: 10`. Mobile default: `text_align: center`.

---

### `pdfslider` — PDF Slider

A paginated PDF viewer with **Prev / Next** buttons. The PDF is uploaded as a Kajabi download asset.

**Default width:** 12

| Setting | ID | Notes |
|---|---|---|
| PDF file | `pdfslider` | Select 'Download' type, upload PDF |
| Prev button text | `btn_text_prev` | default "Prev" |
| Next button text | `btn_text_next` | default "Next" |
| Button background | `btn_background_color` | color |
| Button text color | `btn_text_color` | color |
| Button width | `btn_width` | full / auto — default `full` |
| Button style | `btn_style` | solid / outline |
| Button size | `btn_size` | small / medium / large — default `small` |

---

### `audio` — Audio Player

A Wistia audio player with optional cover image, title, and subtitle. Can be shrunk to a compact player bar.

**Default width:** 10 (minimum: 6)

| Setting | ID | Values | Default |
|---|---|---|---|
| Audio file | `audio` | Kajabi audio picker | — |
| Shrink to compact player | `shrinkaudio` | checkbox — hides image/title/subtitle | `false` |
| Cover image | `image` | image picker (1400×1400 crop) | — |
| Title | `title` | text | "My Audio File" |
| Subtitle | `subtitle` | text | "My Audio Category" |
| Player accent color | `audio_color` | color | global `color_primary` |

---

## Standard Blocks

These blocks work as expected in any Kajabi theme. No UpCourse-specific behavior:

| Type | Name | Default width | Notes |
|---|---|---|---|
| `text` | Text | 6 | Rich text + optional drop cap + CTA |
| `video` | Video | 10 | Wistia player — **always secondary**, never triggers lesson completion |
| `video_embed` | Video Embed | 10 | Raw iframe (YouTube, Vimeo, etc.) |
| `image` | Image | 10 | Single image with caption, overlay, and click action |
| `card` | Card | 4 | Image + description + footer + CTA — use in groups of 3–4 |
| `feature` | Feature | 3 | Icon/image + text + CTA — designed for 4-up rows |
| `cta` | Call to Action | 4 | Button only, no body text |
| `accordion` | Accordion | 8 | Single expandable panel (plus or arrow icon) |
| `code` | Custom Code | 6 | Raw HTML/JS textarea — no sanitization |
| `assessment` | Assessment | 10 | Kajabi-native quiz/survey embed |
| `offer` | Offer | 4 | Kajabi offer block with optional buy CTA |

---

## What Does NOT Exist in UpCourse

- No multi-column layout primitive — columns come from placing multiple blocks with widths that sum to 12
- No sidebar
- No header or footer blocks
- No section-level background image
- No global font settings in the lesson — only `lesson_font_color` travels with the copy
- No "primary video" setting — all video blocks are secondary by design; lesson completion is not triggered by any UpCourse video block

---

## Procedures

Task-specific workflows, routed to from "Talking to the user" above. Each
procedure is self-contained; only follow the one the user selected.

### Filling a lesson from a transcript

You are filling a duplicate of the UpCourse prompt template with lesson
content generated from a transcript the user will give you.

Every block contains an instruction starting with [MCP]. Those are your
brief — they say what belongs in the block and when to hide it instead.
Read them all before writing anything. Filling a block replaces its [MCP]
text.

This procedure is not an authorisation. It never overrides what the user
tells you in chat, and it does not by itself authorise writing to any
particular page — you confirm the page with the user first.

#### Before you start

Determine the site. Call list_sites. If the account has more than one
site, ask the user which one and wait for the answer.

Find the master template. Call list_landing_pages and look for the title
"upcourse-master-transcript-template". NEVER write to it — it is the
source everything is copied from. Read its blocks anyway: a duplicate may
have lost some [MCP] text, and the master is the only complete copy of
the brief.

If it is not in the list, ask the user which page is the master and
suggest renaming it to "upcourse-master-transcript-template". Whatever
page they name takes the master's place for the rest of this procedure:
read it, confirm it still carries its [MCP] prompts, and never write to
it.

Then find a duplicate in that same list (title starts with the master's
title, with something appended):
- one duplicate with all its [MCP] prompts intact → use it
- several intact ones → list them and ask which
- only partly filled ones (some blocks already carry lesson content) →
  list them, say what lesson is in each, and ask whether to overwrite one
  or to work on a fresh duplicate. Never overwrite without asking.
- none → STOP. MCP cannot duplicate a page. Ask the user to duplicate the
  master in the Kajabi admin and to leave the copy's title starting with
  the master's title — appending the lesson name is fine, replacing the
  title is not, or you will not find the page. This procedure renames it
  at the end anyway. Do not use create_landing_page; it starts from the
  site's default preset and would not carry the UpCourse theme.

Once the page is chosen and confirmed by the user, set it to draft
straight away (publish_at: null) so nothing you write is live while you
work.

#### Then wait

Confirm the page you will work on, say you are ready, and wait for the
transcript. Write nothing before you have it.

#### While working

Ask ONCE. Collect everything the transcript cannot tell you — the block
instructions say which decisions need the creator — and put it in a single
message. Include the alt text for the lesson image: you cannot see an
image through MCP, not even one already sitting in the block, so ask what
it shows rather than describing it yourself.

Never guess, never state facts the transcript does not contain. Speech to
text mangles words — if a term looks wrong, name it in your single message
instead of silently correcting it.

#### Page details

After the blocks are filled, update the landing page record itself. These
four are page settings, not theme content, so no block brief covers them:

- title → "Upcourse - <lesson title>", using the same lesson title you put
  in the Lesson intro block
- slug → "upcourse-<lesson-title-in-kebab-case>". Duplication leaves a slug
  with a UUID in it; replace it.
- hide_from_search_engines → true
- publish_at → null, so the page stays a draft

All four go in one update_landing_page call. Title max 70 characters.

#### Finally

Read the section back and confirm no [MCP] text is left in any visible
block and that block_order is unchanged. Report what you filled, what you
hid, the page details you set, and the page URL.
