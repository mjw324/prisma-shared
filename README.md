A shared Prisma schema package used for eSentry, shared between the [Next.js frontend](https://github.com/mjw324/next-esentry) and [Node.js/Express.js backend](https://github.com/mjw324/next-esentry-nodejs). This package provides a common database schema definition for a single source of truth.

## Schema Overview

This schema includes models for:

- **Authentication** (User, Account, Session, VerificationToken)
- **Monitoring** (Monitor)
- **Alerts** (AlertEmail)

## Installation

```bash
# Using npm
npm install @mjw324/prisma-shared

# Using pnpm
pnpm add @mjw324/prisma-shared

# Using yarn
yarn add @mjw324/prisma-shared
```

## Usage

```typescript
import { prisma } from "@mjw324/prisma-shared";

export { prisma };
```

## Development Workflow

### Making Changes to the Schema

1. Edit the `prisma/schema.prisma` file
2. Generate the Prisma client:
   ```bash
   npx prisma generate
   ```
3. Commit your changes:
   ```bash
   git add .
   git commit -m "Description of your changes"
   ```

### Creating a Migration

```bash
npx prisma migrate dev --name descriptive_migration_name
```

### Publishing a New Version

1. Update version:

   ```bash
   npm version patch
   ```

2. Push changes to GitHub:

   ```bash
   git push origin main
   ```

3. Publish to npm:
   ```bash
   pnpm publish
   ```

## Models

### User

Central user model with authentication details and usage limits.

### Account

OAuth account connections for authentication.

### Session

User session management.

### VerificationToken

Email verification for authentication.

### Monitor

Monitoring configuration for tracking items with keywords, price ranges, and conditions.

### AlertEmail

Email notification settings for alerts.

## Environment Variables

Ensure your application has the following environment variable:

```
DATABASE_URL="postgresql://username:password@localhost:5432/databasename"
```

Note that this will also be needed at the base of this repository when making migrations.

## P1000 Error

```
Error: P1000: Authentication failed against database server at `localhost`, the provided database credentials for `postgres` are not valid.
```

If you get the above error while migrating, follow these steps:
Press Win + R to open the Run dialog, type services.msc, and press Enter.
In the Services window, locate postgresql\* in the list of services.
Right-click on it and select "Stop".
