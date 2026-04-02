# Contributing to Spec-Driven Init

Thanks for your interest in improving this skill.

## How This Skill Works

This is a [Claude Code skill](https://docs.anthropic.com/en/docs/claude-code) — a markdown prompt file (`SKILL.md`) that Claude Code loads when `/init-project` is invoked. It's not a traditional program; it's a structured prompt that guides Claude's behavior.

## What to Contribute

### High-value contributions

- **Templates** (`templates/`) — Improve structure, add writing guides, add real-world examples
- **SKILL.md** — Fix flow issues, improve question quality, add missing checks
- **Examples** (`examples/`) — Add complete outputs for different project types (Python CLI, Go backend, React app, etc.)

### Contribution ideas

- Template for a new document type (e.g., `testing-strategy.md`, `deployment.md`)
- Better examples for underrepresented project types
- Translations of templates (the skill auto-detects language)
- Bug reports: "I ran `/init-project` on my X project and it did Y wrong"

## How to Contribute

1. Fork this repo
2. Make your changes
3. Test by copying your modified skill to `~/.claude/skills/init-project/` and running `/init-project` on a real project
4. Submit a PR with:
   - What you changed
   - What project type you tested on
   - Before/after comparison (if modifying templates or SKILL.md)

## Testing

There's no automated test suite (it's a prompt, not code). Quality is validated by:

1. Running `/init-project` on a real project
2. Checking generated documents for:
   - Completeness (all relevant sections present)
   - Consistency (cross-references match)
   - Quality (no filler, no contradictions with existing code)

## Style Guide

### For SKILL.md

- Keep instructions precise and actionable
- Use tables for structured information
- Include concrete examples, not abstract descriptions
- Every instruction should answer: "What should Claude do differently because of this line?"

### For Templates

- Structure section: show the markdown skeleton
- Writing guide: list do's and don'ts
- Real example: show a filled-in snippet from an actual project
- Keep each template under 100 lines

### General

- Chinese for documentation content and examples
- English for README, CONTRIBUTING, and code-facing docs
- No filler phrases ("best practices", "industry standard", "cutting edge")

## Questions?

Open an issue. Keep it specific: "When I run X on Y project, Z happens" is better than "improve the output quality."
