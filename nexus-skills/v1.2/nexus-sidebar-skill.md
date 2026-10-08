# Nexus — Sidebar Skill

> **Before any write:** if you have not fetched the main skill [`nexus-skill.md`](https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/v1.2/nexus-skill.md) in this
> conversation, fetch it now. It holds the payload shapes, value formats and working rules
> (send only changed keys, read back after every write), which this file does not repeat.

## Section: `product_outline` — "Sidebar (global)"
Left navigation on every course page (product, post, category, categories, search, announcements, comment, live session). One shared section: a change is live everywhere at once. Blocks: yes — filters and external links render inside the navigation (in block order), cards render below it.

**Hard rule — the outline markup must stay in the page.** `sidebar_slider: "hide"` and `show_outline: "hide"` are CSS-only: the outline HTML and its `data-cat-url` containers remain, and they fill the `nexus-data-v1-*` cache that collections, badges and card post-triggers read. Hide the sidebar or outline only with these two toggles — never suggest custom CSS/code that removes them.

**Layout modes**
- Desktop `slider` (≥992px): fixed overlay, 330px open, collapses to a 36px icon rail (`html.sidebar-collapsed`). Opens on hover (100ms) or click on the rail, closes on mouse-leave, the toggle bar or a click outside. Open/closed state persists per browser. Cards and item titles are hidden while collapsed.
- Desktop `fixed`: `html.sidebar-fixed-desktop`, sticky 330px column that never collapses; page content scrolls on its own.
- Mobile `compact` (≤991px): hidden off-canvas; a menu button in the header opens it (330px).
- Mobile `slider`: 36px rail stays visible; opens by tapping the left edge or swiping.

### Sidebar settings (top of section, no group)
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `sidebar_slider` | Sidebar | pill_tabs | `"show"` (Show), `"hide"` (Hide) | `"show"` | `"hide"` = `display:none` on the whole sidebar; markup stays. Hides every setting below in the editor. |
| `sidebar_desktop` | Sidebar on desktop | pill_tabs | `"slider"` (Slider), `"fixed"` (Fixed) | `"slider"` | See layout modes. Hidden when `sidebar_slider` = `"hide"`. |
| `sidebar_mobile` | Sidebar on mobile | pill_tabs | `"slider"` (Slider), `"compact"` (Compact) | `"compact"` | See layout modes. Hidden when `sidebar_slider` = `"hide"`. |

### Sidebar Content (menu items, in render order)
All `"show"` (Show) / `"hide"` (Hide) unless noted; all hidden in the editor when `sidebar_slider` = `"hide"`. Hidden items are hidden with `display:none`.

| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `show_product_title` | Sidebar Title / Logo | pill_tabs | show/hide | `"show"` | Content set in group Sidebar Title / Logo. |
| `show_home` | Home | pill_tabs | show/hide | `"show"` | Links to the product homepage. |
| `show_outline` | Product Outline | pill_tabs | show/hide | `"show"` | Collapsible module/lesson tree. `"hide"` is CSS-only (hard rule above). |
| `show_favorites` | Favorites* | pill_tabs | show/hide | `"show"` | Link to `/categories?favorites`. Tab content: categories skill. |
| `show_rewards` | Rewards* | pill_tabs | show/hide | `"show"` | Link to `/categories?rewards`. |
| `show_downloads` | Downloads* | pill_tabs | show/hide | `"show"` | Link to `/categories?downloads`. |
| `show_community` | Community | pill_tabs | show/hide | `"hide"` | Hidden for students when the site has no community or the community widget is not configured (editor shows a warning). |
| `show_chatbot` | Chatbot | pill_tabs | show/hide | `"hide"` | Menu item opens a popup. With `chatbot_action` = `"floating"` there is **no menu item**, only a floating button. Hidden for students when the chatbot is not ready. |
| `show_search` | Search | pill_tabs | show/hide | `"show"` | Search field; searches this product. |
| `show_filter` | Filters | pill_tabs | show/hide | `"show"` | "Filters" dropdown holding the Filter blocks. `"hide"` = Filter blocks are not rendered at all. |
| `show_announcements` | Announcements | pill_tabs | show/hide | `"show"` | Link to the product announcements page. |
| `show_store` | Store | pill_tabs | show/hide | `"show"` | Link = `store_action`. |
| `show_external` | External links | pill_tabs | `"show"` (Dropdown), `"inline"` (Inline), `"hide"` (Hide) | `"show"` | Dropdown = links grouped under a `cat-external` toggle. Inline = each External Link block as its own top-level item. Hide = no links. |
| `hide_back_link` | Backlink | pill_tabs | `"false"` (Show), `"true"` (Hide) | `"false"` | Reversed: `"true"` hides. Destination in Backlink Settings. |

### Sidebar Title / Logo
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `logo_type` | Show | pill_tabs | `"image"` (Logo), `"title"` (Title), `"custom"` (Custom) | `"title"` | Title = product title. |
| `custom_logo_text` | Custom title | text | — | — | Used when `logo_type` = `"custom"`; blank = empty title. Hidden when `logo_type` = `"image"` or `"title"`. |
| `logo` | Logo image | image_picker | suggested 360×80 | — | Used when `logo_type` = `"image"`. Hidden when `logo_type` = `"title"` or `"custom"`. |

### Item Titles
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `cat-home` | Home | text | — | `"Home"` | |
| `cat-title` | Outline | text | — | `""` | Blank = icon only, no label. |
| `cat-favorites` | Favorites | text | — | `"Favorites"` | Sidebar label only. |
| `cat-rewards` | Rewards | text | — | `"Rewards"` | |
| `cat-downloads` | Downloads | text | — | `"Downloads"` | |
| `cat-community` | Community | text | — | `"Community"` | |
| `cat-chatbot` | Chatbot | text | — | `"Ask for help"` | Not shown with floating chatbot. |
| `search_text` | Search | text | — | `"Search for something..."` | Placeholder in the search field. |
| `cat-filters` | Filters | text | — | `"Filters"` | |
| `cat-announcements` | Announcements | text | — | `"Announcements"` | |
| `cat-store` | Store | text | — | `"Store"` | |
| `cat-external` | External links | text | — | `"External links"` | Dropdown label. Hidden when `show_external` = `"inline"` or `"hide"`. |
| `library` | Back link text | text | — | `"Library"` | |

### Outline Settings
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `show_category_arrow` | Add redirect arrow to category title | pill_tabs | `"show"` (Show), `"hide"` (Hide) | `"hide"` | Adds an arrow linking to the category page; the title itself only expands/collapses. Paywalled categories link via the title instead. |

### Community Settings
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `community_action` | Link to Community | pill_tabs | `"popup"` (Popup), `"link"` (Community) | `"popup"` | Popup = community widget over the page; in the Kajabi app / Branded App the community page opens instead. Link = opens `/products/communities`. |

### Chatbot Settings
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `chatbot_id` | Chatbot | chatbot | Kajabi chatbot | — | Blank = the site's default agent, if any. |
| `chatbot_action` | Display style | pill_tabs | `"popup"` (Popup), `"floating"` (Floating) | `"popup"` | Floating removes the sidebar menu item. |
| `chatbot_height` | Popup height | range | 300–800 px, step 50 | `600` | Hidden when `chatbot_action` = `"floating"`. |
| `chatbot_corner_radius` | Popup corner radius | range | 0–50 px, step 2 | `10` | Hidden when `chatbot_action` = `"floating"`. |
| `chatbot_overlay_background` | Overlay background | color | rgba allowed | `"rgba(0, 0, 0, 0.5)"` | Hidden when `chatbot_action` = `"floating"`. |
| `chatbot_text_color` | User text color | color | — | `""` | Blank = global `text_dark`. |
| `chatbot_agent_text_color` | Agent text color | color | — | `""` | Blank = global `text_dark`. |
| `chatbot_primary` | Chatbox color | color | — | `""` | Blank = global `primary_color`. |
| `chatbot_accent` | Chatbox toggle color | color | — | `""` | Blank = global `accent_color`. |
| `chatbot_primary_text` | Chatbox text | color | — | `""` | A colour, not text. Blank = `text_light` or `text_dark`, by contrast with the chatbox colour. |

### Store Settings
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `store_action` | Link to Store | action | URL or path | `"/store"` | |

### Backlink Settings
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `back_link_url` | Back link destination | select | `"library"` (Website Library), `"site_home"` (Website Home Page), `"community"` (Community), `"course"` (Product Home), `"custom"` (Custom URL) | `"library"` | library = `/library`; site_home = site URL; community = `/products/communities` (top window); course = product homepage. |
| `custom_destination` | Custom URL Destination | text | full URL | — | Used when `back_link_url` = `"custom"`; blank = `#`. Hidden for all other values. |

### Sidebar Styling
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `background_color` | Background color | color | — | `""` | Blank = global `sidebar_background` ("Navigation background"). |
| `color` | Text color | color | not blank | `"#fff"` | Text and icons. |
| `searchinputfield` | Search - Input field | color | — | `""` | Text colour in the search field while typing (focus only). Blank = browser default. |
| `kg_outline_border` | Border | pill_tabs | `"border"` (Show), `"none"` (Hide) | `"none"` | 1px line under each menu item and outline category. |
| `kg_outline_border_color` | Border color | color | not blank | `"#666666"` | Hidden when `kg_outline_border` = `"none"`. |
| `item_spacing` | Spacing between cards | range | 0–30 px | `"10"` | Gap between card blocks. |

### Block: `gamify_textfilter` — "Filter"
Item inside the "Filters" dropdown. Renders only when `show_filter` = `"show"`.

| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `filtertext` | Text in navigation | text | — | `"Nexus"` | |
| `filtertexton` | Search on | text | search term, e.g. a hashtag | `"#nexus"` | Links to the product search for this term; trainers tag posts with the hashtag. |

### Block: `gamify_link` — "External Link"
Rendered per `show_external`: inside the dropdown (`"show"`), as top-level items (`"inline"`), or not at all (`"hide"`).

| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `link_text` | Text in navigation | text | — | `"External link"` | |
| `link_action` | Link action | action | URL | `"https://www.jiffycoursesonline.com"` | Replace the default. |
| `new_tab` | Open in new tab | checkbox | — | `""` | `true` = `target="_blank"`. |

### Block: `gamify_card` — "Jiffy Card"
All card settings → **`nexus-blocks-skill.md`**. Rendered below the navigation, hidden while the slider is collapsed. The sidebar card differs from the dashboard card only in:

| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `width` | Width | grid | `"1"`–`"12"` columns | `"12"` | Share of the 330px sidebar; `"12"` = full width. Dashboard default `"4"`. |
| `background_color` | Block background color | color | — | `""` | Blank = transparent (sidebar background shows through). Dashboard default `"#ffffff"`. |

- Text-contrast fallback for a blank card background (and blank `card_textcolor`): sidebar `background_color` → global `sidebar_background`, not `page_background`.
- Gap between cards = `item_spacing` (Sidebar Styling). `block_break` works here too.

## Pitfalls
- Never hide the sidebar or outline by any route other than `sidebar_slider` / `show_outline` (hard rule above). Doing so silently empties collections, post-triggered badges and post-triggered cards.
- Chatbot "missing" from the menu: `chatbot_action` = `"floating"` removes the menu item by design; or the chatbot is not ready (no chatbot selected/published).
- Community item invisible for students but visible in the editor: the site community or widget is not configured. Not a setting problem.
- Filter blocks disappear when `show_filter` = `"hide"`; External Link blocks when `show_external` = `"hide"`. Check the toggle before debugging the block.
- `hide_back_link` reads the wrong way: `"true"` = hidden.
- New sidebar card: send `width: "12"` (or omit). Copying a dashboard card's `"4"` gives a third-width card in a 330px column.
- Card conditions (offer, category, post triggers) and their pitfalls → blocks skill. Post-trigger cards depend on the outline cache, another reason never to remove the outline.
- Cards are hidden while the desktop slider is collapsed; with `sidebar_desktop` = `"slider"` students only see them after opening the sidebar.
- `chatbot_primary_text` is a colour, not a label.
- Sidebar background blank = global Navigation background (`sidebar_background`), not the page background.
