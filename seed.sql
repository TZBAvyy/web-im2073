USE `im2073_db`;

INSERT INTO `MemeTypes`(`name`) VALUES
('Cat'),
('Dog');

INSERT INTO `Customers` VALUES 
(NULL, 'Avisena', '300 ABC Road', 'gibraltar.av@gmail.com', 'xxxx', '88643460');

INSERT INTO `Orders` VALUES
(NULL, 1, 41.92, '2025-02-11T11:23:44');

INSERT INTO `Memes` VALUES
(NULL, 'Crying Cat', 1, 3.99, 'static/asset/sadCat.png'),
(NULL, 'Polite Cat', 1, 2.99, 'static/asset/politeCat.png'),
(NULL, 'Shocked Cat', 1, 5.99, 'static/asset/shockedCat.png'),
(NULL, 'Banana Cat', 1, 6.23, 'static/asset/bananaCryingCat.png'),
(NULL, 'Happy Cat', 1, 1.99, 'static/asset/happyCat.gif'),
(NULL, 'Judging Cat', 1, 4.44, 'static/asset/judgingCat.gif'),
(NULL, 'OIAUIA Cat', 1, 7.01, 'static/asset/oiauiaCat.gif'),
(NULL, 'Angry Cat', 1, 9.00, 'static/asset/angryCat.png');

INSERT INTO `OrderItem` VALUES 
(NULL, 1, 1, 3),
(NULL, 1, 3, 5);

SELECT * FROM `Customers`;
SELECT * FROM `Memes`;
SELECT * FROM `Orders`;
SELECT * FROM `OrderItem`;