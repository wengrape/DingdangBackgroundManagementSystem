-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: my_bd_01
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ev_users`
--

DROP TABLE IF EXISTS `ev_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ev_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL COMMENT '用户的昵称',
  `email` varchar(255) DEFAULT NULL,
  `user_pic` text COMMENT '用户头像',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ev_users`
--

LOCK TABLES `ev_users` WRITE;
/*!40000 ALTER TABLE `ev_users` DISABLE KEYS */;
INSERT INTO `ev_users` VALUES (1,'admin','000000',NULL,NULL,NULL),(2,'Tom','123456',NULL,NULL,NULL),(3,'Tom1','$2a$10$Rro38gIQuKp4Yyvx87o1OewgeBqtw1uzoEg2q3QPGtTj3el9vJn0e',NULL,NULL,NULL),(4,'Jone','$2a$10$yT5iOTQSpnnkp5us1GCkfes0xGM66siYV0vm9p1w9nf8akqtRlOzS','ji','aaa@qq.com',NULL),(5,'Gray','$2a$10$RRG9myqpuMg2o./Jw7WTBu1zo5y3RpUJxR21JZo5a13zvQW3dEugO','tom','sf@qq.com',NULL),(7,'Red','$2a$10$ckmjCVAO/Sr7l9AhdLVPWu.EmfaNY6UMVpVk8pA3rZtC4TaqXhu0K',NULL,NULL,NULL),(8,'Tom','$2a$10$7TkpxEOKtU1M6nqRnsf5y.drNWEX7AtMd6y7/nVq4rbTgoheLEjYC',NULL,NULL,NULL),(9,'Yellow','$2a$10$0G6Ym7AYRrFwkL3CP8XLBud/8odZr/MAyG66g/G90CCxqR6mBB/l6',NULL,NULL,'data:image/png;base64,VE9PTUFOWVNFQ1JFVFM='),(12,'admin03','000000',NULL,NULL,NULL),(13,'admin04','$2a$10$JVjil0m.LrMLmTfXK6vi3.79Shjn8o/DG5QckTVojxrv.BFJtAD26',NULL,NULL,NULL),(14,'202020203488','$2a$10$K.V3ZptKj89TdmcpwGmcPuJiI.2ezbuX3aC/EhE1M.3eq2QDchXQu',NULL,NULL,NULL),(15,'Yellow01','$2a$10$hdhPKO4ZTm62frRp3RDpMubQHlJox9IgrW4WxzkYZRVFAUN.hkNUm',NULL,NULL,NULL),(16,'Yellow02','$2a$10$A99xPCeVlrAgmomqsYwbj.Co8gky7vwO36o.rxmYgWb9WRl3VwF5u',NULL,NULL,NULL),(17,'Wen','$2a$10$beHAcBqsVed6rEURFa6Gi.nnpu2Dq8guOq0zpfx7nKUoSh1ZeovmG',NULL,NULL,NULL),(18,'uy','$2a$10$8yVEgXE5/ORtajsiPmGZYu0vWj2Un.gz131n/ybu8HFFeLhnbsYFe',NULL,NULL,NULL),(19,'Yellow04','$2a$10$GKZU9zXpAae6Bo4ZJP5v.uJPh5ilcJeLrLEQhXYFWv7zoXPMG0O7W',NULL,NULL,NULL),(20,'Yellow0121','$2a$10$BfjgnJUSjQU/gQcdAEkj0Ohjd3Y5yui/W8M9I0UrvxVEmU.n75mku',NULL,NULL,NULL),(21,'Like','$2a$10$nXAJ3pv7/EsGX0uKjDSp.efNzrooAVh3ejHGbn1S/OUk8wA5KPkxi',NULL,NULL,NULL),(22,'小白','$2a$10$3kmUd.H6Xb5OFDDDCW4/W./jKo5G8qdVlPBEa5z7AvZZP5yYS/BYq',NULL,NULL,NULL),(23,'he','$2a$10$Dd2i5RcEcNB/vYayn1w11OlLDGPme8zNYOF53.eCxAN3PVhg01Jo2',NULL,NULL,NULL),(24,'21','$2a$10$X2Hzfp1ZGVEBmXY2y9T6uOo3670PbY4cTlR0z8yeyWjYUT6WxyFgC',NULL,NULL,NULL),(25,'12111','$2a$10$umSEYGJWxYXi3KVZxOKJTePdchgWrpfdjdh7GoEFp1BwdZQV18oue',NULL,NULL,NULL),(26,'000000','$2a$10$EKzLfcPgx.SIZ3ya9NQmF.XSaWDONMl0nlc23TxK1jlFEbZtrPsSK',NULL,NULL,NULL),(27,'111111','$2a$10$Rdw9k.YRcmIRxjpGT7H99.lG7x0PI0OO.AlZHkELox7qTb0ZC2RNG',NULL,NULL,NULL),(28,'fff','$2a$10$BOF86XlbtLkySppCzvTGcu40iFLo6mTOTYIm.ysiBYJ.zIJfjNGGO',NULL,NULL,NULL),(29,'xiaobaihua','$2a$10$VXsNaj2SgacCJQTy3ktzcOtnTrSIMofYoQA68JokJmcf9uCZ48oGG',NULL,NULL,NULL),(30,'11111111','$2a$10$wYHI1ifS8jcfZIbZoVfyiuRY96xqoGmNgEWUtglFq7QBzoaw6cnNW',NULL,NULL,NULL),(31,'11111111111','$2a$10$jl7C4LJ2xpCIMiK33/23We/Ync1YHWmSTwJ9HiK2ynPlSBacwgWim',NULL,NULL,NULL),(32,'123','$2a$10$0vHDkc5zpbZ55JIEv6J/uOE/jlpih3f/PnjRLH4GybZYYSeMoMoLa',NULL,NULL,NULL),(33,'5435','$2a$10$ruJRrsy1TkojYZ3/0b8nZuTiy18QxKwznZgBBcVuennzWiZ0VU5N6',NULL,NULL,NULL),(34,'huahua','$2a$10$WquZnpbGi9HqJfMWdN75ZO.1wYTZMh5WnQJhDJdE11A9mPXcNXuoq',NULL,NULL,NULL);
/*!40000 ALTER TABLE `ev_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '表示用户的状态\n0 正常\n1 禁止',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户的信息描述\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Tom','123',0),(3,'Gray','123',0),(4,'Red','123',0),(9,'Jone','admin123',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'my_bd_01'
--

--
-- Dumping routines for database 'my_bd_01'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-26 10:49:53
