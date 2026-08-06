# Nexus — Badges Skill File

**Section name in theme:** `jiffy_badges`
**Applies to:** product page, post page (same global section on both)

Badges are global. The `jiffy_badges` section and its blocks are shared across
the product homepage and every lesson page. Defining a badge once makes it
available everywhere.

The rewards overview (`jiffy_categories_rewards`) shows the badge area on the
Categories page — its badge area styling is separate from this section.

---

## MCP rules for this section

- Section key: `jiffy_badges`
- Settings path: `settings.sections.jiffy_badges.settings`
- Blocks path: `settings.sections.jiffy_badges.blocks`
- `block_order` is load-bearing — always include it when adding or removing a block
- `{"updated": true}` does not mean the change rendered. Always call `get_theme_content` after writing.

---

## Section settings

| Setting ID | Type | Default |
|---|---|---|
| `badgeflex` | grid | `4` — badges per line on the product page |
| `badgeflexrewards` | grid | `12` — badges per line on the Rewards tab and post page |
| `badgeflexmob` | grid | `3` — badges per line on mobile |
| `badge_title` | rich_text | `"Get all your badges"` |
| `badge_titlecolor` | color | `""` |
| `badge_labelcolor` | color | `""` |
| `badge_overlaycolor` | color | `""` |
| `background_color` | color | `""` |
| `badge_label_fontsize` | range | `13` |
| `badge_overlay_fontsize` | range | `14` |
| `shadow` | checkbox | `false` |
| `border_type` | select | `""` (none) / `"solid"` / `"dotted"` / `"dashed"` / `"double"` / `"ridge"` |
| `border_width` | range | `4` |
| `border_color` | color | `""` |
| `border_radius` | range | `4` |
| `padding_desktop` | spacer | — |

---

## Block type: `gamify_badge` — "Badge"

Each block defines one badge with a locked and unlocked state. The unlock
condition is determined by an offer, category completion, or post completion.

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `image_yes_show` | pill_tabs | `"false"` (locked) / `"true"` (unlocked) | Preview state in admin only |
| `content` | text | `"Label"` | Badge label text |
| `visibility_trigger` | select | `"offer"` / `"category"` / `"post"` | `"offer"` |
| `visibility_offer` | offer picker | `""` | Used when trigger is `"offer"` |
| `visibility_categories` | text | `""` | Comma-separated category IDs |
| `visibility_posts` | text | `""` | Comma-separated post IDs |
| `image_no_show` | pill_tabs | `"true"` (hide) / `"false"` (show) | Whether to show badge when still locked |
| `image_no` | image_picker | — | Badge image when locked |
| `badge_txtno` | rich_text | `"You can do this!"` | Text shown when locked |
| `badge_no_action` | action | `""` | Link when clicking locked badge |
| `badge_no_target` | checkbox | `false` | Open link in new window |
| `image_yes` | image_picker | — | Badge image when unlocked |
| `badge_txtyes` | rich_text | `"Great, you own this badge!"` | Text shown when unlocked |
