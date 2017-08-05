/*
SQLyog Community v11.24 (32 bit)
MySQL - 5.5.27 : Database - retail
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`retail` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `retail`;

/*Table structure for table `dicountvariety_m` */

DROP TABLE IF EXISTS `dicountvariety_m`;

CREATE TABLE `dicountvariety_m` (
  `id` int(11) NOT NULL,
  `disc` double DEFAULT NULL,
  `discName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dicountvariety_m` */

insert  into `dicountvariety_m`(`id`,`disc`,`discName`) values (1,30,'Discount Employee'),(2,10,'Affiliate'),(3,5,'Customer'),(4,5,'Discount of 100$');

/*Table structure for table `discountrole_m` */

DROP TABLE IF EXISTS `discountrole_m`;

CREATE TABLE `discountrole_m` (
  `id` int(11) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `discVarietyFK` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKji0lv6kycpj1abn9iwuxexge5` (`discVarietyFK`),
  CONSTRAINT `FKji0lv6kycpj1abn9iwuxexge5` FOREIGN KEY (`discVarietyFK`) REFERENCES `dicountvariety_m` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `discountrole_m` */

insert  into `discountrole_m`(`id`,`role`,`discVarietyFK`) values (1,'Employee',1),(2,'Member',2),(3,'Customer',3);

/*Table structure for table `goods_m` */

DROP TABLE IF EXISTS `goods_m`;

CREATE TABLE `goods_m` (
  `id` int(11) NOT NULL,
  `goodsName` varchar(100) DEFAULT NULL,
  `isGroceries` tinyint(1) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `goods_m` */

insert  into `goods_m`(`id`,`goodsName`,`isGroceries`,`price`) values (1,'Adidas',0,90),(2,'Reebok',0,80),(3,'New Balance',0,70),(4,'Rice',1,80),(5,'Mango',1,90);

/*Table structure for table `hibernate_sequence` */

DROP TABLE IF EXISTS `hibernate_sequence`;

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hibernate_sequence` */

insert  into `hibernate_sequence`(`next_val`) values (1),(1),(1),(1);

/*Table structure for table `purchase_t` */

DROP TABLE IF EXISTS `purchase_t`;

CREATE TABLE `purchase_t` (
  `noRec` char(32) NOT NULL,
  `bill` double DEFAULT NULL,
  `nett` double DEFAULT NULL,
  `userFK` int(11) DEFAULT NULL,
  PRIMARY KEY (`noRec`),
  KEY `FKi5ur3xw3x6dn2kxa1ti6rqxcd` (`userFK`),
  CONSTRAINT `FKi5ur3xw3x6dn2kxa1ti6rqxcd` FOREIGN KEY (`userFK`) REFERENCES `user_m` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `purchase_t` */

insert  into `purchase_t`(`noRec`,`bill`,`nett`,`userFK`) values ('402881f15db10fb8015db11ff2000004',260,209,1),('402881f15db10fb8015db12038530008',260,243,2),('402881f15db12cdc015db12d1d990000',260,251.5,3),('402881f15db13191015db131d4e90000',260,255,4),('402881f15db13922015db1396e1b0000',340,335,4),('402881f15db139fd015db13c4ca70000',340,335,4),('402881f15db139fd015db13cd72e0005',330,320,4);

/*Table structure for table `purchasedetail_t` */

DROP TABLE IF EXISTS `purchasedetail_t`;

CREATE TABLE `purchasedetail_t` (
  `noRec` char(32) NOT NULL,
  `goodsFK` int(11) DEFAULT NULL,
  `purchaseFK` char(32) DEFAULT NULL,
  PRIMARY KEY (`noRec`),
  KEY `FK35vd5ikfjln5do0fuvh6bgbw4` (`goodsFK`),
  KEY `FKj25xrwe2ragn1bh35fmwhd0sl` (`purchaseFK`),
  CONSTRAINT `FKj25xrwe2ragn1bh35fmwhd0sl` FOREIGN KEY (`purchaseFK`) REFERENCES `purchase_t` (`noRec`),
  CONSTRAINT `FK35vd5ikfjln5do0fuvh6bgbw4` FOREIGN KEY (`goodsFK`) REFERENCES `goods_m` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `purchasedetail_t` */

insert  into `purchasedetail_t`(`noRec`,`goodsFK`,`purchaseFK`) values ('402881f15db10fb8015db11ff2010005',2,'402881f15db10fb8015db11ff2000004'),('402881f15db10fb8015db11ff2010006',5,'402881f15db10fb8015db11ff2000004'),('402881f15db10fb8015db11ff2010007',1,'402881f15db10fb8015db11ff2000004'),('402881f15db10fb8015db12038540009',1,'402881f15db10fb8015db12038530008'),('402881f15db10fb8015db1203854000a',5,'402881f15db10fb8015db12038530008'),('402881f15db10fb8015db1203854000b',2,'402881f15db10fb8015db12038530008'),('402881f15db12cdc015db12d1db50001',2,'402881f15db12cdc015db12d1d990000'),('402881f15db12cdc015db12d1db50002',1,'402881f15db12cdc015db12d1d990000'),('402881f15db12cdc015db12d1db50003',5,'402881f15db12cdc015db12d1d990000'),('402881f15db13191015db131d5070001',2,'402881f15db13191015db131d4e90000'),('402881f15db13191015db131d5070002',1,'402881f15db13191015db131d4e90000'),('402881f15db13191015db131d5070003',5,'402881f15db13191015db131d4e90000'),('402881f15db13922015db1396e390001',1,'402881f15db13922015db1396e1b0000'),('402881f15db13922015db1396e390002',4,'402881f15db13922015db1396e1b0000'),('402881f15db13922015db1396e3a0003',2,'402881f15db13922015db1396e1b0000'),('402881f15db13922015db1396e3a0004',5,'402881f15db13922015db1396e1b0000'),('402881f15db139fd015db13c4cd30001',4,'402881f15db139fd015db13c4ca70000'),('402881f15db139fd015db13c4cd40002',5,'402881f15db139fd015db13c4ca70000'),('402881f15db139fd015db13c4cd40003',2,'402881f15db139fd015db13c4ca70000'),('402881f15db139fd015db13c4cd40004',1,'402881f15db139fd015db13c4ca70000'),('402881f15db139fd015db13cd72e0006',3,'402881f15db139fd015db13cd72e0005'),('402881f15db139fd015db13cd72f0007',5,'402881f15db139fd015db13cd72e0005'),('402881f15db139fd015db13cd72f0008',1,'402881f15db139fd015db13cd72e0005'),('402881f15db139fd015db13cd72f0009',2,'402881f15db139fd015db13cd72e0005');

/*Table structure for table `user_m` */

DROP TABLE IF EXISTS `user_m`;

CREATE TABLE `user_m` (
  `id` int(11) NOT NULL,
  `joinDate` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `discRoleFK` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdi4j4g4wqo7l5vielj9ykn5sr` (`discRoleFK`),
  CONSTRAINT `FKdi4j4g4wqo7l5vielj9ykn5sr` FOREIGN KEY (`discRoleFK`) REFERENCES `discountrole_m` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_m` */

insert  into `user_m`(`id`,`joinDate`,`name`,`discRoleFK`) values (1,'2010-05-21 09:32:29','B.M Yanti',1),(2,'2017-01-28 09:32:59','Surya',2),(3,'2010-01-22 09:33:22','Elisabeth',3),(4,'2017-08-01 09:33:49','Ayu',3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
