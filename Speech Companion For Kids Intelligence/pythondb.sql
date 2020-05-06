/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.22 : Database - pythondb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pythondb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `pythondb`;

/*Table structure for table `complainmaster` */

DROP TABLE IF EXISTS `complainmaster`;

CREATE TABLE `complainmaster` (
  `complainId` bigint(20) NOT NULL AUTO_INCREMENT,
  `complainSubject` varchar(100) DEFAULT NULL,
  `complainDescription` varchar(1000) DEFAULT NULL,
  `complainDate` date DEFAULT NULL,
  `complainTime` time DEFAULT NULL,
  `complainStatus` varchar(20) DEFAULT NULL,
  `complainFileName` varchar(100) DEFAULT NULL,
  `complainFilePath` varchar(200) DEFAULT NULL,
  `complainTo_LoginId` bigint(20) DEFAULT NULL,
  `complainFrom_LoginId` bigint(20) DEFAULT NULL,
  `replySubject` varchar(100) DEFAULT NULL,
  `replyMessage` varchar(1000) DEFAULT NULL,
  `replyFileName` varchar(100) DEFAULT NULL,
  `replyFilePath` varchar(200) DEFAULT NULL,
  `replyDate` date DEFAULT NULL,
  `replyTime` time DEFAULT NULL,
  PRIMARY KEY (`complainId`),
  KEY `complainTo_LoginId` (`complainTo_LoginId`),
  KEY `complainFrom_LoginId` (`complainFrom_LoginId`),
  CONSTRAINT `complainmaster_ibfk_1` FOREIGN KEY (`complainTo_LoginId`) REFERENCES `loginmaster` (`loginId`),
  CONSTRAINT `complainmaster_ibfk_2` FOREIGN KEY (`complainFrom_LoginId`) REFERENCES `loginmaster` (`loginId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `complainmaster` */

/*Table structure for table `factmaster` */

DROP TABLE IF EXISTS `factmaster`;

CREATE TABLE `factmaster` (
  `factId` bigint(20) NOT NULL AUTO_INCREMENT,
  `fact` varchar(100) DEFAULT NULL,
  `factImageName` varchar(100) DEFAULT NULL,
  `factImagePath` varchar(100) DEFAULT NULL,
  `factImageLink` varchar(200) DEFAULT NULL,
  `fact_FactTypeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`factId`),
  UNIQUE KEY `fact` (`fact`),
  KEY `fact_FactTypeId` (`fact_FactTypeId`),
  CONSTRAINT `factmaster_ibfk_1` FOREIGN KEY (`fact_FactTypeId`) REFERENCES `facttypemaster` (`factTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `factmaster` */

insert  into `factmaster`(`factId`,`fact`,`factImageName`,`factImagePath`,`factImageLink`,`fact_FactTypeId`) values (1,'In total there is said to be around 400 million dogs in the world.','dog.jpg','../../static/adminResources/Fact/','https://scfkiimagebucket.s3.amazonaws.com/fact/dog.jpg',1),(2,'The tiger is the biggest species of the cat family.','tiger.jpg','../../static/adminResources/Fact/','https://scfkiimagebucket.s3.amazonaws.com/fact/tiger.jpg',1),(3,'McDonald’s fast food chains employ over 1.5 million people around the world.','mcdonalds.png','../../static/adminResources/Fact/','https://scfkiimagebucket.s3.amazonaws.com/fact/mcdonalds.png',2),(4,'The sweet potato is a root vegetable and is not closely related to the potato. ','SWEET_POTATO.jpg','../../static/adminResources/Fact/','https://scfkiimagebucket.s3.amazonaws.com/fact/SWEET_POTATO.jpg',2);

/*Table structure for table `facttypemaster` */

DROP TABLE IF EXISTS `facttypemaster`;

CREATE TABLE `facttypemaster` (
  `factTypeId` bigint(20) NOT NULL AUTO_INCREMENT,
  `factType` varchar(100) DEFAULT NULL,
  `factTypeDescription` varchar(500) DEFAULT NULL,
  `factTypeImageName` varchar(100) DEFAULT NULL,
  `factTypeImagePath` varchar(100) DEFAULT NULL,
  `factTypeImageLink` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`factTypeId`),
  UNIQUE KEY `factType` (`factType`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `facttypemaster` */

insert  into `facttypemaster`(`factTypeId`,`factType`,`factTypeDescription`,`factTypeImageName`,`factTypeImagePath`,`factTypeImageLink`) values (1,'Animal','Fun Facts about animals.','animal.jpg','../../static/adminResources/FactType/','https://scfkiimagebucket.s3.amazonaws.com/facttype/animal.jpg'),(2,'Food','Fun Facts about Food.','food.jpg','../../static/adminResources/FactType/','https://scfkiimagebucket.s3.amazonaws.com/facttype/food.jpg');

/*Table structure for table `feedbackmaster` */

DROP TABLE IF EXISTS `feedbackmaster`;

CREATE TABLE `feedbackmaster` (
  `feedbackId` bigint(20) NOT NULL AUTO_INCREMENT,
  `feedbackSubject` varchar(100) DEFAULT NULL,
  `feedbackDescription` varchar(1000) DEFAULT NULL,
  `feedbackRating` int(11) DEFAULT NULL,
  `feedbackDate` date DEFAULT NULL,
  `feedbackTime` time DEFAULT NULL,
  `feedbackTo_LoginId` bigint(20) DEFAULT NULL,
  `feedbackFrom_LoginId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`feedbackId`),
  KEY `feedbackTo_LoginId` (`feedbackTo_LoginId`),
  KEY `feedbackFrom_LoginId` (`feedbackFrom_LoginId`),
  CONSTRAINT `feedbackmaster_ibfk_1` FOREIGN KEY (`feedbackTo_LoginId`) REFERENCES `loginmaster` (`loginId`),
  CONSTRAINT `feedbackmaster_ibfk_2` FOREIGN KEY (`feedbackFrom_LoginId`) REFERENCES `loginmaster` (`loginId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `feedbackmaster` */

/*Table structure for table `loginmaster` */

DROP TABLE IF EXISTS `loginmaster`;

CREATE TABLE `loginmaster` (
  `loginId` bigint(20) NOT NULL AUTO_INCREMENT,
  `loginUsername` varchar(100) NOT NULL,
  `loginPassword` varchar(100) NOT NULL,
  `loginRole` varchar(10) NOT NULL,
  `loginStatus` varchar(10) NOT NULL,
  PRIMARY KEY (`loginId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `loginmaster` */

insert  into `loginmaster`(`loginId`,`loginUsername`,`loginPassword`,`loginRole`,`loginStatus`) values (1,'hardykshukla@gmail.com','admin12345','admin','active'),(2,'khushaws@gmail.com','xsHRM7YT','user','active'),(3,'darshilshah325@gmail.com','user123','user','active'),(4,'panchani603@gmail.com','user123','user','active');

/*Table structure for table `mathquizmaster` */

DROP TABLE IF EXISTS `mathquizmaster`;

CREATE TABLE `mathquizmaster` (
  `mathQuizId` bigint(20) NOT NULL AUTO_INCREMENT,
  `mathQuizQuestion` varchar(500) DEFAULT NULL,
  `mathQuizAnswer` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`mathQuizId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `mathquizmaster` */

insert  into `mathquizmaster`(`mathQuizId`,`mathQuizQuestion`,`mathQuizAnswer`) values (1,'Dhruv have 20 mangoes . He found 4 more. So, tell that what is the total number of mangoes does Dhruv have now? ','24');

/*Table structure for table `packagemaster` */

DROP TABLE IF EXISTS `packagemaster`;

CREATE TABLE `packagemaster` (
  `packageId` bigint(20) NOT NULL AUTO_INCREMENT,
  `packageName` varchar(100) DEFAULT NULL,
  `packageDescription` varchar(1000) DEFAULT NULL,
  `packageDuration` varchar(10) DEFAULT NULL,
  `packagePrice` int(11) DEFAULT NULL,
  PRIMARY KEY (`packageId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `packagemaster` */

insert  into `packagemaster`(`packageId`,`packageName`,`packageDescription`,`packageDuration`,`packagePrice`) values (1,'GOLD','This package includes Stories and Poems.','1 year',100),(2,'Silver','Stories only.','1 year',75);

/*Table structure for table `poemmaster` */

DROP TABLE IF EXISTS `poemmaster`;

CREATE TABLE `poemmaster` (
  `poemId` bigint(20) NOT NULL AUTO_INCREMENT,
  `poemTitle` varchar(100) DEFAULT NULL,
  `poemFileName` varchar(100) DEFAULT NULL,
  `poemFilePath` varchar(100) DEFAULT NULL,
  `poemFileLink` varchar(200) DEFAULT NULL,
  `poemImageName` varchar(100) DEFAULT NULL,
  `poemImagePath` varchar(100) DEFAULT NULL,
  `poemImageLink` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`poemId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `poemmaster` */

insert  into `poemmaster`(`poemId`,`poemTitle`,`poemFileName`,`poemFilePath`,`poemFileLink`,`poemImageName`,`poemImagePath`,`poemImageLink`) values (3,'Baa Baa Black Sheep','Baa_Baa_Black_Sheep.mp3','../../static/adminResources/Poem/','https://poembucket.s3.amazonaws.com/Baa_Baa_Black_Sheep.mp3','baa_baa_black_sheep.jpg','../../static/adminResources/Poem/','https://scfkiimagebucket.s3.amazonaws.com/poem/baa_baa_black_sheep.jpg'),(4,'HUMPTY DUMPTY','Humpty_Dumpty.mp3','../../static/adminResources/Poem/','https://poembucket.s3.amazonaws.com/Humpty_Dumpty.mp3','HUMPTY_DUMPTY.jpg','../../static/adminResources/Poem/','https://scfkiimagebucket.s3.amazonaws.com/poem/HUMPTY_DUMPTY.jpg'),(5,'TWINKLE TWINKLE LITTLE STAR','Twinkle_Twinkle.mp3','../../static/adminResources/Poem/','https://poembucket.s3.amazonaws.com/Twinkle_Twinkle.mp3','TWINKLE_TWINKLE_LITTLE_STAR.png','../../static/adminResources/Poem/','https://scfkiimagebucket.s3.amazonaws.com/poem/TWINKLE_TWINKLE_LITTLE_STAR.png');

/*Table structure for table `purchasemaster` */

DROP TABLE IF EXISTS `purchasemaster`;

CREATE TABLE `purchasemaster` (
  `purchaseId` bigint(20) NOT NULL AUTO_INCREMENT,
  `purchaseDate` varchar(500) DEFAULT NULL,
  `purchaseTime` varchar(100) DEFAULT NULL,
  `purchase_LoginId` bigint(20) DEFAULT NULL,
  `purchase_PackageId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`purchaseId`),
  KEY `purchase_LoginId` (`purchase_LoginId`),
  KEY `purchase_PackageId` (`purchase_PackageId`),
  CONSTRAINT `purchasemaster_ibfk_1` FOREIGN KEY (`purchase_LoginId`) REFERENCES `loginmaster` (`loginId`),
  CONSTRAINT `purchasemaster_ibfk_2` FOREIGN KEY (`purchase_PackageId`) REFERENCES `packagemaster` (`packageId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `purchasemaster` */

insert  into `purchasemaster`(`purchaseId`,`purchaseDate`,`purchaseTime`,`purchase_LoginId`,`purchase_PackageId`) values (1,'2020-02-24','12:21:44',2,1),(2,'2020-02-24','12:27:57',2,1);

/*Table structure for table `quizmaster` */

DROP TABLE IF EXISTS `quizmaster`;

CREATE TABLE `quizmaster` (
  `quizId` bigint(20) NOT NULL AUTO_INCREMENT,
  `quizQuestion` varchar(500) DEFAULT NULL,
  `quizAnswer` varchar(500) DEFAULT NULL,
  `quiz_StoryTypeId` bigint(20) DEFAULT NULL,
  `quiz_StoryId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`quizId`),
  KEY `quiz_StoryTypeId` (`quiz_StoryTypeId`),
  KEY `quiz_StoryId` (`quiz_StoryId`),
  CONSTRAINT `quizmaster_ibfk_1` FOREIGN KEY (`quiz_StoryTypeId`) REFERENCES `storytypemaster` (`storyTypeId`),
  CONSTRAINT `quizmaster_ibfk_2` FOREIGN KEY (`quiz_StoryId`) REFERENCES `storymaster` (`storyId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `quizmaster` */

insert  into `quizmaster`(`quizId`,`quizQuestion`,`quizAnswer`,`quiz_StoryTypeId`,`quiz_StoryId`) values (1,'How was the weather?','Hot',2,1),(2,'What was the crow searching?','water',2,1),(3,'The crow use what to get the water?','Pebble',2,1),(4,'Where was the water?','Jug',2,1);

/*Table structure for table `registermaster` */

DROP TABLE IF EXISTS `registermaster`;

CREATE TABLE `registermaster` (
  `registerId` bigint(20) NOT NULL AUTO_INCREMENT,
  `registerChildName` varchar(50) NOT NULL,
  `registerChildBirthDate` date NOT NULL,
  `registerChildGender` varchar(10) NOT NULL,
  `registerParentName` varchar(50) NOT NULL,
  `registerContact` bigint(20) NOT NULL,
  `registerAddress` varchar(500) NOT NULL,
  `register_LoginId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`registerId`),
  KEY `register_LoginId` (`register_LoginId`),
  CONSTRAINT `registermaster_ibfk_1` FOREIGN KEY (`register_LoginId`) REFERENCES `loginmaster` (`loginId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `registermaster` */

insert  into `registermaster`(`registerId`,`registerChildName`,`registerChildBirthDate`,`registerChildGender`,`registerParentName`,`registerContact`,`registerAddress`,`register_LoginId`) values (1,'Khush','2013-07-02','male','Pro',8849914811,'Ahmedabad.',2),(2,'Akash','1997-12-02','male','Arindbhai',909381964,'SG Highway',4),(3,'Lucifer','2016-02-29','male','Darshil',9825008325,'Ahmedabad',3);

/*Table structure for table `storymaster` */

DROP TABLE IF EXISTS `storymaster`;

CREATE TABLE `storymaster` (
  `storyId` bigint(20) NOT NULL AUTO_INCREMENT,
  `storyTitle` varchar(100) DEFAULT NULL,
  `storyFileName` varchar(100) DEFAULT NULL,
  `storyFilePath` varchar(100) DEFAULT NULL,
  `storyFileLink` varchar(200) DEFAULT NULL,
  `storyImageName` varchar(100) DEFAULT NULL,
  `storyImagePath` varchar(100) DEFAULT NULL,
  `storyImageLink` varchar(200) DEFAULT NULL,
  `storyMoral` varchar(500) DEFAULT NULL,
  `story_StoryTypeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`storyId`),
  KEY `story_StoryTypeId` (`story_StoryTypeId`),
  CONSTRAINT `storymaster_ibfk_1` FOREIGN KEY (`story_StoryTypeId`) REFERENCES `storytypemaster` (`storyTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `storymaster` */

insert  into `storymaster`(`storyId`,`storyTitle`,`storyFileName`,`storyFilePath`,`storyFileLink`,`storyImageName`,`storyImagePath`,`storyImageLink`,`storyMoral`,`story_StoryTypeId`) values (1,'Thirsty Crow','The_Thirsty_Crow.txt','../../static/adminResources/Story/','https://storybucket.s3.amazonaws.com/The_Thirsty_Crow.txt','thirsty_crow.jpg','../../static/adminResources/Story/','https://scfkiimagebucket.s3.amazonaws.com/story/thirsty_crow.jpg','Think and work hard, you may find solution to any problem.',2),(2,'the clever fox','the_clever_fox.txt','../../static/adminResources/Story/','https://storybucket.s3.amazonaws.com/the_clever_fox.txt','the_clever_fox.jpg','../../static/adminResources/Story/','https://scfkiimagebucket.s3.amazonaws.com/story/the_clever_fox.jpg','Intelligence.',2),(3,'THE LION AND THE HARE','THE_LION_AND_THE_HARE.txt','../../static/adminResources/Story/','https://storybucket.s3.amazonaws.com/THE_LION_AND_THE_HARE.txt','THE_LION_AND_THE_HARE.jpg','../../static/adminResources/Story/','https://scfkiimagebucket.s3.amazonaws.com/story/THE_LION_AND_THE_HARE.jpg','Wisdom can win might.',2),(11,'The Boy Who Cried Wolf','The_Boy_Who_Cried_Wolf.txt','../../static/adminResources/Story/','https://storybucket.s3.amazonaws.com/The_Boy_Who_Cried_Wolf.txt','The_Boy_Who_Cried_Wolf.jpg','../../static/adminResources/Story/','https://scfkiimagebucket.s3.amazonaws.com/story/The_Boy_Who_Cried_Wolf.jpg',' Lying breaks trust. Nobody trusts a liar, even when he is telling the truth.',4),(12,'The Golden Egg','The_Golden_Egg.txt','../../static/adminResources/Story/','https://storybucket.s3.amazonaws.com/The_Golden_Egg.txt','golden_egg.jpg','../../static/adminResources/Story/','https://scfkiimagebucket.s3.amazonaws.com/story/golden_egg.jpg','Think before you act.',4),(13,'The Miser And His Gold','The_Miser_And_His_Gold.txt','../../static/adminResources/Story/','https://storybucket.s3.amazonaws.com/The_Miser_And_His_Gold.txt','The_Miser_And_His_Gold.jpg','../../static/adminResources/Story/','https://scfkiimagebucket.s3.amazonaws.com/story/The_Miser_And_His_Gold.jpg','A possession is just as worthy of what it is used for.',4),(16,'THE LION AND THE MOUSE','the_lion_and_the_mouse.txt','../../static/adminResources/Story/','https://storybucket.s3.amazonaws.com/the_lion_and_the_mouse.txt','lio_and_mouse.jpg','../../static/adminResources/Story/','https://scfkiimagebucket.s3.amazonaws.com/story/lio_and_mouse.jpg','Never Under Estimate Anyone. Even Tiny Things Can Be Of Immense Help.',5),(17,'CINDRELLA ','cindrella.txt','../../static/adminResources/Story/','https://storybucket.s3.amazonaws.com/cindrella.txt','cindrella.jpg','../../static/adminResources/Story/','https://scfkiimagebucket.s3.amazonaws.com/story/cindrella.jpg','NOT AVAILABLE',5),(18,'LITTLE MERMAID','little_mermaid.txt','../../static/adminResources/Story/','https://storybucket.s3.amazonaws.com/little_mermaid.txt','little_mermaid.jpg','../../static/adminResources/Story/','https://scfkiimagebucket.s3.amazonaws.com/story/little_mermaid.jpg','NOT AVAILABLE',5);

/*Table structure for table `storytypemaster` */

DROP TABLE IF EXISTS `storytypemaster`;

CREATE TABLE `storytypemaster` (
  `storyTypeId` bigint(20) NOT NULL AUTO_INCREMENT,
  `storyType` varchar(100) DEFAULT NULL,
  `storyTypeDescription` varchar(500) DEFAULT NULL,
  `storyTypeImageName` varchar(100) DEFAULT NULL,
  `storyTypeImagePath` varchar(100) DEFAULT NULL,
  `storyTypeImageLink` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`storyTypeId`),
  UNIQUE KEY `storyType` (`storyType`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `storytypemaster` */

insert  into `storytypemaster`(`storyTypeId`,`storyType`,`storyTypeDescription`,`storyTypeImageName`,`storyTypeImagePath`,`storyTypeImageLink`) values (2,'Panchatantra','Old stories','Panchatantra.jpg','../../static/adminResources/StoryType/','https://scfkiimagebucket.s3.amazonaws.com/storytype/Panchatantra.jpg'),(4,'Classic Moral Stories','The classics are the best. These are short stories we have heard more than once, and even told more than once. But we like listening to these stories and telling them to our kids and anyone who is willing to listen!','classic.jpg','../../static/adminResources/StoryType/','https://scfkiimagebucket.s3.amazonaws.com/storytype/classic.jpg'),(5,'Disney','Most famous and loved stories from disney.','disney_img.jpg','../../static/adminResources/StoryType/','https://scfkiimagebucket.s3.amazonaws.com/storytype/disney_img.jpg');

/*Table structure for table `testmaster` */

DROP TABLE IF EXISTS `testmaster`;

CREATE TABLE `testmaster` (
  `testId` bigint(20) NOT NULL AUTO_INCREMENT,
  `testTopic` varchar(10) DEFAULT NULL,
  `testScore` varchar(10) DEFAULT NULL,
  `testGrade` varchar(10) DEFAULT NULL,
  `testDate` date DEFAULT NULL,
  `testTime` time DEFAULT NULL,
  `test_LoginId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`testId`),
  KEY `test_LoginId` (`test_LoginId`),
  CONSTRAINT `testmaster_ibfk_1` FOREIGN KEY (`test_LoginId`) REFERENCES `loginmaster` (`loginId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `testmaster` */

insert  into `testmaster`(`testId`,`testTopic`,`testScore`,`testGrade`,`testDate`,`testTime`,`test_LoginId`) values (1,'Math Quiz','9/10','A','2020-04-14','10:30:50',1),(2,'Math Quiz','1/1','A+','2020-04-14','11:43:40',3),(3,'Thirsty Cr','5/4','A','2020-04-14','11:48:40',3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
