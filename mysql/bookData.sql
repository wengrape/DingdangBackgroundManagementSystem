-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: bookdata
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
-- Table structure for table `author_management`
--

DROP TABLE IF EXISTS `author_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_management` (
  `id` int NOT NULL,
  `author_name` varchar(10) NOT NULL,
  `author_sex` char(2) NOT NULL,
  `author_age` int NOT NULL,
  `author_address` varchar(65) NOT NULL,
  `book_name` varchar(65) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_management`
--

LOCK TABLES `author_management` WRITE;
/*!40000 ALTER TABLE `author_management` DISABLE KEYS */;
INSERT INTO `author_management` VALUES (1,'余华','男',54,'浙江杭州','活着'),(2,'藤萝为枝','女',23,'湖南长沙','偏偏宠爱'),(3,'小黑','男',32,'湖南怀化','我失去你的那一天'),(4,'肉包不吃肉','女',27,'北京朝阳','海棠微雨共归途2'),(5,'小白','男',34,'湖南岳阳','中西印哲学导论'),(6,'张大可','女',23,'北京朝阳','《史记》讲义+《史记》中的宴会'),(7,'温功义','男',45,'湖南岳阳','三案始末 影响大明王朝命运的三大谜案'),(8,'薄世宁','男',56,'湖南怀化',' 薄世宁医学通识讲义 2019年度中国好书'),(9,'罗振宇','男',43,'湖南怀化','阅读的方法'),(10,'乔·博勒','男',52,'湖南岳阳','学习天性'),(11,'邱锡鹏 ','男',45,'湖南怀化','神经网络与深度学习'),(12,'蔡澜 ','女',34,'湖南岳阳','人间好玩'),(13,'戴蓉','女',23,'湖南岳阳','春天，我想去田野里采一朵花'),(14,'李睿秋','女',26,'北京','打开心智'),(15,'海克·法勒 ','女',28,'上海','你想过怎样的一生？'),(16,'临公子','男',39,'杭州','你缺的不是努力，而是变现的能力：用准确努力撬动财富自由'),(17,'风晓樱寒','女',32,'北京','玫瑰予秃鹫 '),(18,'叶斐然','男',34,'广州','白桃乌龙'),(19,'栖见','男',34,'广西','桃枝气泡'),(20,'书海沧生','男',37,'湖南','十年一品温如言'),(21,'顾诚','男',36,'武汉','南明史'),(22,'德克斯特·霍约斯','男',32,'北京朝阳','罗马的胜利');
/*!40000 ALTER TABLE `author_management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_back`
--

DROP TABLE IF EXISTS `book_back`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_back` (
  `id` int NOT NULL,
  `book_name` varchar(65) NOT NULL,
  `back_person` varchar(65) NOT NULL,
  `back_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_back`
--

LOCK TABLES `book_back` WRITE;
/*!40000 ALTER TABLE `book_back` DISABLE KEYS */;
INSERT INTO `book_back` VALUES (1,'活着','刘一一','2022-08-09 00:00:00'),(2,'偏偏宠爱','刘一二','2022-07-05 00:00:00'),(3,'我失去你的那一天','刘一三','2022-05-08 00:00:00'),(4,'海棠微雨共归途2','李一一','2022-07-09 00:00:00'),(5,'中西印哲学导论','李一一','2022-04-09 00:00:00'),(6,'《史记》讲义+《史记》中的宴会','李一二','2022-05-03 00:00:00'),(7,'三案始末 影响大明王朝命运的三大谜案','李一五','2022-04-07 00:00:00'),(8,' 薄世宁医学通识讲义 2019年度中国好书','李一二','2022-03-05 00:00:00'),(9,'打开心智','白信息','2022-10-01 00:00:00'),(10,'你想过怎样的一生？','白金','2022-01-10 00:00:00'),(11,'你缺的不是努力，而是变现的能力：用准确努力撬动财富自由','李贝','2022-01-02 00:00:00'),(12,'玫瑰予秃鹫 ','古天','2021-05-06 00:00:00'),(13,'白桃乌龙','关余','2022-07-23 00:00:00'),(14,'桃枝气泡','广小天','2022-08-23 00:00:00'),(15,'十年一品温如言','李大大','2021-04-24 00:00:00'),(16,'南明史','王先','2022-04-03 00:00:00'),(17,'罗马的胜利','黄含','2022-04-06 00:00:00'),(18,'《史记》讲义+《史记》中的宴会','时莹','2019-10-20 00:00:00');
/*!40000 ALTER TABLE `book_back` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_classification`
--

DROP TABLE IF EXISTS `book_classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_classification` (
  `book_name` varchar(65) NOT NULL,
  `id` int NOT NULL,
  `book_press` varchar(65) NOT NULL,
  `book_classify` varchar(65) NOT NULL,
  `book_price` float DEFAULT NULL,
  `book_score` float NOT NULL,
  PRIMARY KEY (`book_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_classification`
--

LOCK TABLES `book_classification` WRITE;
/*!40000 ALTER TABLE `book_classification` DISABLE KEYS */;
INSERT INTO `book_classification` VALUES (' 薄世宁医学通识讲义 2019年度中国好书',9,'中信出版社','当当保健/养生畅销榜',33.2,2.5),('《史记》讲义+《史记》中的宴会',7,'线装书局','历史',123,3.4),('DK世界家具大百科：从古典到当代',4,'华夏出版社','艺术',299,4.4),('三案始末 影响大明王朝命运的三大谜案',8,'生活.读书.新知三联书店','历史',14.5,3.2),('中西印哲学导论',1,'北京大学出版社','哲学',63.9,4.2),('人间好玩',13,'湖南文艺出版社','文学',22,4.1),('你想过怎样的一生？',15,'北京联合出版有限公司','励志畅销榜',88.5,4.2),('你缺的不是努力，而是变现的能力：用准确努力撬动财富自由',16,'中国友谊出版公司','励志畅销榜',22.4,3.5),('偏偏宠爱',5,'青岛出版社','青春文学',38.9,3.8),('十年一品温如言',20,'百花洲文艺出版社','青春文学',64,2.5),('南明史',21,'北京日报出版社','历史',169,3.5),('学习天性',11,'中国友谊出版公司','励志畅销榜',39.6,1.1),('我失去你的那一天',2,'湖南文艺出版社','青春文学',24.9,3.4),('打开心智',15,'打开心智','励志畅销榜',39,3.4),('春天，我想去田野里采一朵花',14,'北京联合出版有限公司','文学',44,2.3),('桃枝气泡',19,'百花洲文艺出版社','青春文学',24.9,3.5),('活着',6,'北京大学出版社','文学',54.8,4.9),('海棠微雨共归途2',3,'广东旅游出版社','青春文学',36.5,4.7),('玫瑰予秃鹫 ',17,'西安出版社','青春文学',22.5,4.1),('白桃乌龙',18,'江苏凤凰文艺出版社','青春文学',34.9,4.1),('神经网络与深度学习',12,'机械工业出版社','计算机',73,4.3),('罗马的胜利',22,'天津人民出版社','历史',24,2.8),('阅读的方法',10,'新星出版社','励志畅销榜',43.1,2.3);
/*!40000 ALTER TABLE `book_classification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_lending`
--

DROP TABLE IF EXISTS `book_lending`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_lending` (
  `id` int NOT NULL,
  `book_name` varchar(65) NOT NULL,
  `lending_person` varchar(65) NOT NULL,
  `lending_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_yuiyu` (`book_name`),
  CONSTRAINT `FK_yuiyu` FOREIGN KEY (`book_name`) REFERENCES `book_classification` (`book_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_lending`
--

LOCK TABLES `book_lending` WRITE;
/*!40000 ALTER TABLE `book_lending` DISABLE KEYS */;
INSERT INTO `book_lending` VALUES (1,'活着','夏麦校','2022-08-31 00:00:00'),(2,'活着','刘美玲','2022-02-13 00:00:00'),(3,'偏偏宠爱','黄百分','2021-12-24 00:00:00'),(4,'海棠微雨共归途2','李白白','2022-01-03 00:00:00'),(5,'中西印哲学导论','叶小花','2021-10-09 00:00:00'),(6,'《史记》讲义+《史记》中的宴会','李一一','2022-03-26 00:00:00'),(7,'三案始末 影响大明王朝命运的三大谜案','刘一一','2022-01-03 00:00:00'),(8,' 薄世宁医学通识讲义 2019年度中国好书','黄小九','2022-05-01 00:00:00'),(9,'阅读的方法','李一二','2022-08-01 00:00:00'),(10,'学习天性','李一五','2022-04-23 00:00:00'),(11,'神经网络与深度学习','刘白菜','2022-01-21 00:00:00'),(12,'人间好玩','李自知','2022-03-04 00:00:00'),(13,'春天，我想去田野里采一朵花','王小二','2022-01-04 00:00:00'),(14,'人间好玩','黄大大','2020-03-12 00:00:00'),(15,'打开心智','汪中','2022-10-10 00:00:00'),(16,'你想过怎样的一生？','何苗','2021-03-20 00:00:00'),(17,'你缺的不是努力，而是变现的能力：用准确努力撬动财富自由','吴和','2022-01-20 00:00:00'),(18,'玫瑰予秃鹫 ','毛小冰','2019-02-01 00:00:00'),(19,'白桃乌龙','王兄喜','2022-02-01 00:00:00'),(20,'桃枝气泡','李注定','2019-08-20 00:00:00'),(21,'十年一品温如言','胡肖','2020-01-29 00:00:00'),(23,'南明史','夫梧','2021-06-03 00:00:00'),(24,'罗马的胜利','王之时','2022-05-23 00:00:00');
/*!40000 ALTER TABLE `book_lending` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reader_management`
--

DROP TABLE IF EXISTS `reader_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reader_management` (
  `id` int NOT NULL,
  `reader_name` varchar(10) NOT NULL,
  `reader_nickname` varchar(10) NOT NULL,
  `reader_sex` char(2) NOT NULL,
  `reader_age` int NOT NULL,
  `reader_address` varchar(65) NOT NULL,
  `book_name` varchar(65) NOT NULL,
  `leading_name` int NOT NULL,
  `back_name` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_yuu` (`book_name`),
  CONSTRAINT `FK_yuu` FOREIGN KEY (`book_name`) REFERENCES `book_classification` (`book_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reader_management`
--

LOCK TABLES `reader_management` WRITE;
/*!40000 ALTER TABLE `reader_management` DISABLE KEYS */;
INSERT INTO `reader_management` VALUES (1,'李一一','一一','男',23,'华南','我失去你的那一天',4,3),(2,'李一二','一二','女',34,'湖南','活着',5,4),(3,'李一三','一三','男',26,'重庆','偏偏宠爱',6,5),(4,'李一四','一四','男',32,'湖南','海棠微雨共归途2',5,4),(5,'李一五','一五','女',18,'河南','中西印哲学导论',3,2),(6,'李白白','白白','男',33,'河南','《史记》讲义+《史记》中的宴会',5,4),(7,'叶小花','小花','女',32,'哈尔滨','三案始末 影响大明王朝命运的三大谜案',4,3),(8,'黄小九','小九','男',43,'河南',' 薄世宁医学通识讲义 2019年度中国好书',2,1),(9,'刘白菜','白菜','女',23,'黑龙江','阅读的方法',7,6),(10,'李自知','自知','男',44,'河南','学习天性',3,2),(11,'王小二','小二','男',36,'新疆','神经网络与深度学习',5,4),(12,'王玉','玉玉','女',34,'河南','人间好玩',8,7),(13,'李花','花花','女',23,'华南','春天，我想去田野里采一朵花',10,9),(14,'李丽','丽丽','女',25,'华南','神经网络与深度学习',10,9),(15,'王小被','小贝','男',23,'湖南','活着',32,21),(16,'李睿秋','睿秋','男',21,'湖北','打开心智',43,42),(17,'何柏','何何','男',21,'湖南','你想过怎样的一生？',23,20),(18,'广小天','小天','男',21,'湖南','你缺的不是努力，而是变现的能力：用准确努力撬动财富自由',20,19),(19,'王先','王王','女',21,'华南','玫瑰予秃鹫 ',21,20),(20,'李贝','贝贝','男',25,'湖南','白桃乌龙',32,31),(21,'黄含','含含','男',21,'华南','桃枝气泡',34,33),(22,'时莹','莹莹','女',23,'湖南','十年一品温如言',31,32),(23,'毛小冰','小冰','男',25,'黑龙江','南明史',11,10),(24,'王小二','小二','男',23,'华南','罗马的胜利',16,15),(25,'李注定','注定','男',23,'华南','中西印哲学导论',27,26);
/*!40000 ALTER TABLE `reader_management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bookdata'
--

--
-- Dumping routines for database 'bookdata'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-26 10:46:49
