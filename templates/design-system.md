# Template: DESIGN.md

> 视觉设计系统。所有 UI 决策的唯一真相源。仅含 UI 的项目需要。

---

## 结构

```markdown
# Design System — {项目名称}

> Single source of truth for all visual decisions.
> Last updated: {日期}

## Brand Identity
**调性：** {3-5 个关键词描述视觉风格}
**Voice：** {交互文案的语气风格}
**视觉关键词：** {风格方向}
**差异化：** {与竞品/参考产品的视觉区分点}

## Typography

### Font Families
| 角色 | 字体 | 回退栈 | 字重 | 用途 |
|------|------|--------|------|------|
| Heading | {字体} | {回退} | {字重范围} | 标题 |
| Body | {字体} | {回退} | {字重范围} | 正文 |

### Type Scale
| 级别 | 大小 | 字重 | 行高 | 用途 |
|------|------|------|------|------|
| Display | {px} | {weight} | {lh} | 大标题 |
| H1 | ... | ... | ... | 页面标题 |
| H2 | ... | ... | ... | 区块标题 |
| Body | ... | ... | ... | 正文 |
| Small | ... | ... | ... | 辅助文字 |

## Color Palette

### Semantic Tokens
| Token | Light Mode | Dark Mode | 用途 |
|-------|-----------|-----------|------|
| `--color-primary` | #XXXXXX | #XXXXXX | 主操作 |
| `--color-secondary` | #XXXXXX | #XXXXXX | 次要操作 |
| `--color-accent` | #XXXXXX | #XXXXXX | 高亮 |
| `--color-success` | #XXXXXX | #XXXXXX | 成功 |
| `--color-warning` | #XXXXXX | #XXXXXX | 警告 |
| `--color-error` | #XXXXXX | #XXXXXX | 错误 |

### Neutral Scale
| Token | Light Mode | Dark Mode | 用途 |
|-------|-----------|-----------|------|
| `--color-bg-primary` | #XXXXXX | #XXXXXX | 页面背景 |
| `--color-bg-secondary` | #XXXXXX | #XXXXXX | 卡片背景 |
| `--color-text-primary` | #XXXXXX | #XXXXXX | 标题/正文 |
| `--color-text-secondary` | #XXXXXX | #XXXXXX | 说明文字 |
| `--color-border` | #XXXXXX | #XXXXXX | 边框 |

## Spacing
基准单位：**{N}px**
| Token | 值 | 用途 |
|-------|-----|------|
| `--space-1` | {N}px | 最小间距 |
| ... | | |

## Visual Properties

### Border Radius
| Token | 值 | 用途 |
|-------|-----|------|
| `--radius-sm` | {N}px | 小元素 |
| `--radius-md` | {N}px | 按钮/输入框 |
| `--radius-lg` | {N}px | 卡片 |

### Shadows
| Token | 值 | 用途 |
|-------|-----|------|
| `--shadow-sm` | {value} | 微弱抬升 |
| `--shadow-md` | {value} | 卡片 |
| `--shadow-lg` | {value} | 浮层 |

## Motion
**哲学：** {一句话描述动画风格}

### Easing
| 用途 | 函数 |
|------|------|
| Enter | `cubic-bezier(...)` |
| Exit | `cubic-bezier(...)` |
| Move | `cubic-bezier(...)` |

### Duration
| 级别 | 时长 | 用途 |
|------|------|------|
| Micro | {N}ms | 即时反馈 |
| Short | {N}ms | 悬浮效果 |
| Medium | {N}ms | 状态变化 |
| Long | {N}ms | 页面过渡 |

## Layout
| 属性 | 值 |
|------|-----|
| 最大宽度 | {value} |
| 页面边距 | {value} |
| 断点 | sm:{px} / md:{px} / lg:{px} |

## Component Patterns

### Button
| 变体 | 背景 | 文字 | 用途 |
|------|------|------|------|
| Primary | `--color-primary` | `--color-text-inverse` | 主操作 |
| Secondary | ... | ... | 次要操作 |
| Ghost | transparent | `--color-text-secondary` | 辅助操作 |

### Card
（背景 / 边框 / 圆角 / 悬浮效果）

## Token Files
| 文件 | 作用 |
|------|------|
| `{path/to/tokens.css}` | CSS custom properties |
| `{tailwind.config.js}` | Tailwind 映射 |

**规则：** 永远不在组件中硬编码颜色值。一律使用 token。

## Decisions Log
| Date | Decision | Rationale |
|------|----------|-----------|
```

---

## 写作指南

**做：**
- 每个 token 给出具体值（hex、px、贝塞尔曲线）
- 解释设计决策的理由（"选 Noto 是因为 CJK 支持最好"）
- 包含暗色模式的对应值
- 列出 token 的 CSS variable 名（方便直接在代码中使用）

**不做：**
- 不写"颜色待定" — 要么给推荐值，要么标注依赖
- 不只列颜色名不给用途 — 每个 token 必须说明场景
- 不混入代码实现 — 这是设计规范，不是组件文档
- 不脱离项目上下文推荐配色 — 要基于品牌调性

**不同项目类型的建议：**
- **工具/SaaS**：中性色为主 + 一个品牌色。参考 Linear、Notion
- **消费产品**：情感色彩更强。参考 Spotify、Duolingo
- **健康/身心**：自然大地色。参考 Calm、Headspace
- **开发者工具**：暗色优先 + 高对比。参考 GitHub、VS Code
