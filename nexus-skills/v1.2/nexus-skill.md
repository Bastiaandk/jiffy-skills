# Nexus — Main Skill

**Theme:** Nexus, a licensed Kajabi course theme by JiffyCoursesOnline (author: Bastiaan de Koning).
**Skill version:** Nexus 1.2.x.

Read this file before reading or writing any Nexus setting, then read the sub-skill for the
section you are working on (routing table below). The rules here apply to every edit.

---

## 1. Recognise Nexus

You are working in Nexus when the theme's section schemas carry an `ai_guide` default — you will
see `_defaults.<section>.ai_guide` in a `get_theme_content` response — pointing to this file.
`theme.name` usually reads "Nexus", but the customer can rename it, so do not rely on it.

- Nexus is a **product theme**: it styles one Kajabi course product (product, post, category and
  categories pages). Settings are global for that theme — a section setting applies to every page
  that uses the section, never to a single lesson or category.
- The theme must be the product's active theme (`active_theme_id` in `get_course` /
  `get_product`). If it is not, writes have no visible effect. Only the customer can assign a
  theme, in Kajabi admin — tell them and stop.

## 2. Version rules

- **`_defaults` wins.** `_defaults` comes from the schema of the installed theme version. If a
  skill file disagrees with `_defaults` (a missing key, a different default), trust `_defaults`:
  the customer may run an older 1.2.x than the skill describes.
- **A section without `ai_guide` in `_defaults` is not part of this Nexus version.** Saved data
  can still contain old sections (e.g. `product_hero`, `mini_dashboard`). Do not edit them.
- **A saved key that is not in `_defaults` is a leftover** from an older version. The code no
  longer reads it. Ignore it; do not copy it into new blocks.
- **Never write `ai_guide` or `ai_guide_lock`.** They are documentation, not settings.

## 3. Talking to the trainer

Use the customer-facing name (as shown in the Kajabi editor) in chat. Use IDs only in payloads.
Setting labels are given in the sub-skills; trainers describe what they see ("Sm/Md/Lg",
"Grid: 3 posts"), so map labels to values, never the other way round in chat.

## 4. Pages, sections and sub-skills

| Page | Sections (in order) |
|---|---|
| Product homepage | `header`, `product_outline`, `product_welcome`, `product_section_top`, `jiffy_collections`, `product_section_bottom`, `jiffy_popups` (badges appear only through a Badge Area block in a dashboard section) |
| Post / lesson | `header`, `product_outline`, `post_actions`, `jiffy_post_media`, `jiffy_post_body`, `jiffy_badges` (slide-down under the Badges button), `jiffy_post_confetti`, `post_completion`, `post_paywall` |
| Category | `header`, `product_outline`, `category_progress_bar`, `jiffy_category` |
| Categories (tabs) | `header`, `product_outline`, `jiffy_categories` (Modules), `jiffy_categories_favorites`, `jiffy_categories_rewards`, `jiffy_categories_downloads` |
| Search, announcements, comment, live session | `header`, `product_outline` plus Kajabi-native sections |

| Section | Name in editor | Sub-skill |
|---|---|---|
| `header` | Header (global) | header |
| `product_outline` | Sidebar (global) | sidebar |
| `product_welcome` | Dashboard - Progress Banner | product |
| `product_section_top` / `_bottom` | Dashboard - Top / Bottom Section | product (section), blocks (its blocks) |
| `jiffy_popups` | Jiffy - Popups | product |
| `jiffy_collections` | Dashboard - Collections | collections |
| `post_actions` | Post - Action Bar | post |
| `jiffy_post_media` | Post - Media section | post |
| `jiffy_post_body` | Post - Body section | post |
| `jiffy_post_confetti` | Jiffy - Confetti | post |
| `post_completion` | Jiffy - Completion Message | post |
| `post_paywall` | Paywall | post |
| `category_progress_bar` | Category - Progress Bar | category |
| `jiffy_category` | Category - Collection | category |
| `jiffy_categories` | Categories - Collection | categories |
| `jiffy_categories_favorites` / `_rewards` / `_downloads` | Jiffy - Favorites / Rewards / Downloads | categories |
| `jiffy_badges` | Jiffy - Badges (global) | badges |
| — (top-level `settings`) | Theme settings: fonts, colors, icons, pagination | preferences |

Content blocks (Jiffy Card, Form, Certificate, Coaching Widget, Group, Badge Area) in the Dashboard
Top / Bottom, Jiffy - Rewards, Jiffy - Downloads and Sidebar sections are covered by the
`blocks` sub-skill; the section's own sub-skill covers its section-level settings.

`announcements`, `live_session_details`, `search_results` and `community_widget` are Kajabi-native
sections, covered by Kajabi's own guidance — not by these skills.

Nexus 1.2 has no `jiffy_onboarding` section. `product_section_middle` (Dashboard - Middle Section)
exists in the theme files, but the 1.2 product page does not render it: edits there have no
visible effect. Put middle content in Dashboard - Top or Bottom instead, and tell the trainer.

### Routing — fetch before writing

Base URL: `https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/v1.2/`

| Sub-skill | File |
|---|---|
| header | [nexus-header-skill.md](https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/v1.2/nexus-header-skill.md) |
| sidebar | [nexus-sidebar-skill.md](https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/v1.2/nexus-sidebar-skill.md) |
| product | [nexus-product-skill.md](https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/v1.2/nexus-product-skill.md) |
| blocks | [nexus-blocks-skill.md](https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/v1.2/nexus-blocks-skill.md) |
| collections | [nexus-collections-skill.md](https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/v1.2/nexus-collections-skill.md) |
| post | [nexus-post-skill.md](https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/v1.2/nexus-post-skill.md) |
| category | [nexus-category-skill.md](https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/v1.2/nexus-category-skill.md) |
| categories | [nexus-categories-skill.md](https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/v1.2/nexus-categories-skill.md) |
| badges | [nexus-badges-skill.md](https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/v1.2/nexus-badges-skill.md) |
| preferences | [nexus-preferences-skill.md](https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/v1.2/nexus-preferences-skill.md) |

Fetch every sub-skill the task touches before the first write. Fetching a link from a file read
earlier in the conversation sometimes fails; if it does, re-fetch this file and then the sub-skill
in the same turn. If a sub-skill still cannot be fetched, tell the trainer and limit yourself to
changes whose key and value are unambiguous from `_defaults`.

## 5. Writing with `update_theme_content`

The `settings` parameter is a partial hash, deep-merged into the saved settings. Send only what
changes. Shapes:

**Section setting**
```json
{"sections": {"header": {"settings": {"live_session_title": "Live"}}}}
```

**Block setting** (block IDs come from the section's `blocks` in `get_theme_content`)
```json
{"sections": {"jiffy_badges": {"blocks": {"<block_id>": {"settings": {"image_no_show": "true"}}}}}}
```

**Global theme setting** — top level, not under `sections`
```json
{"primary_color": "#1E5EFF"}
```

**Adding, removing or reordering blocks:** write the block under `blocks` with its `type` and
`settings`, and send the complete `block_order` array. If the section's saved data also has a
`blockOrder` array, send it with identical content. A block missing from `block_order` does not
render.

## 6. Value formats

| Setting type | Write | Example |
|---|---|---|
| `range` | number as string, no unit (the code adds `px`, `%`, `rem`) | `"24"` |
| `color` | hex; `""` = automatic/fallback where the sub-skill allows blank | `"#1E5EFF"` |
| `select`, `pill_tabs` | the **value**, never the label | `"grid3"`, not `"Grid: 3 posts"` |
| `checkbox` | `true` / `false` (the code accepts `"true"` / `"false"` as well) | `true` |
| `spacer` | object with `top`, `right`, `bottom`, `left` in px; copy the format of the saved value when one exists | `{"top": 10, "right": 0, "bottom": 10, "left": 0}` |
| `font_select` | Google Fonts family name | `"Open Sans"` |
| `text` with IDs | comma-separated numeric IDs | `"2159509993,2159509991"` |
| `offer` | numeric offer ID | `"2148123456"` |

- Spacer values in a schema are often **placeholders**, not saved defaults. The sub-skills say
  which; an empty spacer uses the code's fallback.
- Pill and select values are lowercase strings. Check the sub-skill — some read the wrong way round
  (e.g. badge `image_no_show: "true"` means **hide**).

## 7. Working rules

- **No draft layer.** Every write is live for every student immediately.
- **Read back after every write** with `get_theme_content` (`section_filter`). `{"updated": true}`
  means accepted, not correct.
- **Category and post IDs** come from `get_course` (modules and lessons). A list of IDs in a
  trigger means **all** listed items must be completed. An empty list never unlocks.
- **Never** write, clear or include the license key `jiffylicense`. A wrong or empty key locks the
  course for students.
- **Never hide the sidebar or outline other than with their own toggles** (`sidebar_slider`,
  `show_outline`). The outline markup feeds the data cache that collections and badges read; it
  must stay in the page even when invisible.
- If the trainer asks for something Nexus has no setting for, say so. Do not invent keys — an
  unknown key is accepted by the MCP and silently ignored by the theme.
