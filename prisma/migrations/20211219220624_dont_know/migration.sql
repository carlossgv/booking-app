-- AlterTable
ALTER TABLE `Location` MODIFY `userType` ENUM('Patient', 'Client', 'Guest') NOT NULL DEFAULT 'Client';
