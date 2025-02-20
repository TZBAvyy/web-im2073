DROP DATABASE IF EXISTS `im2073_db`;
CREATE DATABASE `im2073_db`;

USE `im2073_db`;

CREATE TABLE `Memes`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(60) NOT NULL,
    `type_id` BIGINT UNSIGNED NOT NULL,
    `price` FLOAT(53) NOT NULL,
    `image_link` VARCHAR(255) NOT NULL
);

CREATE TABLE `Customers`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(60) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `hashPassword` VARCHAR(255) NOT NULL,
    `phoneNumber` BIGINT NOT NULL
);

CREATE TABLE `Orders`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `customer_id` BIGINT UNSIGNED NOT NULL,
    `total_price` FLOAT(53) NOT NULL,
    `purchase_datetime` DATETIME NOT NULL
);

CREATE TABLE `OrderItem`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `order_id` BIGINT UNSIGNED NOT NULL,
    `meme_id` BIGINT UNSIGNED NOT NULL,
    `meme_qty` BIGINT NOT NULL
);

CREATE TABLE `MemeTypes`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(60) NOT NULL
);

ALTER TABLE
    `Orders` ADD CONSTRAINT `order_customer_id_foreign` FOREIGN KEY(`customer_id`) REFERENCES `Customers`(`id`);
ALTER TABLE
    `Memes` ADD CONSTRAINT `memes_type_id_foreign` FOREIGN KEY(`type_id`) REFERENCES `MemeTypes`(`id`);
ALTER TABLE
    `OrderItem` ADD CONSTRAINT `orderitem_order_id_foreign` FOREIGN KEY(`order_id`) REFERENCES `Orders`(`id`);
ALTER TABLE
    `OrderItem` ADD CONSTRAINT `orderitem_meme_id_foreign` FOREIGN KEY(`meme_id`) REFERENCES `Memes`(`id`);