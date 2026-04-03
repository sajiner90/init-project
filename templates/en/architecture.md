# Template: docs/architecture.md

> Architecture design. Modules, data flow, tech decision quick reference.

---

## Structure

```markdown
# Architecture

## Overview
(One paragraph + ASCII diagram)

```
┌─────────────┐     ┌──────────────┐     ┌─────────────┐
│   Frontend  │────▶│   API Layer  │────▶│  Data Layer  │
└─────────────┘     └──────────────┘     └─────────────┘
```

## Core Modules
### {Module Name}
- **Responsibility:** What it does
- **Key files:** `src/...`
- **Interface:** Exposed functions/APIs
- **Dependencies:** Other modules it depends on

## Data Model
| Entity | Key Fields | Storage | Notes |
|--------|-----------|---------|-------|

## Data Flow
(At least one core user scenario)

## Tech Decision Quick Reference
| ID | Decision | Choice | Reason | See |
|----|----------|--------|--------|-----|
| D001 | {decision} | {choice} | {one-line reason} | decisions.md |

## Constraints & Boundaries
- {Constraint 1}
- {Constraint 2}
```

---

## Writing Guide

**Adapt emphasis by project type:**
| Type | Focus | Can simplify |
|------|-------|-------------|
| Frontend | Routes, state mgmt, component hierarchy | Data model |
| Backend | Service layers, data model, middleware | UI |
| Fullstack | Frontend/backend boundary, data flow | Neither |
| CLI/Library | Module design, public API surface | Routes, state |

**ASCII diagrams:** Information accuracy matters more than aesthetics. They render correctly in terminals, GitHub, and editors alike.

**Tech decision quick-ref:** IDs must match decisions.md. This table answers "why X not Y" at a glance.
