# Nexus — Master Skill File

**Template:** Nexus by Jiffy Courses (Bastiaan de Koning)
**Type:** Kajabi product theme (product, post, category, categories pages)

Nexus is a licensed Kajabi theme built by JiffyCoursesOnline. It is not a landing page template, but a course template.
It uses Kajabi's native product/post/category page types for courses  with a custom theme on top.
This means settings are written to the theme globally, not per individual page.

If you find options in the skill file that cannot be found in the template you are working on, you cannot use them. They might not have been rolled out. 

---

## How to use this skill set

This file is the entry point. Do not write anything before completing these
steps:

1. Determine the site. Call `list_sites`. If the account has more than one site,
   present the list and ask the user which one to use. Wait for the answer.

2. Determine the course product they want to update. Nexus is tied to a specific
   Kajabi product — it cannot function outside of one. If no product is
   identified, stop and ask.

3. Verify the Nexus theme is active on that product. If it is not assigned, the
   template will not work and MCP writes will have no visible effect. You cannot
   assign the theme yourself — tell the user to do this in Kajabi admin and stop.

4. If unclear, ask the user what they want to configure on this course template. Use this exact list:

   - **Product homepage** — the main product page (welcome, sections, collections)
   - **Post / lesson page** — video, body, completion, paywall
   - **Category page** — single category view with progress bar
   - **Categories overview** — library overview with favorites, rewards, downloads tabs
   - **Badges** — badge definitions and display (global, shown on product and post page)
   - **Sidebar** — the course outline shown on all pages
   - **Header** — logo, colors, breadcrumbs (applies to all pages)
   - **Preferences** — global theme settings (fonts, colors, license key, feature toggles)

5. Based on the answer, fetch the required skill files from GitHub before doing
   anything else. See the routing table below.

6. Read all fetched skill files in full. Then follow the instructions in each.

If any file cannot be fetched, STOP and tell the user. Do not continue from
what you think you know about Nexus.

---

## Routing table

| Task | Fetch these skill files |
|---|---|
| Product homepage | nexus-product-skill.md + nexus-header-skill.md + nexus-sidebar-skill.md |
| Post / lesson page | nexus-post-skill.md + nexus-header-skill.md + nexus-sidebar-skill.md |
| Category page | nexus-category-skill.md + nexus-header-skill.md + nexus-sidebar-skill.md |
| Categories overview | nexus-categories-skill.md + nexus-header-skill.md + nexus-sidebar-skill.md |
| Badges | nexus-badges-skill.md |
| Sidebar only | nexus-sidebar-skill.md |
| Header only | nexus-header-skill.md |
| Preferences | nexus-preferences-skill.md |

For tasks that combine multiple areas (e.g. "set up the full product"), fetch
all relevant files before starting.

---

## GitHub raw URLs

- [nexus-badges-skill.md](https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/nexus-badges-skill.md)
- [nexus-sidebar-skill.md](https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/nexus-sidebar-skill.md)
- [nexus-header-skill.md](https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/nexus-header-skill.md)
- [nexus-preferences-skill.md](https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/nexus-preferences-skill.md)
- [nexus-product-skill.md](https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/nexus-product-skill.md)
- [nexus-post-skill.md](https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/nexus-post-skill.md)
- [nexus-category-skill.md](https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/nexus-category-skill.md)
- [nexus-categories-skill.md](https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/nexus-skills/nexus-categories-skill.md)

---

## Key facts about Nexus and the Kajabi MCP

- Nexus uses `{% section %}` tags in each template. Sections are global —
  changing a section setting affects every page that uses that section.
- There is no draft layer on themes. Every write is immediately live.
- `{"updated": true}` means the payload was accepted, not that it renders
  correctly. Always call `get_theme_content` after a write to confirm.
- Send only the keys you are changing in `update_theme_content`. Everything
  omitted is preserved.
- The sidebar section is named `product_outline` in the Kajabi theme.
- The header section is named `header` in the Kajabi theme.
