# Nexus — Category Skill

> **Before any write:** if you have not fetched the main skill [`nexus-skill.md`](https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/v1.2/nexus-skill.md) in this
> conversation, fetch it now. It holds the payload shapes, value formats and working rules
> (send only changed keys, read back after every write), which this file does not repeat.

Category page order: `header`, `product_outline`, `category_progress_bar`, `jiffy_category`. Both
sections below are global: one setting applies to every category page. There are no per-category
settings.

## Section: `category_progress_bar` — "Category - Progress Bar"
Completion bar at the top of the category page: bar, then "`<done>/<total>` `<complete_text>`".
No groups, no blocks. Inner padding (10px 20px) and corner radius (0) are hard-coded.

| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `show_progress` | Show progress bar | pill_tabs | `"show"` (Show), `"hide"` (Hide) | `"show"` | Hides the whole bar and text. |
| `complete_text` | Complete text | text | free text | `"Lessons Complete"` | Shown after the count, e.g. "3/10 Lessons Complete". |
| `background_color` | Background color | color | hex or `""` | — | Blank = transparent (page background shows). |
| `text_color` | Text color | color | hex or `""` | — | Count and text colour; also the thin divider line under the bar (20 % opacity). Blank = inherited text colour and no divider. |
| `progress_color` | Progress bar color | color | hex or `""` | — | Fill colour; the track is this colour at 20 %. Blank = fill uses `text_color`, and no track. |
| `bar_height` | Progress bar height | range | 4–20 px | `"8"` | Blank = 8. |
| `show_shadow` | Show shadow | checkbox | `true` / `false` | `false` | Small drop shadow under the bar. Checkbox, not a pill. |

## Section: `jiffy_category` — "Category - Collection"
Card collection of the current category: its posts first, then its subcategories as category
cards. The category is always the page's own. No blocks; all settings are section level.

### Top-level settings (no group)
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `collection_type` | Collection style | select | `"slider3"` (Slider: 3 posts), `"slider4"` (Slider: 4 posts), `"lines"` (Grid: post lines), `"grid2"` (Grid: 2 posts), `"grid3"` (Grid: 3 posts), `"grid4"` (Grid: 4 posts) | `"grid3"` | Only these six. No banner or focus slider in this section. |
| `show_two` | Mobile posts per row | pill_tabs | `"one"` (1), `"two"` (2) | `"two"` | Grid layouts only, ≤767px. Hidden when `collection_type` = `lines`, `slider3` or `slider4`. |
| `heading` | Collection heading | rich_text | HTML | `""` | Shown above the cards. Its colour is automatic (light/dark from `background_color`, else the page background); `text_color` does not affect it. |

### Card Styling
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `text_placement` | Text placement | select | `"hover"` (Show on hover), `"on_image"` (Show on image), `"below"` (Below image) | `"on_image"` | On image/hover: gradient overlay in the card background colour. Hidden when `collection_type` = `lines`. |
| `text_align` | Text alignment | align | `"left"`, `"center"`, `"right"` | `"left"` | |
| `show_title` | Title | pill_tabs | `"show"` (Show), `"hide"` (Hide) | `"show"` | |
| `title_font_size` | Title font size | range | 10–32 px | `"14"` | Desktop (>991px). Blank = 18. |
| `title_bold` | Title bold | pill_tabs | `"bold"` (Bold), `"normal"` (Normal) | `"bold"` | |
| `title_font_size_mobile` | Title font size (mobile) | range | 6–32 px | `"12"` | Applies ≤991px (phones and portrait tablets). |
| `title_bold_mobile` | Title bold (mobile) | pill_tabs | `"bold"` (Bold), `"normal"` (Normal) | `"normal"` | Applies ≤991px. |
| `show_description` | Description | pill_tabs | `"show"` (Show), `"hide"` (Hide) | `"hide"` | Post body excerpt. Master switch for all screen sizes. Subcategory cards never show a description here. |
| `show_description_mobile` | Description (mobile) | pill_tabs | `"show"` (Show), `"hide"` (Hide) | `"hide"` | Can only hide (≤767px); cannot show what `show_description` hides. Hidden when `show_description` = `hide`. |
| `body_font_size` | Description font size | range | 10–20 px | `"12"` | Blank = 14. |
| `truncate` | Truncate description | text | whole number | `""` | Characters of the excerpt. Empty = 100. Values above 300 act as 300 (the source excerpt is cut at 300). |
| `show_duration` | Post info: duration | pill_tabs | `"show"` (Show), `"hide"` (Hide) | `"show"` | |
| `show_favorite` | Post info: favorite | pill_tabs | `"show"` (Show), `"hide"` (Hide) | `"show"` | |
| `show_completed` | Post info: completed | pill_tabs | `"show"` (Show), `"hide"` (Hide) | `"show"` | |
| `show_post_info_mobile` | Post info (mobile) | pill_tabs | `"show"` (Show), `"hide"` (Hide) | `"hide"` | `hide` removes all post info ≤991px. |
| `show_progress_bar` | Progress bar | pill_tabs | `"show"` (Show), `"hide"` (Hide) | `"hide"` | 3px bar at the bottom of a post card image. Not the bar at the top of the page (that is `category_progress_bar`). |
| `progress_bar_color` | Progress bar color | color | hex | `"#ffffff"` | Fill; track is the same colour at 30 %. Hidden when `show_progress_bar` = `hide`. |
| `show_hover_animation` | Hover animation | pill_tabs | `"show"` (Show), `"hide"` (Off) | `"show"` | Slight zoom on hover; no zoom in `lines`. |
| `show_card_shadow` | Card shadow | pill_tabs | `"show"` (Show), `"hide"` (Hide) | `"show"` | |
| `item_background_color` | Card background color | color | hex or `""` | `"#000000"` | Blank = theme `page_background`. A dark card adds a text shadow to on-image text. |
| `text_color` | Card text color | color | hex or `""` | `""` | Blank = automatic contrast: theme `text_light` on a dark card, `text_dark` on a light card. |
| `item_border_type` | Border type | select | `"none"` (None), `"solid"` (Solid), `"dotted"` (Dotted), `"dashed"` (Dashed), `"double"` (Double), `"ridge"` (Ridge) | `"none"` | Card border. Blank = `solid`. |
| `item_border_width` | Border width | range | 0–50 px | — | Blank = 1. |
| `item_border_color` | Border color | color | hex or `""` | — | Blank = `#cccccc`. |
| `item_border_radius` | Border radius | range | 0–100 px | `"10"` | Card corners. |
| `padding_text` | Inner spacing text | spacer | px | placeholder 10/10/5/10 | Text padding inside the card. Empty side = 10. |

### Background Settings
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `background_color` | Background color | color | hex or `""` | `""` | Collection box background. Blank = transparent. |
| `show_shadow` | Section shadow | pill_tabs | `"show"` (Show), `"hide"` (Hide) | `"hide"` | Pill with `show`/`hide`, not a checkbox. |
| `border_type` | Border type | select | `"none"` (None), `"solid"` (Solid), `"dotted"` (Dotted), `"dashed"` (Dashed), `"double"` (Double), `"ridge"` (Ridge) | `"none"` | Collection box border. |
| `border_width` | Border width | range | 0–50 px | `"1"` | Blank = 4. |
| `border_color` | Border color | color | hex or `""` | `"#cccccc"` | Blank = black. |
| `border_radius` | Border radius | range | 0–100 px | `"4"` | Blank = 4. |

### Collection Styling
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `item_spacing` | Spacing between cards on desktop | range | 0–30 px | `"15"` | |
| `item_spacing_mobile` | Spacing between cards on mobile | range | 0–30 px | `"10"` | ≤767px. Blank = `item_spacing`. |
| `padding_desktop` | Collection padding | spacer | px | placeholder 10/10/10/10 | Inner padding of the collection box, all screen sizes. Empty side = 10. |

### Desktop Layout
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `margin_desktop` | Outside spacing | spacer | px | placeholder 10/10/10/10 | Section margin, all four sides. Empty side = 10. |

### Mobile Layout
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `margin_mobile` | Outside spacing | spacer | px | placeholder 10/10/10/10 | Section margin ≤767px, all four sides. Empty side = 10. |

## Pitfalls
- **Two progress bars.** "The progress bar on the category page" means `category_progress_bar`
  (`show_progress`, `progress_color`, `bar_height`). "Progress on the cards" means `jiffy_category`
  `show_progress_bar` / `progress_bar_color`. Ask if unclear.
- The card bar only appears on posts with progress above 0 and below 100 % (started, not
  finished). Unstarted, completed and subcategory cards show no bar, so turning it on can look like
  "nothing happened". Default colour `#ffffff` can vanish on light images.
- `show_shadow` differs per section: `category_progress_bar` takes boolean `true`/`false`;
  `jiffy_category` takes `"show"`/`"hide"`. The code accepts the boolean and the strings `"true"`/`"false"`.
- A saved `border_radius` (or `progress_text`) under `category_progress_bar` is a leftover; the
  bar's radius is hard-coded 0. Do not write it.
- `collection_type`: never write `sliderfocus` or `sliderbanner` here. Map trainer labels
  ("Grid: 3 posts") to values (`grid3`).
- `show_two` has no effect on `lines` or sliders. Sliders show two cards per view on mobile.
- To show descriptions on mobile only is impossible: `show_description` must be `show`;
  `show_description_mobile: "hide"` then removes them on phones.
- Post info is hidden on phones and portrait tablets by default (`show_post_info_mobile` =
  `"hide"`). If the trainer misses duration/favorite/completed on mobile, set it to `"show"`.
- `truncate` must be a plain number string (`"150"`). Text or `"0"` empties every description.
- CPB with both `progress_color` and `text_color` blank has an invisible fill. Set at least one.
- Card border: a blank `item_border_type` renders a 1px `#cccccc` solid border. Write `"none"` to
  remove borders.
