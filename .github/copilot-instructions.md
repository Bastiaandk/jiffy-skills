# jiffy-skills

This repo contains Kajabi MCP skill sets — one set of three files per Kajabi page template.
Each set teaches an AI agent how to fill that template from a customer's transcript.

## File convention

Every template uses exactly three files, named `{template}-*.md`:

| File | Purpose |
|------|---------|
| `{template}-customer-prompt.md` | What the customer pastes into their AI chat to start the workflow. It fetches the other two files from GitHub raw and then halts for input. |
| `{template}-fill-procedure.md` | Step-by-step procedure the AI follows: finding the page, waiting for the transcript, filling blocks, updating page settings. |
| `{template}-skill.md` | Read-only domain knowledge: template structure, MCP payload rules, block conventions, gotchas. |

The skill file is the schema definition of the custom template. The Kajabi MCP has no built-in knowledge of custom theme blocks — it can only read and write what it is told. The skill file is the only source that tells the AI which blocks exist in the template, what their settings are, and when to hide them. Without it, the AI would have to guess the block structure and would silently produce wrong output. The procedure tells the AI *what to do*; the skill file tells it *what the template is*.

## GitHub raw URL pattern

The customer prompt always fetches the other two files using:
```
https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/{template}-skills/{template}-skill.md
https://raw.githubusercontent.com/Bastiaandk/jiffy-skills/main/{template}-skills/{template}-fill-procedure.md
```

When creating a new template set, update the filenames in the customer prompt accordingly.

## Adding a new template

To add a template called `{template}`, create these three files:

1. **`{template}-skills/{template}-customer-prompt.md`** — Copy the structure of `upcourse-skills/upcourse-customer-prompt.md`. Update the two raw GitHub URLs and the `Site:` instruction if needed.
2. **`{template}-skills/{template}-fill-procedure.md`** — Describe the procedure specific to this template: how to find the master, how to identify duplicates, which blocks to fill, which page settings to update. Follow the same heading structure as `upcourse-skills/upcourse-fill-procedure.md`.
3. **`{template}-skills/{template}-skill.md`** — Document the template's Liquid structure, section/block layout, MCP payload rules, and any gotchas. Follow the same heading structure as `upcourse-skills/upcourse-skill.md`.

Do not change existing files unless the user asks. Never merge multiple templates into one file.
