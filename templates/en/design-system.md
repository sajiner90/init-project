# Template: DESIGN.md

> Visual design system. Single source of truth for all UI decisions. Only for projects with UI.

---

## Structure

```markdown
# Design System — {Project Name}

> Single source of truth for all visual decisions.
> Last updated: {date}

## Brand Identity
**Tone:** {3-5 keywords describing visual style}
**Voice:** {Interaction copy style}
**Differentiation:** {How you stand out from competitors visually}

## Typography
### Font Families
| Role | Font | Fallback | Weights | Usage |
|------|------|----------|---------|-------|

### Type Scale
| Level | Size | Weight | Line Height | Usage |
|-------|------|--------|-------------|-------|

## Color Palette
### Semantic Tokens
| Token | Light Mode | Dark Mode | Usage |
|-------|-----------|-----------|-------|

### Neutral Scale
| Token | Light Mode | Dark Mode | Usage |
|-------|-----------|-----------|-------|

## Spacing
Base unit: **{N}px**
| Token | Value | Usage |
|-------|-------|-------|

## Visual Properties
### Border Radius / Shadows / Special Effects

## Motion
**Philosophy:** {One sentence describing animation style}
### Easing / Duration

## Layout
| Property | Value |
|----------|-------|

## Component Patterns
### Button / Card / Form / Badge

## Token Files
| File | Purpose |
|------|---------|

**Rule:** Never hardcode color values in components. Always use tokens.

## Decisions Log
| Date | Decision | Rationale |
|------|----------|-----------|
```

---

## Writing Guide

**Do:**
- Give concrete values for every token (hex, px, bezier curves)
- Explain design decision rationale
- Include dark mode counterparts
- List CSS variable names for direct code usage

**Don't:**
- No "TBD" tokens — give a recommended value or mark the dependency
- No listing colors without usage context
- No mixing in code implementation — this is a design spec
- No generic palettes disconnected from brand

**Per project type:**
- **SaaS/Tools**: Neutral-heavy + one brand color (Linear, Notion)
- **Consumer**: Emotionally rich colors (Spotify, Duolingo)
- **Health/Wellness**: Natural earth tones (Calm, Headspace)
- **Developer tools**: Dark-first + high contrast (GitHub, VS Code)
