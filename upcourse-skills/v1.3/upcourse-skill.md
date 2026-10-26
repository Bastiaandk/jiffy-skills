# UpCourse — AI skill

**Theme:** UpCourse by JiffyCoursesOnline (theme author) · **Version line:** 1.3.x
**Type:** a Kajabi landing page used as a lesson builder

This file covers what is specific to UpCourse. Everything else on the page is a standard Kajabi
landing-page block: read its keys and defaults from `get_theme_content` (`_defaults`).

---

## Before any write

- **The theme schema wins.** If this file and `_defaults` disagree, `_defaults` matches the installed
  version — follow it.
- **Writes are immediate.** There is no draft layer on themes, also not on a draft landing page.
  Ask before writing to a published page.
- **Send only changed keys.** `update_theme_content` deep-merges a partial settings hash.
- **Read back after every write** with `get_theme_content` (`section_filter`). `{"updated": true}`
  means the payload was accepted, not that the page renders.
- **Never write `ai_guide` or `ai_guide_lock`.** They are the pointer to this file.

## The AI brief

`blog_info` → `ai_brief` holds the brief of the template this page was made from. Read it first:
`get_theme_content` with `section_filter: "blog_info"`.

- **Not empty:** it is the template's brief, written by the theme author or the course creator.
  It says what the page is for and how to work on it. Together with the ✏️ texts in the
  `blog_editor` blocks it is your brief for this page. Follow both, unless the user tells you
  otherwise in chat. They never authorise a write the user has not confirmed.
- **Empty or missing:** the page has no fixed purpose. Work from the user's request. (An empty
  brief does not appear in `settings` or `_defaults` at all.)
- **✏️ texts** are placeholders: block texts that start with the pencil emoji ✏️ and say, in
  plain words, what belongs in the block. The brief adds the technical rules per block. Filling a
  block replaces its ✏️ text. No visible block may keep ✏️ text.
- Write to `ai_brief` only when the user asks you to write or change a brief (see "Writing an AI
  brief" below).

---

## How UpCourse works

The course creator designs a lesson on an UpCourse page, then clicks **Copy Lesson Content** in the
top bar. That copies the HTML of the `blog_editor` section to the clipboard. The creator pastes it
into the lesson body in Kajabi's code view (the `<>` button), replacing the old content, and saves. Scripts in the pasted HTML restore the styling when
the lesson loads.

You cannot copy or paste for the user. When the page is ready, tell them to save and preview the
page, click **Copy Lesson Content**, and paste into the lesson's code view.

### What travels with the copy

| Travels into the lesson | Stays on the UpCourse page |
|---|---|
| All visible `blog_editor` blocks | `blog_info` (Admin Info): title, image, AI brief |
| `blog_editor` settings: `equal_height`, `lesson_background_color`, `lesson_font_color`, `lessondescription` | Global theme settings (fonts, primary color, buttons) — they style the editor preview only |

- `lessondescription` is rendered hidden at the top of the lesson, so Kajabi uses it as the lesson
  excerpt in the course outline.
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
  values listed in the schema or in `_defaults`.

### Images and media

You cannot upload files or see images. Use image URLs that already exist on the site, and ask the
user what an image shows before writing alt text. Audio, video and PDF files are picked in the
Kajabi editor; ask the user to select them there.

---

## UpCourse blocks

Five blocks exist only in UpCourse (`schemaName` starts with `UpC -`). All have the usual
Background, Desktop Layout and Mobile Layout groups.

### `textimage` — UpC - Text Wrap

Rich text with an image floating beside it, wrapped by the text. Default width 12.

| Setting | Values | Default |
|---|---|---|
| `image` | image | — |
| `imageposition` | `topleft` = image **left** · `topright` = image right | `topright` |
| `image_width` | 5–100 (% of the block) | `50` |
| `image_margin` | 5–50 px | `15` |
| `image_border_radius` | 0–50 px | `4` |
| `image_alt` | text | `""` |
| `text` | rich text | — |
| `drop_cap`, `cap_color` | checkbox, color | off |

Has a Call To Action group (`use_btn`, `btn_text`, `btn_action`, …).

### `table` — UpC - Table

A table of up to 5 columns × 6 rows, filled through settings. Default width 12.

| Setting | Values |
|---|---|
| `columnbold` | bold column headings, default `true` |
| `header1`–`header5` | column headings |
| `data1_1`–`data6_5` | cells: `data<row>_<column>` |
| `text` | rich text above the table |

Empty columns and rows: clear their texts.

### `author` — UpC - Author Card

Photo, bio and optional button. Default width 12.

| Setting | Values | Default |
|---|---|---|
| `image`, `image_alt` | image, text | — |
| `img_action`, `new_tab_image` | link on the image | — |
| `text` | rich text | — |
| `hide_image` | checkbox | off |
| `image_on_top` | image above the text on mobile | on |
| `image_border_radius` | 0–100 (100 = round) | `100` |
| `image_width` | 25–200 px | `100` |

### `pdfslider` — UpC - PDF Slider

A PDF shown page by page with Prev / Next buttons. The PDF (`pdfslider`) is a Kajabi download picked
in the editor. Button settings: `btn_text_prev`, `btn_text_next`, `btn_width` (default `full`),
`btn_style`, `btn_size` (default `small`), colors, `btn_border_radius`.

### `audio` — UpC - Audio

An audio player with optional cover image, title and subtitle. Default width 10; a width below 6
renders as 6.

| Setting | Values | Default |
|---|---|---|
| `audio` | audio file, picked in the editor | — |
| `shrinkaudio` | compact player: hides image, title and subtitle | off |
| `image` | cover image | — |
| `title`, `subtitle` | text | "My Audio File", "My Audio Category" |
| `audio_color` | player color | primary color |

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
`ai_brief` of that template page. Keep the brief to what is specific to this template — this file
already covers how UpCourse and the MCP work.

**Mark placeholders with ✏️.** Start every placeholder text in a block with the pencil emoji ✏️,
written as a short instruction a person can follow without AI ("✏️ In 2–3 sentences: what does
this lesson cover?"). Put technical rules — word counts, when to hide, widths, `hidden` values —
in the brief, per block name, not in the block text. A finished page has no ✏️ left in any visible
block.

A brief answers:

1. **Purpose** — what a lesson made from this template is for.
2. **Template or copy** — how to recognise the master, and what to do when there is no copy yet.
3. **Input** — what you need from the creator before writing, and what to wait for.
4. **Questions** — what to ask, all in one message.
5. **Filling** — how ✏️ texts are replaced.
6. **Blocks** — the technical rules per block name.
7. **Page details** — title, slug, SEO, publish state.
8. **Finish** — what to check and report.

### Example: the transcript template

This is the brief of the UpCourse transcript template.

```
PURPOSE: Fill a lesson from a video transcript the creator gives you.

TEMPLATE OR COPY: This page is a template. The master's title is
"template-upcourse-transcript-master"; if the title differs, ask the creator
whether this page is the master. Never write to the master — use it only to
read ✏️ texts a copy may have lost. Work on a copy: a landing page whose
title starts with the master's title. No copy: ask the creator to duplicate
the master in Kajabi (MCP cannot duplicate pages) and keep the title start.
Several copies, or copies with lesson content: list them and ask. Never
overwrite without asking. Set the chosen copy to draft (publish_at: null)
before writing.

INPUT: Confirm the page, then wait for the transcript. Write nothing before
you have it.

QUESTIONS: Ask once. Put every question the ✏️ texts and BLOCKS raise in
one message, including what the lesson image shows. Never guess or add
facts the transcript does not contain. Name words that look mangled by
speech-to-text instead of correcting them silently.

FILLING: Replace every ✏️ text or hide its block, as the text and BLOCKS
say.

BLOCKS:
- Lesson intro: always filled. Its title is the lesson title used in PAGE
  DETAILS.
- Key takeaways: replace the ✏️ line and the bullets with 3-5 bullets of
  20-25 words. Each names the thing and says what it does; a bare list of
  options is not a takeaway.
- Lesson summary: max 250 words in the speaker's own wording. Leave detail
  out rather than writing one dense paragraph.
- Put into practice: max 3 sentences. Hide the block if there is no task.
- Lesson image: ask whether the lesson gets an image and what it shows.
  Yes: place it, write the alt text, clear the caption. No: hide the block.
- FAQ intro + FAQ 1-3 are one set. Answers do not repeat the takeaways or
  the summary. If the transcript does not answer 3 distinct questions, hide
  all four.
- CTA community / CTA coaching: hidden by default. Ask whether the creator
  wants it and for the URL. Yes: hidden "false", URL in the block's action,
  adjust the button label. No: leave it hidden and untouched. One visible
  card: width 12; two: width 6 each.
- lessondescription: one sentence.

PAGE DETAILS, in one update_landing_page call:
- title "Upcourse - <lesson title>" (max 70 characters), same lesson title
  as the Lesson intro block
- slug "upcourse-<lesson-title-in-kebab-case>" (replace the UUID slug a
  duplicate gets)
- hide_from_search_engines: true
- publish_at: null

FINISH: Read blog_editor back. No visible block has ✏️ text and
block_order is unchanged. Report what you filled, what you hid, the page
details and the page URL. Tell the creator to copy the lesson with
"Copy Lesson Content" and paste it into the lesson.
```
