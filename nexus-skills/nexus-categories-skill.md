# Nexus — Categories Overview Page Skill File

**Template:** `categories.liquid`
**Also load:** nexus-header-skill.md, nexus-sidebar-skill.md

The categories overview is the library page — it shows all course content tabs:
Modules, Favorites, Rewards, and Downloads. Section settings here are global.

---

## MCP rules for this page

- All section settings are at `settings.sections.{section_name}.settings`
- `{"updated": true}` does not mean the change rendered. Always call `get_theme_content` after writing.
- Use `section_filter: "{section_name}"` to read one section at a time.

---

## Sections on this page

| Section | Purpose |
|---|---|
| `jiffy_categories` | Modules tab — main course overview with post cards |
| `jiffy_categories_favorites` | Favorites tab — posts the member has favorited |
| `jiffy_categories_rewards` | Rewards tab — badges and reward cards |
| `jiffy_categories_downloads` | Downloads tab — downloadable files |
| `header` | See nexus-header-skill.md |
| `product_outline` | See nexus-sidebar-skill.md |

---

## Shared post card settings

`jiffy_categories` and `jiffy_categories_favorites` share an identical set of post
card display settings. These are listed once here and referenced below.

**Post card display**

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `collection_type` | select | `"lines"` / `"grid2"` / `"grid3"` / `"grid4"` / `"slider3"` / `"slider4"` / `"sliderfocus"` / `"sliderbanner"` | `"grid3"` |
| `text_placement` | select | `"hover"` / `"on_image"` / `"below"` | `"on_image"` |
| `text_align` | align | — | `"left"` |
| `show_title` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `title_font_size` | range | — | `14` |
| `title_bold` | pill_tabs | `"bold"` / `"normal"` | `"bold"` |
| `title_font_size_mobile` | range | — | `12` |
| `title_bold_mobile` | pill_tabs | `"bold"` / `"normal"` | `"normal"` |
| `show_description` | pill_tabs | `"show"` / `"hide"` | `"hide"` |
| `show_description_mobile` | pill_tabs | `"show"` / `"hide"` | `"hide"` |
| `body_font_size` | range | — | `12` |
| `truncate` | text | — | — |
| `show_preview_border` | pill_tabs | `"show"` / `"hide"` | `"hide"` |
| `show_preview_post_info` | pill_tabs | `"show"` / `"hide"` | `"hide"` |
| `preview_text_display` | select | `"always"` / `"hover"` | `"hover"` |

**Post info**

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `show_duration` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `show_favorite` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `show_completed` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `show_post_info_mobile` | pill_tabs | `"show"` / `"hide"` | `"hide"` |
| `show_progress_bar` | pill_tabs | `"show"` / `"hide"` | `"hide"` |
| `progress_bar_color` | color | — | `"#ffffff"` |
| `show_finished` | pill_tabs | `"show"` / `"hide"` | — |

**Card styling**

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

**Section styling**

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

## Section: `jiffy_categories`

Modules tab — displays the full course outline with post cards.

In addition to the shared post card settings above:

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `heading` | text | — | Section heading |
| `category_id` | text | — | Limit to a specific category ID |
| `max_posts` | — | — | Limit number of posts shown |
| `hashtags` | text | `"#hashtag1, #hashtag2"` | Filter posts by hashtag |
| `lesson_ids` | text | — | Comma-separated post IDs |
| `show_two` | — | — | Two-column layout option |
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

---

## Section: `jiffy_categories_favorites`

Favorites tab — shows posts the member has favorited.

In addition to the shared post card settings:

| Setting ID | Type | Default |
|---|---|---|
| `heading` | text | — |
| `empty_favorites_text` | text | — |
| `show_favorites_admin` | — | — |
| `category_id` | text | — |
| `max_posts` | — | — |
| `hashtags` | text | — |
| `lesson_ids` | text | — |
| `show_two` | — | — |

---

## Section: `jiffy_categories_rewards`

Rewards tab — shows badges and reward cards earned by the member.

### Section settings

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `badges_position` | select | `"top"` / `"bottom"` / `"none"` | `"top"` |
| `alignment` | align | — | — |
| `show_awards_admin` | — | — | — |

**Badge area styling**

| Setting ID | Type | Default |
|---|---|---|
| `ba_background_color` | color | — |
| `ba_text_color` | color | — |
| `ba_shadow` | checkbox | `false` |

**Layout (for reward cards)**

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `vertical` | select | `"start"` / `"center"` / `"end"` | `"start"` |
| `horizontal` | select | `"start"` / `"center"` / `"end"` / `"between"` / `"around"` | `"start"` |
| `equal_height` | checkbox | — | `"false"` |
| `showbgimage` | checkbox | — | `"false"` |
| `bgimage` | image_picker | — | — |
| `bgimage_blur` | range | — | `0` |
| `background_color` | color | — | — |
| `shadow` | checkbox | — | `"false"` |
| `border_type` | select | `"none"` / `"solid"` / `"dotted"` / `"dashed"` / `"double"` / `"ridge"` | `"none"` |
| `border_width` | range | — | `4` |
| `border_color` | color | — | — |
| `border_radius` | range | — | `4` |
| `show_section_desktop` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `show_section_mobile` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `two_column_mobile` | pill_tabs | `"columns"` / `"cascade"` | `"cascade"` |
| `padding_desktop` | spacer | — | — |
| `margin_desktop` | spacer | — | — |
| `margin_mobile` | spacer | — | — |

### Block type: `gamify_card`

Reward cards displayed in this section. Same settings as the gamify_card block
in nexus-sidebar-skill.md (width, content, conditional visibility).

---

## Section: `jiffy_categories_downloads`

Downloads tab — shows downloadable files for the course.

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `show_downloads_admin` | — | — | Admin preview toggle |
| `show_badge_area` | — | — | |
| `show_badge_position` | — | — | |
| `alignment` | align | — | |
| `vertical` | select | — | Same layout options as rewards section |
| `horizontal` | select | — | |
| `equal_height` | checkbox | `"false"` | |
| `showbgimage` | checkbox | `"false"` | |
| `bgimage` | image_picker | — | |
| `bgimage_blur` | range | `0` | |
| `background_color` | color | — | |
| `shadow` | checkbox | `"false"` | |
| `border_type` | select | `"none"` | |
| `border_width` / `border_color` / `border_radius` | — | — | |
| `padding_desktop` / `margin_desktop` / `margin_mobile` | spacer | — | |
