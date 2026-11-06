# HRMS Backend (NestJS + PostgreSQL) - skeleton

Folder structure only. There are no business APIs yet (the single route is `GET /api/v1/health`).
Layout is based on the e-commerce reference project, with all e-commerce features removed.

## Run

```bash
npm run db:dev          # starts Postgres + Redis in Docker (or use your own Postgres / pgAdmin)
npm install
npm run start:dev       # http://localhost:3000/api/v1/health
```

If you use pgAdmin instead of Docker: create a database named `hrms_db` and update `DATABASE_URL` in `.env`.
`synchronize` is OFF (same as the reference), so tables come from migrations:

```bash
npm run migration:generate -- src/database/migrations/Init   # after you add entities
npm run migration:run
```

## Structure

```
src/
├── main.ts, app.module.ts
├── config/        one file per concern + env validation
├── common/        shared: constants, dto, filters, interceptors (+ empty decorators, pipes, utils, validators)
├── core/          technical building blocks, no business logic (placeholders)
│   ├── auth/  cache/  events/  logger/  queue/  storage/
├── database/      database module, base entity, data-source, migrations/, seeds/
├── health/        health check route
├── workers/       background-job entry points (empty)
└── modules/       one folder per HR feature, each with:
                   controllers/ services/ repositories/ entities/ dto/ mappers/ enums/ interfaces/
scripts/           db/ (one-off DB scripts), deploy/ (health-check.sh)
test/              e2e tests (empty)
```

## Feature modules (all empty)

Multi-tenant: every tenant-owned row carries `organization_id`, taken only from the access token
(`@CurrentOrganizationId()`), never from the request. Permissions are global; roles are per
organization. Platform super admins (`users.is_super_admin`) sit outside every organization; create
the first one with `SUPER_ADMIN_EMAIL=... SUPER_ADMIN_PASSWORD=... npm run seed:super-admin`.

| Module | Purpose | Reference module it replaces |
|---|---|---|
| auth, users, roles | login, accounts, permissions | auth, users, roles |
| organizations | tenants; managed by platform super admins | (new) |
| employees, departments, designations | core HR data | (new) |
| masters | `masters/generic`: simple lookup masters (qualification, document type, employment type, ...) in `master_types` + `master_items` via `/masters/:type`; add a type with one `master_types` row | master |
| attendance, leaves, holidays | time and absence | (new) |
| payroll | salary and payslips | orders / payment-requests (money flow) |
| documents | employee file uploads | uploads, gallery |
| notifications | email / in-app | notifications |
| settings | admin-editable settings | admin-settings |
| reports, dashboard | summaries and exports | reports, dashboard |
| audit-logs | change history | audit-log tables |

## Seeding branches

The joinee form's "Candidate Location" dropdown (`GET /masters/branches/dropdown`) needs these
branches: Ahmedabad, Ahmedabad Corporate Office, Ahmedabad Iskcon Hub, Surat SMF Hub, Gurgaon,
Hyderabad, Mehsana Hub, Pune, Panipat Mini Hub (list in `src/database/seeds/data/branches.data.ts`).
Branches are customer data, so they are loaded by a script, not a migration. Run it **once, after
the migrations** (and after `npm run seed:countries-states`):

```
npm run seed:branches
```

Options (after `--`):

| Option | Effect |
|---|---|
| `--org <organization-id>` | Seed this organization. Without it the only organization is used; with several, their ids and names are printed and nothing is written. |
| `--dry-run` | Print what would be inserted and write nothing. |
| `--force` | Needed when `NODE_ENV` is `production`; otherwise the script refuses to run. |

Insert-only and idempotent: a branch whose name already exists in the organization (any case) is
skipped, nothing is updated or deleted, so running it again inserts nothing. The summary lists what
was inserted, what was skipped, and any branch skipped because its state or country was not found.
The address is a placeholder: edit the branches in the app afterwards.

## Seeding candidates

Sample candidate profiles (12, list in `src/database/seeds/data/candidates.data.ts`) for the
candidate form. Run after the migrations, `seed:org-masters` and `seed:branches` (and
`seed:employees` for the reporting managers):

```
npm run seed:candidates                  # the Smile Off-Role entity
npm run seed:candidates -- <entity-id>   # another entity
```

Idempotent: a candidate whose email already exists in the organization is skipped. A missing
department, designation or branch stops the run (nothing is written); a missing gender, salary
structure or reporting manager is left empty with a warning.

## Core placeholders: what to install when you build them

| core/ folder | Install |
|---|---|
| auth | `@nestjs/jwt @nestjs/passport passport passport-jwt` (+ `@types/passport-jwt`) |
| cache | `ioredis` |
| events | `@nestjs/event-emitter` |
| logger | `nestjs-pino pino-http` |
| queue | `bullmq @nestjs/bullmq` |
| storage | `@fastify/multipart` (+ `@google-cloud/storage` for cloud) |

## Rules to keep

- Modules use each other through exported services, never by importing another module's entities.
- `core/` and `common/` never import from `modules/`.
- Config values are read in `config/` only; code uses `ConfigService`.
