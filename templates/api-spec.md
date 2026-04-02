# Template: docs/api-spec.md

> API 规范。仅后端/全栈项目需要。纯前端/CLI/库项目跳过。

---

## 结构

```markdown
# API 规范

## 概览

| 属性 | 值 |
|------|-----|
| Base URL | `{base_url}` |
| 认证方式 | {Bearer Token / API Key / Session / None} |
| 内容类型 | `application/json` |
| 版本策略 | {URL path / Header / None (MVP)} |

## 通用响应格式

### 成功
```json
{
  "success": true,
  "data": { }
}
```

### 错误
```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "human-readable message"
  }
}
```

## 错误码

| Code | HTTP Status | 说明 |
|------|------------|------|
| `VALIDATION_ERROR` | 400 | 请求参数不合法 |
| `UNAUTHORIZED` | 401 | 未认证 |
| `FORBIDDEN` | 403 | 无权限 |
| `NOT_FOUND` | 404 | 资源不存在 |
| `INTERNAL_ERROR` | 500 | 服务器内部错误 |
| {自定义错误码} | {status} | {说明} |

## 接口列表

### {模块名} — M-{编号}

#### {METHOD} {path}
**描述：** {接口做什么}
**请求：**
```json
{
  "field": "type — 说明"
}
```
**成功响应：**
```json
{
  "success": true,
  "data": { }
}
```
**错误场景：**
- `VALIDATION_ERROR` — 当 {条件}
- `NOT_FOUND` — 当 {条件}
```

---

## 写作指南

**做：**
- 模块编号对应 requirements.md 的 M-编号
- 每个接口给出请求/响应的 JSON 示例
- 列出可能的错误场景
- 标注哪些接口需要认证

**不做：**
- 不列出所有 CRUD — 只列非显而易见的接口
- 不写实现细节 — 这是接口契约，不是代码
- 不过度设计 — MVP 阶段不需要版本控制、限流、分页的复杂设计

**何时跳过此文件：**
- 纯前端项目（无自建 API）
- CLI 工具 / 库
- 仅消费第三方 API（在 requirements.md 的外部依赖中记录即可）

---

## 真实案例片段

```markdown
### 问诊模块 — M-001

#### POST /api/checkin
**描述：** 提交用户问诊对话，获取 AI 评估结果
**认证：** 需要
**请求：**
```json
{
  "messages": [
    { "role": "user", "content": "我肩膀酸痛，久坐办公室" }
  ],
  "sessionId": "uuid"
}
```
**成功响应：**
```json
{
  "success": true,
  "data": {
    "assessment": {
      "level": "beginner",
      "conditions": ["shoulder_tension", "sedentary"],
      "contraindications": ["sirsasana"]
    },
    "reply": "了解了，我们来安排一些针对肩颈的练习..."
  }
}
```
**错误场景：**
- `VALIDATION_ERROR` — messages 为空
- `INTERNAL_ERROR` — LLM 服务不可用
```
