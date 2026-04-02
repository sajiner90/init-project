# Spec-Driven Init

> Generate a complete documentation system for any project through natural conversation. Built for [Claude Code](https://docs.anthropic.com/en/docs/claude-code).

**Philosophy: Documentation replaces code as the design center. More Context, Less Control.**

Most scaffolding tools dump files and leave. This skill *talks to you first* — understanding your project through dialogue before generating anything.

## What It Generates

| File | Purpose | Generated For |
|------|---------|---------------|
| `CLAUDE.md` | Agent onboarding — tech stack, structure, conventions | All projects |
| `DESIGN.md` | Visual design system — colors, typography, spacing, motion | Projects with UI |
| `docs/requirements.md` | Requirements spec — modules, acceptance criteria, priorities | All projects |
| `docs/architecture.md` | Architecture — modules, data flow, tech decisions | All projects |
| `docs/api-spec.md` | API specification — endpoints, request/response formats | Backend/fullstack |
| `progress.md` | Progress tracking — module status, recent updates | All projects |
| `docs/decisions.md` | Decision log — what was chosen, what was rejected, and why | All projects |

## How It Works

```
Detect → Explore → Confirm → Generate → Validate
```

1. **Detect** — Scans your project: git status, package files, existing docs, directory structure
2. **Explore** — Asks targeted questions (4-8 rounds, adapts to your detail level)
3. **Confirm** — Shows understanding summary for your approval
4. **Generate** — Creates documents in dependency order with cross-references
5. **Validate** — Checks consistency across all documents

### Three Modes

| Command | Mode | When to use |
|---------|------|-------------|
| `/init-project` | **Init** | First-time setup (new or existing project) |
| `/init-project update` | **Update** | Sync docs after code changes |
| `/init-project audit` | **Audit** | Check document consistency |

## Install

### One-line install

```bash
curl -fsSL https://raw.githubusercontent.com/sajiner90/init-project/main/install.sh | bash
```

### Manual install

```bash
# Clone to Claude Code skills directory
git clone https://github.com/sajiner90/init-project.git ~/.claude/skills/init-project
```

### Verify

Open Claude Code and type `/init-project`. If it appears in the skill list, you're set.

## Usage

### New project

```
$ mkdir my-app && cd my-app && git init
$ claude
> /init-project
```

Claude will ask about your project goals, tech stack, and architecture before generating any files.

### Existing project

```
$ cd my-existing-app
$ claude
> /init-project
```

Claude reads your code first, presents its understanding, and asks clarifying questions.

### Update after changes

```
> /init-project update
```

Detects what changed since last update, asks for context, updates affected documents.

### Audit consistency

```
> /init-project audit
```

Checks cross-references, numbering, and alignment between all documents.

## Key Design Decisions

### Hard Gate

No documents are generated until the exploration phase completes and you confirm understanding. This prevents generic template dumps.

### Cross-Referenced Numbering

- Modules: `M-001`, `M-002`, ...
- Decisions: `D001`, `D002`, ...
- Numbers are referenced across `requirements.md`, `architecture.md`, `progress.md`, and `decisions.md`

### Conditional Generation

- No `DESIGN.md` for CLI tools or backend services
- No `api-spec.md` for frontend-only or library projects
- No `Makefile` if there are fewer than 2 common commands

### Language Detection

Auto-detects project language from existing docs, README, and commit messages. Falls back to asking the user.

## Templates

The `templates/` directory contains structural guides for each document type:

```
templates/
├── claude-md.md        — CLAUDE.md structure + writing guide + real example
├── design-system.md    — DESIGN.md structure + per-project-type recommendations
├── requirements.md     — Module numbering + acceptance criteria examples
├── architecture.md     — ASCII diagram guidance + type-specific emphasis
├── api-spec.md         — Endpoint format + error code conventions
├── progress.md         — Status emoji system + update timing
└── decisions.md        — D-numbering rules + what's worth recording
```

Templates are references, not rigid forms. The skill adapts content to each project.

## Example Output

See [`examples/yoga-ai-companion/`](examples/yoga-ai-companion/) for a complete real-world example — an AI-powered yoga voice companion built with Next.js, Claude Agent SDK, and Volcengine RTC.

## Customization

### Add your own templates

Edit files in `templates/` to match your team's conventions. The skill reads these during generation.

### Skip specific documents

During the confirmation phase (Phase 3), you can uncheck documents you don't need.

### Extend for new document types

Add a new template to `templates/` and reference it in the Phase 4 section of `SKILL.md`.

## FAQ

**Q: Does this work with any programming language?**
A: Yes. The skill detects your tech stack and adapts. Tested with JavaScript/TypeScript, Python, Go, Rust, and Ruby projects.

**Q: What if I already have a CLAUDE.md?**
A: The skill reads it first and asks if you want to update or keep it. No files are overwritten without confirmation.

**Q: Can I use this for a monorepo?**
A: Currently optimized for single-project directories. Monorepo support is planned.

**Q: What's the difference between this and a README?**
A: A README is for humans browsing GitHub. This documentation system is for AI agents working in your codebase across multiple sessions. Different audience, different content.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

MIT — see [LICENSE](LICENSE).
