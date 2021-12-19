/*
  Warnings:

  - You are about to drop the column `description` on the `Location` table. All the data in the column will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `companyCompanyId` to the `Location` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Reservation` DROP FOREIGN KEY `Reservation_userId_fkey`;

-- DropForeignKey
ALTER TABLE `User` DROP FOREIGN KEY `User_companyCompanyId_fkey`;

-- AlterTable
ALTER TABLE `Location` DROP COLUMN `description`,
    ADD COLUMN `companyCompanyId` INTEGER NOT NULL;

-- DropTable
DROP TABLE `User`;

-- CreateTable
CREATE TABLE `LocationUser` (
    `locationUserId` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,
    `isActive` BOOLEAN NOT NULL,
    `locationLocationId` INTEGER NOT NULL,

    PRIMARY KEY (`locationUserId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CompanyUser` (
    `companyUserId` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,
    `isActive` BOOLEAN NOT NULL,
    `companyCompanyId` INTEGER NOT NULL,

    UNIQUE INDEX `CompanyUser_userId_key`(`userId`),
    PRIMARY KEY (`companyUserId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Location` ADD CONSTRAINT `Location_companyCompanyId_fkey` FOREIGN KEY (`companyCompanyId`) REFERENCES `Company`(`companyId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `LocationUser` ADD CONSTRAINT `LocationUser_locationLocationId_fkey` FOREIGN KEY (`locationLocationId`) REFERENCES `Location`(`locationId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CompanyUser` ADD CONSTRAINT `CompanyUser_companyCompanyId_fkey` FOREIGN KEY (`companyCompanyId`) REFERENCES `Company`(`companyId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Reservation` ADD CONSTRAINT `Reservation_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `LocationUser`(`locationUserId`) ON DELETE RESTRICT ON UPDATE CASCADE;
