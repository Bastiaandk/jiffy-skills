# Nexus — Post (Lesson) Page Skill File

**Template:** `post.liquid`
**Also load:** nexus-header-skill.md, nexus-sidebar-skill.md

The post page is the lesson/video page. Section settings on this page are global
— changes apply to all lessons in the course.

---

## MCP rules for this page

- All section settings are at `settings.sections.{section_name}.settings`
- Blocks live at `settings.sections.{section_name}.blocks`
- `block_order` is load-bearing — always include it when adding or removing blocks
- `{"updated": true}` does not mean the change rendered. Always call `get_theme_content` after writing.
- Use `section_filter: "{section_name}"` to read one section at a time.

---

## Sections on this page

| Section | Purpose |
|---|---|
| `post_actions` | Action bar: prev/next, complete, favorites, downloads, badges |
| `jiffy_post_media` | Video/media area with width control |
| `jiffy_post_body` | Post body text, width control, comments |
| `jiffy_post_confetti` | Instant confetti when a lesson is completed |
| `post_completion` | Completion popup shown after marking a lesson complete |
| `post_paywall` | Paywall modal shown on locked lessons |
| `jiffy_badges` | Badge display area — see section below |
| `header` | See nexus-header-skill.md |
| `product_outline` | See nexus-sidebar-skill.md |

---

## Section: `post_actions`

Action bar shown at the top of every lesson page.

### Visibility & layout

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `show_home` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `show_duration` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `show_badges` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `show_lesson_completion` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `show_pagination` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `sticky_action_bar` | pill_tabs | `"yes"` / `"no"` | `"no"` |
| `icon_alignment_desktop` | pill_tabs | `"left"` / `"center"` / `"right"` | `"center"` |
| `icon_alignment_mobile` | pill_tabs | `"center"` / `"between"` | `"center"` |

### Button labels

| Setting ID | Type | Default | Condition |
|---|---|---|---|
| `prev` | text | `"Prev"` | |
| `next` | text | `"Next"` | |
| `home` | text | `"Home"` | |
| `downloads` | text | `"Downloads"` | |
| `badges` | text | `"Badges"` | hidden when `show_badges` is `"hide"` |
| `complete` | text | `"Complete Lesson"` | hidden when `show_lesson_completion` is `"hide"` |
| `completed` | text | `"Lesson Completed"` | hidden when `show_lesson_completion` is `"hide"` |
| `favorite` | text | `"Favorite"` | |

### Action bar styling

| Setting ID | Type | Default |
|---|---|---|
| `icon_font_size` | range | `14` |
| `background_color` | color | `""` |
| `text_color` | color | `""` |
| `hover_color` | color | `""` |
| `show_shadow` | checkbox | `false` |

### Downloads dropdown styling

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `dl_background_color` | color | `""` | Leave blank to use action bar colors |
| `dl_text_color` | color | `""` | |
| `dl_shadow` | checkbox | `false` | |

### Badge area styling

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `ba_background_color` | color | `""` | Overrides jiffy_badges section settings. Leave blank to use action bar colors |
| `ba_text_color` | color | `""` | |
| `ba_shadow` | checkbox | `false` | |

---

## Section: `jiffy_post_media`

Controls the video/media area layout.

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `kgvideo_width` | grid | `8` | Column width 1–12 |
| `showthumbnail` | checkbox | `false` | Show thumbnail in text-only lessons |
| `quizwidth` | grid | `9` | Quiz column width |
| `quizfailedtext` | checkbox | `false` | Hide "You failed the quiz." |
| `quiztext` | checkbox | `false` | Hide the word "Quiz" |
| `quizendbtn` | checkbox | `false` | Hide redo quiz button |
| `quiztextcolor` | color | `"#000"` | |
| `quizheadingbg` | color | `"#eee"` | |
| `quizbg` | color | `"#ebe8e2"` | |
| `quizcardbg` | color | `"#fff"` | |
| `margin_desktop` | spacer | — | Outside spacing |
| `margin_mobile` | spacer | — | Outside spacing |

---

## Section: `jiffy_post_body`

Controls the post body text area.

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `kgpost_width` | grid | — | `8` |
| `show_post_comments` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `margin_desktop` | spacer | — | — |
| `margin_mobile` | spacer | — | — |

---

## Section: `jiffy_post_confetti`

Instant confetti animation triggered when a lesson is marked complete.
No blocks — single settings only.

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `confetti_lessoncompleted` | checkbox | — | `false` |
| `lessonconfettistyle` | select | `"cannon"` / `"fireworks"` / `"school"` / `"rain"` / `"stars"` | `"cannon"` — ⚠️ **not** `"school_parade"` despite the "School Parade" label |
| `confetti_action_color` | color | — | `""` |
| `editconfetti` | checkbox | — | `false` (test mode) |

---

## Section: `post_completion`

Popup shown after a member marks a lesson complete.

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `show-popup` | pill_tabs | `"show"` / `"hide"` | `"show"` |
| `show-edit` | pill_tabs | `"true"` / `"false"` | `"false"` (edit mode) |
| `show-avatar` | checkbox | — | `true` |
| `message_text` | text | — | `"Nice Work,"` |
| `lesson_text` | rich_text | — | `"You just completed the lesson:"` |
| `cta-action` | select | `"video"` / `"dashboard"` | `"video"` |
| `next_text` | text | — | `"Go to Next Lesson"` |
| `cancel_text` | text | — | `"Cancel"` |
| `return_text` | text | — | `"Home"` |
| `auto_advance` | checkbox | — | `false` |
| `starts_text` | text | — | `"Next Lesson Starts In"` |
| `seconds_text` | text | — | `"Seconds"` |
| `overlay_background` | color | — | `"rgba(220, 202, 184, 0.2)"` |
| `box_background` | color | — | `"#ffffff"` |
| `text_color` | color | — | `"#000000"` |
| `button_color` | color | — | `"#000000"` — button background |
| `button_text_color` | color | — | `"#ffffff"` |
| `box_padding` | spacer | — | 40/40/10/40 |

The settings above are the default popup shown for every lesson. A block on
this section can override the popup for specific lessons instead:

### Block type: `gamify_post_completion_individual` — "Individual Popup"

Overrides the default completion popup for one or more specific lessons.

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `show-edit-block` | pill_tabs | `"hide"` | `"show"` / `"hide"` — edit mode preview |
| `lesson_id` | text | `""` | Comma-separated post IDs this override applies to |
| `image` | image_picker | — | |
| `image_size` | range | `"200"` | 50–400 |
| `title` | text | `"Congratulations!"` | |
| `message` | rich_text | `"You've completed this lesson!"` | |
| `button_text` | text | `"Continue"` | |
| `button_action_type` | select | `"url"` | `"next"` (next lesson) / `"home"` (course home) / `"url"` (custom) |
| `button_action` | action | — | The URL. Shown only when `button_action_type` is `"url"` |
| `link_target` | checkbox | `"false"` | Open in new tab. Shown only when `button_action_type` is `"url"` |
| `cancel_text` | text | `"Cancel"` | |
| `overlay_background` | color | `"rgba(220, 202, 184, 0.2)"` | |
| `box_background` | color | `"#ffffff"` | |
| `text_color` | color | `"#000000"` | |
| `button_color` | color | `"#000000"` | Button background |
| `button_text_color` | color | `"#ffffff"` | |
| `box_padding` | spacer | 40/40/10/40 | |

---

## Section: `post_paywall`

Modal overlay shown on lessons locked behind an offer.

| Setting ID | Type | Options | Default |
|---|---|---|---|
| `edit_paywall_modal` | checkbox | — | `false` (edit mode) |
| `show_purchase_cta` | checkbox | — | `true` |
| `purchase_cta_text` | text | — | `"Purchase"` |
| `btn_background_color` | color | — | `""` |
| `btn_text_color` | color | — | `""` |
| `btn_width` | pill_tabs | `"full"` / `"auto"` | `"full"` |
| `btn_style` | pill_tabs | `"solid"` / `"outline"` / `"subtle"` | `"solid"` |
| `btn_size` | pill_tabs | `"small"` / `"medium"` / `"large"` | `"medium"` |
| `btn_alignment` | align | — | `"center"` |
| `btn_border_radius` | range | — | `4` |
| `background_color` | color | — | `""` |
| `text_color` | color | — | `""` |
| `overlay_background` | color | — | — |
| `border_color` | color | — | — |
| `border_radius` | range | — | — |
| `border_type` | select | `"none"` / `"solid"` / `"dotted"` / `"dashed"` / `"double"` / `"ridge"` | — |
| `border_width` | range | — | — |

The settings above only style the purchase button and modal wrapper — the
message shown inside it is built from blocks. Four block types are
available, used in any combination and order:

### Block type: `paywall_text` — "Text"

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `content` | rich_text | `"<h2 style=\"text-align: center;\">Upgrade to unlock</h2>..."` | |
| `alignment` | align | `"left"` | |
| `margin` | spacer | 1/0/1/0 | |

### Block type: `paywall_video` — "Video"

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `autoplay` | checkbox | `"false"` | |
| `video` | video picker | — | |
| `image` | image_picker | — | Suggested 1856×1044 |
| `margin` | spacer | 1/0/1/0 | |

### Block type: `paywall_image` — "Image"

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `image` | image_picker | — | 2300×2300, suggested 1856×1044 |
| `image_action` | action | `""` | |
| `link_target` | checkbox | `"false"` | Open in new window |
| `alignment` | align | `"center"` | |
| `margin` | spacer | 1/0/1/0 | |

### Block type: `cta_block` — "Call to Action"

| Setting ID | Type | Default | Notes |
|---|---|---|---|
| `btn_text` | text | `"Call To Action"` | |
| `btn_action` | action | `""` | |
| `btn_new_tab` | checkbox | `""` | |
| `btn_background_color` | color | — | |
| `btn_text_color` | color | — | Solid buttons only |
| `btn_width` | pill_tabs | `"full"` | `"full"` / `"auto"` |
| `btn_style` | pill_tabs | `"solid"` | `"solid"` / `"outline"` / `"subtle"` |
| `btn_size` | pill_tabs | `"medium"` | `"small"` / `"medium"` / `"large"` |
| `btn_alignment` | align | `"center"` | |

---

## Section: `jiffy_badges`

Badge display area shown on the lesson page (below action bar).
Badges are global — see **nexus-badges-skill.md** for the full section settings and block schema.
