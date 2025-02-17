import { prisma } from './index'

async function testConnection() {
  try {
    // Test the connection
    await prisma.$connect()
    console.log('✅ Successfully connected to database')

    const userCount = await prisma.user.count()
    console.log(`Found ${userCount} users in database`)

  } catch (error) {
    console.error('❌ Database connection failed:', error)
  } finally {
    await prisma.$disconnect()
  }
}

testConnection()
