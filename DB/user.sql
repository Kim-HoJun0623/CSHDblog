CREATE TABLE `blog`.`user` (
  `userId` VARCHAR(20) NOT NULL,
  `userPassword` VARCHAR(20) NULL,
  `userName` VARCHAR(20) NULL,
  `userGender` VARCHAR(20) NULL,
  `userEmail` VARCHAR(50) NULL,
  PRIMARY KEY (`userId`));
