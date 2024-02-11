-- CreateTable
CREATE TABLE `Customer` (
    `customer_id` INTEGER NOT NULL AUTO_INCREMENT,
    `role` ENUM('User', 'Admin') NOT NULL,
    `first_name` VARCHAR(191) NOT NULL,
    `last_name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `phone` VARCHAR(191) NOT NULL,
    `address` VARCHAR(191) NULL,
    `username` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`customer_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Order` (
    `order_id` INTEGER NOT NULL AUTO_INCREMENT,
    `total_amount` INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY (`order_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OrderItems` (
    `orderitem_id` INTEGER NOT NULL AUTO_INCREMENT,
    `quantity` INTEGER NOT NULL DEFAULT 0,
    `subtotal` INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY (`orderitem_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Cart` (
    `cart_id` INTEGER NOT NULL AUTO_INCREMENT,
    `cart_quantity` INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY (`cart_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Genres` (
    `genres_id` INTEGER NOT NULL AUTO_INCREMENT,
    `genre_name` ENUM('Everycategory') NOT NULL DEFAULT 'Everycategory',

    PRIMARY KEY (`genres_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Book` (
    `book_id` INTEGER NOT NULL AUTO_INCREMENT,
    `book_name` VARCHAR(191) NOT NULL,
    `author` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NOT NULL DEFAULT 'description',
    `price` INTEGER NOT NULL,
    `stock_quantity` INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY (`book_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Payments` (
    `payments` INTEGER NOT NULL AUTO_INCREMENT,
    `payment_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `payment_method` VARCHAR(191) NOT NULL,
    `amount` INTEGER NOT NULL,

    PRIMARY KEY (`payments`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ShippingInformation` (
    `shipping_id` INTEGER NOT NULL AUTO_INCREMENT,
    `recipient_name` VARCHAR(191) NOT NULL,
    `shipping_address` VARCHAR(191) NOT NULL,
    `phone` INTEGER NOT NULL,
    `shipping_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `estimated_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `shipping_status` ENUM('SHIPPED', 'IN_TRANSIT', 'DELIVERED') NOT NULL DEFAULT 'SHIPPED',

    PRIMARY KEY (`shipping_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
