CREATE TABLE  `blog`.`board` (
  `bId` int NOT NULL,
  `bTitle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `loginid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bDate` datetime DEFAULT NULL,
  `bContent` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bAvailable` int DEFAULT NULL,
  `bimage` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`bId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3

ALTER TABLE `blog`.`board` 
ADD COLUMN `bcount` INT NULL AFTER `bAvailable` default '0';

ALTER TABLE `blog`.`board` 
ADD COLUMN `bcategory` VARCHAR(45) NULL DEFAULT 'CUTE' AFTER `bimage`;

