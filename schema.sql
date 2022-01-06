-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: test
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `deck`
--

DROP TABLE IF EXISTS `deck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deck` (
  `cardid` tinyint NOT NULL AUTO_INCREMENT,
  `suits` enum('♥','♦','♠','♣') NOT NULL,
  `val` enum('A','2','3','4','5','6','7','8','9','10','K') NOT NULL,
  `owning` enum('player1','player2','player3','player4','player5','player6') DEFAULT NULL,
  PRIMARY KEY (`cardid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deck`
--

LOCK TABLES `deck` WRITE;
/*!40000 ALTER TABLE `deck` DISABLE KEYS */;
INSERT INTO `deck` VALUES (1,'♥','A',NULL),(2,'♥','2',NULL),(3,'♥','3',NULL),(4,'♥','4',NULL),(5,'♥','5',NULL),(6,'♥','6',NULL),(7,'♥','7',NULL),(8,'♥','8',NULL),(9,'♥','9',NULL),(10,'♥','10',NULL),(11,'♦','A',NULL),(12,'♦','2',NULL),(13,'♦','3',NULL),(14,'♦','4',NULL),(15,'♦','5',NULL),(16,'♦','6',NULL),(17,'♦','7',NULL),(18,'♦','8',NULL),(19,'♦','9',NULL),(20,'♦','10',NULL),(21,'♠','A',NULL),(22,'♠','2',NULL),(23,'♠','3',NULL),(24,'♠','4',NULL),(25,'♠','5',NULL),(26,'♠','6',NULL),(27,'♠','7',NULL),(28,'♠','8',NULL),(29,'♠','9',NULL),(30,'♠','10',NULL),(31,'♣','A',NULL),(32,'♣','2',NULL),(33,'♣','3',NULL),(34,'♣','4',NULL),(35,'♣','5',NULL),(36,'♣','6',NULL),(37,'♣','7',NULL),(38,'♣','8',NULL),(39,'♣','9',NULL),(40,'♣','10',NULL),(41,'♠','K',NULL);
/*!40000 ALTER TABLE `deck` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-31 12:43:13



-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: test
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `game_status`
--

DROP TABLE IF EXISTS `game_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_status` (
  `status` enum('not active','initialized','started','ended','aborded') NOT NULL DEFAULT 'not active',
  `p_turn` enum('p1','p2','p3','p4','p5','p6') DEFAULT NULL,
  `result` enum('p1','p2','p3','p4','p5','p6','d') DEFAULT NULL,
  `last_change` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_status`
--

LOCK TABLES `game_status` WRITE;
/*!40000 ALTER TABLE `game_status` DISABLE KEYS */;
INSERT INTO `game_status` VALUES ('not active',NULL,NULL,'2021-12-28 09:05:30');
/*!40000 ALTER TABLE `game_status` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `game_status_update` BEFORE UPDATE ON `game_status` FOR EACH ROW BEGIN
		set NEW.last_change = now();

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-31 12:43:14


-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: test
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `username` varchar(20) DEFAULT NULL,
  `p_turn` enum('p1','p2','p3','p4','p5','p6') NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `last_action` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`p_turn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (NULL,'p1',NULL,NULL),(NULL,'p2',NULL,NULL),(NULL,'p3',NULL,NULL),(NULL,'p4',NULL,NULL),(NULL,'p5',NULL,NULL),(NULL,'p6',NULL,NULL);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-31 12:43:13


-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: test
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Dumping routines for database 'test'
--
/*!50003 DROP PROCEDURE IF EXISTS `clean_deck` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `clean_deck`()
BEGIN

UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '1');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '2');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '3');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '4');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '5');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '6');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '7');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '8');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '9');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '10');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '11');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '12');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '13');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '14');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '15');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '16');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '17');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '18');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '19');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '20');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '21');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '22');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '23');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '24');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '25');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '26');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '27');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '28');
UPDATE`deck` SET `owning` = NULL WHERE (`cardid` = '29');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '30');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '31');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '32');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '33');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '34');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '35');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '36');
UPDATE `game`.`deck` SET `owning` = NULL WHERE (`cardid` = '37');
UPDATE `game`.`deck` SET `owning` = NULL WHERE (`cardid` = '38');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '39');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '40');
UPDATE `deck` SET `owning` = NULL WHERE (`cardid` = '41');





END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_dups` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_dups`(own varchar(7))
BEGIN
update deck set owning=null where exists(
SELECT val FROM deck t2
              WHERE deck.val = t2.val
              GROUP BY val,owning
   HAVING COUNT(*)=2 or count(*)=4)and owning=own;

delete from deck where owning is null;  
  
delete  E from deck E  INNER JOIN 
    (
        SELECT *, 
               RANK() OVER(PARTITION BY val,owning
               ORDER BY cardid) rankk
        FROM deck where owning=own
    ) T ON E.cardid = t.cardid
    WHERE rankk > 1 ;





END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_deck` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_deck`()
BEGIN
truncate deck;
insert into deck(`suits`,`val`,`owning`) values
('♥','A',null),('♥','2',null),('♥','3',null),('♥','4',null),('♥','5',null),('♥','6',null),('♥','7',null),('♥','8',null),('♥','9',null),('♥','10',null);

insert into deck(`suits`,`val`,`owning`) values 
('♦','A',null),('♦','2',null),('♦','3',null),('♦','4',null),('♦','5',null),('♦','6',null),('♦','7',null),('♦','8',null),('♦','9',null),('♦','10',null);

insert into deck(`suits`,`val`,`owning`) values('♠','A',null),('♠','2',null),('♠','3',null),('♠','4',null),('♠','5',null),('♠','6',null),('♠','7',null),('♠','8',null),('♠','9',null),('♠','10',null);

INSERT INTO deck(`suits`,`val`,`owning`) values
('♣','A',null),('♣','2',null),('♣','3',null),('♣','4',null),('♣','5',null),('♣','6',null),('♣','7',null),('♣','8',null),('♣','9',null),('♣','10',null);

insert into deck(`suits`,`val`,`owning`) values ('♠','K',null);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_deck` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_deck`()
BEGIN
call generate_deck;


call shuffle;
call delete_dups('player1');
call delete_dups('player2');





END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pick_card` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pick_card`(ow varchar(2),id tinyint)
BEGIN

declare cond boolean;
declare stat varchar(15);
declare turn varchar(2);

set stat=(select `status` from game_status);
set turn=(select p_turn from game_status);

if stat='started' then
 if turn=ow then

  if ow='p1' then
   if(select owning from deck where cardid=id)='player2' then
    update deck
     set owning='player1' where cardid=id;
     call delete_dups('player1');
   end if;
  else
  if(select owning from deck where cardid=id)='player1' then
   update deck set owning='player2' where cardid=id;
   call delete_dups('player2');
  end if;
 end if;

update game_status set p_turn=if(ow='p1','p2','p1');
call win_condition;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `shuffle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `shuffle`()
BEGIN

declare a tinyint;
declare x tinyint;
set x=0;
call clean_deck;
forloop:loop
if x>20 then
leave forloop;
end if;
flagloop:loop
set a=FLOOR(RAND()*(41-1+1))+1;
if(select `owning` from deck where cardid=a) is null then
update deck set `owning`='player1' where cardid=a;
leave flagloop;
end if;
end loop;
set x=x+1;
end loop;


set x=0;
forloop:loop
if x>19 then
leave forloop;
end if;
flagloop:loop
set a=FLOOR(RAND()*(41-1+1))+1;
if(select `owning` from deck where cardid=a) is null then
update deck set `owning`='player2' where cardid=a;
leave flagloop;
end if;
end loop;
set x=x+1;
end loop;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `win_condition` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `win_condition`()
BEGIN
 declare cnt2 tinyint; 
 declare cnt tinyint; 
 declare Kown varchar(7);
set cnt=(select count(*) from deck where `owning`='player1');
set cnt2=(select count(*) from deck where `owning`='player2');





set Kown=(select owning from deck where cardid=41);
if cnt=1 then
if Kown='player1' then
update game_status set result='p2';
update game_status set `status`='ended';
end if;
elseif cnt=0 then 
update game_status set result='p1';
update game_status set `status`='ended';
end if;
if cnt2=1 then
if Kown='player2' then
update game_status set result='p1';
update game_status set `status`='ended';
end if;
elseif cnt2=0 then 
update game_status set result='p2';
update game_status set `status`='ended';
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_game`()
BEGIN
call new_deck;
update game_status set status='started';
update game_status set p_turn='p1';
END ;;

DELIMITER ;


DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reset_database`()
BEGIN
call new_deck;
update game_status set status='not active';
update game_status set result=null;
update game_status set p_turn=null;
update players set username=null,token=null where p_turn='p1' or p_turn='p2';

END ;;

DELIMITER ;




-- Dump completed on 2021-12-31 12:43:14

