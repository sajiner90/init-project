# Template: CLAUDE.md

> Agent onboarding document. First thing read every session. Keep it 60-100 lines.

---

## Structure

```markdown
# {Project Name}

## Overview
(One paragraph: what it does, who it's for, how it works. Max 3 sentences.)

## Design System
Always read DESIGN.md before making any visual or UI decisions.
(Core design rules. Only for projects with UI.)

## Tech Stack
- {Language} {version}
- {Framework} {version}
- {Database}
- {Key dependencies}

## Project Structure
{root}/
├── CLAUDE.md              ← This file
├── DESIGN.md              ← Visual design system
├── progress.md            ← Progress tracking
├── docs/                  ← Technical docs
│   ├── requirements.md
│   ├── architecture.md
│   ├── api-spec.md
│   └── decisions.md
└── {code directory}/      ← Description

## Key References
- `DESIGN.md` — Visual design system
- `docs/requirements.md` — Requirements spec (MVP scope + acceptance criteria)
- `docs/architecture.md` — Architecture design (modules + data flow)
- `docs/api-spec.md` — API specification
- `docs/decisions.md` — Technical decision log
- `progress.md` — Progress tracking

## Development
```bash
{command1}          # Description
{command2}          # Description
```

## Environment
- `{VAR_1}` — Description
- `{VAR_2}` — Description

## Conventions
- {Convention 1}
- {Convention 2}
```

---

## Writing Guide

**Do:**
- Write what the Agent needs (tech stack, file locations, coding rules)
- Write explicit rules ("never X" beats "try to avoid X")
- Keep it concise (one line per convention)

**Don't:**
- No marketing copy ("world-leading...")
- No duplicating other docs (link instead)
- No listing every file (key directories only)
- No obvious conventions ("use meaningful variable names")
