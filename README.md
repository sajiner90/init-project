# Spec-Driven Init

**Stop scaffolding. Start designing.**

[![MIT License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Platforms](https://img.shields.io/badge/platforms-Claude%20Code%20%7C%20Cursor%20%7C%20Codex-blue.svg)](#cross-platform)
[![Skills](https://img.shields.io/badge/npx%20skills-add-orange.svg)](#install)

Most scaffolding tools dump boilerplate and leave you to clean up. This skill **talks to you first** — understanding your project through 4-8 questions, then generating a complete, cross-referenced documentation system that makes every future AI session 10x more productive.

```
One command. Five questions. Seven documents.
```

## Before / After

```
Before:                              After:
.                                    .
├── src/                             ├── CLAUDE.md          ← Agent reads this first
├── package.json                     ├── DESIGN.md          ← Visual design tokens
└── (AI guesses everything           ├── progress.md        ← Cross-session memory
     every single session)           ├── docs/
                                     │   ├── requirements.md ← What to build (M-001...)
                                     │   ├── architecture.md ← How it fits together
                                     │   ├── api-spec.md     ← Endpoint contracts
                                     │   └── decisions.md    ← Why we chose X (D001...)
                                     ├── src/
                                     └── package.json
```

**The difference:** Without specs, your AI assistant starts from zero every session. With specs, it has full context from line one.

## Install

```bash
# Recommended — via npx skills
npx skills add sajiner90/init-project

# Or one-line script
curl -fsSL https://raw.githubusercontent.com/sajiner90/init-project/main/install.sh | bash

# Or manual
git clone https://github.com/sajiner90/init-project.git ~/.claude/skills/init-project
```

<details>
<summary>Cursor / Codex / Other tools</summary>

The skill includes configs for multiple platforms:
- **Cursor**: `.cursor/rules/init-project.mdc` — auto-detected by Cursor
- **Codex**: `.codex/instructions.md` — compatible with OpenAI Codex
- **Others**: The `SKILL.md` format works with any agent that reads markdown instructions

```bash
# Install for all detected tools at once
npx skills add sajiner90/init-project
```

</details>

## Usage

### Initialize (new or existing project)

```
> /init-project
```

Claude scans your project, asks targeted questions, confirms understanding, then generates all documents in dependency order.

### Update after code changes

```
> /init-project update
```

Detects what changed (new files, deps, routes), asks for context, updates affected docs only.

### Audit consistency

```
> /init-project audit
```

Cross-checks numbering, references, and alignment across all documents. Outputs a report:

```
✅ Passed (4)     ⚠️ Needs attention (1)     ❌ Must fix (1)
```

## How It Works

```
┌─────────┐    ┌─────────┐    ┌─────────┐    ┌──────────┐    ┌──────────┐
│ Detect  │───▶│ Explore │───▶│ Confirm │───▶│ Generate │───▶│ Validate │
│ project │    │ 4-8 Qs  │    │ summary │    │ 7 docs   │    │ cross-ref│
└─────────┘    └─────────┘    └─────────┘    └──────────┘    └──────────┘
     │              │              │               │               │
  auto-scan    adapts depth    HARD GATE      dependency       6-point
  git/deps     to your info    must confirm   ordered          consistency
               level           before any     generation       check
                               file is written
```

### The Hard Gate

This is the core design principle. **No documents are generated until you confirm the understanding summary.** This prevents the #1 problem with scaffolding tools: generic, project-irrelevant output.

### Smart Exploration Depth

| You provide | Exploration depth | Questions |
|-------------|-------------------|-----------|
| Detailed project brief | Quick | 2-3 confirmation rounds |
| Basic info | Standard | 4-6 targeted questions |
| "Just start" | Deep | 6-10 thorough questions |

### Cross-Referenced Numbering

Every module (M-001) and decision (D001) is numbered once and referenced everywhere:

```
requirements.md    →  M-001: User Auth (P0)
architecture.md    →  Module: User Auth (see M-001)
progress.md        →  M-001: User Auth  ✅ Done
decisions.md       →  D003: JWT vs Session (for M-001)
```

Change a module name in one place? The audit mode catches inconsistencies.

### Quality Score

After generation, documents are scored on 5 dimensions:

```
Document Quality: 87/100
✅ Cross-references consistent    (20/20)
✅ Acceptance criteria testable   (18/20)
⚠️ Architecture diagram missing   (12/20)
✅ Decisions include alternatives  (18/20)
⚠️ Dark mode tokens undefined     (19/20)
```

## What Gets Generated

| File | Lines | Purpose | Conditional |
|------|-------|---------|-------------|
| `CLAUDE.md` | 60-100 | Agent onboarding: stack, structure, commands, conventions | Always |
| `DESIGN.md` | 100-200 | Visual design system: colors, typography, spacing, motion | UI projects only |
| `docs/requirements.md` | 80-150 | Modules with acceptance criteria and priorities (P0/P1/P2) | Always |
| `docs/architecture.md` | 80-150 | Modules, data flow, ASCII diagrams, tech decision quick-ref | Always |
| `docs/api-spec.md` | 60-120 | Endpoints, request/response formats, error codes | Backend/fullstack only |
| `progress.md` | 30-60 | Module status (✅🔧❌⏸️), recent updates, next steps | Always |
| `docs/decisions.md` | 50-100 | What was chosen, what was rejected, and why (D001, D002...) | Always |

## Templates

Each template in `templates/` includes three layers:

1. **Structure** — The markdown skeleton
2. **Writing guide** — Do's and don'ts with examples
3. **Real example** — Filled-in snippet from an actual project

Available in [Chinese](templates/) and [English](templates/en/).

## Workflow Integration

init-project fits into a larger development loop:

```
/init-project  →  /brainstorm  →  /plan  →  build  →  /init-project update
      ↑                                                        ↓
      └──────────────── /init-project audit ◄──────────────────┘
```

Works alongside other popular skills:
- **superpowers** — init-project generates the specs that superpowers workflows consume
- **gstack** — init-project provides the documentation foundation for gstack's sprint cycle
- **brainstorming** — init-project runs before brainstorming to establish project context

## Example

See [`examples/yoga-ai-companion/`](examples/yoga-ai-companion/) — a complete real-world output for an AI yoga voice companion built with Next.js + Claude Agent SDK + Volcengine RTC.

Key quality indicators in the example:
- CLAUDE.md is 68 lines — every line serves the Agent
- DESIGN.md has concrete values for every token (hex, px, bezier curves)
- decisions.md records 7 decisions with rejected alternatives
- Cross-references work: D001-D007 match architecture.md's quick-ref table
- Module numbering M-001 to M-007 is consistent across 4 documents

## FAQ

<details>
<summary><b>Works with any language/framework?</b></summary>
Yes. Detects your stack from package files and adapts. Tested with TypeScript, Python, Go, Rust, Ruby, and Java projects.
</details>

<details>
<summary><b>What if I already have a CLAUDE.md?</b></summary>
Reads it first, asks if you want to update or keep it. Nothing is overwritten without confirmation.
</details>

<details>
<summary><b>Can I skip certain documents?</b></summary>
Yes. During the confirmation phase, uncheck any document you don't need.
</details>

<details>
<summary><b>Monorepo support?</b></summary>
Currently optimized for single-project directories. Monorepo support is planned.
</details>

<details>
<summary><b>Difference from a README?</b></summary>
README is for humans browsing GitHub. This system is for AI agents working in your codebase across sessions. Different audience, different content.
</details>

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). High-value contributions: templates for new project types, better examples, cross-platform configs.

## License

MIT — see [LICENSE](LICENSE).
