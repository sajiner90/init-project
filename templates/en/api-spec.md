# Template: docs/api-spec.md

> API specification. Only for backend/fullstack projects. Skip for frontend/CLI/libraries.

---

## Structure

```markdown
# API Specification

## Overview
| Property | Value |
|----------|-------|
| Base URL | `{base_url}` |
| Auth | {Bearer Token / API Key / Session / None} |
| Content Type | `application/json` |

## Response Format
### Success
```json
{ "success": true, "data": {} }
```
### Error
```json
{ "success": false, "error": { "code": "ERROR_CODE", "message": "..." } }
```

## Error Codes
| Code | HTTP Status | Description |
|------|------------|-------------|

## Endpoints

### {Module} — M-{number}

#### {METHOD} {path}
**Description:** ...
**Request:**
```json
{}
```
**Response:**
```json
{}
```
**Errors:** ...
```

---

## Writing Guide

**Do:**
- Match module IDs to requirements.md M-numbers
- Give JSON examples for request/response
- List possible error scenarios
- Mark which endpoints require auth

**Don't:**
- Don't list all CRUD — only non-obvious endpoints
- Don't include implementation details — this is a contract
- Don't over-design — MVP doesn't need versioning, rate limiting, or pagination

**When to skip:** Pure frontend, CLI tools, libraries, or projects that only consume third-party APIs.
