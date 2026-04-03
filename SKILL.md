---
name: init-project
description: "Documentation-driven project initialization. Generates a complete spec system (CLAUDE.md, design system, requirements, architecture, API spec, progress, decisions) through natural dialogue. Works for new and existing projects. Supports three modes: init, update, audit."
triggers:
  - "initialize project"
  - "set up documentation"
  - "create CLAUDE.md"
  - "init docs"
  - "项目初始化"
  - "生成文档体系"
auto_suggest:
  condition: "No CLAUDE.md found in project root"
  message: "This project has no CLAUDE.md. Run /init-project to generate a complete documentation system."
---

# Spec-Driven Init — 规范文档驱动的项目初始化

通过自然语言对话理解项目全貌，生成一套完整的规范文档体系，让 AI Agent 从第一次对话就能高效协作。

**核心理念：规范文档替代代码成为设计中心。More Context, Less Control.**

<HARD-GATE>
在完成「探查阶段」并获得用户确认之前，不得生成任何文档文件。必须先理解，再输出。
</HARD-GATE>

---

## 运行模式

根据调用参数自动选择模式：

| 调用方式 | 模式 | 说明 |
|---------|------|------|
| `/init-project` | **Init** | 完整初始化（默认） |
| `/init-project update` | **Update** | 增量更新已有文档体系 |
| `/init-project audit` | **Audit** | 检查文档间一致性 |

---

## Init Mode — 完整初始化

### Phase 1: 检测项目状态

自动检测当前目录，判断项目类型和现状。

**检测项：**
- Git 状态（`git status`、最近 5 条 `git log --oneline`）
- 包管理器（package.json / Cargo.toml / go.mod / pyproject.toml / Gemfile / pom.xml / CMakeLists.txt）
- 代码目录（src/ / app/ / lib/ / cmd/ / pkg/）
- 已有文档（CLAUDE.md / DESIGN.md / README.md / docs/）
- 目录结构概览（一层深度 `ls`）

**语言检测：**
- 检查 README、已有文档、commit message 的语言
- 如果项目以中文为主，全部文档使用中文
- 如果项目以英文为主，全部文档使用英文
- 不确定时，询问用户偏好

**判断结果：**
- **空项目**：无代码、无配置文件 → 新项目流程
- **已有项目**：有代码或配置 → 已有项目流程

输出简要检测结果，例如：
> "检测到这是一个 Next.js 全栈项目，42 个文件，有 README 但没有规范文档。我来问几个问题以便生成文档体系。"

---

### Phase 2: 对话探查

**原则：每次只问一个问题，优先使用选择题。**

根据用户回答的详细程度，动态调整探查深度：

| 模式 | 触发条件 | 问题数 |
|------|---------|--------|
| **快速** | 用户一开始就给出了详细的项目描述 | 2-3 轮确认 |
| **标准** | 默认 | 4-6 轮 |
| **深度** | 用户明确要求、或项目极其复杂 | 6-10 轮 |

**快速模式：** 如果用户在调用时已经附带了项目描述（例如 `/init-project 这是一个基于 Next.js 的瑜伽 AI 语音伴侣...`），跳过大部分问题，直接进入确认阶段，仅补充关键缺失信息。

#### 新项目 — 必问清单

按顺序逐一询问（根据回答可跳过）：

1. **项目是什么？** — 一句话描述目标和核心功能
2. **项目类型？**（选择题）
   - A. 前端应用（Web / Mobile）
   - B. 后端服务 / API
   - C. 全栈应用
   - D. CLI 工具 / 库
   - E. 数据处理 / ML
   - F. 其他
3. **技术栈？** — 语言、框架、数据库、主要依赖
4. **目标用户和使用场景？** — 谁在用、怎么用
5. **核心功能模块？** — 3-5 个最重要的功能（优先级排序）
6. **外部依赖/集成？** — 第三方 API、现有系统对接
7. **已知约束或非功能需求？** — 性能、安全、部署环境
8. **团队情况？** — 协作人数、角色、是否有设计稿
9. **品牌/视觉方向？**（如适用） — 是否有配色、字体、风格偏好
10. **有没有参考产品？** — 竞品或灵感来源

#### 已有项目 — 必问清单

先分析代码再提问：

1. **我的理解对吗？** — 陈述从代码中读到的理解，让用户确认/纠正
2. **当前阶段？**（选择题）
   - A. 早期开发，核心功能在搭建
   - B. 功能基本完成，迭代优化
   - C. 已上线，维护 + 新功能
   - D. 需要重构或技术迁移
3. **最大痛点或接下来的重点？**
4. **代码里看不出来的信息？** — 业务背景、历史决策原因、团队约定
5. **团队情况？** — 协作人数、AI 使用程度
6. **品牌/视觉方向？**（如适用） — 当前的设计状态

#### 智能跳过规则

- 用户回答已覆盖后续问题 → 跳过
- 已有 README/文档 → 先读取，不重复问
- CLI/库项目 → 跳过品牌/视觉问题
- 纯后端 → 跳过 UI/设计问题
- 用户表达不耐烦 → 立即进入确认阶段

---

### Phase 3: 确认理解

输出**项目理解摘要**：

```
## 项目理解确认

**定位：** [一句话]
**类型 & 技术栈：** [类型] — [主要技术]
**核心模块：**
1. [模块名] — [一句话描述] (P0)
2. [模块名] — [一句话描述] (P0)
3. [模块名] — [一句话描述] (P1)
...

**关键约束：**
- [约束1]
- [约束2]

**将生成的文档：**
- [ ] CLAUDE.md — Agent 入职手册
- [ ] DESIGN.md — 视觉设计系统 ← 仅前端/全栈/有 UI 的项目
- [ ] docs/requirements.md — 需求规范
- [ ] docs/architecture.md — 架构设计
- [ ] docs/api-spec.md — API 规范 ← 仅有 API 的项目
- [ ] progress.md — 进度跟踪
- [ ] docs/decisions.md — 决策记录
```

请用户确认或补充。**获得确认后才进入生成阶段。**

---

### Phase 4: 生成文档

读取 `templates/` 目录中对应的模板文件，结合对话获得的项目信息生成文档。

**已有项目：** 如果已存在某个文档，先读取再决定更新还是跳过。

**生成顺序（有依赖关系）：**
1. `CLAUDE.md`（基础，被所有其他文档引用）
2. `docs/decisions.md`（被 architecture 引用）
3. `docs/requirements.md`（被 architecture、progress 引用）
4. `docs/architecture.md`（引用 decisions 和 requirements）
5. `DESIGN.md`（引用 architecture 中的组件信息）
6. `docs/api-spec.md`（引用 architecture 中的 API 设计）
7. `progress.md`（引用 requirements 中的模块列表）

#### 4.1 CLAUDE.md — Agent 入职手册

项目根目录。Agent 每次进入项目时的第一份文档。

**必含 section（按顺序）：**

```markdown
# 项目名称

## 项目简介
（一段话：目标、核心功能、目标用户）

## Design System
Always read DESIGN.md before making any visual or UI decisions.
（仅含 UI 的项目。指向 DESIGN.md，包含核心规则如"禁止硬编码颜色"）

## Tech Stack
（语言、框架、主要依赖、运行时版本）

## Project Structure
（关键目录树 + 每个目录一句话说明。不需要列出每个文件）

## Key References
（指向其他所有规范文档，含一句话说明）

## Development
（dev / build / test / lint / deploy 命令，用 code block）

## Environment
（需要的环境变量列表，不含实际值）

## Conventions
（项目特有的编码约定、命名规范、Git 规范）
```

**质量要求：**
- 控制在 60-100 行
- 每一行都要对 Agent 有信息增量
- 不写空洞的模板话（如"本项目遵循最佳实践"）

#### 4.2 DESIGN.md — 视觉设计系统

项目根目录。所有视觉决策的唯一真相源。

**仅当项目有 UI 时生成。**CLI/库/纯后端项目跳过。

**必含 section（按顺序）：**

```markdown
# Design System — 项目名称

## Brand Identity
（调性关键词、voice 风格、差异化定位）

## Typography
（字体选择 + 回退栈 + 字号体系 + 行高规范）

## Color Palette
### Semantic Tokens
（primary / secondary / accent / success / warning / error / info）
### Neutral Scale
（bg-primary / bg-secondary / text-primary / text-secondary / border）
### Dark Mode（如适用）

## Spacing
（基准单位 + token 体系）

## Visual Properties
（border-radius / shadows / 特殊效果）

## Motion
（动画哲学 + easing 函数 + duration 分级）

## Layout
（布局策略 + 断点 + 栅格规范）

## Component Patterns
（按钮变体 / 卡片 / 表单 / 其他核心组件的设计规范）

## Token Files
（CSS variables / Tailwind config / 其他 token 文件路径）

## Decisions Log
（设计决策及理由）
```

**质量要求：**
- 每个 token 给出具体值（hex 色值、px 值、贝塞尔曲线）
- 不写"待定"的 token — 要么给值，要么标注"根据品牌确定后补充"
- 如果用户没有明确的品牌方向，基于项目类型推荐合理的默认值并说明理由
- 所有颜色必须同时给出亮/暗模式值（如项目需要暗色模式）

#### 4.3 docs/requirements.md — 需求规范

```markdown
# 需求规范

## 产品定位
（一句话定位 + 目标用户 + 核心使用场景）

## 功能需求
### M-001: [模块名] (P0)
**描述：** ...
**验收标准：**
- [ ] AC-1: ...
- [ ] AC-2: ...

### M-002: [模块名] (P0)
...

## 非功能需求
- **性能：** [具体指标]
- **安全：** [具体要求]
- **可用性：** [具体目标]

## 外部依赖
| 服务 | 用途 | 接口方式 |
|------|------|---------|

## 暂不实现（Out of Scope）
（明确列出排除的功能，防止 Agent 擅自添加）
```

**质量要求：**
- 模块用 M-001 编号，方便交叉引用
- 验收标准必须可测试（不写"用户体验好"，写"首次加载 < 2s"）
- P0/P1/P2 三级优先级

#### 4.4 docs/architecture.md — 架构设计

根据项目类型调整内容侧重：

| 项目类型 | 侧重 |
|---------|------|
| 前端 | 页面路由、状态管理、组件层级 |
| 后端 | 服务分层、数据模型、中间件 |
| 全栈 | 前后端边界、数据流、部署架构 |
| CLI/库 | 模块划分、公共 API、扩展点 |

```markdown
# 架构设计

## 架构概览
（一段话描述 + ASCII 架构图）

## 核心模块
### [模块名]
- **职责：** ...
- **关键文件：** ...
- **对外接口：** ...
- **依赖：** ...

## 数据模型
（核心实体、关系、存储方式）

## 数据流
（关键用户流程的数据流向，用 ASCII 或文字描述）

## 技术决策速查
| 编号 | 决策 | 选择 | 原因 | 详见 |
|------|------|------|------|------|
| D001 | ... | ... | ... | decisions.md |

## 约束与边界
（性能目标、安全边界、已知限制）
```

**质量要求：**
- 技术决策速查表必须与 decisions.md 中的编号一致
- 模块的"关键文件"必须指向实际存在的路径（已有项目）
- 数据流描述至少覆盖一个核心用户场景

#### 4.5 docs/api-spec.md — API 规范

**仅当项目有 API 时生成。**纯前端/CLI/库项目跳过。

```markdown
# API 规范

## 概览
- **Base URL：** ...
- **认证方式：** ...
- **通用响应格式：**
  ```json
  { "success": true, "data": {}, "error": null }
  ```
- **错误码规范：**
  | Code | 含义 |
  |------|------|

## 接口列表

### [模块名]

#### POST /api/xxx
- **描述：** ...
- **请求参数：**
  ```json
  { }
  ```
- **成功响应：**
  ```json
  { }
  ```
- **错误场景：** ...
```

#### 4.6 progress.md — 进度跟踪

项目根目录。Agent 跨 session 的记忆载体。

```markdown
# 进度跟踪

## 当前状态
（一句话描述项目整体进展）

## 模块进度

| 模块 | 状态 | 说明 |
|------|------|------|
| [模块名] | ❌ 未开始 | ... |
| [模块名] | 🔧 进行中 | ... |
| [模块名] | ✅ 完成 | ... |

## 最近更新
（留空，开发过程中逐步填写）

## 下一步
（最高优先级的 1-3 项待办）
```

**状态图标约定：**
- ✅ 完成
- 🔧 进行中
- ❌ 未开始
- ⏸️ 暂停/阻塞

**质量要求：**
- 模块列表必须与 requirements.md 的模块编号对应
- 新项目的状态全部为 ❌，不要乐观标注

#### 4.7 docs/decisions.md — 决策记录

```markdown
# 决策记录

记录重要技术和产品决策。帮助未来的 session 理解「为什么」。

---

### D001: [决策标题]
**日期：** YYYY-MM-DD
**背景：** 为什么需要做这个决策
**考虑的方案：**
1. 方案 A — 优劣分析
2. 方案 B — 优劣分析
**结论：** 选择方案 X，因为 ...
**风险：** ...（可选）
```

**质量要求：**
- 统一使用 D001、D002... 编号
- 每条决策必须包含被拒绝的方案（说明"为什么不"）
- 日期使用绝对日期，不写"今天"

#### 4.8 Makefile（可选）

如果项目适合，生成一个包含常用命令的 Makefile：

```makefile
.PHONY: dev build test lint

dev:          ## Start dev server
	[command]

test:         ## Run tests
	[command]

lint:         ## Type check / lint
	[command]
```

仅当项目有超过 2 个常用命令时生成。不强制。

---

### Phase 5: 校验与审阅

文档全部生成后，执行一致性校验：

**自动校验项：**
1. ☐ CLAUDE.md 的 Key References 是否指向所有已生成的文档
2. ☐ architecture.md 的技术决策编号是否与 decisions.md 一致
3. ☐ progress.md 的模块列表是否与 requirements.md 的模块一致
4. ☐ CLAUDE.md 的 Project Structure 是否反映真实目录（已有项目）
5. ☐ DESIGN.md 的 token 命名是否与 CLAUDE.md 中引用的一致
6. ☐ 所有文档间的交叉引用路径是否正确

**输出给用户：**
```
✅ 文档生成完毕，共 N 个文件：

| 文件 | 行数 | 摘要 |
|------|------|------|
| CLAUDE.md | 85 | Agent 入职手册，含技术栈/结构/命令/约定 |
| DESIGN.md | 180 | 视觉设计系统，含色彩/字体/间距/动效 |
| ... | | |

一致性校验：全部通过 ✅（或列出不一致项）

你可以浏览每个文件确认内容。有需要调整的随时告诉我。
确认没问题后我帮你 commit。
```

### 质量评分

一致性校验后，给出文档质量总评：

```
文档质量评分: XX/100

| 维度 | 得分 | 说明 |
|------|------|------|
| 交叉引用一致 | /20 | M-编号和 D-编号在所有文档中是否一致 |
| 验收标准可测试 | /20 | AC 是否具体、可验证，而非模糊描述 |
| 架构图信息量 | /20 | 是否有 ASCII 图、是否覆盖数据流 |
| 决策记录完整 | /20 | 每条决策是否包含被拒方案和理由 |
| 设计 token 具体 | /20 | 色值/字号/间距是否给出具体数值 |
```

**评分规则：**
- 20/20：完全满足
- 15-19：基本满足，有小缺陷
- 10-14：有明显缺失
- <10：需要重点补充

对于不适用的维度（如纯后端项目无 DESIGN.md），该维度得分归入其他维度平均分配。

如果总分 < 70，主动提示用户哪些维度需要补充信息。

---

## Update Mode — 增量更新

当用户调用 `/init-project update` 时：

1. **读取所有现有文档**
2. **对比代码现状**，识别变化：
   - 新增的目录/文件
   - 新增的依赖（package.json diff）
   - 新增的 API 路由
   - 新增的数据模型
   - 最近的 git log（自上次更新后）
3. **询问用户**变化背景（1-2 轮对话）
4. **更新受影响的文档**，保留未变化的部分
5. **更新 progress.md**

**原则：**
- 只改变化的部分，不重写整个文档
- 新增的决策追加到 decisions.md（编号递增）
- 新增的模块追加到 requirements.md 和 progress.md

---

## Audit Mode — 一致性审计

当用户调用 `/init-project audit` 时：

读取所有文档，执行全面检查：

**检查维度：**

| 维度 | 检查内容 |
|------|---------|
| **完整性** | 所有应有文档是否存在 |
| **一致性** | 文档间交叉引用是否正确、编号是否对应 |
| **时效性** | 文档内容是否与当前代码/依赖/结构匹配 |
| **质量** | 是否有空 section、TODO 标记、过期信息 |

**输出报告：**
```
## 文档体系审计报告

### ✅ 通过 (N 项)
- CLAUDE.md 结构完整
- ...

### ⚠️ 需要注意 (N 项)
- architecture.md 中引用了 D008 但 decisions.md 中没有
- progress.md 的模块 M-003 状态为"未开始"但代码中已有实现
- ...

### ❌ 需要修复 (N 项)
- CLAUDE.md 的 Project Structure 缺少 new-module/ 目录
- ...
```

---

## 关键原则

1. **规范先行** — 文档是项目的核心设计产物，不是补充材料
2. **不写废话** — 每一行都应该对 Agent 或开发者有信息增量。不写"本项目采用业界最佳实践"这种空话
3. **已有项目要尊重现状** — 读懂代码再写文档，不生成与现有代码矛盾的内容
4. **宁少勿多** — 文档不适用就不生成。api-spec.md 对纯前端项目无意义
5. **留有余地** — 不确定的部分标注 `<!-- TODO: 待确认 -->`，不瞎编
6. **编号即契约** — D001、M-001 等编号一旦分配不可变更，只可追加
7. **交叉引用即验证** — 文档间的引用关系是一致性的天然校验手段
8. **模板是起点不是终点** — templates/ 提供结构参考，实际内容必须基于项目定制

---

## 多语言模板

模板目录结构：
```
templates/
├── *.md            ← 中文模板（默认）
└── en/
    └── *.md        ← English templates
```

根据 Phase 1 的语言检测结果选择对应模板。如果项目以英文为主，读取 `templates/en/` 目录。

---

## 工作流集成

init-project 在更大的开发循环中的位置：

```
/init-project → /brainstorm → /plan → 开发 → /init-project update
      ↑                                              ↓
      └──────── /init-project audit ◄─────────────────┘
```

**与其他 skill 的关系：**
- **在 brainstorming 之前运行** — 为创意探索提供项目上下文
- **在 plan 之前运行** — 为实施规划提供需求和架构基础
- **在代码变更后运行 update** — 保持文档与代码同步
- **在发版前运行 audit** — 确保文档一致性

---

## 自动触发建议

当检测到以下条件时，Agent 应主动建议用户运行此 skill：

| 条件 | 建议 |
|------|------|
| 项目无 CLAUDE.md | "建议运行 /init-project 生成文档体系" |
| CLAUDE.md 存在但无 docs/ 目录 | "建议运行 /init-project 补全规范文档" |
| 最近 10 次 commit 但 progress.md 未更新 | "建议运行 /init-project update 同步进度" |
| 用户问"项目结构是什么" | "可以运行 /init-project 生成完整的架构文档" |
