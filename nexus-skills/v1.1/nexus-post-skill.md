# Nexus — Post Skill

> **Before any write:** if you have not fetched the main skill [`nexus-skill.md`](https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/v1.1/nexus-skill.md) in this
> conversation, fetch it now. It holds the payload shapes, value formats and working rules
> (send only changed keys, read back after every write), which this file does not repeat.

The post (lesson) page renders, in order: `header`, `product_outline`, `post_actions`, `jiffy_post_media`, `jiffy_post_body`, a hidden downloads dropdown and a hidden badges area (both moved directly under the action bar), `jiffy_post_confetti`, `post_completion`, `post_paywall`. All are global: one setting applies to every lesson. `post_paywall` also renders on the live session page. Header, sidebar and badges have their own sub-skills.

## Section: `post_actions` — "Post - Action Bar"
Button bar under the header. No blocks. Below 992px every button shows its icon only and the duration is hidden.

### Top level (no group)
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `icon_alignment_desktop` | Position desktop | pill_tabs | `"left"` (Left), `"center"` (Center), `"right"` (Right) | `"center"` | Button alignment from 992px. |
| `icon_alignment_mobile` | Position mobile | pill_tabs | `"center"` (Center), `"between"` (Space between) | `"center"` | Below 992px. |
| `show_home` | Home | pill_tabs | `"show"` (Show), `"hide"` (Hide) | `"show"` | Links to the product homepage. |
| `show_duration` | Duration | pill_tabs | `"show"`, `"hide"` | `"show"` | Video lessons only; hidden on mobile. |
| `show_badges` | Badges | pill_tabs | `"show"`, `"hide"` | `"show"` | The Badges button opens the badges area (see Pitfalls). |
| `show_lesson_completion` | Lesson Completion | pill_tabs | `"show"`, `"hide"` | `"show"` | The "Mark as complete" toggle. |
| `show_favorite` | Favorite | pill_tabs | `"show"`, `"hide"` | `"show"` | Favorite toggle; favorited lessons appear on the Favorites tab. |
| `show_pagination` | Prev/Next | pill_tabs | `"show"`, `"hide"` | `"show"` | Each button only renders when a previous/next post exists. |
| `sticky_action_bar` | Make action bar sticky | pill_tabs | `"yes"` (Yes), `"no"` (No) | `"no"` | Sticks under the header while scrolling. |

There is no visibility setting for Downloads: the button renders automatically when the lesson has downloads and opens a slide-down list.

### Button Texts
Blank text = icon only.
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `prev` | Previous button | text | — | `"Prev"` | |
| `next` | Next button | text | — | `"Next"` | |
| `home` | Home button | text | — | `"Home"` | |
| `downloads` | Download button | text | — | `"Downloads"` | |
| `badges` | Badges button | text | — | `"Badges"` | Hidden when `show_badges` = `"hide"`. |
| `complete` | Complete button | text | — | `"Complete Lesson"` | Shown while the lesson is not completed. Hidden when `show_lesson_completion` = `"hide"`. |
| `completed` | Completed button | text | — | `"Lesson Completed"` | Shown once completed. Hidden when `show_lesson_completion` = `"hide"`. |
| `favorite` | Favorite button | text | — | `"Favorite"` | Hidden when `show_favorite` = `"hide"`. |

### Action Bar Styling
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `icon_font_size` | Font size | range | 10–32 px | `"14"` | Button text and icon size. |
| `background_color` | Background color | color | hex or blank | `""` | Blank = theme setting `text_area_background`. |
| `text_color` | Text color | color | hex or blank | — | Also the button border and the fill of active buttons (completed, favorited, open). Blank = `text_light`/`text_dark`, picked by background brightness. |
| `hover_color` | Hover color | color | hex or blank | — | Button hover background. Blank = background mixed 50% with black (light bar) or white (dark bar). |
| `show_shadow` | Show shadow | checkbox | — | `false` | |

### Downloads Styling
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `dl_background_color` | Background color | color | hex or blank | — | Downloads dropdown. Blank = action bar background. |
| `dl_text_color` | Text color | color | hex or blank | — | Blank = `text_light`/`text_dark` by dropdown background. |
| `dl_shadow` | Show shadow | checkbox | — | `false` | |

### Badge Area Styling
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `ba_background_color` | Background color | color | hex or blank | — | Badges area under the bar. Overrides the `jiffy_badges` section background on this page. Blank = action bar background. |
| `ba_text_color` | Text color | color | hex or blank | — | Overrides badge text/label colours here. Blank = `text_light`/`text_dark` by area background. |
| `ba_shadow` | Show shadow | checkbox | — | `false` | |

## Section: `jiffy_post_media` — "Post - Media section"
The lesson media: quiz, live session, audio or video (first one present). No blocks.

### Top level (no group)
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `kgvideo_width` | Media width | grid | 1–12 columns | `"8"` | Centered; full width below 768px. |
| `showthumbnail` | Show Thumbnail in Text-only Lessons | checkbox | — | `"false"` | Shows the post's poster image when the lesson has no quiz, live session, audio or video. |
| `quizwidth` | Quiz width | grid | 1–12 columns | `"9"` | Width of the fullscreen quiz modal; `12` = edge to edge. |
| `quizfailedtext` | Hide the line: You failed the quiz. | checkbox | — | `false` | |
| `quiztext` | Hide the word 'Quiz' | checkbox | — | `false` | |
| `quizendbtn` | Hide the redo quiz button | checkbox | — | `false` | |
| `quiztextcolor` | Quiz text color | color | hex or blank | `"#000"` | Blank = Kajabi's quiz styling. |
| `quizheadingbg` | Quiz heading background | color | hex or blank | `"#eee"` | Same. |
| `quizbg` | Quiz background | color | hex or blank | `"#ebe8e2"` | Same. |
| `quizcardbg` | Quiz card background | color | hex or blank | `"#fff"` | Same. |

The video/audio player colour is the theme's `primary_color`, not a section setting.

### Desktop Layout
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `margin_desktop` | Desktop section spacing (outside) | spacer | px | placeholder 10/10/10/10 | Only `top` and `bottom` are used; left/right are ignored. Blank side = 10. From 768px. |

### Mobile Layout
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `margin_mobile` | Mobile section spacing (outside) | spacer | px | placeholder 10/10/10/10 | All four sides, below 768px. Blank side = 10. |

## Section: `jiffy_post_body` — "Post - Body section"
Lesson text, live-session recording and comments. No blocks.

### Top level (no group)
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `kgpost_width` | Post body width | grid | 1–12 columns | `"8"` | Centered; full width below 768px. |
| `show_post_comments` | Show comments | pill_tabs | `"show"` (Show), `"hide"` (Hide) | `"show"` | Comments also stay hidden when Kajabi has comments off for the post. |

### Desktop Layout / Mobile Layout
`margin_desktop` and `margin_mobile` — identical to `jiffy_post_media` (desktop top/bottom only, blank side = 10).

## Section: `jiffy_post_confetti` — "Jiffy - Confetti"
Confetti on lesson completion. No blocks.

### Top level (no group)
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `confetti_lessoncompleted` | Add instant confetti when a post is completed | checkbox | — | `"false"` | Fires on `nexus:lesson-completed` and at the end of an audio lesson (see Completion events). |
| `editconfetti` | Test confetti | checkbox | — | `"false"` | Plays the confetti on every load inside the Kajabi editor only. Turn off when done. |
| `lessonconfettistyle` | Confetti style | select | `"cannon"` (Confetti Cannon), `"fireworks"` (Fireworks), `"school"` (School Parade), `"rain"` (Rain), `"stars"` (Stars) | `"cannon"` | |
| `confetti_action_color` | Confetti color | color | hex or blank | `""` | Blank = theme `primary_color`. |

## Section: `post_completion` — "Jiffy - Completion Message"
Popup after a lesson is completed. One popup for every lesson, set by the section settings. No blocks: per-lesson (individual) popups do not exist in 1.1.

### Top level (no group)
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `show-popup` | Use a completion popup | pill_tabs | `"show"` (Yes), `"hide"` (No) | `"show"` | `"hide"` turns the popup off. Confetti is not affected. |

### General popup
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `show-edit` | Edit popup completion | pill_tabs | `"true"` (Edit), `"false"` (Hide) | `"false"` | `"true"` keeps the default popup open in the Kajabi editor. Editor only; set back to `"false"` when done. |
| `show-avatar` | Show avatar (Refresh page after update) | checkbox | — | `"true"` | Student's avatar inside a ring showing course completion %. |
| `message_text` | Title | text | — | `"Nice Work,"` | Followed by the student's first name. |
| `lesson_text` | Lesson text | rich_text | — | `"You just completed the lesson:"` | Followed directly by the lesson title. |
| `cta-action` | Button action | select | `"video"` (Next Video), `"dashboard"` (Course Home) | `"video"` | `"video"`: no button on the last lesson. |
| `next_text` | Next text | text | — | `"Go to Next Lesson"` | Hidden when `cta-action` = `"dashboard"`. |
| `cancel_text` | Cancel text | text | — | `"Cancel"` | Closes the popup (as do Esc and a click on the overlay). |
| `return_text` | Course home text | text | — | `"Home"` | Hidden when `cta-action` = `"video"`. |
| `auto_advance` | Auto advance to next lesson | checkbox | — | `"false"` | Shows the next lesson card and goes there after an 8 s countdown (fixed). Needs a next post; Cancel stops it. |
| `starts_text` | Next video | text | — | `"Next Lesson Starts In"` | Hidden when `auto_advance` = false. |
| `seconds_text` | Seconds text | text | — | `"Seconds"` | Hidden when `auto_advance` = false. |
| `overlay_background` | Overlay background | color | colour or blank | `"rgba(220, 202, 184, 0.2)"` | Over a 20px blur. Blank = blur only. |
| `box_background` | Box background | color | hex | `"#ffffff"` | Blank = stylesheet default. |
| `text_color` | Text color | color | hex | `"#000000"` | Blank = stylesheet default. |
| `button_color` | Button background color | color | hex | `"#000000"` | Blank = `#000000`. Hover is 10% darker. |
| `button_text_color` | Button text color | color | hex | `"#ffffff"` | Blank = `#ffffff`. |
| `box_padding` | Box padding | spacer | px | placeholder 40/40/10/40 | Blank side = 40/40/10/40 (top/right/bottom/left). |

## Completion events
- The popup and confetti fire on `nexus:lesson-completed`, sent once per page by: a real student click on "Mark as complete" while the lesson is not yet completed (Kajabi's own auto-complete at ~90% of a video does not count), or the end of the video (unless the student already completed it with the button on this page). Fullscreen is exited first.
- At the end of an audio lesson, confetti fires and the popup fades in (no countdown).
- With `show_lesson_completion` = `"hide"` only the video/audio end can trigger them; text-only lessons never do.
- Every lesson gets the same popup; there is no per-lesson popup.

## Section: `post_paywall` — "Paywall"
Modal over the lesson when Kajabi shows the post as paywalled (paywall enabled in the course settings). Also on the live session page. Content comes from blocks, rendered in `block_order`; the purchase button sits below them.

### Top level (no group)
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `edit_paywall_modal` | Edit paywall modal | checkbox | — | `"false"` | Shows the modal in the Kajabi editor only. Turn off when done. |

### Purchase CTA
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `show_purchase_cta` | Show purchase CTA | checkbox | — | `"true"` | Opens Kajabi's checkout popup for the paywall offer. |
| `purchase_cta_text` | Purchase CTA text | text | — | `"Purchase"` | |
| `btn_background_color` | Button background color | color | hex or blank | `""` | Blank = theme `primary_color`. Outline/subtle use it as text/border colour. |
| `btn_text_color` | Button text color | color | hex or blank | `""` | Solid only. Blank = `text_light`/`text_dark` by button colour. |
| `btn_width` | Button width | pill_tabs | `"full"` (Full), `"auto"` (Auto) | `"full"` | |
| `btn_style` | Button style | pill_tabs | `"solid"` (Solid), `"outline"` (Outline), `"subtle"` (Subtle) | `"solid"` | Subtle = text only, transparent background and border. |
| `btn_size` | Button size | pill_tabs | `"small"` (sm), `"medium"` (md), `"large"` (lg) | `"medium"` | 14/16/18 px text. |
| `btn_alignment` | Button alignment | align | `"left"`, `"center"`, `"right"` | `"center"` | Visible with `btn_width` = `"auto"`. |
| `btn_border_radius` | Button border radius | range | 0–100 px | `"4"` | |

### Background
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `background_color` | Background color | color | hex or blank | `""` | Modal background. Blank = theme `text_area_background`, else `#ffffff`. |
| `text_color` | Text color | color | hex or blank | `""` | Text, headings and close icon. Blank = `text_light`/`text_dark` by background. |
| `border_type` | Border type | select | `"none"` (None), `"solid"`, `"dotted"`, `"dashed"`, `"double"`, `"ridge"` | `"none"` | |
| `border_width` | Border width | range | 0–50 px | `"1"` | Needs `border_type` ≠ `"none"`. |
| `border_color` | Border color | color | hex or blank | `"#ccc"` | Blank = `#ccc`. |
| `border_radius` | Border radius | range | 0–100 px | `"10"` | Modal corners. |
| `overlay_background` | Overlay background color | color | colour or blank | `""` | Behind the modal. Blank = Kajabi default. |

### Block: `paywall_text` — "Text"
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `content` | Content | rich_text | HTML | "Upgrade to unlock" heading, intro and 3 value props | |
| `alignment` | Text alignment | align | `"left"`, `"center"`, `"right"` | `"left"` | |
| `margin` | Outside spacing | spacer | **rem** | placeholder 1/0/1/0 | Blank side = 0 rem. |

### Block: `paywall_video` — "Video"
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `autoplay` | Autoplay | checkbox | — | `"false"` | |
| `video` | Video | video | Kajabi video | — | Player colour = theme `accent_color`. |
| `image` | Image | image_picker | — | — | Poster image; suggested 1856 × 1044. |
| `margin` | Outside spacing | spacer | **rem** | placeholder 1/0/1/0 | Blank side = 0 rem. |

### Block: `paywall_image` — "Image"
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `image` | Image | image_picker | — | — | Suggested 1856 × 1044. |
| `image_action` | Image action | action | URL | `""` | Empty = image is not a link. |
| `link_target` | Open in new window | checkbox | — | `"false"` | |
| `alignment` | Text alignment | align | `"left"`, `"center"`, `"right"` | `"center"` | Aligns the image. |
| `margin` | Outside spacing | spacer | **rem** | placeholder 1/0/1/0 | Blank side = 0 rem. |

### Block: `cta_block` — "Call to Action"
Extra button inside the modal, separate from the purchase button.
| Setting ID | Label | Type | Values / range | Default | Notes |
|---|---|---|---|---|---|
| `btn_text` | Text | text | — | `"Call To Action"` | |
| `btn_action` | Button action | action | URL | `""` | |
| `btn_new_tab` | Open in new tab | checkbox | — | `""` | `true` opens in a new tab. |
| `btn_background_color` | Button background color | color | hex or blank | `""` | Blank = theme `primary_color`. |
| `btn_text_color` | Button text color | color | hex or blank | `""` | Solid only. Blank = `text_light`/`text_dark` by button colour. |
| `btn_width` | Button width | pill_tabs | `"full"` (Full), `"auto"` (Auto) | `"full"` | |
| `btn_style` | Button style | pill_tabs | `"solid"`, `"outline"`, `"subtle"` | `"solid"` | Subtle = text only. |
| `btn_size` | Button size | pill_tabs | `"small"` (sm), `"medium"` (md), `"large"` (lg) | `"medium"` | |
| `btn_alignment` | Button alignment | align | `"left"`, `"center"`, `"right"` | `"center"` | Visible with `btn_width` = `"auto"`. |

## Pitfalls
- **Badges sit in a hidden slide-down** under the action bar, opened only by the Badges button. With `show_badges` = `"hide"` students cannot reach the badges on the post page. Badge content and unlock rules are in the badges skill; only the area colours (`ba_*`) live here.
- **Edit/test toggles** (`show-edit`, `editconfetti`, `edit_paywall_modal`) only affect the Kajabi editor, but leave them off after a preview so the editor stays usable.
- `show-edit` is a pill with string values: write `"true"`/`"false"`, not booleans.
- `lessonconfettistyle` "School Parade" is `"school"`.
- Auto-advance does nothing on the last lesson. The 8 s timer cannot be changed.
- A different popup per lesson is not possible in 1.1: the section has no blocks. Do not add `gamify_post_completion_individual` blocks.
- `margin_desktop` left/right have no effect; to narrow content use `kgvideo_width` / `kgpost_width`.
- Paywall block margins are **rem**, not px: `"1"` = 16px. Blank = 0, not the 1/0/1/0 placeholder.
- The paywall only appears when the course has a paywall enabled in Kajabi; no theme setting turns it on for students.
- Quiz checkboxes are compared with `== true`: write boolean `true`, not `"true"`.
