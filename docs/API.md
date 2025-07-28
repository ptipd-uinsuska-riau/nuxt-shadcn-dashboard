# 🔌 API Documentation

Template ini menyediakan struktur dasar untuk API endpoints menggunakan Nuxt 3 server routes dengan JavaScript.

## 📁 Struktur API

```
server/
├── api/
│   ├── auth/
│   │   ├── login.post.ts
│   │   ├── logout.post.ts
│   │   └── me.get.ts
│   ├── users/
│   │   ├── index.get.ts
│   │   ├── [id].get.ts
│   │   ├── [id].put.ts
│   │   └── [id].delete.ts
│   └── health.get.ts
└── middleware/
    ├── auth.ts
    └── cors.ts
```

## 🚀 Quick Start

### 1. Membuat API Route Baru

Buat file di folder `server/api/`:

```javascript
// server/api/hello.get.js
export default defineEventHandler(async (event) => {
  return {
    message: "Hello from API!",
    timestamp: new Date().toISOString(),
  };
});
```

### 2. Menggunakan API di Frontend

```vue
<script setup>
const { data } = await $fetch("/api/hello");
</script>

<template>
  <div>{{ data.message }}</div>
</template>
```

## 📋 Available Endpoints

### Health Check

```http
GET /api/health
```

**Response:**

```json
{
  "status": "ok",
  "timestamp": "2025-01-28T10:00:00.000Z",
  "version": "1.0.0"
}
```

### Authentication

#### Login

```http
POST /api/auth/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password123"
}
```

**Response:**

```json
{
  "success": true,
  "user": {
    "id": 1,
    "email": "user@example.com",
    "name": "John Doe"
  },
  "token": "jwt-token-here"
}
```

#### Get Current User

```http
GET /api/auth/me
Authorization: Bearer jwt-token-here
```

#### Logout

```http
POST /api/auth/logout
Authorization: Bearer jwt-token-here
```

### Users Management

#### Get All Users

```http
GET /api/users
Authorization: Bearer jwt-token-here
```

#### Get User by ID

```http
GET /api/users/123
Authorization: Bearer jwt-token-here
```

#### Update User

```http
PUT /api/users/123
Authorization: Bearer jwt-token-here
Content-Type: application/json

{
  "name": "Updated Name",
  "email": "updated@example.com"
}
```

#### Delete User

```http
DELETE /api/users/123
Authorization: Bearer jwt-token-here
```

## 🔒 Authentication & Authorization

### JWT Implementation

```javascript
// server/utils/jwt.js
import jwt from "jsonwebtoken";

export function generateToken(payload) {
  return jwt.sign(payload, process.env.JWT_SECRET, {
    expiresIn: "7d",
  });
}

export function verifyToken(token) {
  return jwt.verify(token, process.env.JWT_SECRET);
}
```

### Auth Middleware

```javascript
// server/middleware/auth.js
export default defineEventHandler(async (event) => {
  // Skip auth for public routes
  if (!event.node.req.url?.startsWith("/api/auth/")) {
    return;
  }

  const token =
    getCookie(event, "auth-token") ||
    getHeader(event, "authorization")?.replace("Bearer ", "");

  if (!token) {
    throw createError({
      statusCode: 401,
      statusMessage: "Unauthorized",
    });
  }

  try {
    const payload = verifyToken(token);
    event.context.user = payload;
  } catch (error) {
    throw createError({
      statusCode: 401,
      statusMessage: "Invalid token",
    });
  }
});
```

## 📊 Database Integration

### Prisma Setup

```javascript
// server/utils/db.js
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export default prisma;
```

### Example Model

```javascript
// server/api/users/index.get.js
import prisma from "~/server/utils/db";

export default defineEventHandler(async (event) => {
  const users = await prisma.user.findMany({
    select: {
      id: true,
      email: true,
      name: true,
      createdAt: true,
    },
  });

  return {
    users,
    total: users.length,
  };
});
```

## 🔧 Utilities

### Error Handling

```typescript
// server/utils/error.ts
export function handleError(error: any) {
  console.error("API Error:", error);

  if (error.code === "P2002") {
    throw createError({
      statusCode: 409,
      statusMessage: "Resource already exists",
    });
  }

  throw createError({
    statusCode: 500,
    statusMessage: "Internal server error",
  });
}
```

### Validation

```typescript
// server/utils/validation.ts
import { z } from "zod";

export const userSchema = z.object({
  name: z.string().min(2),
  email: z.string().email(),
  password: z.string().min(8),
});

export function validateBody(event: any, schema: z.ZodSchema) {
  const body = readBody(event);
  return schema.parse(body);
}
```

## 🧪 Testing

### API Testing dengan Vitest

```typescript
// tests/api/health.test.ts
import { describe, it, expect } from "vitest";
import { $fetch } from "@nuxt/test-utils";

describe("/api/health", () => {
  it("should return health status", async () => {
    const response = await $fetch("/api/health");

    expect(response).toMatchObject({
      status: "ok",
      timestamp: expect.any(String),
      version: expect.any(String),
    });
  });
});
```

## 📚 Best Practices

1. **Error Handling**: Selalu handle error dengan proper HTTP status codes
2. **Validation**: Validate input menggunakan Zod atau library serupa
3. **Authentication**: Implement proper JWT handling
4. **Rate Limiting**: Gunakan rate limiting untuk API endpoints
5. **Logging**: Log semua API requests dan errors
6. **Documentation**: Dokumentasikan semua endpoints
7. **Testing**: Write tests untuk semua API endpoints

## 🔗 External Resources

- [Nuxt 3 Server Routes](https://nuxt.com/docs/guide/directory-structure/server)
- [H3 Event Handler](https://h3.unjs.io/)
- [Prisma Documentation](https://www.prisma.io/docs)
- [Zod Validation](https://zod.dev/)
