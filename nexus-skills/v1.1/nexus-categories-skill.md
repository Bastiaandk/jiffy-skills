# Nexus — Categories Page Skill

> **Before any write:** if you have not fetched the main skill [`nexus-skill.md`](https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/v1.1/nexus-skill.md) in this
> conversation, fetch it now. It holds the payload shapes, value formats and working rules
> (send only changed keys, read back after every write), which this file does not repeat.

## How the tabs work

The categories page (`/categories`) renders all four sections; a script in `templates/categories.liquid` shows one tab based on the URL:

| URL | Visible section |
|---|---|
| `/categories` | `jiffy_categories` (Modules) |
| `/categories?favorites` | `jiffy_categories_favorites` |
| `/categories?rewards` | `jiffy_categories_rewards` |
| `/categories?downloads` | `jiffy_categories_downloads` |

The sidebar links to these URLs. The page title and breadcrumb label per tab are header settings (`favorites_title`, `favorites`, etc. → header sub-skill). All settings are section-level and global; card style settings live in `section.settings`, never in blocks.

In the Kajabi editor the URL parameter is not available, so each tab has a "Preview … in editor" checkbox (`show_favorites_admin`, `show_awards_admin`, `show_downloads_admin`) that forces that tab visible **in the editor only**. Turn on one at a time; with several on, the last section in page order (Favorites → Rewards → Downloads) wins and the header gets several tab classes at once, so the title can be wrong. They have no effect on the live site.

---

## Section: `jiffy_categories` — "Categories - Collection"

Modules tab. One card per top-level category of the product (not per post), in course order. No blocks, no filters.

### Top-level settings (no group)
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `collection_type` | Collection style | select | `"lines"` (Grid - Lines), `"grid3"` (Grid - 3 Posts), `"grid4"` (Grid - 4 Posts), `"slider3"` (Slider - 3 Posts), `"slider4"` (Slider - 4 Posts) | `"grid3"` | Only these five values; no 2-post grid in 1.1. |
| `show_two` | Mobile posts per row | pill_tabs | `"one"` (1), `"two"` (2) | `"two"` | Mobile ≤767px. Hidden when `collection_type` = `lines`/`slider3`/`slider4`. |
| `heading` | Collection heading | rich_text | — | `""` | Shown above the cards; text colour auto-contrasts with `background_color` (or page background). |

### Card Styling
The Banner Layout (`banner_*`), Focus Card Settings (`*focus*`) and Preview Card Settings (`*preview*`) fields are in the schema but always hidden: they only apply to banner/focus styles, which are not selectable. Do not write them.

| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `text_placement` | Text placement | select | `"hover"` (Show on hover), `"on_image"` (Show on image), `"below"` (Below image) | `"on_image"` | Blank → `on_image`. Hidden when `collection_type` = `lines`. |
| `text_align` | Text alignment | align | `"left"`, `"center"`, `"right"` | `"left"` | Blank → left. |
| `show_title` | Title | pill_tabs | `"show"`, `"hide"` | `"show"` | |
| `title_font_size` | Title font size | range | 10–32 px | `"14"` | Desktop. Blank → 18. |
| `title_bold` | Title bold | pill_tabs | `"bold"`, `"normal"` | `"bold"` | |
| `title_font_size_mobile` | Title font size (mobile) | range | 6–32 px | `"12"` | Applies ≤991px. Blank → 12. |
| `title_bold_mobile` | Title bold (mobile) | pill_tabs | `"bold"`, `"normal"` | `"normal"` | Applies ≤991px. |
| `show_description` | Description | pill_tabs | `"show"`, `"hide"` | `"hide"` | Modules: category description. |
| `show_description_mobile` | Description (mobile) | pill_tabs | `"show"`, `"hide"` | `"hide"` | Can only hide on mobile (≤767px); needs `show_description` = `show`. Hidden when `show_description` = `hide`. |
| `body_font_size` | Description font size | range | 10–20 px | `"12"` | Blank → 14. |
| `truncate` | Truncate description | text | number as string | `""` | Max characters of the description. Blank → 100. |
| `show_duration` | Post info: duration | pill_tabs | `"show"`, `"hide"` | `"show"` | Modules: shows the number of posts in the category. |
| `show_favorite` | Post info: favorite | pill_tabs | `"show"`, `"hide"` | `"show"` | No effect on Modules (categories cannot be favorited). |
| `show_completed` | Post info: completed | pill_tabs | `"show"`, `"hide"` | `"show"` | Modules: "completed/total" with check icon. |
| `show_post_info_mobile` | Post info (mobile) | pill_tabs | `"show"`, `"hide"` | `"hide"` | `hide` removes the info row ≤991px. |
| `show_progress_bar` | Progress bar | pill_tabs | `"show"`, `"hide"` | `"hide"` | Post cards only; no effect on Modules (category cards have no bar). |
| `progress_bar_color` | Progress bar color | color | hex | `"#ffffff"` | Hidden when `show_progress_bar` = `hide`. |
| `show_hover_animation` | Hover animation | pill_tabs | `"show"` (Show), `"hide"` (Off) | `"show"` | Not applied to `lines`. |
| `show_card_shadow` | Card shadow | pill_tabs | `"show"`, `"hide"` | `"show"` | |
| `item_background_color` | Card background color | color | hex or `""` | `"#000000"` | Blank → theme `page_background`. Also the colour of the text gradient on image. |
| `text_color` | Card text color | color | hex or `""` | `""` | Blank → `text_light`/`text_dark`, auto-contrast with the card background. |
| `item_border_type` | Border type | select | `"none"`, `"solid"`, `"dotted"`, `"dashed"`, `"double"`, `"ridge"` | `"none"` | Blank → `solid` (so blank ≠ None). |
| `item_border_width` | Border width | range | 0–50 px | — | Blank → 1. |
| `item_border_color` | Border color | color | hex or `""` | — | Blank → `#cccccc`. |
| `item_border_radius` | Border radius | range | 0–100 px | `"10"` | |
| `padding_text` | Inner spacing text | spacer | px | placeholder 10/10/5/10 | Padding around card text. Blank side → 10. |

### Background Settings
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `background_color` | Background color | color | hex or `""` | `""` | Behind the whole collection. Blank → transparent. |
| `show_shadow` | Section shadow | pill_tabs | `"show"`, `"hide"` | `"hide"` | |
| `border_type` | Border type | select | `"none"`, `"solid"`, `"dotted"`, `"dashed"`, `"double"`, `"ridge"` | `"none"` | |
| `border_width` | Border width | range | 0–50 px | `"1"` | Blank → 4. |
| `border_color` | Border color | color | hex or `""` | `"#cccccc"` | Blank → black. |
| `border_radius` | Border radius | range | 0–100 px | `"4"` | Blank → 4. |

### Collection Styling
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `item_spacing` | Spacing between cards on desktop | range | 0–30 px | `"15"` | Gap between cards. |
| `item_spacing_mobile` | Spacing between cards on mobile | range | 0–30 px | `"10"` | ≤767px. Blank → `item_spacing`. |
| `padding_desktop` | Collection padding | spacer | px | placeholder 10/10/10/10 | Inside the collection box. Blank side → 10. |

### Desktop Layout
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `margin_desktop` | Outside spacing | spacer | px | placeholder 10/10/10/10 | Margin around the section. Blank side → 10. |

### Mobile Layout
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `margin_mobile` | Outside spacing | spacer | px | placeholder 10/10/10/10 | ≤767px. Blank side → 10. |

---

## Section: `jiffy_categories_favorites` — "Jiffy - Favorites"

Favorites tab. Post cards for every post the student has favorited, filled client-side from the outline data cache. No blocks, no heading field (the page title comes from the header).

Same settings, groups, values and fallbacks as `jiffy_categories`, with these differences:

| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `show_favorites_admin` | Preview favorites in editor | checkbox | `true`/`false` | `"false"` | Top-level. Editor-only tab preview (see "How the tabs work"). |
| `empty_favorites_text` | Empty favorites message | text | — | `"You have no favorite lessons yet."` | Top-level. Shown when there are no favorites. Blank → the whole section is hidden instead. |
| `collection_type` | Collection style | select | same five values | `"grid4"` | Different default. |
| `heading` | — | — | — | — | Not present. |
| `padding_text` | Inner spacing text | spacer | px | placeholder 10/10/10/10 | Placeholder only differs. |

Card fields act on posts here: `show_duration` = video duration, `show_favorite` = favorite heart, `show_completed` = completed check, `show_progress_bar` = video progress. `truncate` cuts the post body, which is pre-cut to 300 characters, so values above 300 have no extra effect. Blank `item_spacing` → 10.

---

## Section: `jiffy_categories_rewards` — "Jiffy - Rewards"

Rewards tab. Renders the global badges section (`jiffy_badges`) above or below a row of blocks. Blocks: yes.

### Top-level settings (no group)
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `show_awards_admin` | Preview Rewards in editor | checkbox | `true`/`false` | `"false"` | Editor-only tab preview. |

### Badge Area Styling
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `badges_position` | Badges Area position | select | `"top"` (Top of section), `"bottom"` (Bottom of section), `"none"` (Do not show badges) | `"top"` | Where the `jiffy_badges` section renders. Badge content and badge styling → badges sub-skill. |
| `ba_background_color` | Background color | color | hex or `""` | — | Overrides the badges section background on this tab only. |
| `ba_text_color` | Text color | color | hex or `""` | — | Overrides badge text colour on this tab only. Blank → auto-contrast with the badge-area background. |
| `ba_shadow` | Show shadow | checkbox | `true`/`false` | `false` | Shadow on the badge area. |

The `ba_*` override is all-or-nothing: as soon as any of the three is set, the badge area gets a forced background — `ba_background_color`, or theme `text_area_background` when that one is blank. With all three empty/off, the badges section keeps its own colours.

### Section Settings
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `vertical` | Vertical alignment | select | `"start"` (Top), `"center"` (Center), `"end"` (Bottom) | `"start"` | Ignored when `equal_height` is on. |
| `horizontal` | Horizontal alignment | select | `"start"` (Left), `"center"` (Center), `"end"` (Right), `"between"` (Space Between), `"around"` (Space Around) | `"start"` | |
| `equal_height` | Equal height blocks | checkbox | `true`/`false` | `"false"` | Stretches blocks in a row to equal height. |

### Background
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `showbgimage` | Show background image | checkbox | `true`/`false` | `"false"` | |
| `bgimage` | Background image | image_picker | — | `""` | Hidden when `showbgimage` = false. |
| `bgimage_blur` | Background image blur | range | 0–20 px | `"0"` | Hidden when `showbgimage` = false. |
| `background_color` | Background color | color | hex or `""` | — | Overlay on top of the image. Blank → transparent; text colour auto-contrasts with page background. |
| `shadow` | Add shadow to section | checkbox | `true`/`false` | `"false"` | |
| `border_type` | Border type | select | `"none"`, `"solid"`, `"dotted"`, `"dashed"`, `"double"`, `"ridge"` | `"none"` | |
| `border_width` | Border width | range | 0–50 px | `"4"` | Blank → no border. |
| `border_color` | Border color | color | hex or `""` | `""` | Blank → black. |
| `border_radius` | Border radius | range | 0–100 px | `"4"` | Blank → 0. |

### Desktop Layout
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `show_section_desktop` | Show on desktop | pill_tabs | `"show"`, `"hide"` | `"show"` | No visible effect: the tab switch forces the active tab visible. Use `badges_position` / blocks instead. |
| `padding_desktop` | Inside spacing | spacer | px | placeholder 10/10/10/10 | Blank side → 10. |
| `margin_desktop` | Outside spacing | spacer | px | placeholder 10/10/10/10 | Blank side → 10. |

### Mobile Layout
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `show_section_mobile` | Show on mobile | pill_tabs | `"show"`, `"hide"` | `"show"` | No visible effect (see `show_section_desktop`). |
| `two_column_mobile` | Mobile view | pill_tabs | `"columns"` (Columns), `"cascade"` (Cascade) | `"cascade"` | ≤767px. Cascade stacks blocks; Columns keeps block widths side by side. |
| `margin_mobile` | Outside spacing | spacer | px | placeholder 10/10/10/10 | ≤767px. Blank side → 10. |

### Blocks
`gamify_card` ("Jiffy Card"), `gamify_certificate` ("Jiffy Certificate") and `coaching_scheduling_widget` ("Coaching Scheduling Widget") → **`nexus-blocks-skill.md`**. Their schemas are identical to the dashboard blocks, including `width` `"4"`, `background_color` `"#ffffff"` and `margin_desktop`/`margin_mobile` default 5/5/5/5. `block_break` (Place on its own row) works here. No Group, Form or Badge Area blocks.

---

## Section: `jiffy_categories_downloads` — "Jiffy - Downloads"

Downloads tab. A row of Jiffy Cards (typically one per download). Blocks: yes. No badges.

Same settings as `jiffy_categories_rewards` minus the Badge Area Styling group, with `show_downloads_admin` ("Preview Downloads in editor", checkbox, default `"false"`) instead of `show_awards_admin`. Groups, values, defaults and fallbacks are identical, including `border_width` `"4"`.

### Block: `gamify_card` — "Jiffy Card"
Only block type. All settings → **`nexus-blocks-skill.md`**. Identical to the dashboard `gamify_card` except:

| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `margin_desktop` | Outside spacing | spacer | px | placeholder 5/5/5/5 | No saved default: blank side → 0. |
| `margin_mobile` | Outside spacing | spacer | px | placeholder 5/5/5/5 | No saved default: blank side → 0. |

`block_break` works here.

---

## Pitfalls

- `collection_type` accepts only `lines`, `grid3`, `grid4`, `slider3`, `slider4`. Never write `grid2` (not selectable in 1.1), `sliderbanner`/`sliderfocus` or `banner_*`/`focus_*`/`*preview*` fields. Older saves may still hold `sliderbanner` (the old default); write one of the five values to replace it.
- Modules and Favorites: write card styling to `sections.<id>.settings` — the post/category cards there are not blocks. (Rewards and Downloads do have Jiffy Card blocks; those are block settings, see the blocks sub-skill.)
- Modules cards are categories: post-only fields (`show_favorite`, `show_progress_bar`, `progress_bar_color`) do nothing there; `show_duration` shows the post count.
- Blank `item_border_type` means solid 1px `#cccccc`, not "no border". Write `"none"` to remove card borders.
- Leave every `*_admin` preview checkbox off (`false`, boolean) after use, and never turn on more than one.
- Tab titles and breadcrumb labels are header settings, not settings of these sections.
- `show_section_desktop`/`show_section_mobile` on Rewards/Downloads do not hide the tab. To remove a tab, hide its sidebar link (`show_favorites` / `show_rewards` / … → sidebar sub-skill); the section itself cannot be removed.
- Rewards badge content (which badges, unlock rules) is the `jiffy_badges` section → badges sub-skill. Only position and colour overrides live here.
