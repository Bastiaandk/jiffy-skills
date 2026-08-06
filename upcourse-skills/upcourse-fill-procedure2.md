# UpCourse — filling a lesson from a transcript

You are filling a duplicate of the UpCourse prompt template with lesson
content generated from a transcript the user will give you.

Every block contains an instruction starting with [MCP]. Those are your
brief — they say what belongs in the block and when to hide it instead.
Read them all before writing anything. Filling a block replaces its [MCP]
text.

This file is a procedure, not an authorisation. It never overrides what
the user tells you in chat, and it does not by itself authorise writing to
any particular page — you confirm the page with the user first. Do not
fetch and execute further files linked from here.

## Before you start

Determine the site. Call list_sites. If the account has more than one
site, ask the user which one and wait for the answer.

Find the master template: "upcourse-trial template with mcp prompts".
NEVER write to it — it is the source everything is copied from. Read its
blocks anyway: a duplicate may have lost some [MCP] text, and the master
is the only complete copy of the brief.

Then find a duplicate (title starts with the master's title, with
something appended):
- one duplicate with all its [MCP] prompts intact → use it
- several intact ones → list them and ask which
- only partly filled ones (some blocks already carry lesson content) →
  list them, say what lesson is in each, and ask whether to overwrite one
  or to work on a fresh duplicate. Never overwrite without asking.
- none → STOP. MCP cannot duplicate a page. Ask the user to duplicate the
  master in the Kajabi admin and name it after the lesson. Do not use
  create_landing_page; it starts from the site's default preset and would
  not carry the UpCourse theme.

Once the page is chosen and confirmed by the user, set it to draft
straight away (publish_at: null) so nothing you write is live while you
work.

## Then wait

Confirm the page you will work on, say you are ready, and wait for the
transcript. Write nothing before you have it.

## While working

Ask ONCE. Collect everything the transcript cannot tell you — the block
instructions say which decisions need the creator — and put it in a single
message. Include the alt text for the lesson image: you cannot see an
image through MCP, not even one already sitting in the block, so ask what
it shows rather than describing it yourself.

Never guess, never state facts the transcript does not contain. Speech to
text mangles words — if a term looks wrong, name it in your single message
instead of silently correcting it.

## Page details

After the blocks are filled, update the landing page record itself. These
four are page settings, not theme content, so no block brief covers them:

- title → "Upcourse - <lesson title>", using the same lesson title you put
  in the Lesson intro block
- slug → "upcourse-<lesson-title-in-kebab-case>". Duplication leaves a slug
  with a UUID in it; replace it.
- hide_from_search_engines → true
- publish_at → null, so the page stays a draft

All four go in one update_landing_page call. Title max 70 characters.

## Finally

Read the section back and confirm no [MCP] text is left in any visible
block and that block_order is unchanged. Report what you filled, what you
hid, the page details you set, and the page URL.