# Nexus — Badges Skill

> **Before any write:** if you have not fetched the main skill [`nexus-skill.md`](https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/v1.1/nexus-skill.md) in this
> conversation, fetch it now. It holds the payload shapes, value formats and working rules
> (send only changed keys, read back after every write), which this file does not repeat.

## Section: `jiffy_badges` — "Jiffy - Badges (global)"
One global section with one block per badge. Define a badge once; it appears everywhere the section is embedded:
- **Post page** — slide-down opened by the Badges button of "Post - Action Bar" (`post_actions.show_badges` = `"show"`).
- **Categories page, Rewards tab** — embedded by `jiffy_categories_rewards`; its `badges_position` (top/bottom/none) and `ba_*` colours override this section there (see the categories skill).
- **Product homepage** — only through a "Badge Area Block" (`badge_area`) in a Dashboard section. The section itself sits in a hidden wrapper there.

### Top of the editor (no group)
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `badgeflex` | Product page - Badges per line | grid | `"1"`–`"12"` | `"4"` | Badges per row on desktop inside a Badge Area Block on the product homepage. |
| `badgeflexrewards` | Reward & Post page - Badges per line | grid | `"1"`–`"12"` | `"12"` | Badges per row on desktop on the Rewards tab and post page. |
| `badgeflexmob` | Mobile - Badges per line | grid | `"1"`–`"12"` | `"3"` | Badges per row below 768px, all pages. |

The value is the number of badges per row (width = 100 / value %), not a 12-column span.

### Global Badge Settings
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `badge_title` | Title badges | rich_text | — | `"Get all your badges"` | Heading above the badges. Empty removes the heading and its top padding. |
| `badge_titlecolor` | Title color | color | hex or `""` | `""` | Blank: text colour derived from `background_color` (light/dark), else theme text colour. |
| `badge_labelcolor` | Label color | color | hex or `""` | `""` | Colour of the label under each badge (`content`). |
| `badge_overlaycolor` | Overlay color | color | hex or `""` | `""` | Text and border colour of the hover tooltip (locked/unlocked text). Blank: grey `#666666`. |
| `background_color` | Background color | color | hex or `""` | — | Section background. Blank: none. |
| `badge_label_fontsize` | Label font size | range | 6–20 px | `"13"` | |
| `badge_overlay_fontsize` | Overlay font size | range | 6–20 px | `"14"` | |

### Badge Section Background Settings
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `shadow` | Add shadow to section | checkbox | `true` / `false` | `"false"` | |
| `border_type` | Border type | select | `"none"` (None), `"solid"` (Solid), `"dotted"` (Dotted), `"dashed"` (Dashed), `"double"` (Double), `"ridge"` (Ridge) | `""` | `""` and `"none"` both mean no border. |
| `border_width` | Border width | range | 0–50 px | `"4"` | Only visible with a border type. |
| `border_color` | Border color | color | hex or `""` | `""` | Blank: black. |
| `border_radius` | Border radius | range | 0–100 px | `"4"` | |

### Badge Section Styling
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `padding_desktop` | Section padding | spacer | top/right/bottom/left px | placeholder 0/0/0/0 | Empty side falls back to 20px. Applies on all screen sizes. |

### Block: `gamify_badge` — "Badge"
One block = one badge with a locked and an unlocked state.

Ungrouped (top of the block):
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `image_yes_show` | Preview in admin as | pill_tabs | `"false"` (Locked), `"true"` (Unlocked) | `"false"` | Editor only. In the editor real conditions are ignored; this pill decides the state shown. No effect for students. |
| `content` | Label | text | — | `"Label"` | Text under the badge. Empty: no label. |

**Display Conditions**
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `visibility_trigger` | Trigger | select | `"offer"` (Offer), `"category"` (Category completed), `"post"` (Post completed) | `"offer"` | Blank is treated as `"offer"`. |
| `visibility_offer` | Select offer | offer | numeric offer ID | `""` | Unlocks when the student currently owns the offer (typically a free "ghost" offer granted by an automation). Hidden when `visibility_trigger` = `"category"` or `"post"`. |
| `visibility_categories` | Category IDs | text | comma-separated category IDs | `""` | All listed categories must be complete. Evaluated server-side. Hidden when `visibility_trigger` = `"offer"` or `"post"`. |
| `visibility_posts` | Post IDs | text | comma-separated post IDs | `""` | All listed posts must be completed. Evaluated in the browser. Hidden when `visibility_trigger` = `"offer"` or `"category"`. |

**Badge Locked**
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `image_no_show` | Show badge when locked? | pill_tabs | `"true"` (Hide), `"false"` (Show) | `"false"` | Inverted: `"true"` hides the badge until it is unlocked. |
| `image_no` | Badge locked | image_picker | 400×400 suggested | — | Blank: theme placeholder `badge.png`. |
| `badge_txtno` | Badge locked text | rich_text | — | `"You can do this!"` | Hover tooltip while locked. Empty: no tooltip. |
| `badge_no_action` | Badge locked action | action | URL | `""` | Link on the locked badge. Empty: not clickable. |
| `badge_no_target` | Open in new window | checkbox | `true` / `false` | `"false"` | For `badge_no_action`. |

**Badge Unlocked**
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `image_yes` | Badge unlocked | image_picker | 400×400 suggested | — | Blank: theme placeholder `badge.png`. |
| `badge_txtyes` | Badge unlocked text | rich_text | — | `"Great, you own this badge!"` | Hover tooltip once unlocked. Empty: no tooltip. |
| `badge_yes_action` | Badge unlocked action | action | URL | `""` | Link on the unlocked badge (e.g. a certificate or reward download). Empty: not clickable. |
| `badge_yes_target` | Open in new window | checkbox | `true` / `false` | `"false"` | For `badge_yes_action`. |

### Example: add a badge
Read the section first, then send every existing block ID plus the new one in `block_order` (the new ID is any unique string).
```json
{"sections": {"jiffy_badges": {
  "blocks": {"badge_module1": {"type": "gamify_badge", "settings": {
    "content": "Module 1",
    "visibility_trigger": "category",
    "visibility_categories": "2159509993",
    "image_no_show": "false",
    "badge_txtno": "Finish Module 1 to earn this badge",
    "badge_txtyes": "Module 1 completed!"
  }}},
  "block_order": ["<existing_id_1>", "<existing_id_2>", "badge_module1"]
}}}
```

## Pitfalls
- `image_no_show` is inverted: `"true"` = **Hide** while locked, `"false"` = Show.
- `visibility_offer` must be the numeric offer ID (from `list_offers`), not the offer name. A non-numeric or empty value never unlocks.
- ID lists are AND: every listed category/post must be complete. Use one badge per milestone for "any of". An empty list never unlocks. Separate IDs with commas only.
- Category IDs match only top-level categories and their direct subcategories within this product. A deeper sub-subcategory or a category from another product is never found, so the badge never unlocks.
- A category with 0 posts counts as complete; the badge unlocks immediately.
- A scheduled (drip) or locked category, or one containing such posts, cannot be completed by the student, so the badge stays locked until it is released.
- The post trigger is resolved in the browser from the `nexus-data-v1-*` sessionStorage cache that the sidebar outline fills. Until the listed posts are in the cache the badge shows locked (or stays hidden with `image_no_show` = `"true"`). Posts outside this product's outline never resolve.
- The editor never shows real unlock state; use `image_yes_show` to preview. Test unlocks as a student.
- Offer badges relock if the offer is revoked (`currently_owned` is checked on every page load).
- `kgbadge_trigger` is a dead legacy key from older versions. Do not write it; use `visibility_trigger`.
- On the Rewards tab, `ba_*` colours on `jiffy_categories_rewards` override this section's colours. Change them there.
