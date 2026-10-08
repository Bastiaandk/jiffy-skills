# Nexus — Product Homepage Skill

> **Before any write:** if you have not fetched the main skill [`nexus-skill.md`](https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/v1.4/nexus-skill.md) in this
> conversation, fetch it now. It holds the payload shapes, value formats and working rules
> (send only changed keys, read back after every write), which this file does not repeat.

Covers the product homepage (`templates/product.liquid`) except the collections and the content blocks. **Dashboard - Collections (`jiffy_collections`) → `nexus-collections-skill.md`.** Blocks in the Dashboard Top / Middle / Bottom sections → `nexus-blocks-skill.md`. Badge content → badges skill. `community_widget` is Kajabi-native and out of scope.

## Section: `product_welcome` — "Dashboard - Progress Banner"
Banner at the top of the homepage: avatar, "Welcome back, <first name>", course progress % and a progress button. No blocks.

### (top level, no group)
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `hidewelcome` | Welcome area | pill_tabs | `"false"` (Show), `"true"` (Hide) | `"false"` | Inverted: `"true"` hides the whole banner. |
| `welcome` | Welcome text | text | — | `"Welcome back,"` | |
| `showname` | First name | pill_tabs | `"true"` (Show), `"false"` (Hide) | `"true"` | First word of the member's name, after the welcome text. |
| `showprogress` | Progress | pill_tabs | `"true"` (Show), `"false"` (Hide) | `"true"` | "<n>% <Progress text>". |
| `complete` | Progress text | text | — | `"Complete"` | Hidden when `showprogress` = `"false"`. |
| `hide_welcome_text_mobile` | Welcome text on mobile | pill_tabs | `"false"` (Show), `"true"` (Hide) | `"true"` | Inverted. Hides only the welcome text on mobile; the name stays. |
| `welcome_font_size` | Welcome text font size | range | 8–52 px | `"14"` | Applies to the title line on all screen sizes. |
| `text_color` | Text color | color | blank allowed | — | Blank = theme text-area text colour. |

### Avatar
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `showavatar` | Avatar | pill_tabs | `"true"` (Show), `"false"` (Hide) | `"true"` | Avatar ring shows progress. |
| `avatar_size` | Avatar size | pill_tabs | `"small"`, `"medium"`, `"large"` | `"large"` | |

### Progress button
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `showbutton` | Progress button | pill_tabs | `"true"` (Show), `"false"` (Hide) | `"true"` | |
| `start` | Start text | text | — | `"Start Course"` | Shown at 0 %; links to the next post. |
| `resume` | Resume text | text | — | `"Resume Course"` | Shown at 1–99 %; links to the next post. |
| `again` | Restart course text | text | — | `"Start Course Over"` | Shown at 100 %; links to the first post of the first category. |
| `btn_style` | CTA style | pill_tabs | `"solid"`, `"outline"` | `"solid"` | |
| `btn_size` | CTA size | pill_tabs | `"small"`, `"medium"`, `"large"` | `"medium"` | |
| `btn_background_color` | Button color | color | blank allowed | — | Blank = theme text-area text colour. Outline: border + text colour. |
| `btn_text_color` | Button text color | color | blank allowed | — | Solid buttons only. |

### Background
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `showbgimage` | Background image | pill_tabs | `"true"` (Show), `"false"` (Hide) | `"false"` | |
| `bgimage` | Background image | image_picker | — | `""` | Hidden when `showbgimage` = `"false"`. |
| `bgcolor` | Background color | color | blank allowed | `""` | Overlay colour over the image. Blank = theme `text_area_background`. Use an rgba/transparent-ish colour if the image must show through. |

### Section Styling
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `padding_desktop` | Section padding | spacer | px | placeholder 20/20/20/20 | Blank side = 20. |

## Section: `product_section_top` / `product_section_middle` / `product_section_bottom` — "Dashboard - Top / Middle / Bottom Section"
Three identical sections (only the name differs). Order on the page: Progress Banner, Top, Middle, Collections, Bottom. Each is a flex row of blocks; it renders nothing for students when it has no blocks.

### Section Settings
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `trigger` | Show / hide section | select | `"default"` (Always Show), `"always_hide"` (Always Hide), `"show"` (Show with Offer), `"hide"` (Hide with Offer) | `"default"` | Offer = member currently owns the offer. In the editor the section always shows, except `always_hide`. |
| `offer` | Select offer to change visibility | offer | numeric offer ID | `""` | Hidden when `trigger` = `"default"` or `"always_hide"`. `show` without an offer never shows. |
| `vertical` | Vertical alignment | select | `"start"` (Top), `"center"` (Center), `"end"` (Bottom) | `"start"` | Ignored when `equal_height` is on. |
| `horizontal` | Horizontal alignment | select | `"start"` (Left), `"center"` (Center), `"end"` (Right), `"between"` (Space Between), `"around"` (Space Around) | `"start"` | `between` / `around` currently have no effect (see Pitfalls). |
| `equal_height` | Equal height blocks | checkbox | — | `"false"` | Stretches blocks to the tallest in the row; buttons align at the bottom. |

### Background
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `showbgimage` | Show background image | checkbox | — | `"false"` | |
| `bgimage` | Background image | image_picker | — | `""` | Hidden when `showbgimage` = false. |
| `bgimage_blur` | Background image blur | range | 0–20 px | `"0"` | Hidden when `showbgimage` = false. |
| `background_color` | Background color | color | blank allowed | — | Overlay over the image. Text colour is picked automatically (light/dark) from this colour, or from `page_background` when blank. |
| `shadow` | Add shadow to section | checkbox | — | `"false"` | |
| `border_type` | Border type | select | `"none"`, `"solid"`, `"dotted"`, `"dashed"`, `"double"`, `"ridge"` | `"none"` | |
| `border_width` | Border width | range | 0–50 px | `"4"` | |
| `border_color` | Border color | color | blank allowed | `""` | Blank = black. |
| `border_radius` | Border radius | range | 0–100 px | `"4"` | |

### Desktop Layout
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `show_section_desktop` | Show on desktop | pill_tabs | `"show"`, `"hide"` | `"show"` | |
| `padding_desktop` | Inside spacing | spacer | px | placeholder 10/10/10/10 | Blank side = 10. Applies on mobile too. |
| `margin_desktop` | Outside spacing | spacer | px | placeholder 10/10/10/10 | Blank side = 10. |

### Mobile Layout
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `show_section_mobile` | Show on mobile | pill_tabs | `"show"`, `"hide"` | `"show"` | Mobile = below 768 px. |
| `two_column_mobile` | Mobile view | pill_tabs | `"columns"` (2 Columns), `"cascade"` (Cascade) | `"cascade"` | `cascade`: every block full width. `columns`: blocks keep their desktop `width` share (width `"6"` → two per row; `"4"` → three). |
| `margin_mobile` | Outside spacing | spacer | px | placeholder 10/10/10/10 | Blank side = 10. |

### Blocks
`gamify_card`, `gamify_form`, `gamify_certificate`, `coaching_scheduling_widget`, `group`, `badge_area` → **`nexus-blocks-skill.md`** (all block settings, defaults and block pitfalls).

## Section: `jiffy_onboarding` — "Jiffy - Onboarding"
Slideshow overlay on the product homepage, one `onboarding_slide` block per slide. Shown **once per browser per product**: closing it (×, CTA on the last slide or Esc) stores `nexus_onboarding_{product_id}` in localStorage. A new device or cleared browser sees it again. Opening the homepage with `?preview_onboarding` clears all onboarding keys and shows it without saving. No slides = nothing.

### (top level, no group)
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `enabled` | Enable onboarding guide | checkbox | — | `"true"` | Off = never shown to students. |
| `show_preview` | Show preview in admin | checkbox | — | `"false"` | Editor only; closing does not save the seen state. |
| `preview_slide` | Active slide | range | 1–10 | `"1"` | Slide shown in the editor preview. Hidden when `show_preview` = false. |

### Card
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `card_background` | Card background | color | hex | `"#ffffff"` | Also the CTA text colour. |
| `card_text_color` | Text color | color | hex | `"#333333"` | All card text, independent of theme colours. |
| `card_max_width` | Card max width | range | 400–900 px | `"620"` | |

### Navigation
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `cta_text` | CTA button text (last slide) | text | — | `"Let's go →"` | Blank = `"Let's go →"`. |
| `dot_color` | Dot color | color | hex | `"#cccccc"` | |
| `dot_active_color` | Active dot & CTA button color | color | hex | `"#333333"` | |
| `arrow_color` | Arrow icon color | color | hex | `"#333333"` | |
| `arrow_bg` | Arrow button background | color | hex | `"#ffffff"` | |

### Overlay
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `blur_intensity` | Background blur | range | 2–20 px | `"8"` | |
| `overlay_color` | Overlay color | color | hex | `"#000000"` | |
| `overlay_opacity` | Overlay opacity | range | 0–90 % | `"60"` | |

### Block: `onboarding_slide` — "Slide"
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `slide_type` | Slide type | pill_tabs | `"image"`, `"video"` | `"image"` | |
| `image` | Image | image_picker | 1240 × 698 (16:9) suggested | — | Hidden when `slide_type` = `"video"`. Blank = placeholder. |
| `video` | Video | video | Kajabi video | — | Hidden when `slide_type` = `"image"`. Not found = text-only slide. |
| `content` | Text | rich_text | HTML | `"Slider text goes here. You can use this space to explain the benefits of your product or provide a quick tutorial."` | |

## Section: `jiffy_popups` — "Jiffy - Popups"
Confetti popups on the product homepage only, one `gamify_popup_confetti` block per popup. Each popup shows **once per browser**: shown block IDs go in the `confettiActions` cookie (30 days, renewed when a popup shows). If several popups become due on the same visit, only the last one in block order shows; the others are marked as seen. A browser without the cookie gets the last active popup on its first visit. Category and offer conditions are checked when the homepage loads, so the popup appears on the next homepage visit after the condition is met.

### Block: `gamify_popup_confetti` — "Popup Confetti Message"
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `edit` | Edit popup message | checkbox | — | `"true"` | Editor only: keeps this popup open (and fires confetti) while editing. No effect for students. |

#### Display Conditions
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `visibility_trigger` | Trigger | select | `"offer"` (Offer), `"category"` (Category completed), `"post"` (Post completed) | `"offer"` | No show/hide action: the popup always shows when the condition is met. |
| `visibility_offer` | Select offer | offer | numeric offer ID | `""` | Condition = member currently owns the offer. Hidden unless trigger `offer`. |
| `visibility_categories` | Category IDs | text | comma-separated IDs | `""` | AND, same matching as block conditions. Hidden unless trigger `category`. |
| `visibility_posts` | Post IDs | text | comma-separated IDs | `""` | AND, checked in the browser from the outline cache. Hidden unless trigger `post`. |

Empty offer / ID list = never shows.

#### Popup Content
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `confettistyle` | Confetti style | select | `"none"` (No Confetti), `"cannon"` (Confetti Cannon), `"fireworks"` (Fireworks), `"school"` (School Parade), `"rain"` (Rain), `"stars"` (Stars) | `"cannon"` | |
| `confetti_action_color` | Confetti color | color | blank allowed | `""` | Blank = `primary_color`. Hidden when `confettistyle` = `"none"`. |
| `contenttitle` | Shoutout | text | — | `"Congratulations!"` | Empty = no title. |
| `contentname` | Add students name | checkbox | — | `"true"` | Appends the first name to the shoutout. |
| `content` | Message | rich_text | HTML | `"Congratulate your student on achieving this mile stone."` | |
| `text_color` | Text color | color | blank allowed | `""` | Blank = auto contrast against `background_color` (or `text_area_background`). |
| `showimage` | Show image | checkbox | — | `"true"` | |
| `image` | Add a badge or certificate | image_picker | 250 × 250 transparent suggested | — | Hidden when `showimage` = false. Blank = placeholder. |
| `imgwidth` | Image width | range | 0–200 px | `"100"` | Hidden when `showimage` = false. |

#### Button Styling
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `use_btn` | Use button | checkbox | — | `"false"` | All fields below hidden when `use_btn` = false. |
| `btn_text` | Button text | text | — | `"Click here"` | |
| `btn_action` | Button action | action | URL | `""` | |
| `new_tab` | Open in new tab | checkbox | — | `"false"` | |
| `btn_background_color` | Button background color | color | blank allowed | `""` | Blank = theme button style. Outline: border + text colour. |
| `btn_text_color` | Button text color | color | blank allowed | `""` | Used only for solid buttons with a background colour; blank = white. |
| `btn_width` | Button width | pill_tabs | `"full"`, `"auto"` | `"full"` | |
| `btn_style` | Button style | pill_tabs | `"solid"`, `"outline"` | `"solid"` | |
| `btn_size` | Button size | pill_tabs | `"small"` (Sm), `"medium"` (Md), `"large"` (Lg) | `"small"` | |
| `btn_border_radius` | Button border radius | range | 0–100 px | `"4"` | |

#### Background
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `confetti_width` | Container Block Width in % Screen | range | 20–100 % | `"40"` | Desktop only. |
| `background_color` | Block background color | color | blank allowed | `"#f9f9f9"` | |
| `border_type` | Border type | select | `"none"`, `"solid"`, `"dotted"`, `"dashed"`, `"double"`, `"ridge"` | `"solid"` | |
| `border_width` | Border width | range | 0–50 px | `"1"` | |
| `border_color` | Border color | color | blank allowed | `"#ccc"` | |
| `border_radius` | Border radius | range | 0–100 px | `"10"` | |
| `overlay_background` | Overlay background color | color | rgba allowed | `"rgba(220, 202, 184, 0.2)"` | Blurred overlay behind the popup. Blank = same rgba. |

## Pitfalls
- `trigger` values: always-hide is `"always_hide"`; the offer variants are `"show"` / `"hide"` — not `"show_offer"`.
- Section `horizontal` = `"between"` / `"around"` currently does nothing (the value is written as raw CSS, which needs `space-between`). Use a `group` with `justify` (blocks skill) for spacing, or `start`/`center`/`end`.
- `hidewelcome` / `hide_welcome_text_mobile`: `"true"` = hide.
- Popups with an empty offer or ID list never show. ID lists are comma-separated and AND.
- Post-triggered popups need the outline cache: they resolve only after the outline has loaded the listed posts. Never hide the outline other than with its own toggles (main skill).
- Onboarding / popup "nothing happens" on the trainer's own browser is usually the seen state: use `?preview_onboarding`, or a private window for popups.
- Two popups due on the same visit: only the last in block order shows; the other is marked seen.
- Using an offer-or-category popup together with a post popup makes them re-appear on later visits (the cookie is overwritten by each check). Warn the trainer.
