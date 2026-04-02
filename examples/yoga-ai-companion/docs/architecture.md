# 架构设计

## 架构概览

四层分离架构：页面路由 → Agent 逻辑 → API/语音通道 → 数据层。
Practice Agent 是系统核心，通过 event bus 连接前端 UI 和后端数据。

```
┌──────────────────────────────────────────────────┐
│                   Next.js App                     │
│  ┌──────┐  ┌──────┐  ┌──────┐  ┌──────────────┐ │
│  │ Home │  │Check │  │Pract │  │   Complete   │ │
│  │ Page │  │ -in  │  │ -ice │  │     Page     │ │
│  └──┬───┘  └──┬───┘  └──┬───┘  └──────┬───────┘ │
│     └─────────┴─────────┴──────────────┘         │
│                      │                            │
│              ┌───────▼────────┐                   │
│              │  Practice Agent │                   │
│              │  (Claude SDK)   │                   │
│              └───────┬────────┘                   │
│         ┌────────────┼────────────┐               │
│   ┌─────▼─────┐ ┌────▼────┐ ┌────▼─────┐        │
│   │ Voice RTC │ │ KB API  │ │ Prisma   │        │
│   │ (Volcano) │ │ :8000   │ │ Postgres │        │
│   └───────────┘ └─────────┘ └──────────┘        │
└──────────────────────────────────────────────────┘
```

## 核心模块

### 页面路由
- **职责：** UI 渲染和用户交互
- **关键文件：** `app/src/app/` (4 页面路由)
- **依赖：** components/, Agent 层

### Agent 层
- **职责：** AI 导练核心逻辑 — 对话管理、工具调用、状态机
- **关键文件：** `app/src/agent/` (practice-agent, event-bus, memory, prompts/)
- **对外接口：** startSession(), sendMessage(), endSession()
- **依赖：** Claude Agent SDK, KB API, Prisma

### 语音通道
- **职责：** 全双工语音对话 — ASR/TTS/VAD/打断
- **关键文件：** `app/src/lib/rtc/`, `app/src/lib/hooks/`
- **依赖：** 火山引擎 RTC SDK

### 数据层
- **职责：** 持久化存储 + 外部数据源
- **关键文件：** `app/prisma/schema.prisma`, `app/src/lib/kb.ts`
- **数据源：** PostgreSQL (Prisma), 知识库 API (:8000), 内嵌体式数据

## 数据流

```
用户语音 → RTC ASR → 文字 → Agent → Claude LLM
                                  ↓
                           工具调用 (KB 查询 / 编排)
                                  ↓
                           Agent 回复 → RTC TTS → 语音播报
                                  ↓
                           状态更新 → UI 刷新 (体式名/计时器)
```

## 提示词架构

四层设计，从稳定到动态：

```
Layer 1: core-identity.ts    ← 角色定义（极少变化）
Layer 2: practice-rules.ts   ← 教学规则（按版本迭代）
Layer 3: safety-rules.ts     ← 安全红线（独立维护）
Layer 4: dynamic-context.ts  ← 运行时注入（用户评估/序列）
```

## 技术决策速查

| 编号 | 决策 | 选择 | 原因 | 详见 |
|------|------|------|------|------|
| D001 | 语音通道 | 火山引擎 RTC | 国内延迟最低，原生支持全双工打断 | decisions.md |
| D002 | 练习 LLM | Claude Agent SDK | 工具调用能力强 | decisions.md |
| D003 | 前端框架 | Next.js 14 App Router | SSR + API Routes 一体化 | decisions.md |
| D004 | 数据库 | PostgreSQL + Prisma | 类型安全 ORM，迁移可控 | decisions.md |
| D005 | 页面合并 | /checkin + /preview → /session | 减少页面跳转 | decisions.md |
| D006 | 品牌配色 | 鼠尾草绿 + 衬线字体 | 与竞品差异化 | decisions.md |
| D007 | Token 体系 | CSS custom properties | 与知识库后台共享 | decisions.md |

## 约束与边界

- 单用户模式（MVP 不支持多用户同时在线）
- Agent 对话上限 200 轮（maxTurns 安全阀）
- 语音 RTT 目标 < 200ms
- 不提供医疗建议（安全红线）
- 知识库后端需独立运行（:8000）
