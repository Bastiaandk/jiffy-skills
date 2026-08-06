# jiffy-skills

This repo contains Kajabi MCP skill sets — one set of files per Kajabi page template.
Each set teaches an AI agent how to work with that template, including filling it
from a customer's transcript where applicable.

## File convention

Every template uses two files, named `{template}-*.md`:

| File | Purpose |
|------|---------|
| `{template}-customer-prompt.md` | What the customer pastes into their AI chat to start the workflow. It fetches `{template}-skill.md` from GitHub raw and then halts for input. |
| `{template}-skill.md` | The entry point and only file the agent needs after that: domain knowledge (template structure, MCP payload rules, block conventions, gotchas) plus a "Procedures" section holding any task-specific workflows (e.g. filling a lesson from a transcript). |

Keep everything in one skill file per template rather than splitting procedures
into separate files. A skill file is only fetched once, right after the customer
prompt; a procedure fetched from a link *inside* that file, later in the
conversation (e.g. after asking the user a routing question), has been observed
to fail intermittently — the fetch tool seems to only reliably follow a link
that is fetched in the same turn as the document containing it. Keeping
everything in one file sidesteps this entirely.

The skill file is the schema definition of the custom template. The Kajabi MCP has no built-in knowledge of custom theme blocks — it can only read and write what it is told. The skill file is the only source that tells the AI which blocks exist in the template, what their settings are, and when to hide them. Without it, the AI would have to guess the block structure and would silently produce wrong output. Its "Procedures" section tells the AI *what to do* for a given task; the rest of the file tells it *what the template is*.

If a template genuinely needs more content than fits comfortably in one file
(e.g. many largely-independent sub-areas, each only relevant to a fraction of
tasks — see `nexus-skills/`), splitting is acceptable, but route to those
files eagerly (fetch everything the task will need before asking the user
anything else) or refetch the linking document immediately before fetching
each linked file, in the same turn — never fetch a linked file only after an
intervening user turn.

## Ground truth: the theme source repos

The skill files are written by hand and can be incomplete — e.g. a block's
schema had ~35 settings across five groups (video, image, text, CTA,
background) but was documented with only 8. Don't take a skill file's
description of a block or section on faith when writing new content, fixing
a gap, or something a customer reports doesn't match what you'd expect.

The actual Liquid theme source lives in sibling repos, one directory above
this repo:

| Template | Path |
|---|---|
| Nexus | `../nexus/` |
| UpCourse | `../UpCourse/` |

Each block and section's real settings are defined in a `{% schema %}` block
inside `sections/*.liquid` (and `snippets/*.liquid` for shared block
definitions). Grep there for the block or section type (e.g. `gamify_card`,
`product_section_top`) to get the authoritative field list — ID, type,
default, and any `hide_if` conditions — before updating a skill file. These
repos are not deployed anywhere from here; they're read-only reference for
writing accurate skill content.

## GitHub raw URL pattern

The customer prompt always fetches the skill file using:
```
https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/{template}-skills/{template}-skill.md
```

When creating a new template set, update the filename in the customer prompt accordingly.

## Adding a new template

To add a template called `{template}`, create these two files:

1. **`{template}-skills/{template}-customer-prompt.md`** — Copy the structure of `upcourse-skills/upcourse-customer-prompt.md`. Update the raw GitHub URL and the `Site:` instruction if needed.
2. **`{template}-skills/{template}-skill.md`** — Document the template's Liquid structure, section/block layout, MCP payload rules, and any gotchas, plus a "Procedures" section for task-specific workflows (e.g. filling from a transcript). Follow the same heading structure as `upcourse-skills/upcourse-skill.md`.

Do not change existing files unless the user asks. Never merge multiple templates into one file.
