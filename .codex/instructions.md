# Spec-Driven Init — for Codex

## When to activate

When the user asks to:
- Initialize project documentation
- Create a CLAUDE.md, requirements, or architecture document
- Set up a spec-driven documentation system
- Audit or update existing project docs

## How it works

Follow the five-phase process defined in `SKILL.md`:

1. **Detect** — Scan project: git, packages, existing docs, directory structure
2. **Explore** — Ask 4-8 targeted questions (one at a time, prefer multiple choice)
3. **Confirm** — Present understanding summary, wait for user approval
4. **Generate** — Create documents in dependency order with cross-references
5. **Validate** — Check consistency across all documents

## Key rules

- **Hard Gate**: Never generate documents before user confirms understanding
- **Conditional generation**: No DESIGN.md for CLI/backend. No api-spec.md for frontend/libraries
- **Cross-references**: M-001 (modules) and D001 (decisions) numbers must be consistent across all docs
- **Templates**: Use `templates/` directory as structural references, adapt to project context

## Three modes

- `init` — Full documentation generation
- `update` — Incremental update after code changes
- `audit` — Consistency check across documents

Refer to SKILL.md for complete instructions.
