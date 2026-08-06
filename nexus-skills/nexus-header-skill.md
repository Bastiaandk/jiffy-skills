# Nexus — Header Skill File

**Section name in theme:** `header`
**Applies to:** product, post, category, categories, announcements, search, live session pages

The header is global. Any change is immediately live on every page that renders it.
Post and category pages automatically display their own content title in the header —
the title settings here apply to the product homepage and special pages only.

---

## MCP rules for this section

- Section key in the payload: `header`
- Settings path: `settings.sections.header.settings`
- No blocks — this section has elements and groups only
- `{"updated": true}` does not mean the change rendered. Always call `get_theme_content` after writing.

---

## Product page header

| Setting ID | Type | Options | Default | Notes |
|---|---|---|---|---|
| `product_header` | pill_tabs | `"title"` / `"logo"` | `"title"` | Determines what shows in the header on the product homepage |
| `logo_text` | text | — | `"Nexus"` | Hidden when `product_header` is `"logo"` |
| `logo` | image_picker | — | — | Hidden when `product_header` is `"title"` |
| `logo_height` | range | 15–100px | `40` | Hidden when `product_header` is `"title"` |

---

## Page titles

Post and category pages display their content title automatically.
These settings control the title shown on special pages.

| Setting ID | Type | Default | Page where it appears |
|---|---|---|---|
| `text_color` | color | — | All pages |
| `title_font_size` | range | `24` | All pages |
| `categories_title` | text | `"Modules"` | Categories overview |
| `searched_title` | text | `"Search"` | Search results page |
| `announcements_title` | text | `"Announcements"` | Announcements page |
| `favorites_title` | text | `"Favorites"` | Favorites page |
| `rewards_title` | text | `"Rewards"` | Rewards page |
| `downloads_title` | text | `"Downloads"` | Downloads page |
| `live_session_title` | text | — | Live session page — ⚠️ read by the template but has no entry in the section schema, so it has no picker in the Kajabi editor. Settable via MCP as plain text anyway. |

---

## Breadcrumbs

Breadcrumbs are hidden on the product homepage. They appear on post, category, and special pages.

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `show_breadcrumbs` | checkbox | `"true"` | Disables all breadcrumbs when `"false"` |
| `home` | text | `"Home"` | First crumb — links to product homepage |
| `categories` | text | `"Categories"` | |
| `search` | text | `"Search"` | |
| `announcements` | text | `"Announcements"` | |
| `favorites` | text | `"Favorites"` | |
| `rewards` | text | `"Rewards"` | |
| `downloads` | text | `"Downloads"` | |
| `divider` | text | `"/"` | Character shown between crumbs |
| `breadcrumb_color` | color | — | |
| `breadcrumb_color_active` | color | — | Active crumb and toggle |
| `breadcrumbs_font_size` | range | `12` | |

---

## Styling

| Setting ID | Type | Options | Default | Notes |
|---|---|---|---|---|
| `sticky_header` | pill_tabs | `"yes"` / `"no"` | `"no"` | Makes the header stick to the top on scroll |
| `background_color` | color | — | `""` (blank) | Leave blank to use global header background color |
