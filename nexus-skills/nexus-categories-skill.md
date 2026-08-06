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
card display settings — both support every `collection_type` (banner/focus slide
included). These are listed once here and referenced below.

**Banner (focus slide)**

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `banner_auto_scroll` | pill_tabs | `"scroll"` / `"no-scroll"` | `"scroll"` |
| `show_banner_dots` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `banner_height` | range | — | `320` |
| `banner_image_position` | range | — | `25` |
| `banner_blur` | range | — | `15` |
| `banner_dots_color` | color | — | `"#999999"` |
| `show_focus_title` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `show_focus_description` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `show_focus_description_mobile` | pill_tabs | `"show"` / `"hide"` | `"hide"` |
| `show_focus_border` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `show_focus_post_info` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `focus_text_display` | select | `"always"` / `"hover"` | `"always"` |
| `focus_title_font_size` | range | — | `22` |
| `focus_body_font_size` | range | — | `14` |

**Post card display**

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

**Post info**

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `show_duration` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `show_favorite` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `show_completed` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `show_post_info_mobile` | pill_tabs | `"show"` / `"hide"` | `"hide"` |
| `show_progress_bar` | pill_tabs | `"show"` / `"hide"` | `"hide"` |
| `progress_bar_color` | color | — | `"#ffffff"` |

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

| Setting ID | Type | Options | Default | Notes |
|---|---|---|---|---|
| `heading` | rich_text | — | — | |
| `collection_type` | select | `"lines"` / `"grid2"` / `"grid3"` / `"grid4"` / `"slider3"` / `"slider4"` / `"sliderfocus"` / `"sliderbanner"` | `"sliderbanner"` | |
| `show_two` | pill_tabs | `"one"` / `"two"` | `"two"` | Posts per row on mobile. Only applies to grid layouts |

There is no per-category or per-hashtag filtering on this section — it always
shows the full course outline. `category_id`, `hashtags`, `lesson_ids`, and
`max_posts` are fields on the `collection_banner` block (see
nexus-product-skill.md), not on this section.

---

## Section: `jiffy_categories_favorites`

Favorites tab — shows posts the member has favorited.

In addition to the shared post card settings:

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `show_favorites_admin` | checkbox | — | `"false"` — admin preview toggle |
| `empty_favorites_text` | text | — | `"You have no favorite lessons yet."` |
| `collection_type` | select | `"lines"` / `"grid2"` / `"grid3"` / `"grid4"` / `"slider3"` / `"slider4"` / `"sliderfocus"` / `"sliderbanner"` | `"grid4"` |
| `show_two` | pill_tabs | `"one"` / `"two"` | `"two"` |

This section has no `heading` field — the tab title comes from the header's
`favorites_title` setting instead (see nexus-header-skill.md).

---

## Section: `jiffy_categories_rewards`

Rewards tab — shows badges and reward cards earned by the member.

### Section settings

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `badges_position` | select | `"top"` / `"bottom"` / `"none"` | `"top"` |
| `show_awards_admin` | checkbox | — | `"false"` — admin preview toggle |

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

### Block types available in this section

Reward cards. Three block types can be placed here, each with the identical
settings documented for the same block type on the product homepage (see
nexus-product-skill.md):

| Block type | Name |
|---|---|
| `gamify_card` | Jiffy Card |
| `gamify_certificate` | Jiffy Certificate |
| `coaching_scheduling_widget` | Coaching Scheduling Widget |

---

## Section: `jiffy_categories_downloads`

Downloads tab — shows downloadable files for the course.

There is no badge-area sub-styling on this tab (no `show_badge_area` /
`show_badge_position` fields) — that only exists on `jiffy_categories_rewards`.

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `show_downloads_admin` | checkbox | `"false"` | Admin preview toggle |
| `vertical` | select | `"start"` | Same options as the rewards section |
| `horizontal` | select | `"start"` | Same options as the rewards section |
| `equal_height` | checkbox | `"false"` | |
| `showbgimage` | checkbox | `"false"` | |
| `bgimage` | image_picker | — | |
| `bgimage_blur` | range | `0` | |
| `background_color` | color | — | |
| `shadow` | checkbox | `"false"` | |
| `border_type` | select | `"none"` | |
| `border_width` / `border_color` / `border_radius` | — | — | |
| `show_section_desktop` | pill_tabs | `"show"` | `"show"` / `"hide"` |
| `padding_desktop` / `margin_desktop` | spacer | — | |
| `show_section_mobile` | pill_tabs | `"show"` | `"show"` / `"hide"` |
| `two_column_mobile` | pill_tabs | `"cascade"` | `"columns"` / `"cascade"` |
| `margin_mobile` | spacer | — | |

### Block type: `gamify_card` — "Jiffy Card"

Downloadable-file cards. Same settings as the `gamify_card` block on the
product homepage (see nexus-product-skill.md).
