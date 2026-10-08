# Nexus — Collections Skill

> **Before any write:** if you have not fetched the main skill [`nexus-skill.md`](https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/v1.2/nexus-skill.md) in this
> conversation, fetch it now. It holds the payload shapes, value formats and working rules
> (send only changed keys, read back after every write), which this file does not repeat.

## Section: `jiffy_collections` — "Dashboard - Collections"
Product homepage only. A stack of configurable collections: each `collection_banner` block is one
collection with its own content source, style and styling. All collection settings are **block-level**;
the section itself has only outer margins. Cards are filled client-side from the outline data cache
(`NexusDataCache`), so a collection depends on the sidebar outline markup being in the page.

### Desktop Layout
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `margin_desktop` | Outside spacing all collections | spacer | px | placeholder 10/10/10/10 | Margin around the whole section. Blank side = 10. |

### Mobile Layout
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `margin_mobile` | Outside spacing all collections | spacer | px | placeholder 10/10/10/10 | ≤767px. Blank side = 10. |

### Block: `collection_banner` — "Collection"

#### Ungrouped (block elements)
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `collection_content` | Collection content | select | `"demo"` (Demo), `"outline"` (Outline: lessons), `"outline_categories"` (Outline: category cards), `"category"` (Selected: categories), `"highlights"` (Selected: lessons (highlights)), `"favorites"` (Personal: favorites), `"continue_watching"` (Personal: continue watching), `"replay"` (Personal: replay (random)) | `"demo"` | What the collection shows. See content matrix below. |
| `collection_type` | Collection style | select | `"sliderbanner"` (Slider: banner), `"slider3"` (Slider: 3 posts), `"slider4"` (Slider: 4 posts), `"lines"` (Grid: post lines), `"grid2"` (Grid: 2 posts), `"grid3"` (Grid: 3 posts), `"grid4"` (Grid: 4 posts) | `"sliderbanner"` | Layout. Decides which styling settings apply; see style matrix. 1.2 has no `sliderfocus` (see Pitfalls). |
| `hashtags` | Filter post body on | text | hashtags, comma or space separated | `"#hashtag1, #hashtag2"` | Highlights only: includes every post whose body contains one of the tags. Hidden unless `collection_content` = `highlights`. |
| `lesson_ids` | Add post IDs | text | post IDs, comma or space separated | `""` | Highlights only; combined with `hashtags` (a post matching either is shown). Hidden unless `collection_content` = `highlights`. |
| `category_id` | Add category IDs | text | category IDs, comma or space separated (normalised to commas) | `""` | `category` only. Main or subcategory IDs; shown in the order entered. Hidden unless `collection_content` = `category`. |
| `max_posts` | Max posts in a row | range | 1–100 | `"16"` | Cap on cards. For `outline` the cap is **per category row**. Hidden when `collection_content` = `outline_categories`. |
| `outline_paginate_count` | Max rows per page | range | 4–16 | `"8"` | `outline` only: categories (rows) per page; more pages get theme pagination. Blank = 8. Hidden when `collection_content` = `replay`, `continue_watching`, `demo`, `favorites`; shown but ignored for `category`, `highlights` and `outline_categories`. |
| `show_finished` | Finished posts & categories | pill_tabs | `"show"` (Show), `"hide"` (Hide) | `"show"` | `hide` drops completed posts and fully completed (sub)categories; for `outline_categories` it drops completed top-level categories. Always forced to show in the editor. Hidden when `collection_content` = `replay`, `continue_watching`, `demo`, `favorites` (but still read — see Pitfalls). |
| `show_two` | Mobile posts per row | pill_tabs | `"one"` (1), `"two"` (2) | `"two"` | ≤767px. Hidden when `collection_type` = `lines`, `slider3`, `slider4`, `sliderbanner`. |
| `heading` | Collection heading | rich_text | HTML | `"<h4>Collection Title</h4>"` | Title above the collection. |

#### Display Conditions
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `visibility` | Visibility | pill_tabs | `"show"` (Show), `"conditional"` (Conditional) | `"show"` | `conditional` enables the trigger below. In the editor the block always shows, with an info line. |
| `visibility_action` | When condition is met | pill_tabs | `"show"` (Show), `"hide"` (Hide) | `"show"` | Hidden when `visibility` = `show`. |
| `visibility_trigger` | Trigger | select | `"offer"` (Offer), `"category"` (Category completed), `"post"` (Post completed) | `"offer"` | Hidden when `visibility` = `show`. |
| `visibility_offer` | Select offer | offer | numeric offer ID | `""` | Condition = student owns the offer. Hidden unless conditional + trigger `offer`. |
| `visibility_categories` | Category IDs | text | IDs, **comma**-separated | `""` | All must be completed (top-level or direct subcategories). Hidden unless conditional + trigger `category`. |
| `visibility_posts` | Post IDs | text | IDs, **comma**-separated | `""` | All must be completed; checked client-side from the cache. Hidden unless conditional + trigger `post`. |

#### Outline Title Styling
All four hidden unless `collection_content` = `outline` or `outline_categories`. They only affect `outline` (the category title above each row); on `outline_categories` they do nothing.

| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `outline_title_show` | Show category titles | pill_tabs | `"show"` (Show), `"hide"` (Hide) | `"show"` | |
| `outline_title_font_size` | Title font size | range | 12–32 px | `"20"` | Blank = 20. |
| `outline_title_bold` | Bold title | pill_tabs | `"bold"` (Bold), `"regular"` (Regular) | `"bold"` | |
| `outline_title_color` | Title color | color | hex or `""` | `""` | Blank = automatic light/dark heading colour. |

#### Card Styling
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `banner_auto_scroll` | Auto-scroll banner | pill_tabs | `"scroll"` (Scroll), `"no-scroll"` (No scroll) | `"scroll"` | sliderbanner only (all `banner_*` + `show_banner_dots`: hidden unless `collection_type` = `sliderbanner`). |
| `show_banner_dots` | Pagination dots | pill_tabs | `"show"` (Show), `"hide"` (Hide) | `"show"` | No dots with ≤1 card. |
| `banner_height` | Banner height (320px) | range | 200–600 px, step 10 | `"320"` | Half height on mobile. |
| `banner_image_position` | Vertical alignment (33%) | range | 0–100 (%) | `"25"` | Vertical `object-position` of the image. |
| `banner_blur` | Background image blur | range | 0–20 px | `"10"` | Blur of the image behind the text. |
| `banner_dots_color` | Pagination dots color | color | hex | `"#999999"` | |
| `show_focus_title` | Focus title | pill_tabs | `"show"`, `"hide"` | `"show"` | Belongs to the focus slider, which 1.2 does not offer: all `show_focus_*` / `focus_*` are hidden in the editor for every style. Not used. |
| `show_focus_description` | Focus description | pill_tabs | `"show"`, `"hide"` | `"show"` | Gates **category-card** descriptions in every style (see Pitfalls). |
| `show_focus_description_mobile` | Focus description on mobile | pill_tabs | `"show"`, `"hide"` | `"hide"` | Also hidden when `show_focus_description` = `hide`. Also read by sliderbanner. |
| `show_focus_border` | Focus border | pill_tabs | `"show"`, `"hide"` | `"show"` | Read by sliderbanner: draws the `item_border_*` border on its cards. |
| `show_focus_post_info` | Focus post info | pill_tabs | `"show"`, `"hide"` | `"show"` | Also read by sliderbanner. |
| `focus_text_display` | Focus Text Display | select | `"always"` (Always visible), `"hover"` (Show on hover) | `"always"` | Also read by sliderbanner. |
| `focus_title_font_size` | Title font size | range | 12–32 px | `"22"` | Not used (focus slider only). |
| `focus_body_font_size` | Description font size | range | 10–20 px | `"14"` | Not used (focus slider only). |
| `text_placement` | Text placement | select | `"hover"` (Show on hover), `"on_image"` (Show on image), `"below"` (Below image) | `"on_image"` | Blank = `on_image`. Hidden when `collection_type` = `lines`, `sliderbanner`. |
| `text_align` | Text alignment | align | `"left"`, `"center"`, `"right"` | `"left"` | Blank = left. |
| `show_title` | Title | pill_tabs | `"show"`, `"hide"` | `"show"` | Card titles. |
| `show_preview_border` | Preview border | pill_tabs | `"show"`, `"hide"` | `"hide"` | Focus slider only: hidden in the editor for every style in 1.2. Not used. |
| `show_preview_post_info` | Preview post info | pill_tabs | `"show"`, `"hide"` | `"hide"` | Not used (focus slider only). |
| `preview_text_display` | Preview Text Display | select | `"always"` (Always visible), `"hover"` (Show on hover) | `"hover"` | Not used (focus slider only). |
| `title_font_size` | Title font size | range | 10–32 px | `"14"` | Blank = 18. |
| `title_bold` | Title bold | pill_tabs | `"bold"` (Bold), `"normal"` (Normal) | `"bold"` | |
| `title_font_size_mobile` | Title font size (mobile) | range | 6–32 px | `"12"` | ≤991px. Blank = 12. |
| `title_bold_mobile` | Title bold (mobile) | pill_tabs | `"bold"`, `"normal"` | `"normal"` | ≤991px. |
| `show_description` | Description | pill_tabs | `"show"`, `"hide"` | `"hide"` | Post descriptions (body excerpt). |
| `show_description_mobile` | Description (mobile) | pill_tabs | `"show"`, `"hide"` | `"hide"` | ≤767px; can only hide what desktop shows. Hidden when `show_description` = `hide`. |
| `body_font_size` | Description font size | range | 10–20 px | `"12"` | Blank = 13–14 depending on style. |
| `truncate` | Truncate description | text | number of characters | `""` | Blank = 100 (200 for sliderbanner). |
| `show_duration` | Post info: duration | pill_tabs | `"show"`, `"hide"` | `"show"` | On category cards: lesson count. |
| `show_favorite` | Post info: favorite | pill_tabs | `"show"`, `"hide"` | `"show"` | |
| `show_completed` | Post info: completed | pill_tabs | `"show"`, `"hide"` | `"show"` | |
| `show_post_info_mobile` | Post info (mobile) | pill_tabs | `"show"`, `"hide"` | `"hide"` | ≤991px. |
| `show_progress_bar` | Progress bar | pill_tabs | `"show"`, `"hide"` | `"hide"` | Bar on the image of partly watched posts (0–100% exclusive). Hidden when `collection_type` = `sliderbanner`. |
| `progress_bar_color` | Progress bar color | color | hex | `"#ffffff"` | Hidden when sliderbanner or `show_progress_bar` = `hide`. |
| `show_hover_animation` | Hover animation | pill_tabs | `"show"` (Show), `"hide"` (Off) | `"show"` | Scale-up on hover (grid, slider3/4; no scale on `lines`). Hidden when `collection_type` = `sliderbanner`. |
| `show_card_shadow` | Card shadow | pill_tabs | `"show"`, `"hide"` | `"show"` | |
| `item_background_color` | Card background color | color | hex or `""` | `"#000000"` | Blank = theme page background. |
| `text_color` | Card text color | color | hex or `""` | `""` | Blank = automatic light/dark text based on card background. |
| `item_border_type` | Border type | select | `"none"`, `"solid"`, `"dotted"`, `"dashed"`, `"double"`, `"ridge"` | `"none"` | Blank = `solid`. |
| `item_border_width` | Border width | range | 0–50 px | — | Blank = 1 (sliderbanner 0). |
| `item_border_color` | Border color | color | hex or `""` | — | Blank = `#cccccc`. |
| `item_border_radius` | Border radius | range | 0–100 px | `"10"` | |
| `padding_text` | Inner spacing text | spacer | px | placeholder 10/10/10/10 | Padding around card text. Blank side = 10 (20 on sliderbanner). |

#### Collection Background
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `background_color` | Background color | color | hex or `""` | `""` | Box around the whole collection. Blank = transparent. |
| `show_shadow` | Section shadow | pill_tabs | `"show"`, `"hide"` | `"hide"` | |
| `border_type` | Border type | select | `"none"`, `"solid"`, `"dotted"`, `"dashed"`, `"double"`, `"ridge"` | `"none"` | |
| `border_width` | Border width | range | 0–50 px | `"1"` | Blank = 4. |
| `border_color` | Border color | color | hex or `""` | `"#cccccc"` | Blank = black. |
| `border_radius` | Border radius | range | 0–100 px | `"4"` | Blank = 4. |

#### Collection Styling
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `item_spacing` | Spacing between cards on desktop | range | 0–30 px | `"15"` | |
| `item_spacing_mobile` | Spacing between cards on mobile | range | 0–30 px | `"10"` | Blank = `item_spacing`. |
| `padding_desktop` | Inside spacing | spacer | px | placeholder 10/10/10/10 | Padding inside the collection box. Blank side = 10. |

### Content matrix — filter fields per `collection_content`
| Value | Shows | `category_id` | `hashtags` / `lesson_ids` | `max_posts` | `outline_paginate_count` | `show_finished` | Outline Title Styling |
|---|---|---|---|---|---|---|---|
| `demo` | All posts in outline order | — | — | yes | — | hidden* | — |
| `outline` | One row per top-level category: its posts, then subcategories as cards. **Max one per page.** | — | — | per row | yes | yes | yes |
| `outline_categories` | One card per top-level category (rendered server-side) | — | — | — | — | yes | — |
| `category` | Posts of the listed categories, then their subcategories as cards | yes | — | yes | — | yes | — |
| `highlights` | Posts matching a listed post ID or a hashtag in the body, in outline order | — | yes | yes | — | yes | — |
| `favorites` | Posts the student favourited | — | — | yes | — | hidden* | — |
| `continue_watching` | Started, not completed posts | — | — | yes | — | hidden* | — |
| `replay` | Completed posts, shuffled once per day (seeded per collection), then cut at `max_posts` | — | — | yes | — | hidden* | — |

\* hidden in the editor, but a saved `hide` is still applied — see Pitfalls.

### Style matrix — setting groups per `collection_type`
| Settings | sliderbanner | slider3 / slider4 | lines | grid2–4 |
|---|---|---|---|---|
| `banner_*`, `show_banner_dots` | yes | — | — | — |
| `show_focus_*`, `focus_*` | read, hidden** | — | — | — |
| `text_placement` | — | yes | — | yes |
| `show_progress_bar`, `progress_bar_color`, `show_hover_animation` | — | yes | yes | yes |
| `show_two` | — | — | — | yes |
| Other Card Styling, Collection Background, Collection Styling | yes | yes | yes | yes |

\*\* sliderbanner reads `show_focus_border`, `show_focus_post_info`, `focus_text_display`, `show_focus_description_mobile` and `show_focus_description` even though the editor hides them.

### Example — add a collection block
Send the complete `block_order` (existing IDs from `get_theme_content` plus the new one); mirror it in `blockOrder` if the saved data has one.

```json
{"sections": {"jiffy_collections": {
  "blocks": {"1759920000001": {"type": "collection_banner", "settings": {
    "heading": "<h4>Continue where you left off</h4>",
    "collection_content": "continue_watching",
    "collection_type": "slider3",
    "max_posts": "12",
    "show_finished": "show",
    "show_progress_bar": "show"
  }}},
  "block_order": ["<existing_id_1>", "<existing_id_2>", "1759920000001"]
}}}
```

## Pitfalls
- **One `outline` collection per page.** A second `outline` block renders nothing live (only a red warning in the editor). `outline_categories` has no such limit. To show lessons from specific modules, use `category`.
- `show_finished` only applies where the editor shows it; on `replay`, `continue_watching`, `demo` and `favorites` a saved value is ignored.
- **Filter fields are content-specific.** `hashtags`/`lesson_ids` are ignored outside `highlights`, `category_id` outside `category`. The `hashtags` default `"#hashtag1, #hashtag2"` matches nothing real — replace or clear it for highlights.
- **Empty collections disappear.** A non-outline collection with no matching posts hides entirely (heading included); `outline` hides empty rows and the whole block when all rows are empty; `outline_categories` omits the heading when no card remains. Favorites/continue watching/replay are per student, so an empty result for the trainer is normal.
- **sliderbanner reads hidden focus settings**: its card border only draws when `show_focus_border` = `show`, post info follows `show_focus_post_info`, hover text follows `focus_text_display`, mobile description follows `show_focus_description_mobile` (default `hide`). Change these via the API if the trainer asks; they cannot in the editor.
- **Category-card descriptions** (`outline_categories`, subcategory cards in `outline`/`category`) follow `show_focus_description`, not `show_description`, in every style.
- **Display condition IDs are comma-only**, unlike `category_id`/`lesson_ids`. A conditional block with no offer/IDs never renders live.
- **Max posts on `outline` is per row**, not total; total length is set by `outline_paginate_count` (rows per page).
- **No focus slider in 1.2.** `collection_type` has no `"sliderfocus"` option; never write it. The `show_focus_*` / `focus_*` / `show_preview_*` / `preview_text_display` settings exist but are hidden for every style; only the ones sliderbanner reads (above) have any effect. If the trainer asks for a focus slider, it needs Nexus 1.4.
- Block saved without a key: JS falls back to `grid3`/`demo`/no limit, not to the schema defaults. Always write `collection_content` and `collection_type` on new blocks.
