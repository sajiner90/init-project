# Spec-Driven Init — 规范文档驱动的项目初始化

> 通过自然对话，为任意项目生成一套完整的规范文档体系。专为 [Claude Code](https://docs.anthropic.com/en/docs/claude-code) 打造。

**核心理念：规范文档替代代码成为设计中心。More Context, Less Control.**

大多数脚手架工具先吐一堆文件再让你改。这个 skill 先跟你聊，理解你的项目后再生成。

## 生成什么

| 文件 | 用途 | 适用项目 |
|------|------|---------|
| `CLAUDE.md` | Agent 入职手册 — 技术栈、结构、开发规范 | 所有项目 |
| `DESIGN.md` | 视觉设计系统 — 色彩、字体、间距、动效 | 有 UI 的项目 |
| `docs/requirements.md` | 需求规范 — 功能模块、验收标准、优先级 | 所有项目 |
| `docs/architecture.md` | 架构设计 — 模块职责、数据流、技术决策 | 所有项目 |
| `docs/api-spec.md` | API 规范 — 接口定义、请求/响应格式 | 后端/全栈 |
| `progress.md` | 进度跟踪 — 模块状态、最近更新 | 所有项目 |
| `docs/decisions.md` | 决策记录 — 选了什么、为什么、拒绝了什么 | 所有项目 |

## 工作流程

```
检测项目 → 对话探查 → 确认理解 → 生成文档 → 校验审阅
```

### 三种模式

| 命令 | 模式 | 使用场景 |
|------|------|---------|
| `/init-project` | **初始化** | 首次生成文档体系 |
| `/init-project update` | **更新** | 代码变化后同步文档 |
| `/init-project audit` | **审计** | 检查文档间一致性 |

## 安装

```bash
# 一键安装
curl -fsSL https://raw.githubusercontent.com/sajiner90/init-project/main/install.sh | bash

# 或手动安装
git clone https://github.com/sajiner90/init-project.git ~/.claude/skills/init-project
```

## 使用

```bash
# 新项目
mkdir my-app && cd my-app && git init
claude
> /init-project

# 已有项目
cd my-existing-app
claude
> /init-project

# 更新文档
> /init-project update

# 审计一致性
> /init-project audit
```

## 设计决策

- **Hard Gate** — 不理解不输出。对话确认后才生成文档
- **交叉引用编号** — M-001（模块）、D001（决策）贯穿所有文档
- **条件生成** — CLI 不生成 DESIGN.md，纯前端不生成 api-spec.md
- **语言自适应** — 自动检测项目语言偏好（中/英）

## 模板

`templates/` 目录包含每种文档的结构指南、写作规范和真实案例。模板是参考不是限制，实际内容基于项目定制。

## 示例

查看 [`examples/yoga-ai-companion/`](examples/yoga-ai-companion/) — 一个基于 Next.js + Claude Agent SDK + 火山引擎 RTC 的 AI 瑜伽语音伴侣的完整文档输出。

## 协议

MIT
