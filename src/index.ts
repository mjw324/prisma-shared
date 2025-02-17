import { PrismaClient } from '@prisma/client'

// Export a singleton instance instead of a factory
const prisma = new PrismaClient();
export { prisma }

// Also export types
export * from '@prisma/client'