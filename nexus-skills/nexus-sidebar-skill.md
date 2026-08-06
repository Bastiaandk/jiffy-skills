# Nexus — Sidebar Skill File

**Section name in theme:** `product_outline`
**Applies to:** all page templates (product, post, category, categories, announcements, comment, search)

The sidebar is global. Any change to `product_outline` settings is immediately
live on every page of the course. Never write to it without confirming with the
user first.

---

## MCP rules for this section

- Section key in the payload: `product_outline`
- Settings are top-level on the section: `settings.sections.product_outline.settings`
- Blocks (filters, external links, cards) live in `settings.sections.product_outline.blocks`
- Block order is load-bearing — always include `block_order` when adding or removing a block
- `{"updated": true}` does not mean the change rendered. Always call `get_theme_content` after writing.

---

## Display settings

| Setting ID | Type | Options | Default | Notes |
|---|---|---|---|---|
| `sidebar_slider` | pill_tabs | `"show"` / `"hide"` | `"show"` | Hides the entire sidebar when `"hide"`. All other settings become inactive. |
| `sidebar_desktop` | pill_tabs | `"slider"` / `"fixed"` | `"slider"` | Hidden when `sidebar_slider` is `"hide"` |
| `sidebar_mobile` | pill_tabs | `"slider"` / `"compact"` | `"compact"` | Hidden when `sidebar_slider` is `"hide"` |

---

## Sidebar content — visibility toggles

All toggles are `"show"` / `"hide"` unless noted. All are hidden when `sidebar_slider` is `"hide"`.

| Setting ID | Label | Default |
|---|---|---|
| `show_product_title` | Sidebar Title / Logo | `"show"` |
| `show_home` | Home | `"show"` |
| `show_outline` | Product Outline | `"show"` |
| `show_favorites` | Favorites | `"show"` | Controls the sidebar link only — page content is configured on the Categories page |
| `show_rewards` | Rewards | `"show"` | Controls the sidebar link only — page content is configured on the Categories page |
| `show_downloads` | Downloads | `"show"` | Controls the sidebar link only — page content is configured on the Categories page |
| `show_community` | Community | `"hide"` | Controls the sidebar link only — community behavior is configured in the Community section |
| `show_chatbot` | Chatbot | `"hide"` |
| `show_search` | Search | `"show"` |
| `show_filter` | Filters | `"show"` |
| `show_announcements` | Announcements | `"show"` |
| `show_store` | Store | `"show"` |
| `show_external` | External links | `"show"` (dropdown) / `"inline"` / `"hide"` |
| `hide_back_link` | Backlink | `"false"` (show) / `"true"` (hide) |

---

## Sidebar Title / Logo (shown when `show_product_title` is `"show"`)

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `logo_type` | pill_tabs | `"title"` / `"image"` / `"custom"` | `"title"` |
| `custom_logo_text` | text | — | — (shown when `logo_type` is `"custom"`) |
| `logo` | image_picker | — | — (shown when `logo_type` is `"image"`) |

---

## Item title labels

These set the text displayed next to each navigation item.

| Setting ID | Label | Default |
|---|---|---|
| `cat-home` | Home | `"Home"` |
| `cat-title` | Outline | `""` |
| `cat-favorites` | Favorites | `"Favorites"` |
| `cat-rewards` | Rewards | `"Rewards"` |
| `cat-downloads` | Downloads | `"Downloads"` |
| `cat-community` | Community | `"Community"` |
| `cat-chatbot` | Chatbot | `"Ask for help"` |
| `search_text` | Search placeholder | `"Search for something..."` |
| `cat-filters` | Filters | `"Filters"` |
| `cat-announcements` | Announcements | `"Announcements"` |
| `cat-store` | Store | `"Store"` |
| `cat-external` | External links group label | `"External links"` (hidden when `show_external` is `"inline"` or `"hide"`) |
| `library` | Back link text | `"Library"` |

---

## Backlink settings

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `back_link_url` | select | `"library"` / `"site_home"` / `"community"` / `"course"` / `"custom"` | `"library"` |
| `custom_destination` | text | — | — (shown only when `back_link_url` is `"custom"`) |

---

## Outline settings

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `show_category_arrow` | pill_tabs | `"show"` / `"hide"` | `"hide"` |

---

## Community settings (shown when `show_community` is `"show"`)

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `community_action` | pill_tabs | `"popup"` / `"link"` | `"popup"` |

---

## Chatbot settings (shown when `show_chatbot` is `"show"`)

| Setting ID | Type | Options / Range | Default |
|---|---|---|---|
| `chatbot_id` | chatbot picker | — | — |
| `chatbot_action` | pill_tabs | `"popup"` / `"floating"` | `"popup"` |
| `chatbot_height` | range | 300–800px, step 50 | `600` |
| `chatbot_corner_radius` | range | 0–50px, step 2 | `10` |
| `chatbot_overlay_background` | color | — | `"rgba(0, 0, 0, 0.5)"` |
| `chatbot_primary` | color | — | — |
| `chatbot_accent` | color | — | — |
| `chatbot_text_color` | color | — | — |
| `chatbot_agent_text_color` | color | — | — |
| `chatbot_primary_text` | text | — | — |

`chatbot_height`, `chatbot_corner_radius`, and `chatbot_overlay_background` are hidden when `chatbot_action` is `"floating"`.

---

## Store settings (shown when `show_store` is `"show"`)

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `store_action` | action | `"/store"` | Link target for the Store sidebar item |

---

## Styling

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `background_color` | color | `""` (blank) | Leave blank to use global `sidebar_background` preference |
| `color` | color | `"#fff"` | Sidebar text color |
| `searchinputfield` | color | `""` | Search input field color |
| `kg_outline_border` | pill_tabs | `"none"` | `"border"` (show) / `"none"` (hide) — border around outline/category items |
| `kg_outline_border_color` | color | `"#666666"` | Hidden when `kg_outline_border` is `"none"` |
| `item_spacing` | range | `"10"` | 0–30px, spacing between cards |

---

## Blocks

Blocks add extra items to the sidebar navigation (filters, external links) or cards below the navigation.
Block order determines render order — update `block_order` in the same payload when adding or removing blocks.

### Block type: `gamify_textfilter` — "Filter"

Adds a filter item to the navigation.

| Setting ID | Type | Default |
|---|---|---|
| `filtertext` | text | `"Nexus"` |
| `filtertexton` | text | `"#nexus"` |

### Block type: `gamify_link` — "External Link"

Adds an external link item to the navigation.

| Setting ID | Type | Default |
|---|---|---|
| `link_text` | text | `"External link"` |
| `link_action` | action | `"https://www.jiffycoursesonline.com"` |
| `new_tab` | checkbox | `""` |

### Block type: `gamify_card` — "Jiffy Card"

A card block. Text, video, image, and a call-to-action button are independent
groups on the same block, not one combined rich-text field — enable each you
need. Supports conditional visibility (show/hide based on offer, category
completion, or post completion).

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `width` | grid | `"4"` | Column width (1–12) |
| `content` | rich_text | `"<p>This is a Jiffy Card...</p>"` | Text shown on the card |

#### Display Conditions

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `visibility` | pill_tabs | `"show"` | `"show"` / `"conditional"` |
| `visibility_action` | pill_tabs | `"show"` | `"show"` / `"hide"` (when condition is met) |
| `visibility_trigger` | select | `"offer"` | `"offer"` / `"category"` / `"post"` |
| `visibility_offer` | offer picker | `""` | Used when trigger is `"offer"` |
| `visibility_categories` | text | `""` | Comma-separated category IDs |
| `visibility_posts` | text | `""` | Comma-separated post IDs |

#### Video Settings

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `videoyes` | checkbox | `"false"` | Master toggle — must be `"true"` for the video to show |
| `video` | video picker | — | |
| `video_color` | color | — | Player accent color |
| `controls_on_load` | checkbox | `"false"` | Show controls on load |
| `auto_play` | checkbox | `"false"` | Autoplays muted |
| `loop` | checkbox | `"false"` | |
| `play_button` | checkbox | `"true"` | Shown when autoplay is off, or the volume badge when autoplay is on |
| `full_screen` | checkbox | `"false"` | Allow fullscreen |
| `small_play_button` | checkbox | `"true"` | Small play button, bottom-left |
| `playbar` | checkbox | `"false"` | |
| `video_settings` | checkbox | `"false"` | Show quality/playback-rate controls |

#### Image Settings

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `hide_image` | checkbox | `"true"` | ⚠️ Despite the ID, this is the "Use image" toggle — `"true"` shows the image, not hides it |
| `image` | image_picker | — | Suggested 1856×1044 |
| `img_action` | action | `""` | |
| `link_target` | checkbox | `"false"` | Open in new window |
| `image_alt` | text | `""` | |

#### Text Settings

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `card_textcolor` | color | — | |
| `card_textsize_mode` | pill_tabs | `"default"` | `"default"` / `"custom"` |
| `card_textsize` | range | `"14"` | 6–48px. Hidden unless `card_textsize_mode` is `"custom"` |

#### Call to Action

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `use_btn` | checkbox | `"true"` | |
| `btn_text` | text | `"Call To Action"` | |
| `btn_action` | action | `""` | |
| `new_tab` | checkbox | `""` | |
| `btn_background_color` | color | — | |
| `btn_text_color` | color | — | Solid buttons only |
| `btn_width` | pill_tabs | `"full"` | `"full"` / `"auto"` |
| `btn_style` | pill_tabs | `"solid"` | `"solid"` / `"outline"` |
| `btn_size` | pill_tabs | `"small"` | `"small"` / `"medium"` / `"large"` |
| `btn_border_radius` | range | `"4"` | 0–100 |

#### Background

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `background_color` | color | `"#ffffff"` | |
| `shadow` | checkbox | `"true"` | |
| `border_type` | select | `""` | `"none"` / `"solid"` / `"dotted"` / `"dashed"` / `"double"` / `"ridge"` |
| `border_width` | range | `"4"` | 0–50 |
| `border_color` | color | — | |
| `border_radius` | range | `"4"` | 0–100 |

#### Card Layout

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `block_break` | checkbox | `"false"` | Place on its own row |
| `padding_desktop` | spacer | 0/0/0/0 | Inside spacing |
| `padding_text` | spacer | 10/10/10/10 | Text & button spacing |

#### Desktop / Mobile Layout

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `show_block_desktop` | pill_tabs | `"show"` | `"show"` / `"hide"` |
| `text_align` | align | `"left"` | |
| `margin_desktop` | spacer | 5/5/5/5 | |
| `show_block_mobile` | pill_tabs | `"show"` | `"show"` / `"hide"` |
| `text_align_mobile` | align | `"left"` | |
| `margin_mobile` | spacer | 5/5/5/5 | |
