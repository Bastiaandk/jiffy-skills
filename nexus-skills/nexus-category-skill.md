# Nexus — Category Page Skill File

**Template:** `category.liquid`
**Also load:** nexus-header-skill.md, nexus-sidebar-skill.md

The category page shows the posts within a single category/module.
Section settings are global — changes apply to all category pages in the course.

---

## MCP rules for this page

- All section settings are at `settings.sections.{section_name}.settings`
- `{"updated": true}` does not mean the change rendered. Always call `get_theme_content` after writing.
- Use `section_filter: "{section_name}"` to read one section at a time.

---

## Sections on this page

| Section | Purpose |
|---|---|
| `category_progress_bar` | Progress bar shown at the top of the category page |
| `jiffy_category` | Post card grid/slider for the category's posts |
| `header` | See nexus-header-skill.md |
| `product_outline` | See nexus-sidebar-skill.md |

---

## Section: `category_progress_bar`

Progress bar displayed at the top of the category page.

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `show_progress` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `complete_text` | text | — | `"Lessons Complete"` |
| `background_color` | color | — | — |
| `text_color` | color | — | — |
| `progress_color` | color | — | — |
| `bar_height` | range | — | `8` |
| `show_shadow` | checkbox | — | `false` |

---

## Section: `jiffy_category`

Post card display for all posts in the current category.
No blocks — all settings are at the section level.

### Content & layout

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `heading` | rich_text | — | — |
| `collection_type` | select | `"lines"` / `"grid2"` / `"grid3"` / `"grid4"` / `"slider3"` / `"slider4"` / `"sliderfocus"` / `"sliderbanner"` | `"grid3"` |
| `show_two` | pill_tabs | `"one"` / `"two"` | `"two"` — posts per row on mobile. Only applies to grid layouts |

### Post card display

| Setting ID | Type | Options | Default |
|---|---|---|---|
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

### Post info

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `show_duration` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `show_favorite` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `show_completed` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `show_post_info_mobile` | pill_tabs | `"show"` / `"hide"` | `"hide"` |
| `show_progress_bar` | pill_tabs | `"show"` / `"hide"` | `"hide"` |
| `progress_bar_color` | color | — | `"#ffffff"` |

### Card styling

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

### Section styling

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
