import { PrismaClient } from '@prisma/client'

// Create single instance
const prisma = new PrismaClient()

// Export the singleton instance
export { prisma }

// Export types
export * from '@prisma/client'
