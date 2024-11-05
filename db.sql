/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - moocjiaoxuepingtai
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`moocjiaoxuepingtai` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `moocjiaoxuepingtai`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'picture1','http://localhost:8080/moocjiaoxuepingtai/upload/1613980928290.png'),(2,'picture2','http://localhost:8080/moocjiaoxuepingtai/upload/picture2.jpg'),(3,'picture3','http://localhost:8080/moocjiaoxuepingtai/upload/picture3.jpg'),(6,'homepage',NULL);

/*Table structure for table `discusskewaizhishi` */

DROP TABLE IF EXISTS `discusskewaizhishi`;

CREATE TABLE `discusskewaizhishi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1618557276190 DEFAULT CHARSET=utf8 COMMENT='课外知识评论表';

/*Data for the table `discusskewaizhishi` */

insert  into `discusskewaizhishi`(`id`,`addtime`,`refid`,`userid`,`content`,`reply`) values (91,'2021-02-22 15:48:49',1,1,'评论内容1','回复内容1'),(92,'2021-02-22 15:48:49',2,2,'评论内容2','回复内容2'),(93,'2021-02-22 15:48:49',3,3,'评论内容3','回复内容3'),(94,'2021-02-22 15:48:49',4,4,'评论内容4','回复内容4'),(95,'2021-02-22 15:48:49',5,5,'评论内容5','回复内容5'),(96,'2021-02-22 15:48:49',6,6,'评论内容6','回复内容6'),(1613980606127,'2021-02-22 15:56:45',1613980511836,11,'测试',NULL),(1613980608108,'2021-02-22 15:56:47',1613980511836,11,'测试',NULL),(1613981043341,'2021-02-22 16:04:03',1613980797736,1613980983448,'常识',NULL),(1618557275333,'2021-04-16 15:14:34',1618557156351,11,'123','312'),(1618557276189,'2021-04-16 15:14:35',1618557156351,11,'123','321');

/*Table structure for table `exampaper` */

DROP TABLE IF EXISTS `exampaper`;

CREATE TABLE `exampaper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) NOT NULL COMMENT '试卷名称',
  `time` int(11) NOT NULL COMMENT '考试时长(分钟)',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '试卷状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1618557180023 DEFAULT CHARSET=utf8 COMMENT='试卷表';

/*Data for the table `exampaper` */

insert  into `exampaper`(`id`,`addtime`,`name`,`time`,`status`) values (1613980532527,'2021-02-22 15:55:31','试卷1',60,1),(1613980819454,'2021-02-22 16:00:19','试卷2',60,1),(1618557180022,'2021-04-16 15:12:59','试卷3',10,1);

/*Table structure for table `examquestion` */

DROP TABLE IF EXISTS `examquestion`;

CREATE TABLE `examquestion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `paperid` bigint(20) NOT NULL COMMENT '所属试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `type` bigint(20) DEFAULT '0' COMMENT '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
  `sequence` bigint(20) DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1618557205019 DEFAULT CHARSET=utf8 COMMENT='试题表';

/*Data for the table `examquestion` */

insert  into `examquestion`(`id`,`addtime`,`paperid`,`papername`,`questionname`,`options`,`score`,`answer`,`analysis`,`type`,`sequence`) values (1613980565683,'2021-02-22 15:56:05',1613980819454,'试卷2','1+1=？','[{\"text\":\"A.1\",\"code\":\"A\"},{\"text\":\"B.2\",\"code\":\"B\"},{\"text\":\"C.3\",\"code\":\"C\"},{\"text\":\"D.4\",\"code\":\"D\"}]',100,'B','测试',0,1),(1613980850031,'2021-02-22 16:00:50',1613980532527,'试卷1','1+1=？','[{\"text\":\"A.1\",\"code\":\"A\"},{\"text\":\"B.2\",\"code\":\"B\"},{\"text\":\"C.3\",\"code\":\"C\"},{\"text\":\"D.4\",\"code\":\"D\"}]',10,'B','常识',0,1),(1613980881960,'2021-02-22 16:01:21',1613980532527,'试卷1','1+1=3','[{\"text\":\"A.1\",\"code\":\"A\"},{\"text\":\"B.2\",\"code\":\"B\"},{\"text\":\"C.3\",\"code\":\"C\"},{\"text\":\"D.4\",\"code\":\"D\"}]',20,'A,C','测试',1,2),(1613980896832,'2021-02-22 16:01:36',1613980532527,'试卷1','1+1=3','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',30,'A','测试',2,3),(1613980913312,'2021-02-22 16:01:53',1613980532527,'试卷1','1+1=？','[]',4,'2','常识',3,4),(1618557205018,'2021-04-16 15:13:24',1618557180022,'试卷3','1','[{\"text\":\"B.1\",\"code\":\"B\"},{\"text\":\"A.1\",\"code\":\"A\"}]',100,'B','1',0,20);

/*Table structure for table `examrecord` */

DROP TABLE IF EXISTS `examrecord`;

CREATE TABLE `examrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `paperid` bigint(20) NOT NULL COMMENT '试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionid` bigint(20) NOT NULL COMMENT '试题id（外键）',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `myscore` bigint(20) NOT NULL DEFAULT '0' COMMENT '试题得分',
  `myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1618557308431 DEFAULT CHARSET=utf8 COMMENT='考试记录表';

/*Data for the table `examrecord` */

insert  into `examrecord`(`id`,`addtime`,`userid`,`username`,`paperid`,`papername`,`questionid`,`questionname`,`options`,`score`,`answer`,`analysis`,`myscore`,`myanswer`) values (1618553393537,'2021-04-16 14:09:53',1,NULL,1613980532527,'试卷1',1613980850031,'1+1=？','[{\"text\":\"A.1\",\"code\":\"A\"},{\"text\":\"B.2\",\"code\":\"B\"},{\"text\":\"C.3\",\"code\":\"C\"},{\"text\":\"D.4\",\"code\":\"D\"}]',10,'B','常识',10,'B'),(1618553406167,'2021-04-16 14:10:05',1,NULL,1613980532527,'试卷1',1613980881960,'1+1=3','[{\"text\":\"A.1\",\"code\":\"A\"},{\"text\":\"B.2\",\"code\":\"B\"},{\"text\":\"C.3\",\"code\":\"C\"},{\"text\":\"D.4\",\"code\":\"D\"}]',20,'A,C','测试',0,'B'),(1618553409858,'2021-04-16 14:10:09',1,NULL,1613980532527,'试卷1',1613980896832,'1+1=3','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',30,'A','测试',0,'B'),(1618553415575,'2021-04-16 14:10:15',1,NULL,1613980532527,'试卷1',1613980913312,'1+1=？','[]',4,'2','常识',4,'2'),(1618557308430,'2021-04-16 15:15:08',11,NULL,1618557180022,'试卷3',1618557205018,'1','[{\"text\":\"B.1\",\"code\":\"B\"},{\"text\":\"A.1\",\"code\":\"A\"}]',100,'B','1',100,'B');

/*Table structure for table `jiaoshi` */

DROP TABLE IF EXISTS `jiaoshi`;

CREATE TABLE `jiaoshi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuming` varchar(200) NOT NULL COMMENT '用户名',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xingming` varchar(200) NOT NULL COMMENT '姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `nianling` int(11) DEFAULT NULL COMMENT '年龄',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `zhaopian` varchar(200) DEFAULT NULL COMMENT '照片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yonghuming` (`yonghuming`)
) ENGINE=InnoDB AUTO_INCREMENT=1613980983449 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `jiaoshi` */

insert  into `jiaoshi`(`id`,`addtime`,`yonghuming`,`mima`,`xingming`,`xingbie`,`nianling`,`shouji`,`youxiang`,`zhaopian`) values (11,'2021-02-22 15:48:49','111','123456','姓名1','男',1,'13823888881','773890001@qq.com','http://localhost:8080/moocjiaoxuepingtai/upload/yonghu_zhaopian1.jpg'),(12,'2021-02-22 15:48:49','222','123456','姓名2','男',2,'13823888882','773890002@qq.com','http://localhost:8080/moocjiaoxuepingtai/upload/yonghu_zhaopian2.jpg'),(13,'2021-02-22 15:48:49','333','123456','姓名3','男',3,'13823888883','773890003@qq.com','http://localhost:8080/moocjiaoxuepingtai/upload/yonghu_zhaopian3.jpg'),(14,'2021-02-22 15:48:49','444','123456','姓名4','男',4,'13823888884','773890004@qq.com','http://localhost:8080/moocjiaoxuepingtai/upload/yonghu_zhaopian4.jpg'),(15,'2021-02-22 15:48:49','555','123456','姓名5','男',5,'13823888885','773890005@qq.com','http://localhost:8080/moocjiaoxuepingtai/upload/yonghu_zhaopian5.jpg'),(16,'2021-02-22 15:48:49','666','123456','姓名6','男',6,'13823888886','773890006@qq.com','http://localhost:8080/moocjiaoxuepingtai/upload/yonghu_zhaopian6.jpg');

/*Table structure for table `kewaizhishi` */

DROP TABLE IF EXISTS `kewaizhishi`;

CREATE TABLE `kewaizhishi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) DEFAULT NULL COMMENT '标题',
  `leibie` varchar(200) DEFAULT NULL COMMENT '类别',
  `fenlei` varchar(200) DEFAULT NULL COMMENT '分类',
  `fengmian` varchar(200) DEFAULT NULL COMMENT '封面',
  `shipin` varchar(200) DEFAULT NULL COMMENT '视频',
  `wenjian` varchar(200) DEFAULT NULL COMMENT '文件',
  `riqi` date DEFAULT NULL COMMENT '日期',
  `jianjie` longtext COMMENT '简介',
  `xiangqing` longtext COMMENT '详情',
  `thumbsupnum` int(11) DEFAULT '0' COMMENT '赞',
  `crazilynum` int(11) DEFAULT '0' COMMENT '踩',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  `clicknum` int(11) DEFAULT '0' COMMENT '点击次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1618557156352 DEFAULT CHARSET=utf8 COMMENT='课外知识';

/*Data for the table `kewaizhishi` */

insert  into `kewaizhishi`(`id`,`addtime`,`biaoti`,`leibie`,`fenlei`,`fengmian`,`shipin`,`wenjian`,`riqi`,`jianjie`,`xiangqing`,`thumbsupnum`,`crazilynum`,`clicktime`,`clicknum`) values (31,'2021-02-22 15:48:49','标题1','文科','分类1','http://localhost:8080/moocjiaoxuepingtai/upload/kewaizhishi_fengmian1.jpg','http://localhost:8080/moocjiaoxuepingtai/upload/1618552913522.mp4','http://localhost:8080/moocjiaoxuepingtai/upload/1618552920647.doc','2021-05-14','简介1','<p>详情1</p>',1,1,'2021-04-16 15:12:42',3),(32,'2021-02-22 15:48:49','标题2','理科','分类2','http://localhost:8080/moocjiaoxuepingtai/upload/1618552941687.jpg','http://localhost:8080/moocjiaoxuepingtai/upload/1618552947765.mp4','http://localhost:8080/moocjiaoxuepingtai/upload/1618552952806.doc','2021-02-22','简介2','<p>详情2</p>',4,3,'2021-04-16 15:14:20',5),(33,'2021-02-22 15:48:49','标题3','文科','分类3','http://localhost:8080/moocjiaoxuepingtai/upload/kewaizhishi_fengmian3.jpg','http://localhost:8080/moocjiaoxuepingtai/upload/1618552998195.mp4','http://localhost:8080/moocjiaoxuepingtai/upload/1618552994245.rar','2021-02-22','简介3','<p>详情3</p>',3,3,'2021-04-16 14:03:07',5),(34,'2021-02-22 15:48:49','标题4','理科','分类4','http://localhost:8080/moocjiaoxuepingtai/upload/kewaizhishi_fengmian4.jpg','http://localhost:8080/moocjiaoxuepingtai/upload/1618553011953.mp4','http://localhost:8080/moocjiaoxuepingtai/upload/1618553015360.rar','2021-02-22','简介4','<p>详情4</p>',4,4,'2021-04-16 14:03:25',5),(1618557156351,'2021-04-16 15:12:36','标题5','文科','123','http://localhost:8080/moocjiaoxuepingtai/upload/1618557141983.jpg','http://localhost:8080/moocjiaoxuepingtai/upload/1618557145873.mp4','http://localhost:8080/moocjiaoxuepingtai/upload/1618557149263.rar','2021-04-09','简介1','<p><span style=\"color: rgb(96, 98, 102);\">详情1</span></p>',0,0,'2021-04-16 15:16:33',4);

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `introduction` longtext COMMENT '简介',
  `picture` varchar(200) NOT NULL COMMENT '图片',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1613980949908 DEFAULT CHARSET=utf8 COMMENT='学习资讯';

/*Data for the table `news` */

insert  into `news`(`id`,`addtime`,`title`,`introduction`,`picture`,`content`) values (81,'2021-02-22 15:48:49','标题1','简介1','http://localhost:8080/moocjiaoxuepingtai/upload/news_picture1.jpg','内容1'),(82,'2021-02-22 15:48:49','标题2','简介2','http://localhost:8080/moocjiaoxuepingtai/upload/news_picture2.jpg','内容2'),(83,'2021-02-22 15:48:49','标题3','简介3','http://localhost:8080/moocjiaoxuepingtai/upload/news_picture3.jpg','内容3'),(84,'2021-02-22 15:48:49','标题4','简介4','http://localhost:8080/moocjiaoxuepingtai/upload/news_picture4.jpg','内容4'),(85,'2021-02-22 15:48:49','标题5','简介5','http://localhost:8080/moocjiaoxuepingtai/upload/news_picture5.jpg','内容5'),(86,'2021-02-22 15:48:49','标题6','简介6','http://localhost:8080/moocjiaoxuepingtai/upload/news_picture6.jpg','内容6'),(1613980949907,'2021-02-22 16:02:29','学习资讯','常识','http://localhost:8080/moocjiaoxuepingtai/upload/1613980945895.jpg','<p>常识常识常识四成型</p>');

/*Table structure for table `storeup` */

DROP TABLE IF EXISTS `storeup`;

CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) DEFAULT NULL COMMENT '收藏id',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '收藏名称',
  `picture` varchar(200) NOT NULL COMMENT '收藏图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1618557291436 DEFAULT CHARSET=utf8 COMMENT='收藏表';

/*Data for the table `storeup` */

insert  into `storeup`(`id`,`addtime`,`userid`,`refid`,`tablename`,`name`,`picture`) values (1618557291435,'2021-04-16 15:14:50',11,1618557156351,'kewaizhishi','标题5','http://localhost:8080/moocjiaoxuepingtai/upload/1618557141983.jpg');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'abo','users','管理员','qq663jbcmh7zaca0xdjq75bapxgdv5dc','2021-02-22 15:51:04','2021-04-16 16:16:41'),(2,11,'001','yonghu','用户','urocptf949xxrvcvgmax1iu9t5p1qts5','2021-02-22 15:56:36','2021-04-16 16:16:26'),(3,1613980983448,'002','yonghu','用户','ed23kml3sxqukh0blhjicid364vuvvns','2021-02-22 16:03:09','2021-02-22 17:03:10'),(4,11,'111','jiaoshi','教师','jvmf8tktnkqdaxnvv2gryexgstzte3lt','2021-04-16 14:54:21','2021-04-16 16:13:39');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2021-02-22 15:48:50');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuming` varchar(200) NOT NULL COMMENT '用户名',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xingming` varchar(200) NOT NULL COMMENT '姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `nianling` int(11) DEFAULT NULL COMMENT '年龄',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `zhaopian` varchar(200) DEFAULT NULL COMMENT '照片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yonghuming` (`yonghuming`)
) ENGINE=InnoDB AUTO_INCREMENT=1613980983449 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`addtime`,`yonghuming`,`mima`,`xingming`,`xingbie`,`nianling`,`shouji`,`youxiang`,`zhaopian`) values (11,'2021-02-22 15:48:49','111','123456','姓名1','男',1,'13823888881','773890001@qq.com','http://localhost:8080/moocjiaoxuepingtai/upload/yonghu_zhaopian1.jpg'),(12,'2021-02-22 15:48:49','222','123456','姓名2','男',2,'13823888882','773890002@qq.com','http://localhost:8080/moocjiaoxuepingtai/upload/yonghu_zhaopian2.jpg'),(13,'2021-02-22 15:48:49','333','123456','姓名3','男',3,'13823888883','773890003@qq.com','http://localhost:8080/moocjiaoxuepingtai/upload/yonghu_zhaopian3.jpg'),(14,'2021-02-22 15:48:49','444','123456','姓名4','男',4,'13823888884','773890004@qq.com','http://localhost:8080/moocjiaoxuepingtai/upload/yonghu_zhaopian4.jpg'),(15,'2021-02-22 15:48:49','555','123456','姓名5','男',5,'13823888885','773890005@qq.com','http://localhost:8080/moocjiaoxuepingtai/upload/yonghu_zhaopian5.jpg'),(16,'2021-02-22 15:48:49','666','123456','姓名6','男',6,'13823888886','773890006@qq.com','http://localhost:8080/moocjiaoxuepingtai/upload/yonghu_zhaopian6.jpg');

/*Table structure for table `zhishifenlei` */

DROP TABLE IF EXISTS `zhishifenlei`;

CREATE TABLE `zhishifenlei` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `leibie` varchar(200) DEFAULT NULL COMMENT '类别',
  `fenlei` varchar(200) DEFAULT NULL COMMENT '分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1618557113302 DEFAULT CHARSET=utf8 COMMENT='知识分类';

/*Data for the table `zhishifenlei` */

insert  into `zhishifenlei`(`id`,`addtime`,`leibie`,`fenlei`) values (1613980304767,'2021-02-22 15:51:44','文科','语文'),(1613980328058,'2021-02-22 15:52:07','理科','数学'),(1613980370268,'2021-02-22 15:52:50','理科','化学'),(1618552411110,'2021-04-16 13:53:31','文科','历史'),(1618557113301,'2021-04-16 15:11:52','文科','123');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
