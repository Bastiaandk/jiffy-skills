# Nexus — Product Page Skill File

**Template:** `product.liquid`
**Also load:** nexus-header-skill.md, nexus-sidebar-skill.md

The product page is the course homepage. Its sections are global — changes apply
to all visitors of that course's homepage immediately.

---

## MCP rules for this page

- All section settings are at `settings.sections.{section_name}.settings`
- Blocks live at `settings.sections.{section_name}.blocks`
- `block_order` is load-bearing — always include it when adding or removing blocks
- `{"updated": true}` does not mean the change rendered. Always call `get_theme_content` after writing.
- Use `section_filter: "{section_name}"` to read one section at a time — the full settings hash can exceed the 200KB response cap.

---

## Sections on this page

| Section | Purpose |
|---|---|
| `product_welcome` | Welcome banner with member name, progress, and CTA button |
| `product_section_top` | Content section — top of page. Accepts blocks. |
| `product_section_middle` | Content section — middle of page. Accepts blocks. |
| `jiffy_collections` | Displays the course categories/modules |
| `product_section_bottom` | Content section — bottom of page. Accepts blocks. |
| `jiffy_onboarding` | Onboarding slideshow shown to first-time visitors |
| `jiffy_popups` | Confetti popup triggered by offer, category, or post completion |
| `jiffy_badges` | Badge display — rendered in a hidden wrapper, toggled via JS |
| `community_widget` | Community widget — rendered in a hidden wrapper, toggled via JS |
| `header` | See nexus-header-skill.md |
| `product_outline` | See nexus-sidebar-skill.md |

`jiffy_badges` settings and blocks are global — see **nexus-badges-skill.md**. `community_widget` has no MCP-configurable settings — it is controlled via the sidebar section.

---

## Section: `product_welcome`

Welcome banner shown at the top of the product homepage.

### Main settings

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `hidewelcome` | pill_tabs | `"false"` (show) / `"true"` (hide) | `"false"` |
| `welcome` | text | — | `"Welcome back,"` |
| `showname` | pill_tabs | `"true"` / `"false"` | `"true"` |
| `showprogress` | pill_tabs | `"true"` / `"false"` | `"true"` |
| `complete` | text | — | `"Complete"` |
| `hide_welcome_text_mobile` | pill_tabs | `"false"` (show) / `"true"` (hide) | `"true"` |
| `welcome_font_size` | range | — | `14` |
| `text_color` | color | — | — |

`complete` is hidden when `showprogress` is `"false"`.

### Avatar group

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `showavatar` | pill_tabs | `"true"` / `"false"` | `"true"` |
| `avatar_size` | pill_tabs | `"small"` / `"medium"` / `"large"` | `"large"` |

### CTA button group

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `showbutton` | pill_tabs | `"true"` / `"false"` | `"true"` |
| `start` | text | — | `"Start Course"` |
| `resume` | text | — | `"Resume Course"` |
| `again` | text | — | `"Start Course Over"` |
| `btn_style` | pill_tabs | `"solid"` / `"outline"` | `"solid"` |
| `btn_size` | pill_tabs | `"small"` / `"medium"` / `"large"` | `"medium"` |
| `btn_background_color` | color | — | — |
| `btn_text_color` | color | — | — (solid buttons only) |

### Background group

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `showbgimage` | pill_tabs | `"true"` / `"false"` | `"false"` |
| `bgimage` | image_picker | — | — (hidden when `showbgimage` is `"false"`) |
| `bgcolor` | color | — | — |
| `padding_desktop` | spacer | — | top/right/bottom/left: 20 |

---

## Sections: `product_section_top`, `product_section_middle`, `product_section_bottom`

These three sections are structurally identical. Each is a general-purpose content
section that accepts blocks. Use Top for content above the categories, Middle is
shown between top and collections, Bottom below the categories.

### Section-level settings (identical for all three)

**Section Settings**

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `trigger` | select | `"default"` | ⚠️ `"default"` (Always Show) / `"always_hide"` (Always Hide) / `"show"` (Show with Offer) / `"hide"` (Hide with Offer) — **not** `"hide"` for always-hide or `"show_offer"`/`"hide_offer"` for the offer variants |
| `offer` | offer picker | `""` | Shown only when `trigger` is `"show"` or `"hide"` |
| `vertical` | select | `"start"` | `"start"` (Top) / `"center"` / `"end"` (Bottom) |
| `horizontal` | select | `"start"` | ⚠️ `"start"` (Left) / `"center"` / `"end"` (Right) / `"between"` (Space Between) / `"around"` (Space Around) — **not** `"space-between"`/`"space-around"` |
| `equal_height` | checkbox | `"false"` | |

There is no block layout `direction` setting on these sections (that field
only exists on the `group` block, not the section itself).

**Background**

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `showbgimage` | checkbox | `"false"` | |
| `bgimage` | image_picker | — | |
| `bgimage_blur` | range | `"0"` | |
| `background_color` | color | — | |
| `shadow` | checkbox | `"false"` | |
| `border_type` | select | `"none"` | `"none"` / `"solid"` / `"dotted"` / `"dashed"` / `"double"` / `"ridge"` |
| `border_width` | range | `"4"` | |
| `border_color` | color | — | |
| `border_radius` | range | `"4"` | |

**Desktop Layout**

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `show_section_desktop` | pill_tabs | `"show"` | `"show"` / `"hide"` |
| `padding_desktop` | spacer | — | |
| `margin_desktop` | spacer | — | |

**Mobile Layout**

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `show_section_mobile` | pill_tabs | `"show"` | `"show"` / `"hide"` |
| `two_column_mobile` | pill_tabs | `"cascade"` | `"columns"` (2 columns) / `"cascade"` |
| `margin_mobile` | spacer | — | |

### Block types available in all three sections

| Block type | Name | Purpose |
|---|---|---|
| `gamify_form` | Jiffy Form | Kajabi form, with an optional loading-popup redirect to Course Home or a direct redirect to a custom page |
| `gamify_card` | Jiffy Card | Card block — text, video, image, and a CTA button as independent, individually togglable groups (see nexus-sidebar-skill.md for settings) |
| `gamify_certificate` | Jiffy Certificate | Certificate image with the student's name, ID, date, and free text overlaid at configurable positions |
| `coaching_scheduling_widget` | Coaching Scheduling Widget | Links to or embeds a coaching program's scheduling page |
| `group` | Group | Container that lays out other blocks in a row or column |
| `badge_area` | Badge Area Block | Displays the shared badge area (`jiffy_badges` — see nexus-badges-skill.md) at this position on the page |

All blocks except `group` and `badge_area` support conditional visibility
(show/hide based on offer, category completion, or post completion).

#### Groups shared across `gamify_form`, `gamify_card`, `gamify_certificate`, `coaching_scheduling_widget`

These four groups are identical on all four block types. Each block's own
section below lists only its distinct fields — assume these are also present.

**Display Conditions**

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `visibility` | pill_tabs | `"show"` | `"show"` / `"conditional"` |
| `visibility_action` | pill_tabs | `"show"` | `"show"` / `"hide"` (when condition is met) |
| `visibility_trigger` | select | `"offer"` | `"offer"` / `"category"` / `"post"` |
| `visibility_offer` | offer picker | `""` | Used when trigger is `"offer"` |
| `visibility_categories` | text | `""` | Comma-separated category IDs |
| `visibility_posts` | text | `""` | Comma-separated post IDs |

**Background**

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `background_color` | color | `"#ffffff"` | |
| `shadow` | checkbox | `"true"` | |
| `border_type` | select | `""` | `"none"` / `"solid"` / `"dotted"` / `"dashed"` / `"double"` / `"ridge"` |
| `border_width` | range | `"4"` | 0–50 |
| `border_color` | color | — | |
| `border_radius` | range | `"4"` | 0–100 |

**Card Layout**

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `block_break` | checkbox | `"false"` | Place on its own row |
| `padding_desktop` | spacer | 0/0/0/0 | Inside spacing |
| `padding_text` | spacer | 10/10/10/10 | Text & button spacing — `gamify_form` does not have this field |

**Desktop / Mobile Layout**

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `show_block_desktop` | pill_tabs | `"show"` | `"show"` / `"hide"` |
| `text_align` | align | `"left"` | |
| `margin_desktop` | spacer | 5/5/5/5 | |
| `show_block_mobile` | pill_tabs | `"show"` | `"show"` / `"hide"` |
| `text_align_mobile` | align | `"left"` | |
| `margin_mobile` | spacer | 5/5/5/5 | |

---

### Block type: `gamify_form` — "Jiffy Form"

A Kajabi form embed. What happens after submission depends on `gamify_form_ty`
(Button action): **Custom Page** redirects immediately to `thank_you`.
**Course Home** instead shows a loading popup (configurable wait time and four
rotating status texts) before redirecting to the course home — use this when
Kajabi automations triggered by the submission need time to complete.

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `width` | grid | `"4"` | |
| `form` | form picker | — | |
| `gamify_form_fill` | checkbox | `"true"` | Autofill name/email from the logged-in member |
| `gamify_form_hide` | checkbox | `"false"` | Hide the name/email fields. Only relevant when `gamify_form_fill` is `"true"` |
| `text` | rich_text | `"<h4>Join Our Free Trial</h4><p>Get started today before this one-time opportunity expires.</p>"` | |
| `input_label` | pill_tabs | `"placeholder"` | `"placeholder"` (text inside the field) / `"label"` (text above it) |

**Button Action Settings**

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `btn_text` | text | `"Submit"` | |
| `gamify_form_ty` | pill_tabs | `"custom"` | `"course"` (Course Home) / `"custom"` (Custom Page) — see above |
| `thank_you` | action | — | Redirect target. Shown only when `gamify_form_ty` is `"custom"` |
| `timertest` | pill_tabs | `"hide"` | `"hide"` / `"test"` — preview the popup while editing. Shown only when `gamify_form_ty` is `"course"` |
| `text_popup` | rich_text | `"<h4>Please wait a moment while we prepare your setup…</h4>"` | Shown only when `gamify_form_ty` is `"course"` |
| `gamify_wait` | range | `"30"` | 10–60 seconds the popup stays visible. Shown only when `gamify_form_ty` is `"course"` |
| `text1` | text | `"Analyzing your results…"` | Shown only when `gamify_form_ty` is `"course"` |
| `text2` | text | `"Setting things up…"` | Shown only when `gamify_form_ty` is `"course"` |
| `text3` | text | `"Finalizing your progress…"` | Shown only when `gamify_form_ty` is `"course"` |
| `text4` | text | `"Preparing your next steps…"` | Shown only when `gamify_form_ty` is `"course"` |
| `btn_background_color` | color | — | |
| `btn_text_color` | color | — | Solid buttons only |
| `btn_width` | pill_tabs | `"full"` | `"full"` / `"auto"` |
| `btn_style` | pill_tabs | `"solid"` | `"solid"` / `"outline"` |
| `btn_size` | pill_tabs | `"small"` | `"small"` / `"medium"` / `"large"` |
| `btn_border_radius` | range | `"4"` | 0–100 |

Plus the shared Display Conditions, Background, Card Layout (no
`padding_text`), and Desktop/Mobile Layout groups above.

---

### Block type: `gamify_certificate` — "Jiffy Certificate"

A certificate image with dynamic text (name, student ID, date, free text)
overlaid at configurable x/y percentage positions — there is no visual
editor for this in MCP, positioning is numeric only.

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `width` | grid | `"4"` | |
| `image` | image_picker | — | Certificate template, 1500×1000 |
| `certname` | text | `"mycertificate"` | Filename used for the downloaded file |

**Text field: Student Name**

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `namefirst` | checkbox | `"false"` | Show first name only |
| `namex` / `namey` | range | `"50"` / `"50"` | Position, 1–100% |
| `namesize` | range | `"50"` | Font size, 10–100 |

**Text field: Student Number**

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `studentid` | checkbox | `"false"` | Kajabi's internal user ID, not a custom student ID |
| `pretext` | text | `"Student ID: "` | |
| `idx` / `idy` | range | `"50"` / `"95"` | Position, 1–100% |
| `idsize` | range | `"20"` | Font size, 10–100 |

**Text field: Date**

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `dateshow` | pill_tabs | `"generate"` | `"generate"` (learner's browser date) / `"custom"` (one fixed date for everyone) |
| `datefreezefirst` | checkbox | `"true"` | Saves the first-generated date in the learner's browser so it stays the same on return visits. Shown only when `dateshow` is `"generate"` |
| `dateformat` | select | `"yyyymmdd"` | `"yyyymmdd"` / `"ddmmyyyy"` / `"mmddyyyy"`. Shown only when `dateshow` is `"generate"` |
| `datetext` | text | `""` | The fixed date text. Shown only when `dateshow` is `"custom"` |
| `datex` / `datey` | range | `"70"` / `"85"` | Position, 1–100% |
| `datesize` | range | `"20"` | Font size, 10–100 |

**Text field: Free**

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `extratext` | text | `""` | |
| `extrax` / `extray` | range | `"30"` / `"85"` | Position, 1–100% |
| `extrasize` | range | `"20"` | Font size, 10–100 |

**Certificate Body Text**

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `downloadtext` | text | `"Download certificate"` | |
| `downloadmobile` | text | `"Hold image to download certificate"` | Mobile has no direct download; the learner long-presses the image to save it |
| `body` | rich_text | `"Congrats! You did it!"` | |

**Certificate Colors**

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `certtextcolor` | color | `"#444444"` | Text color drawn onto the certificate image itself |
| `card_textcolor` | color | — | Text color of the body text below the certificate |
| `downloadcolor` | color | — | |

Plus the shared Display Conditions, Background, Card Layout, and
Desktop/Mobile Layout groups above.

---

### Block type: `coaching_scheduling_widget` — "Coaching Scheduling Widget"

Links to or embeds a Kajabi coaching program's scheduling page.
`link_to_program_details` decides which: `"true"` links out to the program's
own page; `"false"` shows the title/description/thumbnail inline on this
block instead.

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `width` | grid | `"4"` | |
| `coaching_program` | coaching program picker | — | |
| `offer` | offer picker | — | Shown once a `coaching_program` is selected |
| `link_to_program_details` | checkbox | `"true"` | See above |
| `title_text` | text | `"Program Title"` | Shown only when `link_to_program_details` is `"false"` |
| `description_text` | text | `"Program Description"` | Shown only when `link_to_program_details` is `"false"` |
| `thumbnail_image` | image_picker | — | 1280×720. Shown only when `link_to_program_details` is `"false"` |
| `show_thumbnail` | checkbox | `"true"` | |
| `show_price` | checkbox | `"true"` | |
| `show_duration` | checkbox | `"true"` | |
| `card_textcolor` | color | — | |

**Call to Action**

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `btn_text` | text | `"Call To Action"` | |
| `btn_background_color` | color | — | |
| `btn_text_color` | color | — | Solid buttons only |
| `btn_width` | pill_tabs | `"full"` | `"full"` / `"auto"` |
| `btn_style` | pill_tabs | `"solid"` | `"solid"` / `"outline"` |
| `btn_size` | pill_tabs | `"small"` | `"small"` / `"medium"` / `"large"` |
| `btn_border_radius` | range | `"4"` | 0–100 |

Plus the shared Display Conditions, Background, Card Layout, and
Desktop/Mobile Layout groups above.

---

### Block type: `group` — "Group"

A container block that lays out other blocks in a row or column.
`allowed_children`: `gamify_card`, `gamify_form`, `gamify_certificate`,
`coaching_scheduling_widget`, `badge_area` — a `group` cannot contain another
`group`.

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `width` | grid | `"12"` | Group width |
| `direction` | select | `"horizontal"` | `"vertical"` / `"horizontal"` |
| `align` | select | `"start"` | `"start"` / `"center"` / `"end"` / `"stretch"` — cross-axis (vertical when horizontal direction) alignment of children |
| `justify` | select | `"start"` | `"start"` / `"center"` / `"end"` / `"between"` / `"around"` — main-axis (horizontal when horizontal direction) alignment of children |
| `margin_desktop` | spacer | 0/0/0/0 | |
| `margin_mobile` | spacer | 0/0/0/0 | |
| `background_color` | color | — | |

---

### Block type: `badge_area` — "Badge Area Block"

Displays the shared `jiffy_badges` content (see nexus-badges-skill.md) at
this position on the page. No content settings of its own — only layout.

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `width` | grid | `"12"` | |
| `show_block_desktop` | pill_tabs | `"show"` | `"show"` / `"hide"` |
| `margin_desktop` | spacer | 0/0/0/0 | |
| `show_block_mobile` | pill_tabs | `"show"` | `"show"` / `"hide"` |
| `margin_mobile` | spacer | 0/0/0/0 | |

---

## Section: `jiffy_collections`

Displays the course categories and modules as collection banners. Each block is one collection.

**Section-level settings**

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `margin_desktop` | spacer | — | Outside spacing for all collections |
| `margin_mobile` | spacer | — | Outside spacing for all collections |

**Block type: `collection_banner` — "Collection"**

Each block is one collection/category display. Supports conditional visibility.

> **Legacy fields:** existing blocks may contain `offer`, `preview_in_admin`, and `show_with_offer`. These are not part of the current schema and are silently ignored by the renderer. Do not copy them when creating new blocks.

**Display Conditions**

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `visibility` | pill_tabs | `"show"` | `"show"` / `"conditional"` |
| `visibility_action` | pill_tabs | `"show"` | `"show"` / `"hide"` (when condition is met) |
| `visibility_trigger` | select | `"offer"` | `"offer"` / `"category"` / `"post"` |
| `visibility_offer` | offer picker | `""` | Used when trigger is `"offer"` |
| `visibility_categories` | text | `""` | Comma-separated category IDs |
| `visibility_posts` | text | `""` | Comma-separated post IDs |

*Content*

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `heading` | rich_text | — | `"<h4>Collection Title</h4>"` |
| `collection_content` | select | `"demo"` / `"outline"` / `"category"` / `"highlights"` / `"favorites"` / `"replay"` / `"continue_watching"` / `"outline_categories"` | `"demo"` | Use `"highlights"` for a manually curated set via `lesson_ids`. Other values ignore `lesson_ids`. |
| `category_id` | text | — | — | One or more category IDs, comma or space separated. Hidden for content types that don't pull from a category (`highlights`, `favorites`, `replay`, `continue_watching`, `demo`, `outline`, `outline_categories`) |
| `collection_type` | select | `"lines"` / `"grid2"` / `"grid3"` / `"grid4"` / `"slider3"` / `"slider4"` / `"sliderfocus"` / `"sliderbanner"` | `"sliderbanner"` | |
| `hashtags` | text | `"#hashtag1, #hashtag2"` | Filter posts by hashtag in body | |
| `lesson_ids` | text | — | Comma-separated post IDs — only respected when `collection_content` is `"highlights"` |
| `max_posts` | range | `16` | 1–100. Hidden when `collection_content` is `"outline_categories"` |
| `outline_paginate_count` | range | `8` | 4–16, max rows per page. Only shown for `collection_content` values `"outline"` and `"category"`-adjacent list views |
| `show_finished` | pill_tabs | `"show"` | `"show"` / `"hide"` — completed posts. Hidden for `"replay"`, `"continue_watching"`, `"demo"`, `"favorites"`, `"outline_categories"` |
| `show_two` | pill_tabs | `"two"` | `"one"` / `"two"` posts per row on mobile. Only applies to grid layouts (`grid2`/`grid3`/`grid4`) — hidden for `lines` and slider types |

*Category title row*

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `outline_title_show` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `outline_title_font_size` | range | — | `20` |
| `outline_title_bold` | pill_tabs | `"bold"` / `"regular"` | `"bold"` |
| `outline_title_color` | color | — | — |

*Banner (focus slide)*

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `banner_auto_scroll` | pill_tabs | `"scroll"` / `"no-scroll"` | `"scroll"` |
| `show_banner_dots` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `banner_height` | range | — | `320` |
| `banner_image_position` | range | — | `25` |
| `banner_blur` | range | — | `10` |
| `banner_dots_color` | color | — | `"#999999"` |
| `show_focus_title` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `show_focus_description` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `show_focus_description_mobile` | pill_tabs | `"show"` / `"hide"` | `"hide"` |
| `show_focus_border` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `show_focus_post_info` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `focus_text_display` | select | `"always"` / `"hover"` | `"always"` |
| `focus_title_font_size` | range | — | `22` |
| `focus_body_font_size` | range | — | `14` |

*Preview cards (grid/slider)*

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `text_placement` | select | `"hover"` / `"on_image"` / `"below"` | `"on_image"` |
| `text_align` | align | — | `"left"` |
| `show_title` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `show_preview_border` | pill_tabs | `"show"` / `"hide"` | `"hide"` |
| `show_preview_post_info` | pill_tabs | `"show"` / `"hide"` | `"hide"` |
| `preview_text_display` | select | `"always"` / `"hover"` | `"hover"` |
| `title_font_size` | range | — | `14` |
| `title_bold` | pill_tabs | `"bold"` / `"normal"` | `"bold"` |
| `title_font_size_mobile` | range | — | `12` |
| `title_bold_mobile` | pill_tabs | `"bold"` / `"normal"` | `"normal"` |
| `show_description` | pill_tabs | `"show"` / `"hide"` | `"hide"` |
| `show_description_mobile` | pill_tabs | `"show"` / `"hide"` | `"hide"` |
| `body_font_size` | range | — | `12` |
| `truncate` | text | — | — |

*Post info*

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `show_duration` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `show_favorite` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `show_completed` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `show_post_info_mobile` | pill_tabs | `"show"` / `"hide"` | `"hide"` |
| `show_progress_bar` | pill_tabs | `"show"` / `"hide"` | `"hide"` |
| `progress_bar_color` | color | — | `"#ffffff"` |

*Card styling*

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `show_hover_animation` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `show_card_shadow` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `item_background_color` | color | — | `"#000000"` |
| `text_color` | color | — | — |
| `item_border_type` | select | `"none"` / `"solid"` / `"dotted"` / `"dashed"` / `"double"` / `"ridge"` | `"none"` |
| `item_border_width` | range | — | — |
| `item_border_color` | color | — | — |
| `item_border_radius` | range | — | `10` |
| `padding_text` | spacer | — | — |

*Section styling*

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `background_color` | color | — | — |
| `show_shadow` | pill_tabs | `"show"` / `"hide"` | `"hide"` |
| `border_type` | select | `"none"` / `"solid"` / `"dotted"` / `"dashed"` / `"double"` / `"ridge"` | `"none"` |
| `border_width` | range | — | `1` |
| `border_color` | color | — | `"#cccccc"` |
| `border_radius` | range | — | `4` |
| `item_spacing` | range | — | `15` |
| `item_spacing_mobile` | range | — | `10` |
| `padding_desktop` | spacer | — | — |

---

## Section: `jiffy_onboarding`

Onboarding slideshow shown to first-time visitors. Dismissed and not shown again after completion.

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `enabled` | — | — | Master toggle for the onboarding flow |
| `show_preview` | — | — | Preview in editor |
| `preview_slide` | — | — | Which slide to preview |
| `card_background` | color | `"#ffffff"` | |
| `card_text_color` | color | `"#333333"` | Applies to all text in the card |
| `card_max_width` | range | `620` | 400–900px |
| `cta_text` | text | `"Let's go →"` | CTA button text on last slide |
| `dot_color` | color | `"#cccccc"` | Pagination dot |
| `dot_active_color` | color | `"#333333"` | Active dot and CTA button |
| `arrow_color` | color | `"#333333"` | |
| `arrow_bg` | color | `"#ffffff"` | |
| `overlay_color` | color | `"#000000"` | Background overlay |
| `overlay_opacity` | range | `60` | 0–100 |
| `blur_intensity` | range | `8` | Background blur |

### Block type: `onboarding_slide` — "Slide"

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `slide_type` | pill_tabs | `"image"` | `"image"` / `"video"` |
| `image` | image_picker | — | 1240×698 (16:9). Shown only when `slide_type` is `"image"` |
| `video` | video picker | — | Shown only when `slide_type` is `"video"` |
| `content` | rich_text | `"Slider text goes here. You can use this space to explain the benefits of your product or provide a quick tutorial."` | |

---

## Section: `jiffy_popups`

Confetti popup triggered when a member completes a category or post, or unlocks an offer.

### Block type: `gamify_popup_confetti` — "Popup Confetti Message"

Each block defines one popup trigger.

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `edit` | checkbox | `"true"` | Show/edit popup message in the editor preview |

**Display Conditions**

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `visibility_trigger` | select | `"offer"` | `"offer"` / `"category"` / `"post"` |
| `visibility_offer` | offer picker | `""` | Used when trigger is `"offer"` |
| `visibility_categories` | text | `""` | Comma-separated category IDs |
| `visibility_posts` | text | `""` | Comma-separated post IDs |

**Popup Content**

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `confettistyle` | select | `"cannon"` | ⚠️ `"none"` / `"cannon"` / `"fireworks"` / `"school"` / `"rain"` / `"stars"` — **not** `"school_parade"` despite the "School Parade" label |
| `confetti_action_color` | color | global primary color | Hidden when `confettistyle` is `"none"` |
| `contenttitle` | text | `"Congratulations!"` | |
| `contentname` | checkbox | `"true"` | Append the student's name to the shoutout |
| `content` | rich_text | `"Congratulate your student on achieving this mile stone."` | |
| `text_color` | color | — | |
| `showimage` | checkbox | `"true"` | |
| `image` | image_picker | — | Badge/certificate image, suggested 250×250 transparent. Shown only when `showimage` is `"true"` |
| `imgwidth` | range | `"100"` | 0–200. Shown only when `showimage` is `"true"` |

**Button Styling**

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `use_btn` | checkbox | `"false"` | Master toggle — the fields below are hidden until this is `"true"` |
| `btn_text` | text | `"Click here"` | |
| `btn_action` | action | `""` | |
| `new_tab` | checkbox | `"false"` | |
| `btn_background_color` | color | — | |
| `btn_text_color` | color | — | |
| `btn_width` | pill_tabs | `"full"` | `"full"` / `"auto"` |
| `btn_style` | pill_tabs | `"solid"` | `"solid"` / `"outline"` |
| `btn_size` | pill_tabs | `"small"` | `"small"` / `"medium"` / `"large"` |
| `btn_border_radius` | range | `"4"` | 0–100 |

**Background**

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `confetti_width` | range | `"40"` | 20–100% of screen width |
| `background_color` | color | `"#f9f9f9"` | |
| `border_type` | select | `"solid"` | `"none"` / `"solid"` / `"dotted"` / `"dashed"` / `"double"` / `"ridge"` |
| `border_width` | range | `"1"` | 0–50 |
| `border_color` | color | `"#ccc"` | |
| `border_radius` | range | `"10"` | 0–100 |
| `overlay_background` | color | `"rgba(220, 202, 184, 0.2)"` | Background of the blurred overlay behind the popup |
