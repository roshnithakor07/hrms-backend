# syntax=docker/dockerfile:1
# HRMS backend (NestJS + TypeORM + PostgreSQL)
#
# Build:  docker build -t hrms-backend .
# Run:    docker run --env-file .env -p 3000:3000 hrms-backend
#
# On start the container runs pending TypeORM migrations, then starts the API.
# Set RUN_MIGRATIONS=false to skip them (e.g. when a separate job runs them).

# ── Stage 1: Build ──────────────────────────────────────────
FROM node:22-alpine AS builder
# python3/make/g++ are needed to compile bcrypt's native binding
RUN apk add --no-cache python3 make g++
WORKDIR /app
COPY package*.json ./
RUN if [ -f package-lock.json ]; then npm ci; else npm install; fi
COPY . .
RUN npm run build && npm prune --omit=dev

# ── Stage 2: Production image ───────────────────────────────
FROM node:22-alpine AS production
RUN addgroup -g 1001 -S nodejs && adduser -S nestjs -u 1001 -G nodejs
WORKDIR /app

COPY --from=builder --chown=nestjs:nodejs /app/dist ./dist
COPY --from=builder --chown=nestjs:nodejs /app/node_modules ./node_modules
COPY --from=builder --chown=nestjs:nodejs /app/package.json ./package.json
COPY --chown=nestjs:nodejs --chmod=755 docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

# Writable uploads dir for the non-root user
RUN mkdir -p /app/uploads && chown nestjs:nodejs /app/uploads

USER nestjs
EXPOSE 3000
ENV NODE_ENV=production \
    PORT=3000 \
    RUN_MIGRATIONS=true

# start-period covers migration time on first boot
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD wget -qO- http://127.0.0.1:3000/api/v1/health || exit 1

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["node", "dist/main"]
