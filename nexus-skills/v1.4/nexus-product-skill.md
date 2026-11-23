# Nexus — Product Homepage Skill

> **Before any write:** if you have not fetched the main skill [`nexus-skill.md`](https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/v1.4/nexus-skill.md) in this
> conversation, fetch it now. It holds the payload shapes, value formats and working rules
> (send only changed keys, read back after every write), which this file does not repeat.

Covers the product homepage (`templates/product.liquid`) except the collections and the content blocks. **Dashboard - Collections (`jiffy_collections`) → `nexus-collections-skill.md`.** Blocks in the Dashboard Top / Bottom sections → `nexus-blocks-skill.md`. Badge content → badges skill. `community_widget` is Kajabi-native and out of scope.

## Section: `product_welcome` — "Dashboard - Progress Banner"
Banner at the top of the homepage: avatar, "Welcome back, <first name>", course progress % and a progress button. No blocks.

### (top level, no group) — what shows
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `hidewelcome` | Show banner | pill_tabs | `"false"` (Show), `"true"` (Hide) | `"false"` | Inverted: `"true"` hides the whole banner. |
| `showname` | First name | pill_tabs | `"true"` (Show), `"false"` (Hide) | `"true"` | First word of the member's name, after the welcome text. |
| `showprogress` | Progress indicator | pill_tabs | `"xp"` (XP), `"true"` (Default), `"false"` (Hide) | `"true"` | Default = "<n>% <Progress text>". XP = the XP pill instead of the percentage line (only visible when `jiffy_xp.xp_enabled` = `"show"`, see the xp skill). Older saves hold the booleans `true`/`false`. |
| `xp_pill` | Create pill | pill_tabs | `"true"` (Yes), `"false"` (No) | `"true"` | Only with `showprogress` = `"xp"`. The pill sits in the middle of the banner (inline below 992px), links to the Rewards tab; a hover popover shows level, bar and XP to the next level. Yes: the pill is dressed exactly like the Progress button (the Button styling group: style, size, colour, gradient, radius, text colour), so both match. No: plain text in the banner text colour, no background or rounding. The XP icon (`icon_xp`, Jiffy - Icons) takes the XP Icon color with No or with Button style Outline, the button text on a solid pill. |
| `showbutton` | Progress button | pill_tabs | `"true"` (Show), `"false"` (Hide) | `"true"` | Independent of the progress indicator. |
| `showavatar` | Avatar | pill_tabs | `"true"` (Show), `"false"` (Hide) | `"true"` | Avatar ring shows progress. |
| `avatar_size` | Avatar size | pill_tabs | `"small"`, `"medium"`, `"large"` | `"large"` | Hidden when `showavatar` = `"false"`. |

### Welcome & progress text
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `welcome` | Welcome text | text | — | `"Welcome back,"` | Header "Welcome text". |
| `welcome_font_size` | Welcome text font size | range | 8–52 px | `"14"` | Applies to the title line on all screen sizes. |
| `text_color` | Text color | color | blank allowed | — | Blank = theme text-area text colour. Also colours the XP pill when `xp_pill` = `"false"`. |
| `hide_welcome_text_mobile` | Welcome text on mobile | pill_tabs | `"false"` (Show), `"true"` (Hide) | `"true"` | Inverted. Hides only the welcome text on mobile; the name stays. |
| `complete` | Progress text | text | — | `"Complete"` | Header "Progress text". Only with `showprogress` = `"true"`. |
| `start` | Start text | text | — | `"Start Course"` | Progress button at 0 %; links to the next post. |
| `resume` | Resume text | text | — | `"Resume Course"` | Progress button at 1–99 %; links to the next post. |
| `again` | Restart course text | text | — | `"Start Course Over"` | Progress button at 100 %; links to the first post of the first category. |

### Button styling
One set of settings for the Progress button **and** the XP pill; there are no separate pill settings. Only `xp_pill` = `"false"` overrules them (plain text).
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `btn_style` | Button style | pill_tabs | `"solid"`, `"outline"` | `"solid"` | Outline: transparent with border and text in the button colour, pill included. |
| `btn_size` | Button size | pill_tabs | `"small"`, `"medium"`, `"large"` | `"medium"` | Padding and font size; the pill follows, so button and pill have the same height. |
| `btn_background_color` | Button color | color | blank allowed | — | Blank: the theme accent colour. Solid: fill (darkens a little on hover); Outline: border + text colour. |
| `btn_gradient` | Button gradient | select | `"none"`, `"linear"` | `"none"` | Solid style only (hidden for Outline): a linear gradient on the button colour (blank: the theme accent colour); dims slightly on hover. |
| `btn_gradient_color` | Button gradient second color | color | hex or `""` | `""` | Blank: an automatic lighter or darker shade. Hidden when the button gradient is `"none"` or the style is Outline. |
| `btn_gradient_angle` | Button gradient angle | range | 0–360 | `"135"` | Hidden when the button gradient is `"none"` or the style is Outline. |
| `btn_radius` | Button border radius | range | 0–30 px | `"4"` | 4 = the theme default; 30 gives a pill shape. |
| `btn_text_color` | Button text color | color | blank allowed | — | Solid style only (hidden for Outline). Blank: light or dark text to match the button colour. |

### Background
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `showbgimage` | Background image | pill_tabs | `"true"` (Show), `"false"` (Hide) | `"false"` | |
| `bgimage` | Background image | image_picker | — | `""` | Hidden when `showbgimage` = `"false"`. |
| `bgcolor` | Background color | color | blank allowed | `""` | Overlay colour over the image. Blank = theme `text_area_background`. Use an rgba/transparent-ish colour if the image must show through. |
| `bg_gradient` | Gradient | select | `"none"`, `"linear"` | `"none"` | A linear gradient on top of the banner background (own colour, else the theme text area colour). Hidden and inactive while `showbgimage` is on: the image wins. |
| `bg_gradient_color` | Gradient second color | color | hex or `""` | `""` | Blank: an automatic lighter (dark base) or darker (light base) shade. Hidden when the gradient is `"none"`. |
| `bg_gradient_angle` | Gradient angle | range | 0–360 | `"135"` | Degrees. Hidden when the gradient is `"none"`. |

### Section Styling
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `padding_desktop` | Section padding | spacer | px | placeholder 20/20/20/20 | Blank side = 20. |

## Section: `product_section_top` / `product_section_bottom` — "Dashboard - Top / Bottom Section"
Two identical sections (only the name differs). Order on the page: Progress Banner, Top, Collections, Bottom. Each is a flex row of blocks; it renders nothing for students when it has no blocks. A third copy, `product_section_middle` ("Dashboard - Middle Section"), exists as a file with the same settings, but the 1.3 product template does not place it on the page: never add blocks or settings to it, they would not show (see Pitfalls).

### Section Settings
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `trigger` | Show / hide section | select | `"default"` (Always Show), `"always_hide"` (Always Hide), `"show"` (Show with Offer), `"hide"` (Hide with Offer) | `"default"` | Offer = member currently owns the offer. In the editor the section always shows, except `always_hide`. |
| `offer` | Select offer to change visibility | offer | numeric offer ID | `""` | Hidden when `trigger` = `"default"` or `"always_hide"`. `show` without an offer never shows. |
| `vertical` | Vertical alignment | select | `"start"` (Top), `"center"` (Center), `"end"` (Bottom) | `"start"` | Ignored when `equal_height` is on. |
| `horizontal` | Horizontal alignment | select | `"start"` (Left), `"center"` (Center), `"end"` (Right), `"between"` (Space Between), `"around"` (Space Around) | `"start"` | `between` / `around` spread the blocks over the row (space-between / space-around). |
| `equal_height` | Equal height blocks | checkbox | — | `"false"` | Stretches blocks to the tallest in the row; buttons align at the bottom. |

### Background
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `showbgimage` | Show background image | checkbox | — | `"false"` | |
| `bgimage` | Background image | image_picker | — | `""` | Hidden when `showbgimage` = false. |
| `bgimage_blur` | Background image blur | range | 0–20 px | `"0"` | Hidden when `showbgimage` = false. |
| `background_color` | Background color | color | blank allowed | — | Overlay over the image. Text colour is picked automatically (light/dark) from this colour, or from `page_background` when blank. |
| `background_gradient` | Gradient | select | `"none"`, `"linear"` | `"none"` | A linear gradient on top of the section background (own colour, else the page colour). Hidden and inactive while `showbgimage` is on: the image wins. |
| `background_gradient_color` | Gradient second color | color | hex or `""` | `""` | Blank: an automatic lighter (dark base) or darker (light base) shade. Hidden when the gradient is `"none"`. |
| `background_gradient_angle` | Gradient angle | range | 0–360 | `"135"` | Degrees. Hidden when the gradient is `"none"`. |
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
`gamify_card`, `code` (Jiffy Custom Code), `gamify_form`, `gamify_certificate`, `coaching_scheduling_widget`, `group`, `badge_area` → **`nexus-blocks-skill.md`** (all block settings, defaults and block pitfalls).

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
| `confettistyle` | Confetti style | select | `"none"` (No Confetti), `"cannon"` (Confetti Cannon), `"fireworks"` (Fireworks), `"school"` (School Parade), `"rain"` (Rain), `"stars"` (Stars), `"random"` (Random — picks one of the five styles each time; since 1.4.0) | `"cannon"` | |
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
| `btn_gradient` / `btn_gradient_color` | Button gradient / second color | select / color | `"none"`, `"linear"` / hex or blank | `"none"` / `""` | Solid only, from the button colour (blank: `primary_color`), fixed 135°, dims on hover. |
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
| `background_gradient` / `background_gradient_color` / `background_gradient_angle` | Gradient / second color / angle | | | `"none"` / `""` / `"135"` | A linear gradient on the popup box. |
| `border_type` | Border type | select | `"none"`, `"solid"`, `"dotted"`, `"dashed"`, `"double"`, `"ridge"` | `"solid"` | |
| `border_width` | Border width | range | 0–50 px | `"1"` | |
| `border_color` | Border color | color | blank allowed | `"#ccc"` | |
| `border_radius` | Border radius | range | 0–100 px | `"10"` | |
| `overlay_background` | Overlay background color | color | rgba allowed | `"rgba(220, 202, 184, 0.2)"` | Blurred overlay behind the popup. Blank = same rgba. |

## Pitfalls
- `trigger` values: always-hide is `"always_hide"`; the offer variants are `"show"` / `"hide"` — not `"show_offer"`.
- `hidewelcome` / `hide_welcome_text_mobile`: `"true"` = hide.
- Popups with an empty offer or ID list never show. ID lists are comma-separated and AND.
- Post-triggered popups need the outline cache: they resolve only after the outline has loaded the listed posts. Never hide the outline other than with its own toggles (main skill).
- Popup "nothing happens" on the trainer's own browser is usually the seen state: use a private window. 1.4 has no onboarding section (`jiffy_onboarding` is not in this Nexus version yet).
- No Middle section on the 1.4 homepage: `product_section_middle` is not rendered. For content between the banner and the collections use `product_section_top`; below the collections, `product_section_bottom`.
- Two popups due on the same visit: only the last in block order shows; the other is marked seen.
