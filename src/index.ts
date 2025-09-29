import { PrismaClient } from '@prisma/client'
import { withAccelerate } from '@prisma/extension-accelerate'

// Create single instance with Accelerate extension for connection pooling
const prisma = new PrismaClient().$extends(withAccelerate())

// Export the singleton instance
export { prisma }

// Export types
export * from '@prisma/client'
