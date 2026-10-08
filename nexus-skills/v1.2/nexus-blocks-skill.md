# Nexus — Blocks Skill

> **Before any write:** if you have not fetched the main skill [`nexus-skill.md`](https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/v1.2/nexus-skill.md) in this
> conversation, fetch it now. It holds the payload shapes, value formats and working rules
> (send only changed keys, read back after every write), which this file does not repeat.

Covers the content blocks: Jiffy Card, Jiffy Form, Jiffy Certificate, Coaching Scheduling Widget, Group and Badge Area Block. Section-level settings of the sections that hold them → product skill (dashboard sections), categories skill (Rewards, Downloads), sidebar skill (Sidebar, plus its Filter and External Link blocks).

## Where each block is available
| Block type | Name in editor | Dashboard Top / Bottom | Jiffy - Rewards | Jiffy - Downloads | Sidebar (global) |
|---|---|---|---|---|---|
| `gamify_card` | Jiffy Card | yes | yes | yes | yes |
| `gamify_form` | Jiffy Form | yes | — | — | — |
| `gamify_certificate` | Jiffy Certificate | yes | yes | — | — |
| `coaching_scheduling_widget` | Coaching Scheduling Widget | yes | yes | — | — |
| `group` | Group | yes | — | — | — |
| `badge_area` | Badge Area Block | yes | — | — | — |

Section IDs: `product_section_top` / `product_section_bottom`, `jiffy_categories_rewards`, `jiffy_categories_downloads`, `product_outline`. Block settings live in `sections.<section_id>.blocks.<block_id>.settings`. Nexus 1.2 has no Dashboard - Middle Section on the product page: never write blocks to `product_section_middle`.

## Per-section differences
The block schemas are identical in every section except for the rows below. Everything else in this file (settings, defaults, placeholders) applies everywhere the block is available.

| Section | Block | Difference |
|---|---|---|
| Dashboard Top / Bottom | all | Reference schema; the two sections are identical. |
| Jiffy - Rewards | card, certificate, coaching | No differences: `width` `"4"`, `background_color` `"#ffffff"`, `margin_desktop` / `margin_mobile` default 5/5/5/5. |
| Jiffy - Downloads | `gamify_card` | `margin_desktop` / `margin_mobile`: no saved default, placeholder 5/5/5/5 (dashboard: default 5/5/5/5, placeholder 0). Blank side = 0, so a new Downloads card has no outside spacing unless you write it. |
| Sidebar (global) | `gamify_card` | `width` default `"12"` (dashboard `"4"`): share of the 330px sidebar, `"12"` = full width. `background_color` default `""` (dashboard `"#ffffff"`): blank = transparent, the sidebar background shows through. Text-contrast fallback when the card background is blank: sidebar `background_color` → global `sidebar_background` (dashboard: section `background_color` → `page_background`). Gap between cards = sidebar `item_spacing`. Cards render below the navigation and are hidden while the desktop slider is collapsed. |

`block_break` (Place on its own row) works in all four sections: each section loop adds a row break before and after the block. It is ignored inside a `group`.

## Shared groups
`gamify_card`, `gamify_form`, `gamify_certificate` and `coaching_scheduling_widget` share the groups below (schema order: top-level fields, Display Conditions, block-specific groups, Background, Card Layout, Desktop Layout, Mobile Layout). Differences are listed per block.

### Display Conditions (shared)
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `visibility` | Block visibility | pill_tabs | `"show"` (Show), `"conditional"` (Conditional) | `"show"` | |
| `visibility_action` | When condition is met | pill_tabs | `"show"`, `"hide"` | `"show"` | Hidden when `visibility` = `"show"`. |
| `visibility_trigger` | Trigger | select | `"offer"` (Offer), `"category"` (Category completed), `"post"` (Post completed) | `"offer"` | Hidden when `visibility` = `"show"`. |
| `visibility_offer` | Select offer | offer | numeric offer ID | `""` | Condition = member currently owns the offer. Hidden unless trigger `offer`. |
| `visibility_categories` | Category IDs | text | comma-separated IDs | `""` | **AND**: all listed categories complete. Checked server-side; matches top-level categories and their direct subcategories of this product; a category with 0 posts counts as complete; an unknown ID never completes. Hidden unless trigger `category`. |
| `visibility_posts` | Post IDs | text | comma-separated IDs | `""` | **AND**: all listed posts completed. Checked in the browser from the outline cache: a "show" block stays hidden (and a "hide" block visible) until every listed post is in the cache. Hidden unless trigger `post`. |

A conditional block with no offer / no IDs renders for nobody (whatever the action). In the editor every block shows, with an indicator line describing the condition.

### Background (shared)
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `background_color` | Block background color | color | blank allowed | `"#ffffff"` (Sidebar: `""`) | Blank = transparent. Text colour auto-contrasts against block → section → `page_background` (Sidebar: block → sidebar `background_color` → `sidebar_background`). |
| `shadow` | Add shadow to block | checkbox | — | `"true"` | |
| `border_type` | Border type | select | `"none"`, `"solid"`, `"dotted"`, `"dashed"`, `"double"`, `"ridge"` | `""` | `""` = no border. |
| `border_width` | Border width | range | 0–50 px | `"4"` | |
| `border_color` | Border color | color | blank allowed | `""` | Blank = black. |
| `border_radius` | Border radius | range | 0–100 px | `"4"` | Also rounds the image/video top corners. |

### Card Layout (shared)
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `block_break` | Place on its own row | checkbox | — | `"false"` | Works in every section that has these blocks (the section loop adds a row break before and after). Ignored inside a `group`. |
| `padding_desktop` | Inside spacing | spacer | px | placeholder 0/0/0/0 (form: 10/10/10/10) | Blank side = 0. |
| `padding_text` | Text & button spacing | spacer | px | placeholder 10/10/10/10 | Blank side = 10 (card), 20 (certificate, coaching). Not on `gamify_form` (its text area uses 10). |

### Desktop Layout / Mobile Layout (shared)
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `show_block_desktop` | Show on desktop | pill_tabs | `"show"`, `"hide"` | `"show"` | Desktop = ≥768px. |
| `text_align` | Text alignment | align | `"left"`, `"center"`, `"right"` | `"left"` | |
| `margin_desktop` | Outside spacing | spacer | px | `{"top":"5","right":"5","bottom":"5","left":"5"}` (placeholder 0) | Real default (Downloads card: none, placeholder 5/5/5/5). Blank side = 0. Left+right are subtracted from the width. |
| `show_block_mobile` | Show on mobile | pill_tabs | `"show"`, `"hide"` | `"show"` | Mobile = ≤767px. |
| `text_align_mobile` | Text alignment | align | `"left"`, `"center"`, `"right"` | `"left"` | |
| `margin_mobile` | Outside spacing | spacer | px | `{"top":"5","right":"5","bottom":"5","left":"5"}` (placeholder 0) | Real default (Downloads card: none, placeholder 5/5/5/5). Blank side = 0. |

Block button colours (card, form, coaching): `btn_background_color` blank = `accent_color` (outline style uses it as text/border colour); `btn_text_color` blank = auto light/dark against the button colour.

## Block: `gamify_card` — "Jiffy Card"
Video, image, text and button, each optional. Available in all four sections. Defaults: `width` `"4"`, `background_color` `"#ffffff"` (Sidebar: `"12"` and `""` — see Per-section differences).

| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `width` | Width | grid | `"1"`–`"12"` (twelfths) | `"4"` (Sidebar: `"12"`) | |
| `content` | Text | rich_text | HTML | `"<p>This is a Jiffy Card.</p>"` | |

Then Display Conditions (shared).

### Video Settings
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `videoyes` | Use video | checkbox | — | `"false"` | On: video replaces the image; `image` becomes the poster. |
| `video` | Video | video | Kajabi video | — | Not found = poster image only. |
| `video_color` | Player accent color | color | blank allowed | — | Blank = `primary_color`. |
| `controls_on_load` | Show controls on load | checkbox | — | `"false"` | |
| `auto_play` | Autoplay | checkbox | — | `"false"` | Muted autoplay. |
| `loop` | Loop video | checkbox | — | `"false"` | |
| `play_button` | Play button | checkbox | — | `"true"` | |
| `full_screen` | Allow full screen | checkbox | — | `"false"` | |
| `small_play_button` | Show small play button | checkbox | — | `"true"` | |
| `playbar` | Show playbar | checkbox | — | `"false"` | |
| `video_settings` | Video settings | checkbox | — | `"false"` | Quality and speed controls. |

### Image Settings
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `hide_image` | Use image | checkbox | — | `"true"` | **Name is inverted**: `true` = image shown, `false` = no image. Not shown when `videoyes` is on. |
| `image` | Image | image_picker | 1856 × 1044 suggested | — | Blank = placeholder image. |
| `img_action` | Image action | action | URL | `""` | Makes the image a link. |
| `link_target` | Open in new window | checkbox | — | `"false"` | For `img_action`. |
| `image_alt` | Image alt attribute | text | — | `""` | |

### Text Settings
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `card_textcolor` | Text color | color | blank allowed | `""` | Blank = auto contrast. |
| `card_textsize_mode` | Font size | pill_tabs | `"default"`, `"custom"` | `"default"` | |
| `card_textsize` | Custom size | range | 6–48 px | `"14"` | Hidden when `card_textsize_mode` = `"default"`. |

### Call to Action
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `use_btn` | Use button | checkbox | — | `"true"` | Text area is omitted when `content` is empty and `use_btn` is off. |
| `btn_text` | Text | text | — | `"Call To Action"` | |
| `btn_action` | Button action | action | URL | `""` | |
| `new_tab` | Open in new tab | checkbox | — | `""` | |
| `btn_background_color` | Button background color | color | blank allowed | `""` | |
| `btn_text_color` | Button text color | color | blank allowed | `""` | Solid buttons only. |
| `btn_width` | Button width | pill_tabs | `"full"` (Full), `"auto"` (Auto) | `"full"` | |
| `btn_style` | Button style | pill_tabs | `"solid"`, `"outline"` | `"solid"` | |
| `btn_size` | Button size | pill_tabs | `"small"` (Sm), `"medium"` (Md), `"large"` (Lg) | `"small"` | |
| `btn_border_radius` | Border radius | range | 0–100 px | `"4"` | |

Then Background, Card Layout, Desktop/Mobile Layout (shared).

## Block: `gamify_form` — "Jiffy Form"
A Kajabi form with optional autofill and a "wait for automations" popup.

| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `width` | Width | grid | `"1"`–`"12"` | `"4"` | |
| `form` | Form | form | Kajabi form ID | `""` | Empty = nothing for students. |
| `gamify_form_fill` | Autofill name and email | checkbox | — | `"true"` | Fills the name/email fields from the logged-in member. |
| `gamify_form_hide` | Hide name and email | checkbox | — | `"false"` | Hidden when `gamify_form_fill` = false. Only turn on together with autofill, or required fields stay empty. |
| `text` | Text | rich_text | HTML | `"<h4>Join Our Free Trial</h4><p>Get started today before this one-time opportunity expires.</p>"` | |
| `input_label` | Input label | pill_tabs | `"placeholder"` (Text), `"label"` (Labels) | `"placeholder"` | Text inside the field vs label above it. |

Then Display Conditions (shared).

### Button Action Settings
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `btn_text` | Text | text | — | `"Submit"` | |
| `gamify_form_ty` | Button action | pill_tabs | `"course"` (Course Home), `"custom"` (Custom Page) | `"custom"` | `custom`: redirect to `thank_you`. `course`: back to the course home with a loading popup for `gamify_wait` seconds (texts 1–4 rotate each quarter), then reload. |
| `timertest` | Test popup (save page) | pill_tabs | `"hide"`, `"test"` | `"hide"` | Editor only: plays the popup once. Hidden when `gamify_form_ty` = `"custom"`. |
| `text_popup` | Text popup | rich_text | HTML | `"<h4>Please wait a moment while we prepare your setup…</h4>"` | Hidden when `gamify_form_ty` = `"custom"`. |
| `gamify_wait` | Seconds | range | 10–60 s | `"30"` | Hidden when `gamify_form_ty` = `"custom"`. |
| `text1` … `text4` | Text 1 … Text 4 | text | — | `"Analyzing your results…"`, `"Setting things up…"`, `"Finalizing your progress…"`, `"Preparing your next steps…"` | Hidden when `gamify_form_ty` = `"custom"`. |
| `thank_you` | Page after form submission | action | URL | — | Hidden when `gamify_form_ty` = `"course"`. |
| `btn_background_color` | Button background color | color | blank allowed | `""` | |
| `btn_text_color` | Button text color | color | blank allowed | `""` | Solid buttons only. |
| `btn_width` | Button width | pill_tabs | `"full"`, `"auto"` | `"full"` | |
| `btn_style` | Button style | pill_tabs | `"solid"`, `"outline"` | `"solid"` | |
| `btn_size` | Button size | pill_tabs | `"small"` (Sm), `"medium"` (Md), `"large"` (Lg) | `"small"` | |
| `btn_border_radius` | Border radius | range | 0–100 px | `"4"` | |

Background (shared) plus `card_textcolor` ("Text color on body", color, `""`, blank = auto contrast) after `background_color`. Card Layout without `padding_text`; `padding_desktop` placeholder is 10/10/10/10. Desktop/Mobile Layout shared.

## Block: `gamify_certificate` — "Jiffy Certificate"
Draws the member's name, ID, date and free text onto a template image (canvas) with a download link. Positions are numeric only.

| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `width` | Width | grid | `"1"`–`"12"` | `"4"` | |
| `image` | Certificate template | image_picker | 1500 × 1000 suggested | — | |
| `certname` | Certificate name for download | text | — | `"mycertificate"` | File name (`.jpg` added, spaces removed). |

Then Display Conditions (shared). Text fields use the global certificate font (preferences skill); x/y are % of the image, text is centred on that point.

### Text field: Student Name
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `namefirst` | First name only | checkbox | — | `"false"` | Off = full name. |
| `namex` / `namey` | Name x / y position | range | 1–100 % | `"50"` / `"50"` | |
| `namesize` | Name font size | range | 10–100 pt | `"50"` | |

### Text field: Student Number
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `studentid` | Show student id | checkbox | — | `"false"` | Kajabi's internal user ID. |
| `pretext` | Pre-text | text | — | `"Student ID: "` | |
| `idx` / `idy` | Student x / y position | range | 1–100 % | `"50"` / `"95"` | |
| `idsize` | Id font size | range | 10–100 pt | `"20"` | |

### Text field: Date
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `dateshow` | Show date | pill_tabs | `"generate"` (Generate), `"custom"` (Custom) | `"generate"` | Generate = date the certificate is viewed; Custom = one fixed text for everyone. |
| `datefreezefirst` | Save the first generated date in learner's browser. | checkbox | — | `"true"` | Keeps the first date per member per block in that browser. Hidden when `dateshow` = `"custom"`. |
| `dateformat` | Date format | select | `"yyyymmdd"` (yyyy-mm-dd), `"ddmmyyyy"` (dd-mm-yyyy), `"mmddyyyy"` (mm-dd-yyyy) | `"yyyymmdd"` | Hidden when `dateshow` = `"custom"`. |
| `datetext` | Custom date | text | — | `""` | Hidden when `dateshow` = `"generate"`. |
| `datex` / `datey` | Date x / y position | range | 1–100 % | `"70"` / `"85"` | |
| `datesize` | Date font size | range | 10–100 pt | `"20"` | |

### Text field: Free
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `extratext` | Extra text | text | — | `""` | Empty = not drawn. |
| `extrax` / `extray` | Extra text x / y position | range | 1–100 % | `"30"` / `"85"` | |
| `extrasize` | Extra text font size | range | 10–100 pt | `"20"` | |

### Certificate Body Text
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `downloadtext` | Download link text | text | — | `"Download certificate"` | Empty = no download link. |
| `downloadmobile` | Mobile download text | text | — | `"Hold image to download certificate"` | Mobile: canvas becomes an image to long-press. |
| `body` | Body | rich_text | HTML | `"Congrats! You did it!"` | Empty = no body. |

### Certificate Colors
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `certtextcolor` | Text color on certificate | color | hex | `"#444444"` | Drawn on the image. |
| `card_textcolor` | Text color on body | color | — | `""` | Blank = auto contrast. |
| `downloadcolor` | Download link color on body | color | blank allowed | `""` | |

Then Background, Card Layout, Desktop/Mobile Layout (shared).

## Block: `coaching_scheduling_widget` — "Coaching Scheduling Widget"
Card for a Kajabi coaching program; the button opens Kajabi's scheduling widget. **Renders nothing unless both `coaching_program` and `offer` are set** (editor shows a placeholder).

| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `width` | Width | grid | `"1"`–`"12"` | `"4"` | |
| `coaching_program` | Select your coaching program | coaching_program_for_scheduling_widget | program ID | — | |
| `offer` | Select your offer | offer_for_productizable | numeric offer ID | — | Hidden until a program is set. Supplies the price. |
| `link_to_program_details` | Link to program details | checkbox | — | `"true"` | **Content source switch, not a link.** On: title, description and thumbnail come from the coaching program. Off: from `title_text`, `description_text`, `thumbnail_image`. |
| `title_text` | Title text | text | — | `"Program Title"` | Hidden when `link_to_program_details` = true. |
| `description_text` | Description text | text | — | `"Program Description"` | Hidden when `link_to_program_details` = true. |
| `thumbnail_image` | Thumbnail image | image_picker | max 1280 × 720 | — | Hidden when `link_to_program_details` = true. |
| `show_thumbnail` | Show thumbnail | checkbox | — | `"true"` | Only if the chosen source has an image. |
| `show_price` | Show price | checkbox | — | `"true"` | Offer price. |
| `show_duration` | Show duration | checkbox | — | `"true"` | Session minutes from the program. |
| `card_textcolor` | Text color | color | blank allowed | `""` | Blank = auto contrast. |

Then Display Conditions (shared).

### Call to Action
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `btn_text` | Text | text | — | `"Call To Action"` | |
| `btn_background_color` | Button background color | color | blank allowed | `""` | |
| `btn_text_color` | Button text color | color | blank allowed | `""` | Solid buttons only. |
| `btn_width` | Button width | pill_tabs | `"full"`, `"auto"` | `"full"` | |
| `btn_style` | Button style | pill_tabs | `"solid"`, `"outline"` | `"solid"` | |
| `btn_size` | Button size | pill_tabs | `"small"` (Sm), `"medium"` (Md), `"large"` (Lg) | `"small"` | |
| `btn_border_radius` | Border radius | range | 0–100 px | `"4"` | |

Then Background, Card Layout, Desktop/Mobile Layout (shared).

## Block: `group` — "Group"
Container that lays out child blocks in a row or column. Allowed children: `gamify_card`, `gamify_form`, `gamify_certificate`, `coaching_scheduling_widget`, `badge_area`. No display conditions on the group itself (children keep theirs). Child `width` is a share of the group width.

| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `width` | Group Width | grid | `"1"`–`"12"` | `"12"` | |
| `direction` | Direction | select | `"vertical"`, `"horizontal"` | `"horizontal"` | Horizontal wraps. |
| `align` | Vertical alignment | select | `"start"` (Top), `"center"` (Center), `"end"` (Bottom), `"stretch"` (Stretch) | `"start"` | Cross axis. `start` in a vertical group = stretch. |
| `justify` | Horizontal alignment | select | `"start"` (Left), `"center"` (Center), `"end"` (Right), `"between"` (Space Between), `"around"` (Space Around) | `"start"` | Main axis. |

### Layout
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `margin_desktop` | Outside spacing | spacer | px | placeholder 0/0/0/0 | Blank side = 0. |
| `margin_mobile` | Outside spacing (mobile) | spacer | px | placeholder 0/0/0/0 | Blank side = 0. |

### Background
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `background_color` | Background color | color | blank allowed | — | Blank = transparent. |

Child blocks are stored inside the group, not in the section's top-level `block_order`. Copy the exact nesting from a saved group in `get_theme_content`; if none exists, ask the trainer to add a group in the editor first.

## Block: `badge_area` — "Badge Area Block"
Renders the global Jiffy - Badges section at this spot — the only way badges become visible on the homepage. Badge content and styling: badges skill. No display conditions, no `block_break`.

| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `width` | Width | grid | `"1"`–`"12"` | `"12"` | |

### Desktop Settings (within a Dashboard Section)
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `show_block_desktop` | Show on desktop | pill_tabs | `"show"`, `"hide"` | `"show"` | |
| `margin_desktop` | Outside spacing | spacer | px | placeholder 0/0/0/0 | Blank side = 0. |

### Mobile Settings (within a Dashboard Section)
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `show_block_mobile` | Show on mobile | pill_tabs | `"show"`, `"hide"` | `"show"` | |
| `margin_mobile` | Outside spacing | spacer | px | placeholder 0/0/0/0 | Blank side = 0. |

## Pitfalls
- `hide_image` reads the wrong way: `true` = use the image.
- Card defaults differ per section: dashboard/Rewards/Downloads `width` `"4"`, `background_color` `"#ffffff"`; Sidebar `"12"` and `""`. Never copy a card's values between the sidebar and another section.
- New Downloads card: blank margins mean 0, not 5. Write `margin_desktop` / `margin_mobile` explicitly if the card needs spacing.
- Conditional blocks with an empty offer or ID list never show (whatever the action). ID lists are comma-separated and AND.
- Post triggers need the outline cache: they resolve in the browser after the outline has loaded the listed posts, never in the editor (the editor always shows conditional blocks with an indicator line). Never hide the outline other than with its own toggles (main skill).
- Coaching widget without both program and offer renders nothing for students.
- `block_break` inside a group is ignored; set it on top-level blocks only.
- Only two dashboard sections in 1.2: Top (above the collections) and Bottom. A request for a "middle" dashboard block goes into Top or Bottom; `product_section_middle` is not rendered.
- `group` and `badge_area` exist only in the dashboard sections; `gamify_form` too. Rewards has no Group, Form or Badge Area; Downloads and Sidebar take only `gamify_card`.
