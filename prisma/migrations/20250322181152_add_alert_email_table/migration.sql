/*
  Warnings:

  - You are about to drop the `NotificationSettings` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "NotificationSettings" DROP CONSTRAINT "NotificationSettings_userId_fkey";

-- AlterTable
ALTER TABLE "User" ALTER COLUMN "maxApiCallsPerHour" SET DEFAULT 25;

-- DropTable
DROP TABLE "NotificationSettings";

-- CreateTable
CREATE TABLE "AlertEmail" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "verificationToken" TEXT,
    "verificationPin" TEXT,
    "verificationExpires" TIMESTAMP(3),
    "verificationAttempts" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "AlertEmail_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "AlertEmail_userId_idx" ON "AlertEmail"("userId");

-- CreateIndex
CREATE INDEX "AlertEmail_status_idx" ON "AlertEmail"("status");

-- CreateIndex
CREATE UNIQUE INDEX "AlertEmail_userId_email_key" ON "AlertEmail"("userId", "email");

-- AddForeignKey
ALTER TABLE "AlertEmail" ADD CONSTRAINT "AlertEmail_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
