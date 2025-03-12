USE `im2073_db`;

INSERT INTO `Users` (`name`, `email`, `hashPassword`, `address`, `phoneNumber`, `isAdmin`) VALUES 
('Meowster', 'meowster@cats.com', 'hashed_password_1', '9 Lives St, Cat City', '1234567890', 0),
('WhiskerQueen', 'queenwhiskers@cats.com', 'hashed_password_2', 'Feline Ave, Meowtown', '0987654321', 0),
('PurrfectUser', 'purrfect@cats.com', 'hashed_password_3', 'Tabby Road, Kittyland', '1122334455', 0),
('Avisena', 'gibraltar.av@gmail.com', 'xxxx', '300 ABC Road', '88643460', 1);

INSERT INTO `Memes` (`name`, `descrip`, `image_link`, `price`) VALUES
('Angwyy CAT', 'A fierce cat stare to judge you forever.', 'static/asset/angryCat.png', 9.99),
('Banana Crying Cat', 'A sad cat wrapped in a banana—why?', 'static/asset/bananaCryingCat.png', 4.99),
('Crying Cat', 'Drink your tears with this crying cat meme.', 'static/asset/cryingCat.png', 14.99),
('Happy Cat', 'An overly happy cat.', 'static/asset/happyCat.gif', 19.99),
('Judging Cat', 'Yes im JUDGINGGGG YOUUUUU HOOMANNN', 'static/asset/judgingCat.gif', 24.99),
('Oiaua Cat', 'OIAUIAOIAUIA', 'static/asset/oiauiaCat.gif', 19.99),
('Polite Cat', 'A classy, polite cat to remind you of good manners.', 'static/asset/politeCat.png', 8.99),
('Sad Cat', 'TT', 'static/asset/sadCat.png', 6.99),
('Screaming Cat', 'AAAAAAAAAAAAAAAAAAAAA', 'static/asset/screamingCat.png', 15.99),
('Shocked Cat', 'For when you need to write down shocking thoughts.', 'static/asset/shockedCat.png', 9.99),
('Smudge the Cat', 'HEHE', 'static/asset/smudgeTheCat.png', 12.99),
('Squished Cat', '....????....', 'static/asset/squishedCat.png', 29.99),
('Standing Cat', 'A mini figure of a proud standing cat.', 'static/asset/standingCat.png', 14.99),
('Talking Cat', 'MurMiao Wu NGun Duuu... MiaooooOO', 'static/asset/talkingCat.gif', 19.99),
('Thumbs Up Cat', 'FINE you are right', 'static/asset/thumbsUpCat.png', 3.99),
('UiiA UiiA', 'the legendary UiiA cat', 'static/asset/uiiaCat.png', 39.99),
('Wawa Cat', 'round and round...', 'static/asset/wawaCat.png', 5.99);

INSERT INTO `Orders` (`customer_id`) VALUES
(1),  
(2),  
(3),
(1),
(4);

INSERT INTO `OrderItems` (`order_id`, `meme_id`, `meme_qty`) VALUES 
(1, 1, 2),  
(1, 5, 1),  
(2, 3, 3),  
(2, 7, 2),  
(3, 12, 1), 
(3, 14, 2), 
(4, 3, 3),  
(4, 7, 2),
(5, 1, 3),
(5, 3, 5);

SELECT * FROM `Users`;
SELECT * FROM `Memes`;
SELECT * FROM `Orders`;
SELECT * FROM `OrderItems`;