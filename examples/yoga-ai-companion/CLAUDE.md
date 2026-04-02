# Iyengar AI Voice Companion

## 项目简介
AI 驱动的艾扬格瑜伽语音伴侣。通过全双工语音对话引导用户完成个性化瑜伽练习。核心流程：问诊评估 → 智能编排 → 语音导练 → 练习记忆。

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
- Azure AI / GPT-5.4（问诊备选 LLM）
- 知识库后台 REST API（FastAPI :8000）

## Project Structure
```
瑜伽/
├── CLAUDE.md              ← 本文件
├── DESIGN.md              ← 视觉设计系统
├── progress.md            ← 进度跟踪
├── docs/                  ← 技术文档
│   ├── requirements.md    ← 需求规范
│   ├── architecture.md    ← 架构设计
│   └── decisions.md       ← 决策记录
├── data/                  ← 体式 JSON + 教师编排序列
└── app/                   ← Next.js 主应用
    ├── prisma/            ← 数据库 schema + 迁移 + 种子
    └── src/
        ├── agent/         ← Agent 逻辑（practice-agent, memory）
        ├── app/           ← 页面路由 + API routes
        ├── components/    ← React 组件
        ├── lib/           ← 工具函数、hooks（RTC/ASR/KB/LLM）
        └── styles/        ← CSS token 文件
```

## Key References
- `DESIGN.md` — 视觉设计系统（色彩/字体/间距/动效）
- `docs/requirements.md` — 需求规范（MVP 范围 + 验收标准）
- `docs/architecture.md` — 架构设计（模块职责 + 数据流 + 决策速查）
- `docs/decisions.md` — 技术决策日志（D001–D007）
- `progress.md` — 进度跟踪

## Development
```bash
make dev          # 启动开发服务器（localhost:3000）
make migrate      # 数据库迁移
make seed         # 填充种子数据
make test         # 运行测试（vitest）
make lint         # TypeScript 类型检查
```

## Environment
- `DATABASE_URL` — PostgreSQL 连接串
- `AZURE_AI_API_BASE` / `AZURE_AI_API_KEY` — 问诊 LLM
- `VOLC_RTC_APP_ID` / `APP_KEY` / `ACCESS_KEY` / `SECRET_KEY` — 语音通道
- `PRACTICE_LLM=claude` — 练习时用 Claude
- `YOGA_KB_API_URL=http://localhost:8000` — 知识库后端

## Conventions
- 中文：UI 文案、体式名称、commit message、文档
- 英文：代码变量名、函数名、注释
- 体式命名：以梵文 ID 为主键（如 `tadasana`），中文名用于显示
- UI：永远使用 `var(--color-*)` 或 Tailwind token class，禁止硬编码颜色
