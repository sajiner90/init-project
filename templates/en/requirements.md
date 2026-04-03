# Template: docs/requirements.md

> Requirements spec. Defines what to build, what not to build, and what "done" looks like.

---

## Structure

```markdown
# Requirements

## Product Positioning
**One-liner:** {What the product does}
**Target users:** {Who uses it}
**Core scenario:** {When and how they use it}

## Functional Requirements

### M-001: {Module Name} (P0)
**Description:** {What this module does}
**Acceptance Criteria:**
- [ ] AC-1: {Testable condition}
- [ ] AC-2: {Testable condition}

### M-002: {Module Name} (P0)
...

## Non-Functional Requirements
### Performance
- {Metric}: {Target} (e.g., "Page load < 2s on 4G")

### Security
- {Specific security requirement}

### Usability
- {Specific usability goal}

## External Dependencies
| Service | Purpose | Interface | Replaceable |
|---------|---------|-----------|-------------|

## Out of Scope
- {Feature 1} — {Why not}
- {Feature 2} — {Why not}
```

---

## Writing Guide

**Module numbering:** M-001 and up, never reused, consistent across all docs.

**Priority levels:**
| Level | Meaning | Criteria |
|-------|---------|----------|
| P0 | Must have | Product unusable without it |
| P1 | Should have | Needed before first user test |
| P2 | Nice to have | QA/iteration phase |

**Acceptance criteria:**
- Good: "Form submission shows success message within 2 seconds"
- Bad: "Form submission works smoothly"
- Good: "Filtered results contain at least 3 items, otherwise show fallback"
- Bad: "Filtering logic is correct"

**Out of Scope value:** Prevents the Agent from adding unrequested features. Say *why* not, not just *what* not.
