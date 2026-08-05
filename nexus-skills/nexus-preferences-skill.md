# Nexus — Preferences Skill File

**Source:** `config/settings_schema.json`
**Theme version:** 1.4.10

Global theme settings — apply to all pages and all courses using this theme.
Write via `update_theme_content` at the root settings level (not inside a section).

---

## MCP rules

- Global settings path: `settings` (top-level, not inside `sections`)
- `{"updated": true}` does not mean the change rendered. Always call `get_theme_content` after writing.
- Changes affect all courses using this theme installation simultaneously.

---

## License key

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `jiffylicense` | text | `""` | Required — theme locks all content if missing or invalid |

---

## Favicon

| Setting ID | Type | Notes |
|---|---|---|
| `favicon` | image_picker | Must be 32×32 PNG. Allow time for change to propagate. |

---

## Typography

### Fonts

| Setting ID | Type | Default |
|---|---|---|
| `font_family` | font_select | `"Open Sans"` |
| `heading_font_family` | font_select | `"Open Sans"` |
| `certificate_font_family` | font_select | `"Montserrat"` |

### Desktop font sizes

| Setting ID | Default |
|---|---|
| `h1_font_size` | `40` |
| `h2_font_size` | `32` |
| `h3_font_size` | `28` |
| `h4_font_size` | `24` |
| `h5_font_size` | `20` |
| `h6_font_size` | `16` |
| `p_font_size` | `18` |

### Mobile font sizes

| Setting ID | Default |
|---|---|
| `h1_font_size_mobile` | `32` |
| `h2_font_size_mobile` | `28` |
| `h3_font_size_mobile` | `24` |
| `h4_font_size_mobile` | `20` |
| `h5_font_size_mobile` | `18` |
| `h6_font_size_mobile` | `16` |
| `p_font_size_mobile` | `16` |

---

## Colors & background

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `primary_color` | color | `"#2e91fc"` | Used for buttons, links, accents throughout |
| `accent_color` | color | `"#2e91fc"` | Secondary accent color |
| `text_light` | color | `"#fff"` | Light text (on dark backgrounds) |
| `text_dark` | color | `"#30373d"` | Dark text (on light backgrounds) |
| `page_background` | color | `""` (blank) | Global page background color |
| `sidebar_background` | color | `"#000000"` | Navigation/sidebar background |
| `text_area_background` | color | `"#fff"` | Post body text area background |
| `page_background_img` | image_picker | — | Suggested: 2500×2500 |

---

## Custom code

| Setting ID | Type | Default |
|---|---|---|
| `extra_css_txt` | textarea | `"/* add your css code without <style> tags */"` |
| `embedded_scripts` | textarea | `"<!-- Embedded '<script>' tags go here -->"` |

---

## Comments language

| Setting ID | Default |
|---|---|
| `language_comment_locked` | `"Comments Locked"` |
| `language_comment_placeholder` | `"Say Something..."` |
| `language_comment_submitting` | `"submitting"` |
| `language_comment_add` | `"Post Comment"` |
| `language_comment_reply` | `"REPLY"` |
| `language_comment_edit` | `"EDIT"` |
| `language_comment_show_more` | `"Show More"` |
| `language_comment_show_more_loading` | `"Loading More Comments..."` |

---

## Icons

All icons use Font Awesome 5 Free. Each icon setting has a `_custom` companion
(a text field for a custom FA class) that activates when the select is set to `"custom"`.

| Setting ID | Default | Options |
|---|---|---|
| `outline_icon` | `"fas fa-user-graduate"` | bars / list / sitemap / student / graduation-cap / custom |
| `chatbot_icon` | `"far fa-comment-dots"` | comment-dots / robot / question-circle / custom |
| `icon_favorite` | `"far fa-heart"` | heart / star / bookmark / custom |
| `icon_badges` | `"fas fa-trophy"` | trophy / award / gift / custom |
| `icon_downloads` | `"fas fa-file-download"` | file-download / download / archive / custom |
| `icon_external` | `"fas fa-link"` | link / external-link-alt / globe / compass / custom |
| `paywall_icon` | `"fas fa-dollar-sign"` | dollar / euro / pound / yen / lock / shield / custom |
| `icon_mobile_toggle` | `"fas fa-chevron-left"` | chevron-left / bars / arrow-left / custom |

---

## Announcements bar

Shown at the top of product, post, category, and categories pages.

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `gamify_announcements` | pill_tabs | `"show"` / `"hide"` | `"hide"` |
| `gamify_announcement_read_more` | text | — | `"Read More"` |
| `gamify_announcement_bg` | color | — | `"#fff"` |
| `gamify_announcement_color` | color | — | `"#ff0000"` |

---

## Pagination

Controls the prev/next buttons on the categories overview page.

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `previous_text` | text | — | `"Previous"` |
| `next_text` | text | — | `"Next"` |
| `pagination_bg_color` | color | — | `"#ffffff"` |
| `pagination_text_color` | color | — | `"#333333"` |
| `pagination_btn_style` | pill_tabs | `"solid"` / `"outline"` | `"solid"` |
| `pagination_btn_size` | pill_tabs | `"small"` / `"medium"` / `"large"` | `"small"` |
| `pagination_btn_radius` | range | 0–50 | `4` |

---

## Live rooms

| Setting ID | Type | Notes |
|---|---|---|
| `live_room_img` | image_picker | Custom image for live room categories. Replaces default product image. Recommended: 1280×720 |
