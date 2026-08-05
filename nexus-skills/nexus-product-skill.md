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

**Visibility**

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `trigger` | select | `"default"` (always show) / `"hide"` (always hide) / `"show_offer"` / `"hide_offer"` | `"default"` |
| `offer` | offer picker | — | — (shown when trigger is offer-based) |

**Layout**

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `vertical` | select | `"start"` / `"center"` / `"end"` | `"start"` |
| `horizontal` | select | `"start"` / `"center"` / `"end"` / `"space-between"` / `"space-around"` | `"start"` |
| `equal_height` | checkbox | — | `"false"` |
| `direction` | select | `"horizontal"` / `"vertical"` | `"horizontal"` |
| `margin_desktop` | spacer | — | — |
| `margin_mobile` | spacer | — | — |

**Background**

| Setting ID | Type | Default |
|---|---|---|
| `showbgimage` | checkbox | `"false"` |
| `bgimage` | image_picker | — |
| `bgimage_blur` | range | `0` |
| `background_color` | color | — |

**Border & shadow**

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `shadow` | checkbox | — | `"false"` |
| `border_type` | select | `"none"` / `"solid"` / `"dotted"` / `"dashed"` / `"double"` / `"ridge"` | `"none"` |
| `border_width` | range | — | — |
| `border_color` | color | — | — |
| `border_radius` | range | — | — |

### Block types available in all three sections

| Block type | Name | Purpose |
|---|---|---|
| `gamify_form` | Jiffy Form | Embeds a Kajabi form with conditional visibility |
| `gamify_card` | Jiffy Card | Rich-text content card with conditional visibility |
| `gamify_certificate` | Jiffy Certificate | Certificate display with conditional visibility |
| `coaching_scheduling_widget` | Coaching Scheduling Widget | Embeds a coaching scheduling widget |
| `group` | Group | Groups multiple blocks in a layout column |
| `badge_area` | Badge Area Block | Displays earned badges |

All blocks support conditional visibility (show/hide based on offer, category completion, or post completion).

---

## Section: `jiffy_collections`

Displays the course categories and modules as collection banners. Each block is one collection.

**Section-level settings**

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `margin_desktop` | spacer | — | Outside spacing for all collections |
| `margin_mobile` | spacer | — | Outside spacing for all collections |

**Block type: `collection_banner`**

Each block is one collection/category display. Supports conditional visibility.

*Content*

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `collection_content` | select | `"demo"` / `"outline"` / `"category"` / `"highlights"` / `"favorites"` / `"replay"` / `"continue_watching"` / `"outline_categories"` | `"demo"` |
| `collection_type` | select | `"lines"` / `"grid2"` / `"grid3"` / `"grid4"` / `"slider3"` / `"slider4"` / `"sliderfocus"` / `"sliderbanner"` | `"sliderbanner"` |
| `hashtags` | text | `"#hashtag1, #hashtag2"` | Filter posts by hashtag in body |
| `lesson_ids` | text | — | Comma-separated post IDs to include |

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

Block type: `onboarding_slide`. Each slide has a `slide_type` setting (`"image"` or other).

---

## Section: `jiffy_popups`

Confetti popup triggered when a member completes a category or post, or unlocks an offer.

Block type: `gamify_popup_confetti`. Each block defines one popup trigger.

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `visibility_trigger` | select | `"offer"` / `"category"` / `"post"` | `"offer"` |
| `visibility_offer` | offer picker | — | — |
| `visibility_categories` | text | — | Comma-separated category IDs |
| `visibility_posts` | text | — | Comma-separated post IDs |
| `confettistyle` | select | `"none"` / `"cannon"` / `"fireworks"` / `"school_parade"` | `"cannon"` |
| `edit` | checkbox | `"true"` | Show/edit popup message in editor |
