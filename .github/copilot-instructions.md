# jiffy-skills

Public home of the Kajabi MCP skills for the Jiffy themes. Claude fetches these files through
GitHub raw while it works on a customer's Kajabi site.

## This repo is a publish target only

**Never edit skill files here by hand.** Each skill is written in its theme repo and copied here
by that repo's publish script, which commits but does not push:

| Theme | Source | Publish script | Published to |
|---|---|---|---|
| Nexus | `../nexus/ai-skills/` (1.4), `ai-skills-evolution/` (1.2), `ai-skills-core/` (1.1) | `../nexus/sh/publish-ai-skills.sh [main\|evolution\|core]` | `nexus-skills/v1.x/` |
| UpCourse | `../UpCourse/ai-skills/` | `../UpCourse/publish-ai-skills.sh` | `upcourse-skills/v1.x/` |

Publishing is the last step of a release, after the version bump. Bastiaan pushes this repo
himself.

## How Claude finds a skill

Every section schema of the theme ends with the hidden settings `ai_guide_lock` + `ai_guide`. The
Kajabi MCP returns their defaults in `_defaults`; the `ai_guide` text links to the skill for the
installed version line:

```
https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/{theme}-skills/v{line}/{theme}-skill.md
```

The URL is fixed per version line (`v1.3`, `v1.4`, …); only the content behind it changes. A new
version line that changes settings gets its own folder, so pages on an older version keep reading
the skill that matches their code.

UpCourse pages can also carry an **AI brief** (`blog_info` → `ai_brief`): template-specific
instructions stored in the page content, next to ✏️ placeholder texts in its blocks. The skill
stays general; the brief and placeholders travel with the template.

## Fetching: one file, or route eagerly

The fetch tool reliably follows a link only when it is fetched in the same turn as the document
containing it; a link fetched after an intervening user turn has been observed to fail. So:

- Prefer one skill file per theme (UpCourse).
- When a theme needs sub-skills (Nexus), the pointer names the main skill and the sub-skill
  together, and the main skill routes eagerly — fetch everything the task needs before asking the
  user anything.

## Unversioned files

`upcourse-skills/upcourse-skill.md` is a redirect to `v1.3/` for anyone still using the old
customer prompt. Do not add new unversioned skill files.
