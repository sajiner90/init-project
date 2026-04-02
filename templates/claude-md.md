# Template: CLAUDE.md

> Agent 入职手册。每次新 session 的第一份文档。控制在 60-100 行。

---

## 结构

```markdown
# {项目名称}

## 项目简介
（一段话：做什么、为谁做、怎么用。不超过 3 句。）

## Design System
Always read DESIGN.md before making any visual or UI decisions.
（核心设计规则 1-2 条，如"禁止硬编码颜色"。仅含 UI 的项目需要此 section。）

## Tech Stack
- {语言} {版本}
- {框架} {版本}
- {数据库}
- {关键依赖}（逐行列出）

## Project Structure
{项目根}/
├── CLAUDE.md              ← 本文件
├── DESIGN.md              ← 视觉设计系统
├── progress.md            ← 进度跟踪
├── docs/                  ← 技术文档
│   ├── requirements.md
│   ├── architecture.md
│   ├── api-spec.md
│   └── decisions.md
└── {代码目录}/            ← 说明

## Key References
- `DESIGN.md` — 视觉设计系统
- `docs/requirements.md` — 需求规范（MVP 范围 + 验收标准）
- `docs/architecture.md` — 架构设计（模块职责 + 数据流）
- `docs/api-spec.md` — API 规范
- `docs/decisions.md` — 技术决策日志
- `progress.md` — 进度跟踪

## Development
```bash
{命令1}          # 说明
{命令2}          # 说明
{命令3}          # 说明
```

## Environment
环境变量（不含实际值）：
- `{VAR_1}` — 说明
- `{VAR_2}` — 说明

## Conventions
- {约定1}
- {约定2}
- {约定3}
```

---

## 写作指南

**做：**
- 写 Agent 需要的信息（技术栈、文件位置、编码规则）
- 写明确的规则（"禁止 X" 比 "尽量避免 X" 好）
- 保持简洁（每条约定一行）

**不做：**
- 不写营销文案（"世界领先的..."）
- 不重复其他文档的内容（用引用链接代替）
- 不列出每一个文件（只列关键目录）
- 不写显而易见的约定（"变量名要有意义"）

---

## 真实案例片段

```markdown
# Iyengar AI Voice Companion

## Design System
Always read DESIGN.md before making any visual or UI decisions.
All colors, spacing, and fonts are defined as CSS custom properties in `app/src/styles/tokens.css`.
Tailwind classes mapped to `var(--color-*)` in `app/tailwind.config.js`.
**规则**：永远不在组件中硬编码颜色值 (hex/rgba)，一律使用 token。

## Tech Stack
- Next.js 14 + React 18 + TypeScript + Tailwind CSS 3
- Prisma ORM + PostgreSQL
- 火山引擎 RTC（全双工语音对话：ASR + TTS + VAD + 打断）
- Claude Agent SDK（AI 导练 Agent）

## Conventions
- 中文：UI 文案、体式名称、commit message、文档
- 英文：代码变量名、函数名、注释
- 体式命名：以梵文 ID 为主键（如 `tadasana`），中文名用于显示
- UI：永远使用 `var(--color-*)` 或 Tailwind token class，禁止硬编码颜色
```
