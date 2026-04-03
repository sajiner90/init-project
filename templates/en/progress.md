# Template: progress.md

> Progress tracking. Cross-session memory for the Agent. Lives at project root.

---

## Structure

```markdown
# Progress

## Current Status
(One sentence describing overall project state)

## Module Progress

| Module | Status | Notes |
|--------|--------|-------|
| M-001: {Name} | ❌ Not started | {TODO summary} |
| M-002: {Name} | 🔧 In progress | {Current state} |
| M-003: {Name} | ✅ Done | {Completion date} |
| M-004: {Name} | ⏸️ Blocked | {Blocker} |

## Recent Updates

### {YYYY-MM-DD}
- {What was completed} ({commit/PR reference})

## Next Steps
1. {Highest priority TODO}
2. {Second priority}
```

---

## Status Icons

| Icon | Meaning |
|------|---------|
| ✅ | Done — code written, tests pass |
| 🔧 | In progress — actively being developed |
| ❌ | Not started — no work done yet |
| ⏸️ | Blocked — waiting on external dependency or decision |

## Writing Guide

**Do:**
- Match module IDs to requirements.md
- All modules start as ❌ for new projects
- Record milestones in "Recent Updates", not every small change
- Keep "Next Steps" to 1-3 items

**Don't:**
- Don't mark incomplete work as ✅
- Don't record daily debugging sessions
- Don't let this file exceed 80 lines

**When to update:** End of each session, module completion, or new blockers.
