CREATE DATABASE  IF NOT EXISTS `blpkdphhphnmf0o8ikdt` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `blpkdphhphnmf0o8ikdt`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: blpkdphhphnmf0o8ikdt
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `aluno_tem_cursos`
--

DROP TABLE IF EXISTS `aluno_tem_cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno_tem_cursos` (
  `cursos_id_cursos` int(11) NOT NULL,
  `usuario_id_usuario` int(11) NOT NULL,
  `pagamento_id_pagamento` int(11) NOT NULL,
  PRIMARY KEY (`cursos_id_cursos`,`usuario_id_usuario`),
  KEY `fk_aluno_tem_cursos_usuario_idx` (`usuario_id_usuario`),
  KEY `fk_aluno_tem_cursos_pagamento_idx` (`pagamento_id_pagamento`),
  CONSTRAINT `fk_aluno_tem_cursos_cursos` FOREIGN KEY (`cursos_id_cursos`) REFERENCES `cursos` (`id_cursos`),
  CONSTRAINT `fk_aluno_tem_cursos_pagamento` FOREIGN KEY (`pagamento_id_pagamento`) REFERENCES `pagamento` (`id_pagamento`),
  CONSTRAINT `fk_aluno_tem_cursos_usuario` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_tem_cursos`
--

LOCK TABLES `aluno_tem_cursos` WRITE;
/*!40000 ALTER TABLE `aluno_tem_cursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `aluno_tem_cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aulas`
--

DROP TABLE IF EXISTS `aulas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aulas` (
  `idaulas` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `link_aula` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `cursos_id_cursos` int(11) NOT NULL,
  PRIMARY KEY (`idaulas`),
  KEY `fk_aulas_cursos_idx` (`cursos_id_cursos`),
  CONSTRAINT `fk_aulas_cursos` FOREIGN KEY (`cursos_id_cursos`) REFERENCES `cursos` (`id_cursos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aulas`
--

LOCK TABLES `aulas` WRITE;
/*!40000 ALTER TABLE `aulas` DISABLE KEYS */;
/*!40000 ALTER TABLE `aulas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `mensagem` longtext NOT NULL,
  `remetente_id_usuario` int(11) DEFAULT NULL,
  `destinatario_id_usuario` int(11) DEFAULT NULL,
  `usuario_id_usuario` int(11) NOT NULL,
  KEY `fk_chat_usuario_idx` (`usuario_id_usuario`),
  CONSTRAINT `fk_chat_usuario` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `id_cursos` int(11) NOT NULL AUTO_INCREMENT,
  `descricao_cursos` mediumtext NOT NULL,
  `nome_curso` varchar(70) NOT NULL,
  `categoria_curso` varchar(70) NOT NULL,
  `duraco_curso` varchar(20) NOT NULL,
  `preco_curso` varchar(45) NOT NULL,
  `image` varchar(90) NOT NULL,
  `dono` int(11) NOT NULL,
  PRIMARY KEY (`id_cursos`),
  UNIQUE KEY `id_cursos_UNIQUE` (`id_cursos`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'curso teste','curso','Informatica','20:00','49','https://conteudize.ai/blog/wp-content/uploads/2024/06/como-criar-prompts-para-geracao-de-i',0),(2,'curso teste','curso','Informatica','20:00','49','https://conteudize.ai/blog/wp-content/uploads/2024/06/como-criar-prompts-para-geracao-de-i',0),(3,'curso teste','curso','Informatica','20:00','49','https://conteudize.ai/blog/wp-content/uploads/2024/06/como-criar-prompts-para-geracao-de-i',0),(4,'teste','curso','teste','50:00','55','https://media.istockphoto.com/id/483724081/pt/foto/vale-yosemite-paisagem-e-rio-calif%C3%B',0),(5,'teste','curso','teste','50 min','55','https://i.pinimg.com/736x/fc/ae/92/fcae926c96ccd00b33df12b6ffe31cce.jpg',0);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_de_pagamento`
--

DROP TABLE IF EXISTS `forma_de_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_de_pagamento` (
  `id_forma_de_pagamento` int(11) NOT NULL,
  PRIMARY KEY (`id_forma_de_pagamento`),
  UNIQUE KEY `id_forma_de_pagamento_UNIQUE` (`id_forma_de_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_de_pagamento`
--

LOCK TABLES `forma_de_pagamento` WRITE;
/*!40000 ALTER TABLE `forma_de_pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma_de_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `id_pagamento` int(11) NOT NULL,
  `pagamento_concluido` varchar(45) NOT NULL,
  `pagamento_pendente` varchar(45) NOT NULL,
  `pagamento_data` date NOT NULL,
  `valor_pagamento` double NOT NULL,
  `forma_de_pagamento_id` int(11) NOT NULL,
  PRIMARY KEY (`id_pagamento`),
  UNIQUE KEY `id_pagamento_UNIQUE` (`id_pagamento`),
  KEY `fk_pagamento_forma_de_pagamento_idx` (`forma_de_pagamento_id`),
  CONSTRAINT `fk_pagamento_forma_de_pagamento` FOREIGN KEY (`forma_de_pagamento_id`) REFERENCES `forma_de_pagamento` (`id_forma_de_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor_tem_cursos`
--

DROP TABLE IF EXISTS `professor_tem_cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor_tem_cursos` (
  `usuario_id_usuario` int(11) NOT NULL,
  `cursos_id_cursos` int(11) NOT NULL,
  KEY `fk_professor_cursos_idx` (`cursos_id_cursos`),
  KEY `fk_professor_usuario_idx` (`usuario_id_usuario`),
  CONSTRAINT `fk_professor_cursos` FOREIGN KEY (`cursos_id_cursos`) REFERENCES `cursos` (`id_cursos`),
  CONSTRAINT `fk_professor_usuario` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_tem_cursos`
--

LOCK TABLES `professor_tem_cursos` WRITE;
/*!40000 ALTER TABLE `professor_tem_cursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `professor_tem_cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_usuario` (
  `id_tipo_usuario` int(11) NOT NULL,
  `tipo_comum` varchar(45) NOT NULL,
  `tipo_professor` varchar(45) NOT NULL,
  `tipo_adm` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_usuario`),
  UNIQUE KEY `id_tipo_usuario_UNIQUE` (`id_tipo_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome_usuario` varchar(70) NOT NULL,
  `email_usuario` varchar(35) NOT NULL,
  `celular_usuario` char(11) NOT NULL,
  `senha_usuario` varchar(225) NOT NULL,
  `sobrenome_usuario` varchar(70) NOT NULL,
  `image` blob DEFAULT NULL,
  `comprados` text DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Gustavo','submit.gustavo@yahoo.com','11996919109','$2a$10$crZWNaZoLEm6mDfBDs0ZUuKgnDj5h6V6T0MJEn0KqFykLPR90nez.','Couto',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0ÿ\í\08Photoshop 3.0\08BIM\0\0\0\0\0\08BIM%\0\0\0\0\0\ÔŒÙ\0²\é€	˜\ìøB~ÿ\Û\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿ\Û\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((ÿ\Â\0\0\à\0\ë\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0\0 ‰Q\"> \ÄF\ê\ài,CAY\ÉÖ‚„M\â r\r\å\áL\Ç/<o\Ì=…^\åc†x\î]u«:\æ€Võ\'	º’B£Œ\áy¨=œÁ\Ü\ÎInióªÖz‡*«¶†;W©\Ëe¤ª\ÅÄ–\ÞMa\â\å$‡J\r\rG\\TŠlm\åˆ\Ô¨ƒ\Ã>ˆœrw\'WL\Å$\éLŽ\Ï]Ÿ«ü\Í[\nl%cœ\ÓrÓ§‡\Ð\äP‰Ÿ\×d½| \ÆpzexU\æ’e\Õ\ÛE?Y\ÖWw<}\Í\Þ\Ó\Z¯$–\Ð\ØN˜0R<\Ô!KœjRRxû\Å\ër\ï™\r\Ô\Î\Üü¤\ÈúñFû—\ÏkŒxÜŸUcóžµ.\\Ís©ø»\\-ŽcÛ¼±¹‚[leVÈ‘.ªz¨h&r\ÜXVê¹²›eM}µV²×¸:^v{£\Ð\æy‡¡\çGoCÍ”\Øñ\ÈùAÀ\ï!\î\á$±\î\n’§D\Ô\æÁô1Xc~[&[±bY„ú\Ê\ç¶Y\ÍHö‘.tÝœ\ÖVzŸm\Èh²\ébL™\Ïv­cgYhRªzc.?@¯\Þqý®\ã+{sC²l\\\êÆ­CrT’\Þ[3x” —®\"\çµp5Ïˆº\0ç¤–V]¦Æ²š¾žjüR	ä°¾­]¼\Ñ\ë&;6²5¸¦¢\Öu\Ôôë¨£,T\Ø>j\ï\"²8ü9§\r±¢k*¢\æ\è¯<ö\Ò]ì¬\î5h)-š19§\×XW,ö4w=™fSY4F\Ã\ÞlE\0…‘«\äG²F™¯*Ê«:\å¯˜\È\Ê¦	#\Ã\Æ\ÇJ[\ÚÇ \Ü\ã\'cZF\Ä\\õ3aV­¾9CÓ\0nA¬\Ö<a£ôgD©‚:ú´X,\é\È\Ð\Þiªªý³c\ÏC\èK/š·\Ö\'fù\î‹N¹´Æ´vlb™eUG\ÐtÁ+–\Ü`÷!AX\×/\î([_F‘´[œýû\Ö\Z\Â¢I^%d¼\×4Š&K)\Ãr¹\â!\Ü\î±Baž}–\Ö`úd\Ê\Ú3,ŽG©\ï\Zfˆ¼4UŒ\èù¥$U–H€\ÂCbš[G \ç±Á9®±\Ìx\Ì7s…\é˜ùT#£!\Z\Ä=ñDü¹ŒE\è\Ê×´§A ŽGÊ¤o$r¡\Ê†Q>ˆ\ÅD\Èc½G¹”—ºˆÖ«Oÿ\Ä\0+\0\0\0\0\0\0! \"1A2#0$34ÿ\Ú\0\0z÷%ƒ\Øö\ZƒZ/¨|–möôÛˆð[³\è^\ËD\äV\Ñ\Ä8$²j	Ÿsõ¸füw\Ü\Ü=õ\ã^=§ºÌ˜N´üÏ‰¾·\æY¸DØ™±\ßb{o±\ì|\Z‡(\ãPö×·Üª·±ñú1•\Û^\"6zò´ù¢\0j–ã•Ž5Ø‰¿}\Ïmû):k~Pû+­¬|NˆD\çN-Y}HG\Èk,g$»S!\ÔCn\áks¸}\Ç\Ý\\u°\Û\Ô@Y°úŽñð«\Ë\êžo²Ë‹wµžaV\Ö‰\Ç\ÓÒ­œMÿ\0;aöoGÁ©†±`úQ\ç¤]•(«§®gTòö\Ùq3[<Ž\Í\äo\àã°X(\ÇQž\í \é\ï¯CØ“Ü›qðq°P\êJ³#*ÌŽÀ\ê7\Òý‘òÖ—FkcBb©ô²W\Ë`\ï‡b™•Ž\È{:gD²\á\ëUVP;-»5}”\Û<UÐšš•\ãÛ÷-5\Õr\ì”0¡…L\Ô\ã4{:úf‚¹úN\Öaô«¦6&N—ä½§;;döY¹¸ƒf¾ \Öü*A¶õ1©…\'„Z’Y¥\"…‰›PŸ\ÉV \êU\Ï\ËWœ•£¦<8¸/N\é¦—\ÓwV?O¤þPAfC¼&f\Ù\é\ãý{e~Ý¹±J-LÀ¤5	ž¥\\\Ëþ»)\âNi_T½f.eY0ûzÿ\04\×m\Í\ÍÀ\Ä@\Þ\ã_O\Ä7=t0A\Õgò)\Æ\Ì\Ì{«×‚\'\ê\áñ\Ã\Ü+ÿ\0\'þ\"›=an;´\Zš\Úù%ªkrÓ”\Ü\ßzRcaz†…9\ÆVê…ªÇ²cUurÏŒk]™Ùµ¿8\Ä6=”-’\Ì8\è\ÈgD³ŽgPñ‹\Ð\Æñ8ø¶ BŸ\Ç=G\ÕVOuB\Ç¦Z\ÓºG€ÀOÈž”ôTÁM’¾UN\'\"±¹À¡²¹y¡ƒY£´3¾9\Ý_\ã‹Óª	,Wÿ\0,,ð²\Êi¾7O¢Hœ0\Òbò1R\Æ\à¿\'†§ŒžJ\ÎžœO„¼m3d\Ö‰q¹M\íD\\”°3o·L¯žwü‚ÿ\0òt\Û	ª\ã?š6%œºV)B=\n\Óñ‘g\r@»–_Mr\ÜÐ‘²®¶jó\ßzŸsÁša9K\è\Ë+±N&V\Î%™\Êj\\Z-\é\Ù_ƒO¦ºš™\ãQé‚kµšQ~MÚ±®-\éW£j,{‘\×þ¼û‚½\ÏLF©\Ê9j\Ú5µD|iMª¡[”g\ÇL£³	­:ý\Í\Æf\æ\êY“TüŠ7Ãœ+pˆnœ\ÌT3\Ò1€ŽL&Lf…£¼R\æU{$¦ðÒ«ŠcÁô~÷üþ`~n¡³/mwPó2V\Ë\ÅeÒ‰\Í\Ä\à5`ñ|³7\Ã\Zs5œ§!Ò³$\ÊrH‰j¸f\ã9\ÆyX™9U\Ð2º™È–ÿ\0bJª\Ö\Ð\Ûr\ÏP¤3Z¼Žñü\ÆÇ—F0˜a†qð¢3+QËŠr\å_ªÐ‹cz\ë2?-\é\Öoø\ë~;m\êJR\ÞSG°•øž!³rÇŒ|±\ä¼h\Æy\ØV˜9\ìtª\Ô/O¤Á§’ÐŠ8,P&£	\ÄNYX#5*­N\Ù\îfXRx\íQó±9\î	Ü¯\Z\ËH\ém?ˆX\Ý/FX½3Bc\×\\\×úvG”\Ë\nÓ—§?b7\Ùq®`˜v–§§¨*¡G´û77\ìý\Ú\Íñ\ê\ä÷ú‘\×\Èó8 Y¯n\á3s”\Ü\ßb{o\È\í¸=\årª>µ\à\Íòš•1Y\Ä\âr}‰œ¦û4&77\ß/	\å‡a\ÜCôÿ\0×ª)óþv_–¢ˆg)\Ë\ØO™\Ê›€øÁhZoq~››\í¸\'\éÏŒò9\ë\å¯/\ÍGO~SpŸ1œ·7	…¡h\Ç}‡aõÙ†gÓ£–Ÿ2<&1¾÷\ìÞ£™¸Zß¿\ßc77÷d\Õ\ê&]\Zcð%ô\çÁ\Ü=¿ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0 01@A!ÿ\Ú\0?\ïË¶‹<³ˆ÷Sp¿e\î‡~\ËO\áE\Êe3‹8\è\Ýô\'/DŠ*2\ÕC(¡bx—Þª3ròokõ¡d‡’ø7\è=*k½{ÿ\Ä\0 \0\0\0\0\0\0\0\0\0\0\0\0 !01Qqÿ\Ú\0?]3µ=¿†-‹…\"ù…³¼dˆ§\ÍØ¹—£f%4%\é’23FH\É$:ŠVžZ5«Ó£$’JV¯\Ë/³\"GQ\íé¥Š˜»–U›E\Õ	kj—\\@’\ÞI$’uZey\è[¾…ÞžŸÿ\Ä\0=\0\0\0\0\0\0\0!\"1Q 2Aa0Rbq‘#3@B¡Ñ±Á$4rƒC’“£²ðñÿ\Ú\0\0?\àµr`\rX­œ©ò3‘ô[·•x*ª|Ìš	<\0A`ƒR×°\ÈvNhJ½\ã’\ÉS-’U!\Ô]†\Ò\çhwµ¾\ã{#4G²\Ãd!\Ú\ã\êŒ\â8• \\«f»\á—U5>V‹a´¹Ç€W½µ÷;\ÍJ	º£\Ñ\ãv¥N#‰SYYš\Â&Ž½@¼6\Ìø)\0e_ö\Çt,\ìýEJv¸”z3\Ú*qN\ÅAU\ÝRkTò±\Ç-¹ÿ\0\Ðz‰ \ç{¨=·/\á\Úø\Är=7kÁM\ä¸\í•r\ä³YM5e·\\¸§\\\ËO\Æ\Õ\ÈM.ý“L}ð\à:»ƒ\Äi \Ù*vbHnõwNjðn\\6Oi÷0¹\æWE\ìg‹ šñrýN\Ì\ÖT*\è\ËfMn\Å\\†û\Äfx[’\Ê\ÊZõq*#0\î?•u/wt)\Å5z›M´\åˆ\Ñp½vªh¥\É_òm—\"‡—Œ\åeY|\ê\ãD8mn‹z¢£¡z/‰/oB>aV’¬~m~M[’ðš%\×Ï™W›—)A„\Æ‰\Ö8Œò\ê$<ÿ\0\ÑO[a¹‘\\öý\ÛÏª\Åv \æ¤\Ü1;\'ö\Ú>=M\ãš\é\"N\çüÅƒ²\ÕV”ô\ê‹\\DŠ\Î|õ²H\ÙF™l\Þ;\í£”Ê¼\ÍÓ’¼×¼E]»Áÿ\0”Zr!»1·3’Ž0},\Õx}­\Ü#[§?\"½\ÜN\Ú<S\Õqý\ng%9©\Î\ÆKEP°•Qe\Î%ÁxY\\•ÇŸtr\î«\ì\ß\nDlP b\Ê\ïgè°‰»´\ì\í\Ö\Ê\á:ðXK¤aò”\Û\èŒ\Ãg«LÁWx©E]\ÔM\r¹(vÂ‰\è˜¥t^\Ðe-\×þU\ì\'›U\"ŸEñG&*1\Ï#W\æ½\Ô6An­\\g\ÍML\Îyôÿ\0Õ»4øBd‡©U}ø\Â­µ!a¾|\ÖP”Äƒ¿UJ;E\'Y«tXMt¶\ÄS ƒ\Þre\ëJ\Ý<\Õü§eD\Õ\Z\0¸•w¥†\×r©XŸiRûü\Ïì¿–oúv\ÑT©\n*¬uXM~\ë%\\\Õj©¢gn%\Î/¸\æ\ã\Å¿I*\î–\Êu\ÎJ¢¼N»š—³\Ãc9¹»»\Ã\ï%9	j÷“øTö˜m\Z2\×ÅŒ\ï9/ñ¾ß…@±d¸YU\Åfl©˜Ð¬P!Ÿ\n/\åY\ë5\î\Ã!ÿ\0KTó<\ë\ÕÉ†Œ×¼\Å\ÈÔ…‘\Ú;„\ÙN³\Þþ»\Ó_\Ê4mV\Ú…¹þ\ØY)Ž§%b—ù‚£›?\"k\ÔP®ŽFwŒ–Ž}\×O÷U1Ç€R\éŸ\àV6‡}” hq„ú)^­§\ÇjªõX„ü\Ê\Ü[4\Íy‹+%lÊ›\Ý\ä®B.‡\ÍJ(©¨x\â®\ÈJó&\ß5ñf<f±Cað¢\ÂH\ä\ïÊ¨+2µ³ì¹©‚\nû*ì´¬ŒôR•â„¦Žœ\íV\èRgo’J¹#	’sFñ\à§0\à>¢«\äD­¢Ý°\ç\èŠ\å9Yö°Ù»4‹<j\nªr\ÉN\íU\Z[9Y*r\nnoƒU\Æ7»šœBGŽjƒc_‘’Ã™¡+\Â\ß[\ã\Ì,f~J¬XXZMnø\ÉRgÁÁ`:œös_•\"\Å8•\ä¤¾J‰Î•EJº\à\Ï4eIp°–¶\çò\æx\å‘…Zd„÷‡5O0¦\Ú\nÐ­\ï—\é\Ú\á\ÄrFy;>V‹*³QG¬2©mòP‹¸\ç¢æ§¯Í“­P\äB˜O\ZTYN¦B\Êõò?_êªT\Øÿ\Ä\0\'\0\0\0\0\0\0\0!1AQaq‘¡±Á\Ñð\áñ ÿ\Ú\0\0?!Õº\ìF­•\'@•¹™¦<Á\ØE\ÐyŠt(eóú‹\"]\Ü\ë5\Î\ÜFn>¡\è\ÌÑ·x¹–ŒFŸJõ&Ø—W¬|ˆ/h¤bbJÑ¦rÇŽ±vTS	À:\ë4\ÃX]\Ì\ÓQ˜\×\ì”zu•\Ï†ñ†Œ N—\Ì— µ•ªT&^]y¸yrA]YŸ\×Ô\ßkÕ†¹pÁ\Å\ÅBsË¦Q6v¢\Ç2\ê6ÿ\0\Ã@\ÄH^&™\Øõ¡*`¦]‹…\æmMü?[\î£S|9”\í*¢®DvC¯0]E\Ò\"J¦J4\ÔiKˆ\åb\ÄZ˜\é/ŸB\Í#*8L\ÈÒ× \Ñ\ÐFid\à¶TT™ºüÝ¥–òo{°o\ÐRµ\Ãm½£ð\Ð\í.Z\È0A2&‚E\ÍN„\É\æ`\Åo\Òý1¶°¦ƒñ\Ö_þe`gGI{’¢\r\"–L\0Z\Ãñ~ˆ×º«\ì–\'¶C´\Ã=3Cxš´ob¨+–[@\î5[sW9gYF¬9\Ä_Cu–Áj\êõûº1?ð:\Ìs>|Æ¼Css±\á|¯x(*7\è—4#¨A±„¢œ\ÜJaS–¡ \Å,P•i\Ã\Ì@#Y.°¶\ê>šGB\êz9—ÁF•\ç\Ê\ãÿ\095\0,ø\îefh\É5i{F9Tø\ß\ì%fµª‹\'h®²ž…\Ê\Þ5>\áF£„U\Ò™\Ã2i¯´¶•,U\×k”=¼Ü¢:úŽtû‰¿¦\áC©\Þ9­¸\Ü\ß\Õ\×X_\Â6\0×­\Î\èh\Ê\åWSV\rý.\æ\ÓBSB9>ó,97ø”!(\Û\áar×¤cSQ´\àô‡ÀŒß‰W]§/\íªö”Ž†“¼4?\Zö˜ºy¤\ÐA«‚²7+÷‹S\ÚQQ|]¸™\Ñ8‡õôi-´p»#\0fP´\'ª\í¶\î×«3‘vñúo‰TµB2tG²4\çp;“HzJ)û†€?d²\Ö\íAŠ\×-¥•n±zêº‡\æ&Á[dÏ–•~\ç@šØœm\â,\Ë1\Ê	8„Q\Í²\ÅGy†¢Š‡­\äý ^ö`;N=Gy\Í\â/G\ß\î8,\ÃJ–¡ƒñ˜\Ü!ƒœq0\æôEF}£O¹÷¾\í\åÈ±e\Æ£`\Ç$i	Às0¹~f:ð\ÍUçˆ†´þþ\ÒQŒ¾WsM…mŒ4xgRpŽ†€v6¸™MehùŒ\Ù\È!¥\"N\ÑL‰*–Û¼\ìùˆD \Ê\Å<\Z\ÍÙ‰–½¡\Ã\Ë‡g\æS\nÿ\00|¤©Øþ\ËÜ \Êñ0ð*½œ¼h¥\0`t©aº<Ë†AZ\ÖÁŒ\ë_æ‹¯0E\ÓTw,l\ìó\0\\i)*‹¶“\0OI\â›#)\æû•ýLp1#X\Ôy™>¾f™\Î(^\ç\Ä-jÁ	[Ü¿\ÌOû@E\ngÖ AÀs-›´2P6\Û-\Ín†„\'™¯³\Óx\ç‹›\Å\ì\Ê:¸Å¯EÀ0ü9ƒ }Dò\Ó\Ã\0b­}¡‘\ï:^6]R¨\êKŠŒ$%’\æ\Ø;K*\ßç†‡%<µ/b\è¾eQ˜1ŠN §ª7jY*ú¢ñ\Ç\í0yF`Q\æôB\Âÿ\0!¬\î@ =‘d\ë ü°³´µrY”h@*Aó£´VnŸÁ\ÒR\Ï\îW\ÐF\Ó\å€\ÜxÀ€\\¨\0üf 7Su\äU)‹À<b\Ô\êÿ\0I\\úË‘\Ì\ëw\Äµ:GôÂ¹1\nˆ®bÝ»\é\ÞwC.±²ZAh\Ç4|\â¡u=¿ò€7ØŽ`>\çû»\Þ¿¿˜\í\0\î|R(·\'L¨Û«L®«¶³\'º\ÒQ.\ål\ÓZ\r «\É\ãÙ¼\\)®™Šô\'T·C\â.±\Ö<ŽƒV.\Þ¿\êj¸ù\ë\Íý\"4¥t\ÝL­Ãº\Æ#M#–(]	aÐ\ãü˜vo£\åø«.f€{\æRòM[¿û*\ÖûG²²¿\é+uê§°”ºÓ£˜OÍ½‘¡Wu1}aŠ\è\r‘ï¼Ÿ¤Àùñ\Éó\rÛ¾¡š¡w¤	›J¨¥~`¹ß˜ð\"¸µh{ÁU…n½—\ê\ãÀ\à\ß\â]^!ôöù\Ù\ß!ó0^\çù€øÀŽs\Î\ÐÕ½D™þþ¨k/R\ì\Î7”®\ì£\Z\Ë\Ü\ë¯yM´•\Ü\Û\ã\ÓF#\ì½Àü\Ê\ä•‚»‡x\ÈE34O!ƒŒrr\Æ\É\Üfúo\æ°¯˜ù\0«\â!\êþ\çÀrýk\r\Å÷W}ÿ\0³¤]S\0ñr\å|i\ç1\ãJ\Û\ÌQª`ÛµÅœo«ý¤èš¯Z›³¤\èùc£\ï•l°—ý\Ç÷4)\Ù~Æ€¿” Y\ï–\Æ\Ì/(n¾\ÓX­Ž¬¶\äù?$M‰\ÊV5\ï-¤»²H³sC\ÞK\âiùŸ6\rþ1ñ\rJÿ\08~ \ÙS„\É0¿$«M³·\ä•nc\Z\Äa\Ók¡û„º˜5C·÷™¶p\ë\ÍNJƒ+\Ãýøš¢¤øš/X\ï[fZ@š\â*…SŒó.\ÑS~³ˆB\ÃXq,ºYW\0¡g\ÂAˆ^\ã4€Œ:¨\Ö\Ä\ÄIj\ÄJX3›…Ú·—B(#\Û\Ôz<ýÁ\0>€\Ó\î$šk\Âv\Ç54iš\çÎ¦¤®/vi²w·Û˜•ô3,ª¬ÁÁ\Ó÷1Q¨s;‚\Ìýö\È|&\Ç\ä™<\"*\Zñ‘r\Å\Æ\æþKE\ÝjAŸÒ†›iVÀ\0o&\0ˆ\â´É¤AqÅ1«mFû\n	gr»\ì\á\Ç\åÿ\0ez\ÓMK\Ç\î9UG\\²º2Œ¯\Þ_yŠX«|0À·‚ññ\Z\ÆAmk\Ñ\äTkJ2c)\Ú\ê˜-\Óqû&\×\Z\â+Àž\åUQ*y„¬Aƒ½\ï\ê 5g#\Ûtû\áÄµ³•\Þ[i\ÔûB¹†	\Ñ?\ì`ª\Ñ\Å|\ï)‡\Ñ\n\Ò\Z#‰qn$£AoM\à\í<¥+x\Â\Âö¹]\Í?Y¡¦c\Ù\Î;\æ\ÜnŠ–º\ë+Á}FV6‡]%öøÊ…\Ég’\Ú5ô#YS)©C´\ìƒ`\\5Œ]Â…¯\×J4\ÌN\Û\ÔPÉ¤r8™E\Åð\ìk\Ü\ÞkŸj{?‡\Þ\r\Ñ(\Ô\ÒpB	d¢4—{K½fŒ”Ô¥G8¥Z®}*½4UÀ\Ë}¦•\ë\é.jv\îaø……”\îT­	T\Ó¾º1²­w‹\Åñ£{¸w%\È:\âg\Ò\Ì\"\àˆ1\è6™!¢\ïAV\Z¸›;GD!^…Ff±gL¨j«¨\ÓZ+\à;A\ïZo¥—ÁF‹™\Ò\Ã.\Ù\æ<#B¥0³\Ë+\×1V¥­{Ê±\ÒlE\Þ?Šƒ¤\Üuž\ÑK©µA…Š™¶¼¾Òš+U[QþC|\Èn÷²¢ÿ\0\Ót\ßi\æG—º\r!¼wc©\Z&Fh­\æxg\ÚVotKŒxC\æŒ<z>\ÓB^fóW0\ËP\Ð\äH\ÎNÃ‚¤h‚“h\0Ÿ\é\ÖÁ¿$\Ïzš=?ÿ\Ú\0\0\0\0\0\0\Ñ\å<\ÆdIŒ«¶\'n¹©\r;5\Ò5ucƒºD®ƒ¯f™\Ùòcµ\ç$¼‡Õ¦hÁiù¯òýYoUô*;•\Ð;‹EH\ÎKÐ€)³{‹—6P¡¸\\\å>!¾B\å\01[3\è›®«Á¼e&:…’=-A \éº\Ý\ÅI@®¼\í»\êHË°]\Ä\Ño\ÓhV}\"\0}~\0\ê\â9¿·t»¯	¢ú`w9ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0 !1AQaÿ\Ú\0?K$ê—›9\ÎFp™<y¹\ØýY=¸\ÃöOÙ·Œ\èxüYö_¿Ž‡!}H%\ÞÙ²õgn\×ð¿•§\È»\æL›Hó\å\êÔs<\ì\é~¸\Þ?\Ä\Ì~K-žw·\Ü\ä\Òñ€-|G‹\ÜAx\Ó\ÌY9—yB9‹Í›Þ	Y±³`‘\ä\à ² ‚\Ë:³°AÑž™e²:½2\È,³¦r?ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0!1 AaQ0ÿ\Ú\0?P\Ûg90OH‡løŒ;\Ï]Ê³Gp7HöKy}\ÂÛ¾_\ÛÃ¯qN\Ðrÿ\0a\Þ{›è²ywKƒ?¼µú_RW\ËN\ØrŒ=\Øg£¨c„6}—\ìw\äº\Ë¶d§È€}½£«-”L\á\"\æ }Ù±è»Â»½1\Ô&\"À’¶\ÈL\Ç\Ô\ÏS\ÂO\Ã\ïl\äfl\å6b·c´~;bD\ÅÊµ·‚ññ*ðÅ—“‚ññß˜\à¼q¼m»/þwÿ\Ä\0&\0\0\0\0\0\0!1AQaq‘¡±\ÑðÁ\áñÿ\Ú\0\0?	¹t»’\è\0Ù‰\Úó\Éz\ÝYolü’ö°»ßŒD™sf#)».\×g¯\é7….ŽO\ì\Ê¨\Ñ\çm­uÐ€¦sEž\Ûy\ï,¨ªtTje.q\åo\0;ƒg¸Ji\ê6›Y€ÝŸ\Ýb4üóšWg\æ]Ü¦%9|J¶ˆP%\ï™]e\ÜB\ç†&7$U¾|³]J¹[cyj\ßN¨¢›°AyÏŽf@Q¦j\ÌA¨]\"¢¥;\Ì|™—\åL2ª\ÌEAÀô\âs‚«\'`\ÎÒŠ´r\È/7\rE[\äÿ\0%J³‹^,b@j\"÷ž‘N\ÝBF.ªVWn\ã†Í€ƒ Y\ïP£\Ì\ÔÞ¥M\ç¥ÁÕ¥#\æZ]\0\ÌK1ªj\È6.\ÂøIv,©\ä \×\ê‚4Ã²µ\í\ê\îe\r©c¶@–€d/“ù—y—Æ¨o2°(†1\Ä`zZb% \Ìø¯ò/L\Z\\4n¸—\ró750NR\ãR\àâ±¾µ3«¬·RØŒ4PÍ–^ºAÍ«\áø‰HFQ÷ï‚·\âjN«^{y›Š„B\éz=\\\ÈÀT\ë‘}µ˜n\×o˜EX(Àh¿?\ä\ßxÊ°\é€w]\å\Ä\ÂZ¬y³·}G¥9[\é\æR£®š†¹\0p\à{®—\Ò%fn÷\r4P½:@\à¾\äÎ›r0\È\Õv\\ZPµ.q.ƒF7l\'”°•»†\ÈT1\Ö\åF‚.\æ[¸œC>žˆ¸@\'`Çl\0f«yS/¹”¬Òˆp~…V‡ˆžY`\àžm¿»–ò‹¯Î¶Ï“¿ˆù\rúT\r“˜`\âN=µ-G>ab’cž‘\n8À\äpû\ë\Ú6\í\Ûs¹‹N%&·²f‘3sMüºŒ“¨õ—‡\Â$# š–h+\Ê5\ïobŒVqYXÍ‰w£\ÑÌ£mÈš\rGkš…r\r\ËLg\å^\ä\é\â2¸•„§’­\\’\ÑNús\n\Ç-/ºó\0f®1¹±“WP†®\È-u#\n\å\Í^¼Á%\ÓóÖ±½Ž§\r]\îS…Bðcqb®sµ¨…¡GIfwj+B\â´<\Ì\ÙMô®f0¨‚“\ë_-aY\n4{Þƒ±DDø‹ü2\çK°x ¨U5‚]A9Y9—‡¬6‹KrªL\Ç?=¡ªC¶&¨Š(\Ðõ\ÂJ¨Vƒ¢\æ1T\Öóˆ#ž¿Á7$<\ï\ÄY™‚Ñ¼2‚^]‰¢bf\Z\Ö½¼õ¨vB¹«À\Í:\çfhµ.¢\Ë\Æ^Ð€5\ç\Ì\Ýý´P¼¦\Ì\nÖ«¦TwU·\Ñ	Ur¬w<Y¾\æ\Ìgù\Ë\nP`—\Ü=¯\×\æQÔ«\Ü\ä˜\Ü`•L+Áuþ\Ì»N£¥üF…œ*\rös«&\Ð!\Â\0º\åAjexF ½*|Ì­G@‹ó,\ã!,¥wš¨UiM·HÛ˜]\Å\ã\Ü@\\V\æ3hFMx ™Eui[¡óŠn³0Ê¸Et\ãšÁC\Üû?™gýR\ÛÝ—P»ž¦Z\Ïo\'\Êô\í1S2\è‹Teº \ÔW÷²À\\\Õù™2\Èa»x¯öU\Ò<½?ß©CŠ‘\ËW\Z‚ S0¥ð\Ê`/~­®!Kˆm\Ü\ß\â=65T¯QJÊ‚›­\æ²y€P÷/º¶ô?s!nŸò<¶¾e•\Ð°Æ¾/[8\È\âZ#F\ëV5Àb\áƒÌ¨.5±¨×±\Ï\ÍB)¦f½3\Þ]i-A\ê;6—D~\Ýøó«¶\n\ÛjòÀ¶b\0\ê|G¢õ\Ôqi,\Ê\ÜFW]V=s.h\"hF—?02Waº:—ø—\äjñyhÁ+œ‚o‘t÷‰i\î$ª[pue ¡\ÔÝ†\Ïp\é.puÁû¸P©\ÕUø¨:…¯\ê/\Èò\Ê\Í\Êj’ýÇ¤t\ÅG3\íFg/7\ÕÀ3\ß	Pa9ø±\Ù;V\ß\ÌF¤¬\ãWù»Eý\Ö\'«#\ÔvOÜ¢P	zUBÛ»”²,\â\ë-µW¼U\Ôm¬@\Ì8j4\â\0\Ö_\ï\î`®Ó†}»bˆKj\éÇ—O˜ ¾¢U¾XfO\Äu×¢.\nnôiN¥3\Ò0¨5ø\Äut7Ìº£L\ÍôÛ”\ìWƒšs§\ÄV¿*]j	8ô\Âv©ù‰)w—\âc\Ãhô,f\ÜÀ¹l\Ð×‰zŠö\ÍVqrˆ&e‹¯¹a\È\êQ`/—\Ï[sCvht	xAŸ_\ß\ì$\Z§9~G\Ò\êA\Æ:\Ýx‡ðsÀŸ\ÐÐ¯ ¹^«¶Ù¢/\Ç\Ù\îŸ@öw\Ät\àDU\rY¬:“¨gºFC\ÇO\ÏÀ\Æ‚…=Ew\ÒS\æ\ÚPŠ\Å\Ùÿ\0\Â\è¨p!HšG‡¼\ß\ãzÁtöo¸Áp%\Z	’\é€\Ð\ÖoW.k\Æ>B\Õ\Zu¥;L´FŽ\êË°8\ÄL“LB–Ü·l8·Q\Ê)y—œC8µ:#£\ËÁP‰tÑ·°|€\ÕK¢ù`YÜ)º>c”­\Ã\Ò\0¿û\Ì\Üz0\ï	\ê9[)2˜;X°9Svu9#9ÐŽ\Ï>ó<’n$È·$feF\rÇ—]Lq\Ëj\ZŠ‡Ž¦\å\Û–‹B\í_ö!(Ú¡õŠPy\\1A\êBÞ£#\Ìxªb%¹«¯\Ñ\ÅÉ”\ä×š?¤)%1\'Cy\Ð2»\Ç2„¸_tFS»ú¿b÷\Û_<\Ë\ÒBz»Vo´5\'ˆ\Í¸kñ\àÔ¥ù\Ñÿ\0\ÜSc\Õø‚(c ‹¦VÔ›«“\Î\éhƒ-Qo \ÛW\Ô\Ê\ÏX\ÇT\Ü+\á¹{þNðzT.I±(C£/›ž‘\êówF\ÒÀ¯n«ªóÐ™¼“yJç¹†\r€\rðˆ0[\ÕÁöÔ§À(\Í\èœ\Çe\Æ[\æ\Æ\ÏRöz´Ô¯\Ì lX£ò &8!´S\æ¦M\Ú\Ó%øXm²\îÔ¹|^°“R¨†v(¹U\Üù\Ç\Zz… Œ#>ž}A1R\Å2ö\'\ÑOò?p†œ[½¡WRŠ¥_\×Y¨ÀER¹{üõ–‚\"m\ï\\ù– \Ð\ì\ã\ÔÇ·H\Öô´U=WÌŽL#÷\ê*¾H†U°ý\ËóD¤\0‹tþm¾È#8\Æ\é®8‰¸\Z\Æ\ä­8ºn£P[¢\Ð.)…FÁb\ÊU\ßOò\á¦­\Ç\î^X¾®b•Ò•±<AS„~%U\àõCÅ£¼§ºŠ©m“Š->›Ô¥®‡‰)ùE€\ç{ð›óq»NJ\Üü—ó0\Ø/y˜xš ‡7„EQ\æ°~“„ôë¾‘¿—%\0\ê\"e¶7ÎªŠ‚‰x\rx<ŒöY,M?R¯‡[ý‹mU\í0p*ú…±lQ‡òy> .X½b\Ü£T\à=FŽÛ¨–5ºEW\æ\æzlZ\\\ç\Ô\"œ£E\ì5~a%\ëÍµ8ýJ‰Àj\0Jù©[‰%\Â\ì¥øÌ£6ò{‹?hA…¤:\à†²¤©\ãW[Y-º²xŠw\rtŸºb\Ý\îü¿2°\áyŠ\ÙZ\Ðõ\ÍÁ\àðw\ëdx\â¬cG8\ÎS¦_¸\æów¥˜»¹¼\Ò\"®¹\Å.£r•nÀKÀ˜õk7ôj¥Ü‡gâ”\Ôò}Ë¤u*ùf~ð\ë\ß,n	,MCû\Ä\ÏP=F!\ÎT/\Ä1¢pÿ\0ä£°\0ùb43:\Ë\ÜÁ3„ \â\ÈWŒ]úNd\îþ\Ú\å·¼c·\Ê\"4ù%§\Ô`\ë¼[¾–\Ü\ÐQ\×?iV\ÊQª‹aq8û§s8(hºz¾\ÊùŠ\"¢#E\Âq\ç’.£X—/\×7±\ÄKè¡±‘r÷\ég¸–u‹õ+!\Èk\âcVE½Wi\Ú\ã0÷.Gudù\Ô=„pÁóh\È‹_EFsõ	`ÁJ,ò\ë\æi\0#}ej¾®¨l¨†¶V·¸8¦¬@°\\\Û, ôam\ÉUÁ\Éb¾\n•‹\Ý;\Ó?P„”#Q$\Õ\æ\ßÐœÁmMú>¢–u¶—\Æ\È\\»QÃ‡»óØœ9òh	º{_ü\æ\r2[%\è\Í\ã§\ÜzP”\Ú\êC¾Tw»(79\Å9n¬n“(Õš~DN.\ë9¯‰¨«o\â¿U3Sn\ãa\Ç\â`±ko}\n9þ\Ì~\ÕÂ±\à\Ññ\î [ç‹¢c\Û2\Æ\Ó\ä\Ä\àu°»\èQø%a§\í·{Z¿\Ø#%–\Ü@b´…W‡Py=ÀU‹J˜0ó/N‘\Þ\Ør\Å:FPg\È;ØŒœÞ¦F\É\ÖU\âúœyƒ(´û\02®„‡±\ìü_”$^º	\è?#\Ì)°rð˜}0€l®\êRœ‚;^\n\Ñ\Ü\ëX@U§fö¡«W\Ü\â´-*mi\ÎWqÀ°¨+\rÕd¤\ZW|ðb“FjVØ„V¬\ít\Ô\"\Ð4ow\Ã\ê³Û¼\"Š¶þ1Ž\Ù\ËpU\ÜM\ßy›ˆQV\Ë*üD0-\n¡K\áÉ¾°M\Ç\È z‡=`\êµ\r+§|ž{Â…\\V\Õtx\ã?jj#£Ó§H\Éªueaÿ\0’•]¼\Éx\Ã\Ò¢\í£7U\ê&Fôc\'l\Ç0Bj›«\ïEyŠ\Üª\éy\Ï@™\äFFŽ`EV\Ä\Äy@Ž*\í\Èò\ÛtrZ\Ôdª=Jdò¶\ÄY&®g>IKG\ì‚\È\ä\Ü%€%‡Fÿ\0\Ä\Ä\ÒX¢\Ê\Íe¿BŠ\ß:T\Ú\ån\Íä³†°¹„™œ8¥eo¨Ý¡m‚\íN”bºÂ\Ô-„\Ã@oŽl“n\Ùw‘o\×m*Û™¾‡W¿üŠ2ŽRŽþ¸\Î~c [+É‰ F©I\æµ\î6ªÏ¨d¹w\É\ÚóöÀ¨¬;<f0yc]s5G\0!q``R\0+ñ\Ú,\Ä]2·ó4•\Ä\n\ì3u¨J…–\ÈS¢™®\Ä>Ái…U•u\Ívn>!¶Š\0œaIi\Éw[Ý–üˆ\Ô\ÚC\Ô\Ø; \éq Ž¢³Þ¾%\0MS+Ž*\é\êP(ù ´\ë7¥Àr\ã\Ù3®¢¸+µ®¼\Þ\à)v0^\Ô\ëZ?²«DRâªªÃ‚ n\åV\ép7Yƒ\n‚˜ƒƒn­ùf/a/XÂ’½Áˆã€£\å3\ìg\æLú&ûº,ü¹€	U™u\ï-y¹½‹\ï	uo¨õ-ñ(3\Ù‡.“\Ðn!TK \ëvüˆV.—žE“\ÒD2]¡\ìW¡}âƒ¨µ6¯v ò\\	V7\Æ\âR8v\Ô\0Gx¬À•™\â±\í,H–7þŽ°™\Ð\Ý[] {\Í{ŒÚ¼1qù…òd\ÝøŽû\Ñh‡ŠÂ“\0³w8Å‘»n\'/Oòa\Ô`ðö¾!…DocwD/µ\æ”†¼Y\â”\ë[€]¦ýY½\ç§€½)\ïšñq»SI{ös\Úðk\êXØ£:¿\ÂKr¡Áo\ÜEñÃ²¼\\\Åeµ\î F *\Ó—‘\îXÝ‘Âß¸t®\"X™\ÍÁA³\Ò-u–ÖŽ\ïH ²¸•“ñ.\ç,Pg¯Q+V¿ù#•G\ÔÂ†k\ç2\ÙuPCLÅ…m(\æÀj’ø*c»‚m\É\ê\ï>j] \0œ–—s‡¦8%•\nq¬S\Û\Ì\Å)J\æ?•P·k¦\ì\Ý\íy<)p*ª-ñŒüBŒ\ÑK˜\09‰ø‹²_2fãŽ§P\ÍLoR†\ïQa\Óx%\èy\íû*\Å*³óÿ\0³p\îÏˆ[5f…E7\×d–VùKü\ÌCÁK5®\ì^\\8¶­\ÑsAw»”Ú¼u„\ãJ$<H2Àj\Ð\äUž¥:‚\Â\Þ]L®\ãù ^‘¯\æ¡vC\Â!\Ôg÷÷y„@«\Íù\í)¯CðxŠ(÷	þ@8\Î\à¤\ÈÅµ—«;\0Š~k€µ\Êñ	\ÈXk¿x—W¿‰Cf•÷\Z\×L}ÌIÔ—m{ú–Å²\Ë\Ä\è\ÌÓ‰T+\Ñ\Ëÿ\0V`-µjX%^,º1*\ë?\Þ\â\Òß‹†£¦o¶%‚\Å\'\à±‹Z<¬ø{±9\0³’ÓŸ’`|v®sþG\Ün\éˆ/ý§\Ô\å;À œiõ\Þ9l(õi‰T(~_3}\Ï<¸\Ï\æPƒ&\Ú\Ä\098/òfŽyŠpmþüL®ŸÙ\Ð;*@Gˆl\Ë[˜Ueþ%Añ ø‰I\×\î:\ÇT[9¤\"[ƒf\Øe8*&.õ\\jds\0K}<`‡ƒ	íšªkˆŸ!!L4¾Œ.\ÏBú[\Þ\\¡`\Ê\ë\ÒXŽZQ¶e¾;\Êpp)/or¸©£<ý?uV¥«¾\ÝXÅ™M§<~fZYÁ&\éÃ¯r\áÙ³\Þeb•uþJ¬\ïoi  }YŠ•\Î\åx*U´\Êd=Ÿ\îòª¿\×.‹§÷û(\Z\ã0l7„–Q‚39p\ÂV^˜ýÁ.U×†f:X6ub%}«›ÿ\0’ð€\ä\á\nO…=\Æº¡öTUŒÃ—ú \Â÷\Ïh…\ä}Oÿ\Ù','[\"5\",\"4\"]'),(2,'Gustavo','gustavo@yahoo.com','11996919109','$2a$12$uhqHyFc4xs0XdR4hAf.ND.wikbOeZxCTeeyJ5EQJ3QYW0bF5umveS','Couto',NULL,NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_avalia_cursos`
--

DROP TABLE IF EXISTS `usuario_avalia_cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_avalia_cursos` (
  `usuario_id_usuario` int(11) NOT NULL,
  `cursos_id_cursos` int(11) NOT NULL,
  PRIMARY KEY (`usuario_id_usuario`,`cursos_id_cursos`),
  KEY `fk_usuario_avalia_cursos_idx` (`cursos_id_cursos`),
  CONSTRAINT `fk_usuario_avalia_cursos_cursos` FOREIGN KEY (`cursos_id_cursos`) REFERENCES `cursos` (`id_cursos`),
  CONSTRAINT `fk_usuario_avalia_cursos_usuario` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_avalia_cursos`
--

LOCK TABLES `usuario_avalia_cursos` WRITE;
/*!40000 ALTER TABLE `usuario_avalia_cursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_avalia_cursos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-28 22:52:54
