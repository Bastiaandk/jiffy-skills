# Nexus — XP & Levels Skill

> **Before any write:** if you have not fetched the main skill [`nexus-skill.md`](https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/v1.4/nexus-skill.md) in this
> conversation, fetch it now. It holds the payload shapes, value formats and working rules
> (send only changed keys, read back after every write), which this file does not repeat.

## Section: `jiffy_xp` — "Jiffy - XP & Levels (global)"
One global section with the global XP settings: points, levels, bonus lessons, level-up, texts and the
accent color. It shows nothing itself except the level-up popup, and sits last on the product, post
and categories page (last in the editor sidebar). Students earn XP for their progress; levels turn that XP into a title.
XP is recalculated on every page load from Kajabi's own progress data, so it always matches the
course and is never lost:

```
XP = completed lessons × xp_per_lesson
   + completed modules × xp_per_module
   + xp_course_complete once the course is 100%
   + xp of every unlocked badge          (block setting xp in jiffy_badges)
   + points of every completed bonus lesson (xp_bonus blocks, on top of the lesson XP)
```

A module is a top-level category with at least one post; posts in its subcategories count too.

Where students see it (each place has its own show/hide setting, see the other skills):
- **Product homepage** — `product_welcome.showprogress` = `"xp"`: a compact XP pill in the banner (instead of the percentage line) that links to the
  Rewards tab; hovering it shows the level, a bar and the XP to the next level. A total the student
  has not seen here yet counts up 0.5 s after the page has loaded; XP earned since the last visit
  (e.g. a badge unlocked by an automation) also floats "+X". **The level-up popup appears only
  here**: a level reached on the post page waits until the next visit to the product page (noted
  at completion). With a level-up the popup comes **first** and the pill keeps its old total; when
  it closes, XP icons fly from the level circle to the pill and the count starts.
- **Post page** — `post_actions.show_xp`: compact XP chip that links to the Rewards tab (icon only below 992px); "+XP" floats
  from it when a lesson is completed. `post_completion.show_xp`: a large "+XP" with the XP icon,
  a "You reached …" label on a new level and the XP to the next level in the completion popup (no
  total, no bar: those live on the chip). While the popup is open the chip keeps its old total;
  Cancel (or Esc, or a click beside the popup) lets XP icons fly from the "+XP" to the chip, which
  then counts up. Leaving with Next, the Dashboard button or the countdown carries the XP to the
  next page (sessionStorage, 2 minutes): there the icons fly in from the middle of the screen to the
  chip or pill. Unmarking the lesson takes its XP off at once (lesson, plus a module or course it
  completed, plus bonus points), counting down. The level-up popup follows on the product page.
- **Rewards tab** — `jiffy_categories_rewards.xp_overview` (show/hide; always first, above the badges) plus its `xp_*` texts and
  styling (categories skill): the full overview with
  XP, level, stats (lessons, modules, badges, bonus lessons), the level ladder and how to earn XP.

XP is not visible in the Kajabi mobile app or a branded app: those ignore the theme.

### Top of the editor (no group)
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `xp_enabled` | Use XP & Levels | pill_tabs | `"show"` (Yes), `"hide"` (No) | `"hide"` | Master switch. `"hide"` removes all XP markup and scripts from every page. |
| `xp_preview_levelup` | Preview level-up popup in editor | pill_tabs | `"show"`, `"hide"` | `"hide"` | Editor only, on the product and post page; opens and closes the popup as soon as the setting changes, showing the step from the previous level to the current one. |

### Points
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `xp_per_lesson` | XP per completed lesson | range | 0–100 | `"10"` | |
| `xp_per_module` | XP per completed module | range | 0–500 | `"50"` | |
| `xp_course_complete` | XP for completing the course | range | 0–1000 | `"200"` | |

### Animations
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `xp_animations` | Animations | pill_tabs | `"show"` (Yes), `"hide"` (No) | `"show"` | Every page remembers per session what the student last saw there (a page that has not shown the new total yet starts from the total before the last gain); when the total is higher, it counts up from that value (1.5 s, starting 0.5 s after the page has loaded) while the pill, chip or total throbs and shows the number in the accent colour, ends with a pulse, and the bar fills along; on a real gain the pill and chip also shed sparks. A refresh stays still. In the completion popup the gain, the total, the level and a bar count along. Always off for visitors with reduced motion. |

### Level-up
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `xp_levelup_title` | Level-up title | text | — | `"Level up!"` | |
| `xp_levelup_text` | Level-up text | text | — | `"You reached {level}"` | `{level}` = name of the new level. Also used in the completion popup. |
| `xp_levelup_button` | Level-up button | text | — | `"Keep going"` | Closes the popup. |

The popup shows on the product page only, also for a level reached on a post page (kept in localStorage until then; several level-ups merge into one popup). It opens with the box scaling in, the level icon bouncing in with a ring burst, then "Level 1 · Starter → Level 2 · Explorer" and the XP to the next level (`xp_next_text` / `xp_max_text`) fading in; confetti as set. With `xp_animations` off or reduced motion it simply appears.
| `xp_levelup_confetti` | Confetti on level-up | checkbox | `true` / `false` | `"true"` | |
| `xp_levelup_confetti_style` | Confetti style | select | `"cannon"`, `"fireworks"`, `"school"`, `"rain"`, `"stars"`, `"random"` (picks one of the five styles each time) | `"cannon"` | |
| `xp_levelup_confetti_color` | Confetti color | color | hex or `""` | `""` | Blank: primary color. |
| `box_background` | Popup background | color | hex or `""` | `""` | Blank: white. |
| `box_text_color` | Popup text color | color | hex or `""` | `""` | Blank: dark grey. |

### Texts
| Setting ID | Label | Default | Notes |
|---|---|---|---|
| `xp_label` | XP label | `"XP"` | Unit after every number. |
| `xp_level_label` | Level label | `"Level"` | "Level 3 · Achiever". |
| `xp_next_text` | Next level text | `"{points} XP to {level}"` | `{points}` = XP still needed, `{level}` = next level. |
| `xp_max_text` | Highest level text | `"Highest level reached"` | |
| `xp_base_level` | Start level name | `"Starter"` | The level every student begins in when the lowest Level block starts above 0 XP. |

### Styling
Two headers. The icon itself is a theme setting: `icon_xp` in Settings → Jiffy - Icons (see the preferences skill).

| Setting ID | Label | Type | Default | Notes |
|---|---|---|---|---|
| `xp_icon_color` | Icon color | color | `""` | Header "XP icon". The XP icon (banner pill without "Create pill" or with Button style Outline, action bar chip with Button fill None, completion popup, Rewards total, XP points overview) and the gain animations: floating "+XP", sparks, pulse ring, count-up number. On a filled pill or filled action bar button the icon follows the button text instead. Blank: primary color. |
| `bar_color` | Bar color | color | `""` | Header "Progress bar". The filled part of the bar (hover popover, completion popup, Rewards overview). Blank: primary color. Level icons without their own `icon_color`, and the level-up popup's icon circle and button, use this colour too. |
| `bar_gradient` | Bar gradient | select | `"none"` | `"none"` or `"linear"`. Fill only, always left to right (no angle setting). |
| `bar_gradient_color` | Bar gradient second color | color | `""` | Blank: a clearly lighter (dark bar, 50% white) or darker (light bar, 35% black) shade. Hidden while `bar_gradient` = none. |
| `bar_track_color` | Track color | color | `""` | The empty part of the bar, one flat colour. Blank: `#bbbbbb`. |


### Block: `xp_level` — "Level"
| Setting ID | Label | Type | Default | Notes |
|---|---|---|---|---|
| `name` | Level name | text | `"Starter"` | A new block is the 0 XP start level by default; add the next levels above it. |
| `min_xp` | XP needed | text | `"0"` | Whole number. Blocks are sorted by this value, not by their order. |
| `icon` | Icon | select | `"fas fa-star"` | `"fas fa-star"` (Star), `"fas fa-gem"`, `"fas fa-bolt"`, `"fas fa-medal"`, `"fas fa-trophy"`, `"fas fa-crown"`, `"fas fa-seedling"`, `"fas fa-compass"`, `"fas fa-rocket"`, `"fas fa-fire"`, `"fas fa-shield-alt"`, `"fas fa-heart"`, `"custom"`. |
| `icon_custom` | Custom icon | text | — | A Font Awesome class, e.g. `"fas fa-dragon"`; a full `<i class="…">` tag is accepted too. Only used with `icon` = `"custom"`. |
| `icon_color` | Icon color | color | `""` | Blank: the bar color (`bar_color`). Use per-level colours for a bronze/silver/gold feel. |

Without any Level block Nexus uses Starter 0 (seedling), Explorer 100 (compass), Achiever 300
(medal), Master 600 (crown) in the accent colour. **The first Level block replaces all four
defaults.** When the lowest block starts above 0 XP, Nexus puts a start level under it at 0 XP
(`xp_base_level`, default "Starter", seedling icon), so reaching the lowest block is a real
level-up; a block at `min_xp` `"0"` replaces that start level.

The level icon shows large in the level-up popup, before the level name in the completion popup,
in the Rewards ladder (levels not reached yet are dimmed) and in the Rewards head, and small in
the hover popover of the pill and the chip. On a level-up the icon shakes once (part of
`xp_animations`).

### Block: `xp_bonus` — "Bonus lessons"
| Setting ID | Label | Type | Default | Notes |
|---|---|---|---|---|
| `posts` | Post IDs | text | `""` | Comma-separated post IDs. |
| `points` | Bonus XP per post | range 0–500 | `"25"` | On top of the normal lesson XP. |

### Example: turn XP on with three levels
Read the section first and send every existing block ID plus the new ones in `block_order`.
```json
{"sections": {"jiffy_xp": {
  "settings": {"xp_enabled": "show"},
  "blocks": {
    "lvl1": {"type": "xp_level", "settings": {"name": "Starter", "min_xp": "0"}},
    "lvl2": {"type": "xp_level", "settings": {"name": "Explorer", "min_xp": "150"}},
    "lvl3": {"type": "xp_level", "settings": {"name": "Master", "min_xp": "500"}}
  },
  "block_order": ["lvl1", "lvl2", "lvl3"]
}}}
```

## Choosing level thresholds
In the theme editor, the **XP points** button in the Jiffy toolbar (next to Find IDs) shows what the
course is worth with the current settings: XP per module with a running total, the course bonus,
bonus lessons and badges, and for each level when it is reached. Thresholds at the running total
of a module end make a level feel like a chapter finished. Without the editor, estimate the
maximum as lessons × `xp_per_lesson` + modules × `xp_per_module` + `xp_course_complete` + badge XP
+ bonus XP, and keep the highest level at or below it.

## Pitfalls
- Off by default: nothing shows until `xp_enabled` = `"show"`.
- A Kajabi quiz completes the lesson even with a failing score, so it earns lesson XP too.
- A module with 0 posts earns nothing; a locked or scheduled module can only be completed once released.
- Unmarking a lesson lowers the XP again; replaying a completed lesson earns nothing.
- Bonus lessons and post-triggered badges are read from the sidebar outline cache. On a fresh session
  they can take a few seconds to count; the last total the student saw is shown meanwhile.
- `min_xp` above the course maximum makes that level unreachable; the XP points overview flags it.
- Badge XP is set per badge in `jiffy_badges` (`xp`), not here.
