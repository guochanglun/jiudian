/*
SQLyog Community Edition- MySQL GUI v6.54
MySQL - 5.5.25a : Database - jiudian
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`jiudian` /*!40100 DEFAULT CHARACTER SET gb2312 */;

USE `jiudian`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `age` varchar(50) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `addtime` varchar(50) DEFAULT NULL,
  `sf` varchar(50) DEFAULT '员工',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312;

/*Data for the table `admin` */

insert  into `admin`(`id`,`username`,`password`,`realname`,`sex`,`age`,`tel`,`address`,`addtime`,`sf`) values (1,'admin','111','陈道明','男','25','13900000000','成都市金牛区','2018-04-28','管理员');

/*Table structure for table `dd` */

DROP TABLE IF EXISTS `dd`;

CREATE TABLE `dd` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `jdid` varchar(500) DEFAULT NULL,
  `mc` varchar(500) DEFAULT NULL,
  `fl` varchar(500) DEFAULT NULL,
  `jg` float DEFAULT NULL,
  `sl` int(4) DEFAULT NULL,
  `zj` float DEFAULT NULL,
  `member` varchar(500) DEFAULT NULL,
  `sj` date DEFAULT NULL,
  `qx` varchar(500) DEFAULT '未取消',
  `dd` varchar(50) DEFAULT NULL,
  `ddh` varchar(500) DEFAULT NULL,
  `sh` varchar(500) DEFAULT '暂无',
  `tz` varchar(500) DEFAULT '暂无',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=gb2312;

/*Data for the table `dd` */

insert  into `dd`(`id`,`jdid`,`mc`,`fl`,`jg`,`sl`,`zj`,`member`,`sj`,`qx`,`dd`,`ddh`,`sh`,`tz`) values (9,'11','测试客房1','商务房',988,1,988,'111','2018-04-28','未取消','2018-04-28','11176408205405929','已通过','您好您的订单已受理'),(10,'8','测试客房4','商务房',588,1,588,'111','2018-04-28','未取消','2018-04-28','11176427230004032','已通过','您好您的订单已受理'),(11,'8','测试客房4','商务房',588,1,588,'111','2018-04-28','未取消','2018-04-28','11171218204712687','已通过','test'),(12,'11','测试客房1','商务房',988,1,988,'111','2018-04-28','未取消','2018-04-28','20122224232733395','已通过','ok');

/*Table structure for table `fl` */

DROP TABLE IF EXISTS `fl`;

CREATE TABLE `fl` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `mc` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gb2312;

/*Data for the table `fl` */

insert  into `fl`(`id`,`mc`) values (1,'总统套房'),(2,'豪华房'),(3,'商务房'),(4,'标准间'),(5,'情趣房');

/*Table structure for table `jd` */

DROP TABLE IF EXISTS `jd`;

CREATE TABLE `jd` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `mc` varchar(500) DEFAULT NULL,
  `fl` varchar(500) DEFAULT NULL,
  `jg` int(4) DEFAULT '0',
  `url` varchar(500) DEFAULT NULL,
  `nr` text,
  `zt` varchar(500) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=gb2312;

/*Data for the table `jd` */

insert  into `jd`(`id`,`mc`,`fl`,`jg`,`url`,`nr`,`zt`) values (2,'测试客房8','商务房',188,'upfile/1.jpg','<div style=\"text-align:center;\">\n	<img src=\"/jiudian/attached/1.jpg\" alt=\"\" /> \n<img src=\"/jiudian/attached/2.jpg\" alt=\"\" /> \n<img src=\"/jiudian/attached/3.jpg\" alt=\"\" /> <img src=\"/jiudian/attached/4.jpg\" alt=\"\" /> \n</div>','占用'),(5,'测试客房7','商务房',288,'upfile/2.jpg','<div style=\"text-align:center;\">\n	<img src=\"/jiudian/attached/1.jpg\" alt=\"\" /> \n<img src=\"/jiudian/attached/2.jpg\" alt=\"\" /> \n<img src=\"/jiudian/attached/3.jpg\" alt=\"\" /> <img src=\"/jiudian/attached/4.jpg\" alt=\"\" /> \n</div>','占用'),(6,'测试客房6','商务房',388,'upfile/3.jpg','<div style=\"text-align:center;\">\n	<img src=\"/jiudian/attached/1.jpg\" alt=\"\" /> \n<img src=\"/jiudian/attached/2.jpg\" alt=\"\" /> \n<img src=\"/jiudian/attached/3.jpg\" alt=\"\" /> <img src=\"/jiudian/attached/4.jpg\" alt=\"\" /> \n</div>','空闲'),(7,'测试客房5','商务房',488,'upfile/4.jpg','<div style=\"text-align:center;\">\n	<img src=\"/jiudian/attached/1.jpg\" alt=\"\" /> \n<img src=\"/jiudian/attached/2.jpg\" alt=\"\" /> \n<img src=\"/jiudian/attached/3.jpg\" alt=\"\" /> <img src=\"/jiudian/attached/4.jpg\" alt=\"\" /> \n</div>','空闲'),(8,'测试客房4','商务房',588,'upfile/5.jpg','<div style=\"text-align:center;\">\n	<img src=\"/jiudian/attached/1.jpg\" alt=\"\" /> \n<img src=\"/jiudian/attached/2.jpg\" alt=\"\" /> \n<img src=\"/jiudian/attached/3.jpg\" alt=\"\" /> <img src=\"/jiudian/attached/4.jpg\" alt=\"\" /> \n</div>','预定'),(9,'测试客房3','商务房',688,'upfile/6.jpg','<div style=\"text-align:center;\">\n	<img src=\"/jiudian/attached/1.jpg\" alt=\"\" /> \n<img src=\"/jiudian/attached/2.jpg\" alt=\"\" /> \n<img src=\"/jiudian/attached/3.jpg\" alt=\"\" /> <img src=\"/jiudian/attached/4.jpg\" alt=\"\" /> \n</div>','空闲'),(10,'测试客房2','商务房',788,'upfile/7.jpg','<div style=\"text-align:center;\">\n	<img src=\"/jiudian/attached/1.jpg\" alt=\"\" /> \n<img src=\"/jiudian/attached/2.jpg\" alt=\"\" /> \n<img src=\"/jiudian/attached/3.jpg\" alt=\"\" /> <img src=\"/jiudian/attached/4.jpg\" alt=\"\" /> \n</div>','空闲'),(11,'测试客房1','商务房',988,'upfile/8.jpg','<div style=\"text-align:center;\">\r\n	<img src=\"/jiudian/attached/1.jpg\" alt=\"\" /> <img src=\"/jiudian/attached/2.jpg\" alt=\"\" /> <img src=\"/jiudian/attached/3.jpg\" alt=\"\" /> <img src=\"/jiudian/attached/4.jpg\" alt=\"\" /> \r\n</div>','预定');

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `age` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `regtime` varchar(50) DEFAULT NULL,
  `ifuse` varchar(50) DEFAULT '在用',
  `sl` int(4) DEFAULT '0',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gb2312;

/*Data for the table `member` */

insert  into `member`(`id`,`username`,`password`,`realname`,`sex`,`age`,`address`,`email`,`regtime`,`ifuse`,`sl`) values (7,'111','111','张同学','男','22','13800000001','112@163.com','2018-04-28','在用',0);

/*Table structure for table `rz` */

DROP TABLE IF EXISTS `rz`;

CREATE TABLE `rz` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `mc` varchar(500) DEFAULT NULL,
  `xm` varchar(500) DEFAULT NULL,
  `sfz` varchar(500) DEFAULT NULL,
  `rzsj` date DEFAULT NULL,
  `yj` int(4) DEFAULT NULL,
  `jg` int(4) DEFAULT NULL,
  `ts` int(4) DEFAULT '0',
  `zj` int(4) DEFAULT '0',
  `tfsj` varchar(500) DEFAULT '暂无',
  `fh` int(4) DEFAULT '0',
  `fl` varchar(50) DEFAULT NULL,
  `member` varchar(500) DEFAULT NULL,
  `pj` varchar(500) DEFAULT '暂无',
  `py` varchar(500) DEFAULT '暂无',
  `xf` int(4) DEFAULT '0',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=gb2312;

/*Data for the table `rz` */

insert  into `rz`(`id`,`mc`,`xm`,`sfz`,`rzsj`,`yj`,`jg`,`ts`,`zj`,`tfsj`,`fh`,`fl`,`member`,`pj`,`py`,`xf`) values (8,'测试客房8','阿丽','211220199009091234','2018-04-28',1000,188,1,188,'2018-04-28',812,'商务房','无','暂无','暂无',0),(9,'测试客房7','阿丽','211220199809091211','2018-04-28',1000,288,1,288,'2018-04-28',712,'商务房','无','暂无','暂无',0),(10,'测试客房6','阿丽','211220199009091234','2018-04-28',1000,388,1,388,'2018-04-28',612,'商务房','无','暂无','暂无',0),(11,'测试客房8','张二狗','211110199009091234','2018-04-28',1000,188,1,188,'2018-04-28',812,'商务房','无','暂无','暂无',0),(12,'测试客房8','许巍','211110199009098765','2018-04-28',5000,188,1,188,'2018-04-28',4812,'商务房','111','好评','很好',0),(14,'测试客房8','特朗普','222199200109091098','2018-04-28',1000,188,1,188,'2018-04-28',812,'商务房','111','中评','test',0),(15,'测试客房8','张三','211220199009091234','2018-04-25',1000,188,0,0,'暂无',0,'商务房','111','暂无','暂无',0);

/*Table structure for table `xs` */

DROP TABLE IF EXISTS `xs`;

CREATE TABLE `xs` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `mc` varchar(500) DEFAULT NULL,
  `jg` int(4) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gb2312;

/*Data for the table `xs` */

insert  into `xs`(`id`,`mc`,`jg`,`url`) values (2,'啤酒',8,'upfile/11.jpg'),(3,'宫保鸡丁',15,'upfile/22.jpg');

/*Table structure for table `xsdd` */

DROP TABLE IF EXISTS `xsdd`;

CREATE TABLE `xsdd` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `ddh` varchar(500) DEFAULT NULL,
  `xsid` varchar(500) DEFAULT NULL,
  `mc` varchar(500) DEFAULT NULL,
  `jg` int(4) DEFAULT NULL,
  `sl` int(4) DEFAULT NULL,
  `zj` int(4) DEFAULT NULL,
  `member` varchar(500) DEFAULT NULL,
  `sj` date DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312;

/*Data for the table `xsdd` */

insert  into `xsdd`(`id`,`ddh`,`xsid`,`mc`,`jg`,`sl`,`zj`,`member`,`sj`) values (1,'20180428231402143','3','宫保鸡丁',15,11,165,'111','2018-04-28'),(2,'20180428231406123','3','宫保鸡丁',15,11,165,'111','2018-04-28');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
