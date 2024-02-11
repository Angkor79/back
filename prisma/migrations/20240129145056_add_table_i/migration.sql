/*
  Warnings:

  - The primary key for the `book` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `book_id` on the `book` table. All the data in the column will be lost.
  - The primary key for the `cart` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `cart_id` on the `cart` table. All the data in the column will be lost.
  - The primary key for the `genres` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `genres_id` on the `genres` table. All the data in the column will be lost.
  - The primary key for the `order` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `order_id` on the `order` table. All the data in the column will be lost.
  - The primary key for the `orderitems` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `orderitem_id` on the `orderitems` table. All the data in the column will be lost.
  - You are about to alter the column `payment_method` on the `payments` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Enum(EnumId(2))`.
  - The primary key for the `shippinginformation` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `shipping_id` on the `shippinginformation` table. All the data in the column will be lost.
  - You are about to drop the `customer` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[user_id]` on the table `Cart` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[order_id]` on the table `Payments` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[order_id]` on the table `ShippingInformation` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `genreId` to the `Book` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `Book` table without a default value. This is not possible if the table is not empty.
  - Added the required column `book_id` to the `Cart` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `Cart` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `Cart` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `Genres` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `Order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `Order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `book_id` to the `OrderItems` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `OrderItems` table without a default value. This is not possible if the table is not empty.
  - Added the required column `order_id` to the `OrderItems` table without a default value. This is not possible if the table is not empty.
  - Added the required column `order_id` to the `Payments` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `ShippingInformation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `order_id` to the `ShippingInformation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `ShippingInformation` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `book` DROP PRIMARY KEY,
    DROP COLUMN `book_id`,
    ADD COLUMN `genreId` INTEGER NOT NULL,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `cart` DROP PRIMARY KEY,
    DROP COLUMN `cart_id`,
    ADD COLUMN `book_id` INTEGER NOT NULL,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `user_id` INTEGER NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `genres` DROP PRIMARY KEY,
    DROP COLUMN `genres_id`,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `order` DROP PRIMARY KEY,
    DROP COLUMN `order_id`,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `order_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `user_id` INTEGER NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `orderitems` DROP PRIMARY KEY,
    DROP COLUMN `orderitem_id`,
    ADD COLUMN `book_id` INTEGER NOT NULL,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `order_id` INTEGER NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `payments` ADD COLUMN `order_id` INTEGER NOT NULL,
    MODIFY `payment_method` ENUM('Pay_on_delivery', 'Bank') NOT NULL;

-- AlterTable
ALTER TABLE `shippinginformation` DROP PRIMARY KEY,
    DROP COLUMN `shipping_id`,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `order_id` INTEGER NOT NULL,
    ADD COLUMN `user_id` INTEGER NOT NULL,
    ADD PRIMARY KEY (`id`);

-- DropTable
DROP TABLE `customer`;

-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `role` ENUM('User', 'Admin') NOT NULL,
    `first_name` VARCHAR(191) NOT NULL,
    `last_name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `phone` VARCHAR(191) NOT NULL,
    `address` VARCHAR(191) NULL,
    `username` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `Cart_user_id_key` ON `Cart`(`user_id`);

-- CreateIndex
CREATE UNIQUE INDEX `Payments_order_id_key` ON `Payments`(`order_id`);

-- CreateIndex
CREATE UNIQUE INDEX `ShippingInformation_order_id_key` ON `ShippingInformation`(`order_id`);

-- AddForeignKey
ALTER TABLE `Order` ADD CONSTRAINT `Order_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderItems` ADD CONSTRAINT `OrderItems_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `Order`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderItems` ADD CONSTRAINT `OrderItems_book_id_fkey` FOREIGN KEY (`book_id`) REFERENCES `Book`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Cart` ADD CONSTRAINT `Cart_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Cart` ADD CONSTRAINT `Cart_book_id_fkey` FOREIGN KEY (`book_id`) REFERENCES `Book`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Book` ADD CONSTRAINT `Book_genreId_fkey` FOREIGN KEY (`genreId`) REFERENCES `Genres`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Payments` ADD CONSTRAINT `Payments_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `Order`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ShippingInformation` ADD CONSTRAINT `ShippingInformation_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ShippingInformation` ADD CONSTRAINT `ShippingInformation_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `Order`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
