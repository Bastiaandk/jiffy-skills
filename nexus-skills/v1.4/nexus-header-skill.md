# Nexus — Header Skill

Part of the Nexus skill set. Read `nexus-skill.md` first: payload shapes, value formats and working rules are there, not repeated here.

## Section: `header` — "Header (global)"
Top bar of the content column: page title (h1), breadcrumbs and the mobile sidebar toggle. Global: rendered on the product, post, category, categories, search, announcements, comment and live session pages. No blocks.

### Per page: title and breadcrumbs

Favorites, Rewards and Downloads are **not separate pages**: they are tabs of the one categories page (`?favorites`, `?rewards`, `?downloads`; no parameter = Modules). The header shows the title and crumb of the active tab.

The h1 title (`*_title` fields, group Titles) and the breadcrumb label (group Breadcrumbs & toggle) are **separate fields**. Renaming "Modules" means `categories_title` (h1) and/or `categories` (crumb) — ask which, or change both.

| Page | h1 title | Breadcrumbs (when `show_breadcrumbs` is on) |
|---|---|---|
| Product homepage | `logo_text`, or the `logo` image when `product_header` = `"logo"` | Never shown live (may show in the editor preview) |
| Post | Post title (automatic) | `home` / `categories` (link) / category title / post title |
| Comment | Same as post (the page carries the post) | Same as post |
| Category | Category title (automatic) | `home` / `categories` (link) / category title |
| Categories — Modules tab | `categories_title` | `home` / `categories` |
| Categories — Favorites tab | `favorites_title` | `home` / `favorites` |
| Categories — Rewards tab | `rewards_title` | `home` / `rewards` |
| Categories — Downloads tab | `downloads_title` | `home` / `downloads` |
| Search | `searched_title` followed by the search terms | `home` / `search` |
| Announcements | `announcements_title` | `home` / `announcements` |
| Live session | `live_session_title` | `home` / `categories` (not a link) |

On every page except the product homepage the theme hides the in-page post, category and search titles, because the header h1 shows them.

### (top level, no group)
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `product_header` | Product page header | pill_tabs | `"title"` (Title), `"logo"` (Logo) | `"title"` | Product homepage only. |
| `logo_text` | Product page title | text | — | `"Nexus"` | h1 on the product homepage; also the fallback h1 on any page not listed above. Hidden when `product_header` = `"logo"`. |
| `logo` | Logo image | image_picker | suggested 360×80 | — | Blank falls back to the theme's `logo.png`. Hidden when `product_header` = `"title"`. |
| `logo_height` | Logo height | range | 15–100 px | `"40"` | Max height of the logo image. Hidden when `product_header` = `"title"`. |

### Titles
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `text_color` | Text color | color | hex or blank | — | h1 colour on all pages. Blank: derived from `background_color` (dark → global `text_light`, light → `text_dark`); if that is blank too, derived the same way from global `sidebar_background`. |
| `title_font_size` | Title font size | range | 10–100 px | `"24"` | Desktop only; at ≤767px the h1 is fixed at 1.8em. |
| `categories_title` | Categories | text | — | `"Modules"` | h1 of the Modules tab. |
| `searched_title` | Search | text | — | `"Search"` | h1 on search; the search terms are appended. |
| `announcements_title` | Announcements | text | — | `"Announcements"` | h1 on announcements. |
| `live_session_title` | Live session | text | — | `"Live Session"` | h1 on the live session page. |
| `favorites_title` | Favorites | text | — | `"Favorites"` | h1 of the Favorites tab. |
| `rewards_title` | Rewards | text | — | `"Rewards"` | h1 of the Rewards tab. |
| `downloads_title` | Downloads | text | — | `"Downloads"` | h1 of the Downloads tab. |

### Breadcrumbs & toggle
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `show_breadcrumbs` | Show breadcrumbs | checkbox | — | `"true"` | Off hides breadcrumbs on every page. |
| `home` | Home text | text | — | `"Home"` | First crumb, links to the product homepage. |
| `categories` | Categories text | text | — | `"Categories"` | Crumb for the Modules tab; on post/category pages it links to the categories page. |
| `search` | Search text | text | — | `"Search"` | |
| `announcements` | Announcements text | text | — | `"Announcements"` | |
| `favorites` | Favorites text | text | — | `"Favorites"` | Favorites tab crumb. |
| `rewards` | Rewards text | text | — | `"Rewards"` | Rewards tab crumb. |
| `downloads` | Downloads text | text | — | `"Downloads"` | Downloads tab crumb. |
| `divider` | Divider | text | — | `"/"` | Shown between crumbs. |
| `breadcrumb_color` | Breadcrumb color | color | hex or blank | — | Linked crumbs and dividers. Blank: same chain as `text_color` (header background → global `sidebar_background`). |
| `breadcrumb_color_active` | Breadcrumb active & toggle color | color | hex or blank | — | Last (current) crumb and the mobile sidebar toggle icon. Blank: last crumb uses global `accent_color`. |
| `breadcrumbs_font_size` | Breadcrumb font size | range | 12–32 px | `"12"` | 80% of this at ≤767px. |

### Header Styling
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `sticky_header` | Make header sticky | pill_tabs | `"yes"` (Yes), `"no"` (No) | `"no"` | Header sticks to the top while scrolling. |
| `background_color` | Background color | color | hex or blank | `""` | Blank uses global `sidebar_background` (Navigation background). There is no separate global header colour. |

## Pitfalls
- "Change the Favorites/Rewards/Downloads page title" is a header setting (`*_title`), not a setting of the Jiffy - Favorites/Rewards/Downloads sections.
- Changing an h1 title does not change the matching breadcrumb, and the other way round. Post and category titles come from Kajabi content, not from header settings.
- The live session page has no own breadcrumb label: it shows the Categories text, without a link. Only `show_breadcrumbs` = false removes it, and that applies to every page.
- Blank colours are derived from the background, not inherited from a "header" global. To change the header background together with the sidebar, change global `sidebar_background` (preferences skill); to change only the header, set `background_color`.
- Header settings are global: there is no per-page or per-module title colour or size.
