/*
  Warnings:

  - You are about to drop the column `comment` on the `review` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "review" DROP COLUMN "comment",
ADD COLUMN     "text" TEXT;
