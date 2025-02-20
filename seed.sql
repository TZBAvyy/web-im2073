USE `im2073_db`;

INSERT INTO `MemeTypes`(`name`) VALUES
('Cat'),
('Dog');

INSERT INTO `Customers` VALUES 
(NULL, 'Avisena', '300 ABC Road', 'gibraltar.av@gmail.com', 'xxxx', '88643460');

INSERT INTO `Orders` VALUES
(NULL, 1, 41.92, '2025-02-11T11:23:44');

INSERT INTO `Memes` VALUES
(NULL, 'Crying Cat', 1, 3.99, 'https://s3.getstickerpack.com/storage/uploads/sticker-pack/cat-memes/sticker_2.png'),
(NULL, 'Polite Cat', 1, 2.99, 'https://s3.getstickerpack.com/storage/uploads/sticker-pack/cat-memes/sticker_1.png'),
(NULL, 'Confused Cat', 1, 5.99, 'https://s3.getstickerpack.com/storage/uploads/sticker-pack/cat-memes/sticker_8.png');

INSERT INTO `OrderItem` VALUES 
(NULL, 1, 1, 3),
(NULL, 1, 3, 5);

SELECT * FROM `Customers`;
SELECT * FROM `Memes`;
SELECT * FROM `Orders`;
SELECT * FROM `OrderItem`;