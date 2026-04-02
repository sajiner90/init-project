# Design System — Iyengar AI Voice Companion

> Single source of truth. Last updated: 2026-04-01

## Brand Identity
**调性：** 禅意自然 — 沉稳、安静、有呼吸感。像清晨林间的瑜伽练习。
**Voice：** 专业而温和，不说教。用平静的语气传递知识，给予空间。
**差异化：** 衬线字体 + 大地色系，传达瑜伽经典传承感。区别于 Calm（暗蓝）/ Headspace（橙色）/ Down Dog（白底）。

## Typography

| 角色 | 字体 | 回退 | 字重 | 用途 |
|------|------|------|------|------|
| Heading | Noto Serif SC | Georgia, serif | 500-700 | 标题、体式名 |
| Body | Noto Sans SC | system-ui, sans-serif | 300-500 | 正文、UI 标签 |

### Type Scale
| 级别 | 大小 | 字重 | 行高 | 用途 |
|------|------|------|------|------|
| Display | 32px | 700 | 1.2 | 首页大标题 |
| H1 | 28px | 600 | 1.3 | 页面标题 |
| H2 | 22px | 600 | 1.3 | 区块标题 |
| Body | 15px | 400 | 1.7 | 正文 |
| Small | 13px | 400 | 1.5 | 辅助文字 |
| Pose Name | 36px+ | 700 | 1.2 | 练习中体式名（1-2m 可读） |
| Timer | 48px+ | 300 | 1 | 练习计时器 |

## Color Palette

### Semantic Tokens
| Token | Light | Dark | 用途 |
|-------|-------|------|------|
| `--color-primary` | #5B8A72 | #7DB892 | 主操作（鼠尾草绿） |
| `--color-secondary` | #8B7D6B | #A89A88 | 次要操作（暖灰棕） |
| `--color-accent` | #C4956A | #D4A97E | 高亮（赤陶色） |
| `--color-success` | #5B8A72 | #7DB892 | 成功 = primary |
| `--color-warning` | #D4A574 | #E0B888 | 警告 |
| `--color-error` | #C75C5C | #E07A7A | 错误 |

### Neutral Scale
| Token | Light | Dark | 用途 |
|-------|-------|------|------|
| `--color-bg-primary` | #FAFAF7 | #1A1A18 | 页面底色 |
| `--color-bg-secondary` | #F3F1EC | #252522 | 卡片底色 |
| `--color-text-primary` | #2C2C2A | #EDEDE8 | 标题/正文 |
| `--color-text-secondary` | #5C5C58 | #A0A09A | 说明文字 |
| `--color-border` | #DDD9D0 | #3D3D38 | 边框 |

### Dark Mode
- 仅练习页使用暗色（`.practice-mode` class 切换）
- 其他页面固定亮色

## Spacing
基准：**4px**

| Token | 值 | 用途 |
|-------|-----|------|
| `--space-2` | 8px | 紧凑间距 |
| `--space-4` | 16px | 卡片内边距 |
| `--space-6` | 24px | 区块内边距 |
| `--space-8` | 32px | 区块间距 |

## Motion
**哲学：** 呼吸节奏 — 所有动画像一次呼气，不弹跳。

| 级别 | 时长 | 用途 |
|------|------|------|
| Micro | 75ms | 按钮反馈 |
| Short | 200ms | 悬浮效果 |
| Medium | 300ms | 状态变化 |
| Long | 500ms | 页面过渡 |

## Component Patterns

### Button
| 变体 | 背景 | 文字 | 用途 |
|------|------|------|------|
| Primary | `--color-primary` | `--color-text-inverse` | 主操作 |
| Secondary | `--color-primary-light` | `--color-primary` | 次要操作 |
| Ghost | transparent | `--color-text-secondary` | 辅助操作 |

## Decisions Log
| Date | Decision | Rationale |
|------|----------|-----------|
| 2026-03-27 | Serif + earth tones | 与竞品的 sans-serif/pastel 风格差异化 |
| 2026-04-01 | Noto Serif/Sans SC | CJK 最佳 Google Font |
| 2026-04-01 | Sage green #5B8A72 | 与知识库后台统一品牌色 |
