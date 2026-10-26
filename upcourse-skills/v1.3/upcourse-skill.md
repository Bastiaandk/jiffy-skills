# UpCourse — AI skill

**Theme:** UpCourse by JiffyCoursesOnline (theme author) · **Version line:** 1.3.x
**Type:** a Kajabi landing page used as a lesson builder

This file covers what is specific to UpCourse and applies to every UpCourse page and template.
What is specific to one template lives in that page's AI brief. Everything else on the page is a
standard Kajabi landing-page block: read its keys and defaults from `get_theme_content`
(`_defaults`).

---

## Before any write

- **The theme schema wins.** If this file and `_defaults` disagree, `_defaults` matches the installed
  version — follow it.
- **Writes are immediate.** There is no draft layer on themes, also not on a draft landing page.
  Ask before writing to a published page. Once the user has confirmed the page you will work on,
  setting it to draft needs no extra question.
- **Send only changed keys.** `update_theme_content` deep-merges a partial settings hash.
- **Read back after every write** with `get_theme_content` (`section_filter`). `{"updated": true}`
  means the payload was accepted, not that the page renders.
- **Never write `ai_guide` or `ai_guide_lock`.** They are the pointer to this file.

### Toolsets

The Kajabi connector keeps at most 3 toolsets active; enabling a fourth switches off the least
recently used one. You always need `themes` (page content) and `pages` (landing pages). Enable
others, such as `courses`, only for the step that needs them, and make sure `themes` is active
again before you write.

---

## The AI brief

`blog_info` → `ai_brief` holds the brief of the template this page was made from. Read it first:
`get_theme_content` with `section_filter: "blog_info"`.

- **Not empty:** it is the template's brief, written by the theme author or the course creator.
  It says what the page is for and what is specific to this template. Together with the ✏️ texts
  in the `blog_editor` blocks and the rules below, it is your brief for this page. Follow it,
  unless the user tells you otherwise in chat. It never authorises a write the user has not
  confirmed.
- **Empty or missing:** the page has no fixed purpose. Work from the user's request. (An empty
  brief does not appear in `settings` or `_defaults` at all.)
- **✏️ texts** are placeholders: block texts that start with the pencil emoji ✏️ and say, in
  plain words, what belongs in the block. The brief adds the technical rules per block. Filling a
  block replaces its ✏️ text. No visible block may keep ✏️ text.
- Write to `ai_brief` only when the user asks you to write or change a brief (see "Writing an AI
  brief" below).

## Working with a template

These rules apply to every page whose brief says it is a template.

### Master and copies

- **Never write to the master.** The brief names the master's title. If the page title differs,
  ask the creator whether this page is the master. Read the master only to recover ✏️ texts a copy
  may have lost.
- **Master published?** Suggest the creator sets the master to draft, so every copy starts as a
  draft.
- **Work on a copy.** An empty copy's title starts with the master's title; a filled copy's title
  follows the pattern the brief gives under page details. List the landing pages to find them.
- **No copy:** ask the creator to duplicate the master in Kajabi and keep the start of the title.
  The MCP cannot duplicate pages, and `create_landing_page` would not carry the UpCourse theme.
- **Several copies, or copies with content:** list them, say what is on each, and ask which one.
  Never overwrite content without asking.
- **Once the creator has confirmed the copy,** set it to draft (`publish_at: null`) before writing.

### Source

- **One source per copy.** If the source changes halfway, ask whether to start over on this copy.
- **Can't find or read the source?** Ask the creator to paste it. Do not switch to other
  connectors or tools unless the creator asks.
- **Language:** write in the language of the source, unless the creator says otherwise.
- **Never add facts** the source does not contain.

### Questions

- **Ask once.** Put every question the brief, its blocks and the ✏️ texts raise in one message.
- **Give the default for each question** ("no answer = the image block stays hidden").
- **Wait.** Write nothing until the creator answers or tells you to go ahead with the defaults.

### Lesson title

If the source has a title (a Kajabi lesson, a video, a file name), use it as it is. Otherwise
derive one from the content and put it to the creator in your questions.

### Finish

Read `blog_editor` back. No visible block may have ✏️ text, and `block_order` must be unchanged
unless the brief says otherwise. Report what you filled, what you hid, the page details you set,
and the page URL. Tell the creator to copy the lesson with **Copy Lesson Content**.

---

## How UpCourse works

The course creator designs a lesson on an UpCourse page, then clicks **Copy Lesson Content** in the
top bar. That copies the HTML of the `blog_editor` section to the clipboard. The creator pastes it
into the lesson body in Kajabi's code view (the `<>` button), replacing the old content, and saves.
Scripts in the pasted HTML restore the styling when the lesson loads.

You cannot copy or paste for the user. When the page is ready, tell them to save and preview the
page, click **Copy Lesson Content**, and paste into the lesson's code view.

### What travels with the copy

| Travels into the lesson | Stays on the UpCourse page |
|---|---|
| All visible `blog_editor` blocks | `blog_info` (Admin Info): `blogtitle`, image, AI brief |
| `blog_editor` settings: `equal_height`, `lesson_background_color`, `lesson_font_color`, `lessondescription` | Global theme settings (fonts, primary color, buttons) — they style the editor preview only |

- `lessondescription` is rendered hidden at the top of the lesson, so Kajabi uses it as the lesson
  excerpt in the course outline.
- `blogtitle` is the creator's reference title for the page. Set it to the lesson title.
- A lesson that was pasted earlier does not change when the page changes. The creator must copy
  and paste again.

---

## Editing through the Kajabi MCP

### Where content lives

The page has exactly two sections, hardcoded in the template: `blog_editor` (the lesson) and
`blog_info` (Admin Info). There is no `content_for_index` order; neither section can be added,
removed or reordered. All lesson content is in `settings.sections.blog_editor.blocks`.

Read one section at a time with `section_filter` — a populated `blog_editor` can exceed the default
response budget.

### Payload shape

```json
{
  "settings": {
    "sections": {
      "blog_editor": {
        "blocks": {
          "1732009252637": { "settings": { "imageposition": "topleft" } }
        }
      }
    }
  }
}
```

### Blocks

- **`block_order` decides what renders.** A block missing from `block_order` does not render; an ID in
  `block_order` without a block is skipped. Adding or removing a block: update `block_order` in the
  same payload.
- **Structural fields sit next to `settings`**, not inside it: `type`, `name`, `hidden`, `id`,
  `sectionId`, `sectionType`, `schemaName`, `deletable`, `duplicatable`, `hideable`.
- **`hidden` is a string:** `"true"` / `"false"`. A hidden block is not copied into the lesson.
- **`name` is the editor label.** Give every new block a name that says what it is for.
- **Block IDs** are timestamps without meaning. Never sort by them.
- **Width** is a 12-column grid (`width`, `"1"`–`"12"`). Blocks sit side by side when their widths
  add up to 12; `make_block: true` forces a block onto its own row.
- An unknown option value is accepted by the API and then ignored by the theme. Use only the
  values listed here or in `_defaults`.
- **`_defaults` only lists block types already on the page.** For an UpCourse block, use the
  tables below. For a standard block type that is not on the page yet, copy the settings of an
  existing block of that type on another UpCourse page, or ask the creator to add one in the
  editor first.

### Images and media

- You cannot upload files or see images. Use image URLs that already exist on the site, and ask
  the creator what an image shows before writing alt text.
- You cannot browse lesson thumbnails. Ask for an image that is already in the site's media
  library, or hide the image block.
- A media ID in a lesson is not the ID of the same file in the media library. Search the library
  by name or title instead.
- Audio, video and PDF files are picked in the Kajabi editor; ask the creator to select them there.

---

## UpCourse blocks

Five blocks exist only in UpCourse (`schemaName` starts with `UpC -`).

### Shared settings

Most UpCourse blocks have these groups. Per block, the tables below list which ones and any
default that differs.

**Background**

| Setting | Values |
|---|---|
| `background_color` | color, blank allowed |
| `border_type` | `none` · `solid` · `dotted` · `dashed` · `double` · `ridge` |
| `border_width` | 0–50 |
| `border_color` | color, blank allowed |
| `border_radius` | 0–50 |
| `box_shadow` | `none` · `small` · `medium` · `large` |

**Desktop Layout / Mobile Layout**

| Setting | Values |
|---|---|
| `hide_on_desktop`, `hide_on_mobile` | checkbox |
| `text_align`, `mobile_text_align` | `left` · `center` · `right` |
| `padding_desktop`, `margin_desktop`, `padding_mobile`, `margin_mobile` | `{"top": "15", "right": "15", "bottom": "15", "left": "15"}` (px, as strings) |
| `make_flush` | checkbox: remove the block's padding (desktop group) |
| `make_block` | checkbox: place the block on its own row (desktop group) |

**Call To Action**

| Setting | Values |
|---|---|
| `use_btn` | checkbox: show the button |
| `btn_text` | text |
| `btn_action` | link |
| `new_tab` | checkbox |
| `btn_background_color`, `btn_text_color` | color, blank = global button colors |
| `btn_width` | `full` · `auto` |
| `btn_style` | `solid` · `outline` |
| `btn_size` | `small` · `medium` · `large` |
| `btn_border_radius` | text (px) |

### `textimage` — UpC - Text Wrap

Rich text with an image floating beside it, wrapped by the text. Default width 12.
Groups: Call To Action, Background, Desktop Layout, Mobile Layout.

| Setting | Values | Default |
|---|---|---|
| `image` | image | — |
| `imageposition` | `topleft` = image **left** · `topright` = image right | `topright` |
| `image_width` | 5–100 (% of the block) | `50` |
| `image_margin` | 5–50 px | `15` |
| `image_border_radius` | 0–50 px | `4` |
| `image_alt` | text | `""` |
| `text` | rich text | — |
| `drop_cap` | checkbox: enlarge the first letter | off |
| `cap_color` | color | blank |

Background defaults: `border_width` 4, `border_radius` 4.

### `table` — UpC - Table

A table of up to 5 columns × 6 rows, filled through settings. Default width 12.
Groups: Background, Desktop Layout, Mobile Layout.

| Setting | Values | Default |
|---|---|---|
| `text` | rich text above the table | — |
| `columnbold` | bold column headings | `true` |
| `header1`–`header5` | column headings | "Column 1"–"Column 5" |
| `data1_1`–`data6_5` | cells: `data<row>_<column>` | "Row N field M" |

Background defaults: `border_type` none, `border_width` 1, `border_color` `#ECF0F1`,
`border_radius` 0, `box_shadow` none. Clear the texts of columns and rows you don't use.

### `author` — UpC - Author Card

Photo, bio and optional button. Default width 12.
Groups: Image Style, Call To Action (`btn_size` default `small`), Background, Desktop Layout,
Mobile Layout.

| Setting | Values | Default |
|---|---|---|
| `image` | image | — |
| `img_action`, `new_tab_image` | link on the image, open in new tab | — |
| `image_alt` | text | `""` |
| `text` | rich text | — |
| `hide_image` | checkbox | off |
| `image_on_top` | image above the text on mobile | on |
| `image_border_radius` | 0–100 (100 = round) | `100` |
| `image_width` | 25–200 px | `100` |

Background defaults: `border_type` solid, `border_width` 1, `border_color` `#ECF0F1`,
`border_radius` 10. Mobile: `mobile_text_align` center.

### `pdfslider` — UpC - PDF Slider

A PDF shown page by page with Prev / Next buttons. Default width 12.
Groups: Slider Buttons, Background, Desktop Layout, Mobile Layout.

| Setting | Values | Default |
|---|---|---|
| `pdfslider` | the PDF: a Kajabi download, picked in the editor | — |
| `btn_text_prev` | text | "Prev" |
| `btn_text_next` | text | "Next" |
| `btn_background_color`, `btn_text_color` | color, blank = global button colors | blank |
| `btn_width` | `full` · `auto` | `full` |
| `btn_style` | `solid` · `outline` | blank |
| `btn_size` | `small` · `medium` · `large` | `small` |
| `btn_border_radius` | text (px) | blank |

Background defaults: `border_type` none, `border_width` 1, `border_color` `#ECF0F1`,
`border_radius` 0. Mobile: `mobile_text_align` center.

### `audio` — UpC - Audio

An audio player with optional cover image, title and subtitle. Default width 10; a width below 6
renders as 6. Groups: Background, Desktop Layout and Mobile Layout without text alignment.

| Setting | Values | Default |
|---|---|---|
| `audio` | audio file, picked in the editor | — |
| `shrinkaudio` | compact player: hides image, title and subtitle | off |
| `image` | cover image | — |
| `title`, `subtitle` | text | "My Audio File", "My Audio Category" |
| `audio_color` | player color | primary color |

Background defaults: `border_width` 4, `border_radius` 4.

### Standard blocks with UpCourse behaviour

- **Video and audio never complete the lesson.** Every `video` and `audio` block is marked as a
  secondary player; the copied lesson blocks their completion event. Lesson completion stays with
  the lesson's own Kajabi video.
- All other blocks (`text`, `card`, `accordion`, `image`, `cta`, `feature`, `code`, `video_embed`,
  `assessment`, `offer`) behave as in a standard Kajabi landing page.

### Leftovers

`adminnotes` may appear in saved `blog_editor` settings. The theme no longer reads it; ignore it.

---

## Writing an AI brief

When a creator asks you to write a brief for their own template, write it into `blog_info` →
`ai_brief` of that template page.

**Only what is specific to this template goes in the brief.** Everything in this file — master and
copies, asking once, source, language, lesson title, the final check — applies already; don't
repeat it.

**Mark placeholders with ✏️.** Start every placeholder text in a block with the pencil emoji ✏️,
written as a short instruction a person can follow without AI ("✏️ In 2–3 sentences: what does
this lesson cover?"). Put technical rules — word counts, when to hide, widths, `hidden` values —
in the brief, per block name, not in the block text.

A brief has these parts:

1. **PURPOSE** — what a lesson made from this template is for. Start with "This page is a
   template." when it is one.
2. **MASTER** — the master's exact title.
3. **INPUT** — what the source is and where it comes from.
4. **BLOCKS** — the technical rules per block name.
5. **PAGE DETAILS** — title pattern (also how a filled copy is recognised), slug, SEO, publish
   state, `blogtitle`.
6. **Anything else** that only this template needs.

### Example (shortened)

```
PURPOSE: This page is a template. Fill a lesson from a video transcript.

MASTER: "template-upcourse-transcript-master"

INPUT: A transcript from the creator: pasted text, a file, or a lesson they
name. Correct words mangled by speech-to-text and list each correction in
your report.

BLOCKS:
- Lesson intro: always filled; its title is the lesson title.
- Put into practice: max 3 sentences. Hide the block if there is no task.
- CTA community: hidden by default. Ask whether the creator wants it and
  for the URL. Yes: hidden "false", URL in the block's action.

PAGE DETAILS, in one update_landing_page call:
- title "Upcourse - <lesson title>" (max 70 characters)
- slug "upcourse-<lesson-title-in-kebab-case>"
- hide_from_search_engines: true, publish_at: null
- blogtitle in Admin Info: the lesson title
```

The full brief of the transcript template is on its master page.
