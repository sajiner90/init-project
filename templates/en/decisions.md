# Template: docs/decisions.md

> Decision log. Explains "why". Prevents future sessions from revisiting settled questions.

---

## Structure

```markdown
# Decision Log

Records important technical and product decisions for future reference.

---

### D001: {Decision Title}
**Date:** {YYYY-MM-DD}
**Context:** {Why this decision was needed}
**Options considered:**
1. **Option A: {name}** — {pros} / {cons}
2. **Option B: {name}** — {pros} / {cons}
3. **Option C: {name}** — {pros} / {cons} (if applicable)
**Decision:** Chose {X} because {core reason}
**Risks:** {Known risks and mitigations} (optional)
```

---

## Numbering Rules

- Start at **D001**, increment sequentially
- **Never reuse** an assigned number (even if decision is reversed)
- Reversed decisions: mark `[DEPRECATED]` and reference the new decision
- IDs in architecture.md's quick-ref table must match this file

## Writing Guide

**What's worth recording:**
- Tech choices (framework, database, third-party services)
- Architecture decisions (layering, state management)
- Product decisions (feature trade-offs, priority changes)
- Design decisions (color scheme, typography) — can also go in DESIGN.md's log

**Do:**
- Every decision must include rejected alternatives
- Use concrete facts ("latency < 100ms" not "better performance")
- Use absolute dates (not "today" or "last week")

**Don't:**
- Don't record obvious choices ("we decided to use Git")
- Don't record temporary decisions ("using console.log for debugging")
- Don't leave ambiguity ("we might choose A" — either you did or you didn't)
