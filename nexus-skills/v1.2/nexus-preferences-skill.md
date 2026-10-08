# Nexus — Preferences Skill

> **Before any write:** if you have not fetched the main skill [`nexus-skill.md`](https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/v1.2/nexus-skill.md) in this
> conversation, fetch it now. It holds the payload shapes, value formats and working rules
> (send only changed keys, read back after every write), which this file does not repeat.

Global theme settings: top-level keys in `settings` (see the main skill for the write shape). They apply to every page of the theme. `get_theme_content` returns **no `_defaults` for global settings**: a key missing from the saved settings means the schema default below applies. This file is the only source for those defaults.

## Jiffy License Key
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `jiffylicense` | Enter your license key and save this page | text | — | `""` | **Hard rule: never write, clear or include in any payload.** Empty → students see "This course is currently unavailable"; a value different from the one validated before → key-mismatch lock. Only the trainer enters it in the editor. |

## Settings - Favicon
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `favicon` | Favicon image | image_picker | 32×32 PNG, transparency OK | — | Empty → no theme favicon. Browsers cache favicons; the change can take a while to show. |

## Settings - Typography
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `font_family` | Base font family | font_select | Google Fonts family name | `"Open Sans"` | Body text. Only weights 400 and 700 (+ italics) are loaded. |
| `heading_font_family` | Heading font family | font_select | Google Fonts family name | `"Open Sans"` | h1–h6. Same weights. |
| `certificate_font_family` | Certificate Font Family | font_select | Google Fonts family name | `"Montserrat"` | Text on the generated certificate. Trainer must refresh after saving to see it. |
| `h1_font_size` | H1 font size | range | 8–72 px | `"40"` | Desktop; also the post title. |
| `h2_font_size` | H2 font size | range | 8–72 px | `"32"` | Desktop |
| `h3_font_size` | H3 font size | range | 8–72 px | `"28"` | Desktop |
| `h4_font_size` | H4 font size | range | 8–72 px | `"24"` | Desktop |
| `h5_font_size` | H5 font size | range | 8–72 px | `"20"` | Desktop |
| `h6_font_size` | H6 font size | range | 8–72 px | `"16"` | Desktop |
| `p_font_size` | Paragraph font size | range | 8–72 px | `"18"` | Desktop |
| `h1_font_size_mobile` | H1 font size | range | 8–72 px | `"32"` | ≤767 px |
| `h2_font_size_mobile` | H2 font size | range | 8–72 px | `"28"` | ≤767 px |
| `h3_font_size_mobile` | H3 font size | range | 8–72 px | `"24"` | ≤767 px |
| `h4_font_size_mobile` | H4 font size | range | 8–72 px | `"20"` | ≤767 px |
| `h5_font_size_mobile` | H5 font size | range | 8–72 px | `"18"` | ≤767 px |
| `h6_font_size_mobile` | H6 font size | range | 8–72 px | `"16"` | ≤767 px |
| `p_font_size_mobile` | Paragraph font size | range | 8–72 px | `"16"` | ≤767 px |

Desktop and mobile sizes share labels in the editor (under "Desktop font sizes" / "Mobile font sizes" headers); ask which one the trainer means.

## Settings - Colors & Background
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `primary_color` | Primary | color | hex, never blank | `"#2e91fc"` | Borders, progress bars and progress circle, lesson video player, card video player when the card has no video colour, paywall button and paywall CTA buttons, `.btn-primary`, confetti and chatbot fallback. Used in SCSS `lighten()`/`darken()`. |
| `accent_color` | Accent | color | hex, never blank | `"#2e91fc"` | Links (and hover), active breadcrumb, active tab underline, default button colour of content blocks (dashboard/post blocks without own button colour), form buttons, live-session CTA and chatbot accent fallback. Used in SCSS `darken()`. |
| `text_light` | Text light | color | hex | `"#fff"` | Automatic text colour on dark backgrounds (sections, cards, buttons without own text colour). |
| `text_dark` | Text dark | color | hex | `"#30373d"` | Automatic text colour on light backgrounds. |
| `page_background` | Page background | color | hex or `""` | `""` | Blank → `#fff`. Also the fallback background for cards and sections without own background colour. |
| `sidebar_background` | Navigation background | color | hex | `"#000000"` | Sidebar background when Sidebar (global) has no own background colour. |
| `text_area_background` | Text area background | color | hex or `""` | `"#fff"` | Content panels: post body, action bar, popups, Rewards/Downloads tabs, paywall. Blank → `#fff`. |
| `page_background_img` | Page background image | image_picker | suggested 2500×2500 | — | Fixed, cover-sized body background behind all pages. |

## Settings - Custom Code
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `extra_css_txt` | Add your css, don't add '<style>' tags | textarea | raw CSS | `"/* add your css code without <style> tags */"` | Injected raw inside a `<style>` in `<head>`. No `<style>` tags. |
| `embedded_scripts` | Embedded scripts | textarea | raw HTML | `"<!-- Embedded '<script>' tags go here -->"` | Injected raw at the end of `<body>`. Must include its own `<script>` tags. |

Both fields hold the trainer's existing code: read the current value, **append**, write the combined value. Never overwrite. Broken code here breaks every page.

## Settings - Comments Language
Labels for Kajabi lesson comments. All `text`, any string.

| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `language_comment_locked` | Comments locked | text | — | `"Comments Locked"` | |
| `language_comment_placeholder` | Comments placeholder | text | — | `"Say Something..."` | |
| `language_comment_submitting` | Comment submitting | text | — | `"submitting"` | |
| `language_comment_add` | Comment submit | text | — | `"Post Comment"` | |
| `language_comment_reply` | Comment reply | text | — | `"REPLY"` | |
| `language_comment_edit` | Comment edit | text | — | `"EDIT"` | |
| `language_comment_show_more` | Show more comments | text | — | `"Show More"` | |
| `language_comment_show_more_loading` | Show more comments loading | text | — | `"Loading More Comments..."` | |

## Jiffy - Icons
Font Awesome 5 Free. Write the **value** (full class string), not the label. Each select has a `*_custom` text field, used only when the select is `"custom"` (hidden in the editor otherwise). A custom field accepts a class (`"fas fa-book-open"`) or a full `<i class="...">` tag; empty → the default icon of that select.

| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `outline_icon` | Outline icon | select | `fas fa-bars` (Bars), `fas fa-list-ul` (List), `fas fa-sitemap` (Sitemap), `fas fa-user-graduate` (Student), `fas fa-graduation-cap` (Graduation cap), `custom` (Custom) | `"fas fa-user-graduate"` | Sidebar outline toggle. |
| `outline_icon_custom` | Custom outline icon | text | FA class or `<i>` tag | — | |
| `chatbot_icon` | Chatbot icon | select | `far fa-comment-dots` (Comment dots), `fas fa-robot` (Robot), `fas fa-question-circle` (Question circle), `custom` (Custom) | `"far fa-comment-dots"` | Sidebar chatbot button. |
| `chatbot_icon_custom` | Custom chatbot icon | text | FA class or `<i>` tag | — | |
| `icon_favorite` | Favorite icon | select | `far fa-heart` (Heart), `far fa-star` (Star), `far fa-bookmark` (Bookmark), `custom` (Custom) | `"far fa-heart"` | Favorite buttons (action bar, sidebar, cards). Active state = same icon with `far` → `fas`. |
| `icon_favorite_custom` | Custom favorite icon | text | **`far` class** | — | Must be a `far` (outline) class, else the favorited state looks identical. |
| `icon_badges` | Rewards / Badges icon | select | `fas fa-trophy` (Trophy), `fas fa-award` (Award), `fas fa-gift` (Gift), `custom` (Custom) | `"fas fa-trophy"` | Action bar and sidebar. |
| `icon_badges_custom` | Custom rewards / badges icon | text | FA class or `<i>` tag | — | |
| `icon_downloads` | Downloads icon | select | `fas fa-file-download` (File download), `fas fa-download` (Download arrow), `fas fa-archive` (Archive), `custom` (Custom) | `"fas fa-file-download"` | Action bar, sidebar, post downloads list. |
| `icon_downloads_custom` | Custom downloads icon | text | FA class or `<i>` tag | — | |
| `icon_external` | External links icon | select | `fas fa-link` (Link), `fas fa-external-link-alt` (External link), `fas fa-globe` (Globe), `fas fa-compass` (Compass), `custom` (Custom) | `"fas fa-link"` | External links in the sidebar. |
| `icon_external_custom` | Custom external links icon | text | FA class or `<i>` tag | — | |
| `paywall_icon` | Paywall icon | select | `fas fa-dollar-sign` (Dollar ($)), `fas fa-euro-sign` (Euro (€)), `fas fa-pound-sign` (Pound (£)), `fas fa-yen-sign` (Yen / Yuan (¥)), `fas fa-lock` (Lock), `fas fa-shield-alt` (Shield), `custom` (Custom) | `"fas fa-dollar-sign"` | Marks locked (paywalled) lessons. |
| `paywall_icon_custom` | Custom paywall icon | text | FA class or `<i>` tag | — | |
| `icon_mobile_toggle` | Mobile toggle icon | select | `fas fa-chevron-left` (Chevron left), `fas fa-bars` (Bars (hamburger)), `fas fa-arrow-left` (Arrow left), `custom` (Custom) | `"fas fa-chevron-left"` | Header button that opens the sidebar on mobile. |
| `icon_mobile_toggle_custom` | Custom mobile toggle icon | text | FA class or `<i>` tag | — | |

## Jiffy - Announcements Bar
Bar at the top of product, post, category and categories pages showing the latest product announcement; click opens it. Students can close it for one day (per announcement, so a new announcement shows again).

| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `gamify_announcements` | Announcement bar | pill_tabs | `hide` (Hide), `show` (Show) | `"hide"` | Nothing shows without at least one announcement. |
| `gamify_announcement_read_more` | Read more text | text | — | `"Read More"` | Appended after the title; `""` → title only. |
| `gamify_announcement_bg` | Background color | color | hex, not blank | `"#fff"` | |
| `gamify_announcement_color` | Text color | color | hex, not blank | `"#ff0000"` | Text, link and close button. |

## Jiffy - Pagination
Prev/next buttons on the announcements page, in outline-type Dashboard collections and on search results. **Not** used on the categories page.

| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `previous_text` | Previous text | text | — | `"Previous"` | |
| `next_text` | Next text | text | — | `"Next"` | |
| `pagination_bg_color` | Button background color | color | hex | `"#ffffff"` | With `outline` style this is the border **and text** colour. |
| `pagination_text_color` | Button text color | color | hex | `"#333333"` | `solid`: text colour. `outline`: only the hover text colour. |
| `pagination_btn_style` | Button style | pill_tabs | `solid` (Solid), `outline` (Outline) | `"solid"` | |
| `pagination_btn_size` | Button size | pill_tabs | `small` (Sm), `medium` (Md), `large` (Lg) | `"small"` | |
| `pagination_btn_radius` | Border radius | range | 0–50 px | `"4"` | |

## Jiffy - Live Rooms
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `live_room_img` | Live room image | image_picker | recommended 1280×720 | — | Image for Live Room categories in outline collections and category banners. Empty → the category's own poster image (placeholder if none). |

## Pitfalls
- `jiffylicense` is never part of a payload — not even to "keep" the current value.
- No `_defaults` exist for these keys; an absent key is the schema default, not "empty".
- `primary_color` / `accent_color` are swapped in trainers' heads: "link/button colour" is **Accent**; "progress bar/paywall button" is **Primary**. Both must stay valid hex — a blank or `rgba()` value breaks the SCSS and the whole stylesheet.
- Font values are Google Fonts family names exactly as Google lists them (`"Playfair Display"`); bold weights other than 700 are synthesised by the browser.
- Font sizes and radius are bare number strings (`"24"`), no `px`.
- Icon selects take the class value (`"fas fa-bars"`), not the label ("Bars"); a `*_custom` field does nothing unless its select is `"custom"`.
- Pagination `outline` style: text uses `pagination_bg_color` — a white bg colour gives white text on a light page.
- Custom code fields: append, never replace; check for an existing value first.
