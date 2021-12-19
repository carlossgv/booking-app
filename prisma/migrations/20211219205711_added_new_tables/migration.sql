/*
  Warnings:

  - The primary key for the `Location` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `Location` table. All the data in the column will be lost.
  - You are about to alter the column `locationType` on the `Location` table. The data in that column could be lost. The data in that column will be cast from `Enum("Location_locationType")` to `Enum("Location_locationType")`.
  - A unique constraint covering the columns `[name]` on the table `Location` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `userType` to the `Location` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `Location_name_email_key` ON `Location`;

-- AlterTable
ALTER TABLE `Location` DROP PRIMARY KEY,
    DROP COLUMN `id`,
    ADD COLUMN `isActive` BOOLEAN NOT NULL DEFAULT true,
    ADD COLUMN `locationId` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `userType` ENUM('Patient', 'Client', 'Guest') NOT NULL,
    MODIFY `locationType` ENUM('Restaurant', 'Bar', 'Cafe', 'Gym', 'Other') NOT NULL DEFAULT 'Other',
    ADD PRIMARY KEY (`locationId`);

-- CreateTable
CREATE TABLE `Company` (
    `companyId` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `address` VARCHAR(191) NULL,
    `email` VARCHAR(191) NULL,

    PRIMARY KEY (`companyId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `User` (
    `LocationUserId` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,
    `locationId` INTEGER NOT NULL,
    `isActive` BOOLEAN NOT NULL,
    `companyCompanyId` INTEGER NULL,

    PRIMARY KEY (`LocationUserId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Reservation` (
    `reservationId` INTEGER NOT NULL AUTO_INCREMENT,
    `date` DATETIME(3) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `locationId` INTEGER NOT NULL,
    `userLocationUserId` INTEGER NOT NULL,
    `scheduleScheduleId` INTEGER NULL,
    `userId` INTEGER NOT NULL,

    PRIMARY KEY (`reservationId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Schedule` (
    `scheduleId` INTEGER NOT NULL AUTO_INCREMENT,
    `date` DATETIME(3) NOT NULL,
    `initialTime` INTEGER NOT NULL,
    `finishTime` INTEGER NOT NULL,
    `maxReservations` INTEGER NOT NULL,
    `repeatition` ENUM('None', 'Daily', 'Weekly', 'Monthly', 'Monday to Friday') NOT NULL DEFAULT 'None',
    `endDate` DATETIME(3) NULL,
    `locationLocationId` INTEGER NULL,

    PRIMARY KEY (`scheduleId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `Location_name_key` ON `Location`(`name`);

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `User_companyCompanyId_fkey` FOREIGN KEY (`companyCompanyId`) REFERENCES `Company`(`companyId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Reservation` ADD CONSTRAINT `Reservation_scheduleScheduleId_fkey` FOREIGN KEY (`scheduleScheduleId`) REFERENCES `Schedule`(`scheduleId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Reservation` ADD CONSTRAINT `Reservation_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`LocationUserId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Schedule` ADD CONSTRAINT `Schedule_locationLocationId_fkey` FOREIGN KEY (`locationLocationId`) REFERENCES `Location`(`locationId`) ON DELETE SET NULL ON UPDATE CASCADE;
