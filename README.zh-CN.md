# Spec-Driven Init

**别急着写代码，先把设计搞清楚。**

[![MIT License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Platforms](https://img.shields.io/badge/platforms-Claude%20Code%20%7C%20Cursor%20%7C%20Codex-blue.svg)](#跨平台)
[![Skills](https://img.shields.io/badge/npx%20skills-add-orange.svg)](#安装)

大多数脚手架工具先吐一堆模板再让你删。这个 skill **先跟你聊** — 4-8 个问题理解你的项目，然后生成一套交叉引用的完整文档体系，让每一次 AI 对话都从满血状态开始。

```
一个命令。五个问题。七份文档。
```

## 前后对比

```
之前:                                之后:
.                                    .
├── src/                             ├── CLAUDE.md          ← Agent 入职手册
├── package.json                     ├── DESIGN.md          ← 设计系统 token
└── (AI 每次都在猜你的项目)            ├── progress.md        ← 跨 session 记忆
                                     ├── docs/
                                     │   ├── requirements.md ← 做什么 (M-001...)
                                     │   ├── architecture.md ← 怎么搭
                                     │   ├── api-spec.md     ← 接口契约
                                     │   └── decisions.md    ← 为什么选 X (D001...)
                                     ├── src/
                                     └── package.json
```

**区别：** 没有规范文档，AI 每次从零开始。有了规范文档，它第一行就有完整上下文。

## 安装

```bash
# 推荐 — npx skills
npx skills add sajiner90/init-project

# 一键脚本
curl -fsSL https://raw.githubusercontent.com/sajiner90/init-project/main/install.sh | bash

# 手动
git clone https://github.com/sajiner90/init-project.git ~/.claude/skills/init-project
```

支持 Claude Code / Cursor / Codex 多平台。

## 使用

```bash
/init-project            # 完整初始化
/init-project update     # 增量更新
/init-project audit      # 一致性审计
```

## 工作流程

```
检测项目 → 对话探查(4-8轮) → 确认理解[必须] → 生成文档(7份) → 校验一致性
```

**Hard Gate：** 不理解不输出。确认后才生成。

## 生成文档质量评分

```
文档质量: 87/100
✅ 交叉引用一致     (20/20)
✅ 验收标准可测试   (18/20)
⚠️ 架构图缺数据流   (12/20)
✅ 决策含替代方案   (18/20)
⚠️ 暗色模式未定义   (19/20)
```

## 工作流集成

```
/init-project → /brainstorm → /plan → 开发 → /init-project update
      ↑                                              ↓
      └──────── /init-project audit ◄─────────────────┘
```

## 示例

[`examples/yoga-ai-companion/`](examples/yoga-ai-companion/) — AI 瑜伽语音伴侣的完整文档输出。

## 协议

MIT
