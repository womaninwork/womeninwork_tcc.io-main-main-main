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
INSERT INTO `usuario` VALUES (1,'Gustavo','submit.gustavo@yahoo.com','11996919109','$2a$10$crZWNaZoLEm6mDfBDs0ZUuKgnDj5h6V6T0MJEn0KqFykLPR90nez.','Couto',_binary '�\��\�\0JFIF\0\0�\0�\0\0�\�\08Photoshop 3.0\08BIM\0\0\0\0\0\08BIM%\0\0\0\0\0\��ُ\0�\�	�\��B~�\�\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(�\�\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((�\�\0\0\�\0\�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0��Q\">�\�F\�\�i,CAY\�֍��M\�r\r\�\�L\�/<o\�=�^\�c�x\�]u�:\�V�\'	��B��\�y�=��\�\�Ini�֐z�*���;W�\�e��\�Ė\�Ma\�\�$�J\r\rG\\T�lm\�\���\�>��rw\'WL\�$\�L�\�]���\�[\nl%c�\�rӧ�\�\�P��\�d�| \�pzexU\�e\�\�E?Y\�Ww<}\�\�\�\Z�$�\�\�N�0R�<\�!K�jRRx�\�\�r\��\r\�\�\���\���F��\�k�xܟUc�.\\͐s���\\-�cۼ���[leVȑ.��z�h&r\�XV�깲�eM}�V�׸:^v{�\�\�y��\�GoC͔\��\��A�\�!\�\�$�\�\n��D\�\���1Xc~[&[�bY��\�\�Y\�H��.tݜ\�Vz�m\�h�\�bL�\�v��cgYhR�zc.?@�\�q��\�+{s�C�l\\\�ƭCrT�\�[�3x� ��\"\�p5ψ�\0礖V]�Ʋ���j�R	�䰾�]�\�\�&;6�5���\�u\��먣,T\�>j\�\"�8�9�\r��k*�\�\�<�\�]쬍\�5h)-�19�\�XW,�4w=�fSY4F\�\�lE\0���\�G�F��*ʫ:\��\�\��	#\�\�\�J[\�Ǡ\�\�\'cZF\�\\�3aV��9CӍ\0nA�\�<a��gD��:��X,\�\�\�\�i����c\�C\�K/��\�\'f�\�N��ƴvlb�eUG\�t�+�\�`�!AX\�/\�([_F��[���\�\Z\��I^%d�\�4�&K)\�r�\�!\�\�Ba�}�\�`�d\�\�3�,�G�\�\Zf��4U�\���$U�H�\�Cb�[G \��9��\�x\�7s�\��T#�!\Z\�=�D���E\�\�״�A �Gʤo$r�\��Q>�\�D\�c�G�����֫O�\�\0+\0\0\0\0\0\0! \"1A2#0$34�\�\0\0z�%�\��\Z�Z/�|�m��ۈ�[�\�^\�D\�V\�\�8$�j	�s��f�w\�\�=�\�^=��̘�N��ω���\�Y�Dؙ�\�b{o�\�|\Z�(\�P�׷ܪ����1�\�^\"6z���\0j��㕎5؉�}\�m�):k~P�+��|N�D\�N-Y}HG\�k,g$�S!\�Cn\�ks�}\�\�\\u�\�\�@Y�����\�\�o�ˋw��aV\��\�\�ҭ�M�\0;a�oG�����`�Q\��]�(���gT��\�q3[<�\�\�o\�㰍X(\�Q�\�\�\�Cؓܛq�q�P\�J�#*̎�\�7\����֗FkcBb���W\�`\�b���\�{:gD�\�\�U�VP;-�5}�\�<UК��\�ې�-5\�r\�0��L\�\�4{:�f���N\�a���6&N�佧;;d�Y���f� \��*A��1��\'�Z�Y��\"���P�\�V \�U\�\�W����<8�/N\��\�wV?O��PAfC�&f\�\�\��{e~ݹ�J-L��5	��\\�\���)\�Ni_T�f.eY0�z��\04\�m\�\��\�@\�\�_O\�7=t0A\�g�)\�\�\�{�ׂ\'\�\��\�\�+�\0\'�\"�=an;�\Z�\��%�krӔ\�\�zRcaz��9\�VꅪǲcUurόk]�ٵ�8\�6=�-�\�8\�\�gD��gP�\�\��8���B�\�=G\�VOuB\��Z\��G��OȞ��T�M��UN\'\"��������y��Y��3�9\�_\�Ӫ	�,�W�\0,,�\�i�7O�H�0\�b�1R\�\�\'����J\���O��m3d\��q�M\�D\\��3o�L��w���\0�t\�	�\�?�6%��V)B=\n\��g\r@��_Mr\�Б���j�\�z�s��a9K\�\�+�N&V\�%�\�j\\Z-\�\�_�O����\�Q鐂k��Q~Mڱ�-\�W�j,{�\������\�LF��\�9j\�5�D|iM��[�g\�L��	�:�\�\�f\�\�Y�T��7Ü+p�n�\�T3\�1��L&Lf���R\�U{$��ҫ��c��~����`~n��/mwP�2V\�\�e҉\�\�\�5`�|�7\�\Zs5��!ҳ$\�rH�j�f\�9\�yX�9U\�2��Ȗ�\0bJ�\�\�\�r\�P�3Z�����\�ǗF0�a�q��3+Qˊr\�_�Ћcz\�2?-�\�\�o�\�~;m\�JR\�SG����!�rǌ|��\�h\�y\�V��9\�t�\�/O����Њ8,P&�	\�NYX#5*�N\�\�fXRx\�Q�9\�	ܯ\Z\�H\�m?�X\�/FX�3Bc\�\\\��v�G�\�\nӗ�?b7\�q�`�v����*�G��77\��\�\��\�\����\�\��8� Y�n\�3s�\�\�b{o\�\�=�\�r�>�\�\��1Y\�\�r}����4&77\�/	\�a\�C��\0ת)��v_���g)\�\�O�\�����hZoq~���\�\'\�ό�9\�\�/\�GO~Sp�1��7	��h\�}�a�نgӣ��2<&1��\�ޣ��Z߿\�c77�d\�\�&]\Zc�%�\��\�=��\�\0\0\0\0\0\0\0\0\0\0\0\0 01@A!�\�\0?\�˶�<���Sp�e\�~\�O\�E\�e3�8�\�\��\'/D�*2\�C(�bx��ު3r�ok���d���7\�=*k�{�\�\0 \0\0\0\0\0\0\0\0\0\0\0\0 !01Qq�\�\0?]3�=��-��\"����d��\�ع��f%4%\�23FH\�$:�V�Z5��ӣ$�JV�\�/�\"GQ\�饊���U�E\�	kj�\\@�\�I$�uZey\�[��ޞ��\�\0=\0\0\0\0\0\0\0!\"1Q 2Aa0Rbq��#3@B�ѱ�$4r�C�������\�\0\0?\�r`\rX����3��[��x*�|̚	<\0A�`�Rװ\�vNhJ�\�\�S-�U!\�]�\�\�hw��\�{#4G�\�d!\�\�\�\�8� �\\�f�\�U5>V�a��ǀW���;�\�J	��\�\�v�N#�SYY�\�&��@�6\��)\0e_�\�t,\��EJv��z3\�*qN\�AU\�RkT�\�-��\0\�z��\�{�=�/\�\��\�r=7k�M\�\��r\�YM5e�\\��\\\�O\�\�\�M.��L}�\�:��\�i�\�*vbHn�wNj�n\\6Oi�0�\�WE\�g� ��r�N\�\�T*\�\�fMn\�\\��\�fx[�\�\�Z�q*#0\�?�u�/wt)\�5z�M�\�\�p�v�h�\�_�m�\"���\�eY|\�\�D8mn�z���z/�/�oB>aV��~m~M[��%\�ϙW��)A�\��\�8��\�$<�\0\�O[a��\\��\�Ϫ\�v \�\�1;\'�\�>=M\�\�\"N\���Ń�\�V��\�\\D�\�|��H\�F�l\�;\�ʼ\�Ӓ�׼E]����\0�Zr!�1�3��0},\�x}�\�#[�?\"�\�N�\�<S\�q�\ng%9�\�\�KEP��Qe\�%�xY\\�ǟtr\�\�\�\nDlP b\�\�g谉��\�\�\�\�\�:�XK�a�\�\�\�g�L�Wx�E]\�M\r�(v\��t^\�e-\��U\�\'�U\"�E�G&*1\�#W\�\�6An�\\g\�ML\�y��\0ջ4�Bd��U�}�\���!a�|\�P�ă�UJ;E\'Y�tXMt��\�S �\�re\�J\�<\���eD\�\Z\0��w��\�r�X�iR��\�쿖o�v\�T�\n*�uXM~\�%\\\�j��gn%\�/�\�\�\���I*\�\�u\�J��N����\�c9���\�\�%9	j���T��m\Z2\�Ō\�9/�߅@�d�YU\�fl��ЬP!�\n/\�Y\�5\�\�!�\0KT�<\�\�Ɇ�׼\�\�ԅ��\�;�\�N�\���\�_\�4mV\����\�Y)��%b�����?\"k\�P��Fw���}\�O�U1ǀR\�\�V6�}�� hq��)^��\�j���X��\�\�[4\�y�+%lʛ\�\�B.�\�J(��x\�\�J�&\�5�f<f�Ca�\�H\�\�ʨ+2��칩�\n�*촬��R�Ω��\�V\�Rgo�J�#	�sF�\�0\�>��\�D��ݰ\�\�\�9Y��ٻ4�<j\n�r\�N\�U\Z[9Y*r\nno�U\�7���BG�j�c_��Ù�+\�\�[\�\�,f~J�XXZMn�\�Rg��`:��s_�\"\�8�\��J�ΕEJ�\�\�4eIp���\��\�x\��Z�d���5O0�\�\nЭ\�\�\�\�\�rFy;>V�*�QG�2�m�P��\�槯͓�P\�B�O\ZTYN�B\���?_ꪁT\��\�\0\'\0\0\0\0\0\0\0!1AQaq�����\��\�� �\�\0\0?!պ\�F��\'@����<�\�E\�y�t(e���\"]\�\�5\�\�Fn>�\�\�ѷx���F�J�&ؗW�|�/h�bbJѦ�rǎ�vTS	�:\�4\�X]\�\�Q��\�\�zu�\��� N�\������T&^]y�yrA]Y�\�ԝ�\�kՆ�p�\�\�Bs˦Q6v��\�2\�6�\0\�@\�H^&�\���*�`�]��\�mM�?[\�S|9�\�*��DvC�0]E\�\"J�J4\�iK�\�b\�Z�\�/�B\�#*8L\�Ґנ\�\�Fid\�TT���ݥ��o{�o\�R�\�m���\�\�.Z\�0A2&�E\�N�\�\�`\�o\��1�����\�_�e`gGI{��\r\"�L\0Z\��~�׺�\�\'�C�\�=3Cx��ob�+�[@\�5[sW9gYF�9\�_Cu��j\����1?�:\�s>|ƼCss�\�|�x(*7\�4#�A����\�JaS���\�,P�i\�\�@#Y.��\�>�GB\�z9��F�\�\�\��\095\0,�\�efh\�5i{F9T�\�\�%f���\'h����\�\�5>\�F��U\��\�2i����,U\�k�=�ܢ:��t����\�C�\�9��\�\�\�\�X�_\�6�\0׭\�\�h\�\�WSV\r�.\�\�BSB9>�,97��!(\�\�arפcSQ�\�����߉W]�/\��������4?\Z���y�\�A���7+��S\�QQ|]��\�8���i-�p�#\0�fP�\'�\��\�׫3�v��o�T�B2tG�4\�p;�HzJ)���?d�\�\�A�\�-��n�z꺇\�&�[dϖ�~\�@�؜m\�,\�1\�	8�Q\��\�Gy�����\���^�`;N=Gy\�\�/G\�\�8,\�J����\�!��q0\��EF}�O���\�\�ȱe\��`\�$i	�s0�~f:�\�U爆���\�Q��WsM��m�4xgRp���v6��Meh��\�\�!�\"N\�L�*�ۼ\���D�\�\�<\Z\�ى���\�\��g\�S\n�\00|��؏�\�ܠ\��0�*����h�\0`t��a�<ˆAZ\���\�_拯0E\�Tw,l\��\0\\i)*���\0OI\�#)\�����Lp1#X\�y�>�f�\�(^\�\�-j��	[ܿ\�O�@E\ng֠A�s-��2P6\�-\�n��\'���\�x\��\�\�\�:�ůE�0�9� }D�\�\�\0b�}��\�:^6]�R�\�K��$%�\�\�;K*\�熇%<�/b\�eQ�1�N ��7jY*���\�\�0yF`Q\��B\��\0!�\�@�=�d\������rY�h@*A�Vn��\�R\�\�W\�F\�\�\�x��\\�\0�f 7Su\�U)��<�b\�\��\0I\\�ˑ\�\�w\��:G�¹1\n��bݻ\�\�wC.��ZAh\�4|\�u=���7؎`>\���\����\�\0\�|R(�\'L�۫�L����\'�\�Q.\�l\�Z\r���\�\�ټ\\)����\'T�C\�.�\�<��V.\��\�j��\�\��\"4�t\�L�ú\�#M#���(]	aЏ\���vo�\���.f�{\�R�M[��*\��G���\�+u꧰��ӣ�Oͽ��W�u1}a�\�\r�？����\��\r۾���w�	�J��~`�ߘ�\"��h{��U�n��\�\��\�\�\�]^!����\��\�!�0^\������s\�\�սD����k/R\�\�7��\�\Z\�\�\�yM��\�\�\�\�F#\����\�\������x\�E34O!���rr\�\�\�f�o\�����\0�\�!\��\��r�k\r\��W}�\0��]S\0�r\�|i\�1\�J\�\�Q�`۵Ŝo���蚯Z���\��c�\�l���\��4)\�~�ƀ���Y\��\�\�/(�n�\�X����\��?$M�\�V5\�-���H�sC\�K\�i��6\r�1�\rJ�\08~�\�S�\�0�$�M��\�nc\Z\�a\�k�����5C����p\�\�NJ�+\��������/X\�[fZ@�\�*�S��.\�S~��B\�Xq,�YW\0�g\�A�^\�4��:�\�\�\�Ij\�JX3��ڷ�B(#\�\�z<��\0>�\�\�$�k\�v�\�54i�\�Φ��/vi�w�ۘ��3,����\��1Q�s;�\���\�|&�\�\�<\"*\Z��r\�\�\��KE\�jA�҆�iV�\0o&\0�\��ɤAqŝ1�mF���\n	gr�\�\�\�\��\0ez\�MK\�\�9UG\\��2��\�_y��X�|0�����\Z\�Amk\�\�TkJ2c)\�\�-\�q�&\�\Z\�+��\�UQ*y��A��\�\�5g#\�t�\�ĵ��\�[i\��B��	\��?\�`�\�\�|\�)�\�\n\�\Z#�qn$�AoM\�\�<��+x\�\���]\�?Y��c\�\�;\�\�n����\�+�}FV6�]%��ʅ\�g�\�5�#YS)�C�\�`\\5�]��\�J4\�N\�\�Pɤr8�E\��\�k\�\�k�j{?�\�\r\�(\�\�pB	d�4�{K�f��ԥG8�Z�}*�4�U�\�}��\�\�.jv\�a����\�T�	T\���1��w�\��{�w%\�:\�g\�\�\"\��1\�6�!�\�AV\Z��;GD!^�Ff�gL�j���\�Z+\�;A\�Zo���F��\�\�.\�\�<#B�0�\�+\�1V���{ʱ\�lE\�?���\�u�\�K��A������Қ+U[Q�C|\�n����\0\�t\�i\�G��\r!�wc�\Z&Fh�\�xg\�VotK�xC\��<z>\�B^�f�W0\�P\�\�H\�NÂ�h��h\0�\�\���$\�z�=?�\�\0\0\0\0\0\0\�\�<\�dI���\'n��\r;5\�5uc��D���f�\��c�\�$��զh�i����Y�oU�*;�\�;�EH\�KЀ)�{��6P��\\\�>!�B\�\01[3\�����e&:���=-A�\�\�\�I@���\�\�H˰]\�\�o\�hV}\"\0}~\0\�\�9��t��	��`w9��\�\0\0\0\0\0\0\0\0\0\0\0 !1AQa�\�\0?K$ꗛ9\�Fp�<y��\��Y=�\��Oٷ�\�x�Y�_���!}H%\�ٲ�g�n\�𿕧\��\�L�H�\�\�ԏs<\�\�~�\�?\�\�~K-�w�\�\�\���-|G�\�Ax\�\�Y9�yB9�͛ށ	Y��`�\�\� � �\�:��Aў�e��:�2\�,��r�?�\�\0\0\0\0\0\0\0\0\0\0\0!1 AaQ0�\�\0?P\�g90OH�l��;\�]ʳGp7H��Ky}\�۾_\�ïqN\�r�\0a\�{�貐ywK�?���_RW\�N\�r�=\�g��c�6}�\�w\�\��d�Ȁ}���-�L\�\"\� }ٱ軁»�1\�&\"���\�L\�\�\�S\�O\�\�l\�fl\�6b�c�~;bD\�ʵ����*�ŗ����ߘ\�q�m�/�w�\�\0&\0\0\0\0\0\0!1AQaq����\���\���\�\0\0?	�t��\�\0ى\��\�z\�Yol�����ߌD�sf#)�.�\�g�\�7�.�O\�\��\�\�m�uЀ�sE�\�y\�,��tTje.�q\�o\0;�g�Ji\�6�Y�ݟ\�b4���Wg\�]ܦ%9|J��P%\�]e\�B\�&7$U�|�]J�[cyj\�N����Ayώf@Q�j\�A�]\"��;\�|��\�L2�\�EA��\�s��\'`\�Ҋ�r\�/7\rE[\��\0%J��^,b�@j\"���N\�BF�.�VWn\�̀� Y\�P��\�\�ޥM\��ե#\�Z]\0\�K1�j\�6.\��Iv,�\� \�\�4ò�\�\�\�e\r�c�@��d/���y�ƨo2�(�1\�`zZb%�\����/L\Z\\4n��\r�750N�R\�R\�Ȿ�3���R،4P͖^�Aͫ\���HFQ�\�jN�^{y���B\�z=\\\��T\�}��n\�o�EX(�h�?\�\�xʰ\��w]\�\�\�Z�y��}G�9�[\�\�R�����\0p\�{��\�%fn�\r4P�:@\�\�Λr0\�\�v\\ZP�.q.�F7l\'�����\�T1\�\�F�.\�[��C>���@\'`ǁl\0f�yS/���҈p~�V����Y`\��m����ζϓ���\r�T\r��`\�N=�-G>ab��c��\n8�\�p�\�\�6\�\�s��N%&��f�3sM��������\�$#���h+\�5\�ob�VqYX͉w�\�̣mȚ\rGk��r\r\�Lg\�^\�\�\�2������\\�\�N�s\n\�-�/��\0f�1���WP��\�-u#\n\�\�^��%\��ֱ����\r]\�S�B�cqb�s����GIfwj+B\�<\�\�M��f0���\�_-aY\n4{ރ�DD���2\�K�x �U5�]A9Y9���6�Kr�L\�?=��C�&��(\��\�J�V��\�1T\��#���7$<\�\�Y��Ѽ2�^]��bf\Z\�����vB����\�:\�fh�.�\�\�^Ѐ5\�\�\���P��\�\n֫�TwU�\�	Ur�w<Y�\�\�g�\�\nP`�\�=�\�\�Qԫ\�\�\�`�L+�u�\��N���F��*\r�s�&\�!\�\0�\�AjexF���*|̭G@��,\�!,�w��UiM�Hۘ]\�\�\�@\\V\�3hFMx �Eui[��n�0ʸEt\��C\��?�g�R\�ݗP���Z\�o\'\��\�1S2\�Te� \�W���\\\���2\�a�x��U\�<�?ߩC��\�W\Z� S0��\�`/~��!K�m\�\�\�=65T�QJʂ��\�y�P�/���?s!n��<��e�\��ƾ/[8\�\�Z#F\�V5�b\�̨.5��ױ\�\�B)��f�3\�]i-A\�;6�D~\���\n\�j���b\0\�|G��\�qi,\�\�FW]V=s.h\"hF�?02Wa�:���\�j�yh�+��o�t��i\�$�[pue��\�݆\�p\�.pu���P�\�U��:��\�/\��\�\�\�j��Ǥt\�G3\�Fg/7\��3\�	Pa9��\�;V\�\�F��\�W��E�\�\'�#\�vOܢP	zUBۻ��,\�\�-�W�U\�m�@\�8j4\�\0\�_\�\�`��ӆ}�b�Kj\�ǗO� ��U�XfO\�uע.\nn�iN�3\�0�5�\�ut7̺�L\��۔\�W���s�\�V�*�]j	8�\�v���)w�\�c\�h�,f\���l\�׉z��\�Vqr�&e���a\�\�Q`/�\�[sCvht	xA�_\�\�$\Z�9~G\�\�A\�:\�x��s��\�Я��^��٢/\�\�\��@�w\�t\�DU\rY�:���g��FC\�O\��\���=Ew\�S\�\�P�\�\��\0\�\�p!H�G��\�\�z�t�o��p%\Z	�\�\�\�oW.k\�>B\�\Zu�;L�F��\�˰8\�L�LB�ܷl8�Q\�)y��C8�:#�\��P�tѷ�|�\�K���`Y܁)�>c��\�\�\0��\�\�z0\�	\�9[)2�;X�9Svu9#�9Ў\�>�<�n$ȷ$feF\rǗ]Lq\�j\Z����\�\���B\�_�!(ڡ��Py\\1A\�Bޣ#\�x�b%���\�\�ɔ\�ך?�)%1\'Cy\�2�\�2��_tFS���b���\�_<\�\�Bz�Vo�5\'�\��k�\�ԥ�\��\0\�Sc\���(c���Vԛ��\�\�h�-Qo�\�W\�\�\�X\�T\�+\��{�N�zT.I��(C�/���\��wF�\���n���Й��y�J繆\r�\r��0[\���ԧ�(\�\�\�e\�[\�\�\�R�z�ԯ\� lX��&8!��S\�M\�\�%�Xm�\�Թ|^��R��v(��U\��\�\Zz� �#>�}A1R\�2�\'\�O�?p��[���WR��_\�Y��ER�{����\"m\�\\���\�\�\�\�ǷH\���U=W̎L#�\�*�H�U��\��D�\0�t�m�ȝ#8\�\�8��\Z\�\�8��n��P[�\�.)�F�b\�U\�O�\���\�\�^X��b�ҕ�<AS�~%U\��Cţ������m��->�ԥ���)�E�\�{��q�NJ\����0\�/y�x� �7�EQ\�~���뾑��%\0\�\"e�7Ϊ���x\rx�<����Y,M?R��[��mU\�0p*���lQ��y> .X�b\��T\�=F�ۨ�5�EW\�\�zlZ\\\�\�\"��E\�5~a%\�͵8�J��j\0J��[�%\�\��̣6�{�?hA��:�\�����\�W[Y-��x�w\rt���b\�\���2��\�y�\�Z\���\��\��w\�dx\�cG8\�S�_�\��w�����\�\"���\�.�r�n�K���k7�j�܇g┝\��}ˤu*�f~�\�\�,n	,MC��\�\�P=F!\�T/\�1�p�\0䣰\0�b43:\�\��3� \�\�W�]��Nd\��\�\���c�\�\"4�%�\�`\�[��\�\�Q\�?iV\�Q��aq8��s8(h�z�\���\"�#E\�q\�.�X�/\�7�\�K衱�r�\�g���u��+!\�k\�cVE�Wi\�\�0�.Gud�\�=�p��h\��_EFs�	`�J,�\�\�i\0#}ej���l���V��8��@�\\\�, �am\�U�\�b�\n��\�;\�?P��#Q$\�\�\�М�mM�>��u��\�\�\\�QÇ��؜9�h	�{_�\�\r2[%\�\�\�\�zP�\�\�C�Tw�(79\�9n�n�(՚~DN.\�9����o\�U3Sn\�a\�\�`�ko}\n9�\�~\�±\�\��\� [珋�c\�2\�\�\�\�\�u��\�Q�%a�\��{Z�\�#%�\�@b��W�P��y=�U�J�0�/N�\�\�r\�:FPg\�;�،�ަF\�\�U\���y��(��\02����\��_�$^�	\�?#\�)�r�}0�l�\�R��;^\n\�\�\�X@U�f���W\�\�-*mi\�W�q����+\rՏd�\ZW|�b�FjV؄V�\�t\�\"\�4ow\�\�ۼ\"���1�\�\�pU\�M\�y��QV\�*�D0-\n�K\�ɾ�M\�\� z�=`\�\r+�|�{\\V\�tx\�?jj#�ӧH\��uea�\0��]�\�x\�\��\�7U\�&F�c\'l\�0Bj��\�Ey�\��\�y\�@�\�FF�`EV\�\�y@�*\�\��\�trZ\�d�=Jd�\�Y&�g>IK�G\�\�\�\�%�%��F�\0\�\�\�X�\�\�e�B�\�:T\�\�n\�䳆�����8�eo�ݡm�\�N�b�\�-�\�@o�l�n\�w�o\�m*ۙ��W���2�R���\�~c�[+ɉ F�I\�\�6�Ϩd�w\�\������;<f0yc]s5G\0!q``R\0+�\�,\�]2��4�\�\n\�3u�J��\�S���\�>�i�U�u\�vn>!��\0�aIi\�w[ݖ��\�\�C\�\�;�\�q ���޾%\0MS+�*\�\�P(���\�7��r\�\�3���+���\�\�)v0^\�\�Z?��DR⪪Â�n\�V\�p7Y�\n����n��f/a/X���〣\�3\�g\�L�&��,���	U�u\�-y���\�	uo��-�(3\��.�\�n!TK \�v��V.��E�\�D2]�\�W�}⃨�6�v �\\	V7\�\�R8v\�\0Gx����\�\�,H�7����\�\�[] �{\�{�ڼ1q���d\�����\�h��\0�w8ő�n\'/O�a\�`���!�DocwD/�\���Y�\�\�[�]��Y�\����)\��q�SI{�s\���k\�Xأ:�\�Kr��o\�E�ò�\\\�e�\�F *\���\�Xݑ߸t�\"X�\��A�\�-u�֎\�H �����.\�,P�g�Q+V��#�G\�k\�2\�uPCLŅm(\��j��*c��m\�\�\�>j]�\0���s��8%�\nq�S\�\�\�)J\�?�P�k�\�\�\�y<)p*�-��B�\�K�\09����_2f㎧P\�LoR�\�Qa\�x%\�y\��*\�*���\0�p\�ψ[5f�E7\�d�V�K�\�C�K5�\�^\\8��\�sAw��ڼu�\�J$<H2�j\�\�U���:�\�\�]�L�\�� ^��\��vC�\�!\�g��y�@�\��\�)�C�x�(�	�@8\�\�\�ŵ��;\0�~k���\��	\�Xk�x�W��Cf��\Z\�L}̏Iԗm{��Ų\�\�\�\�ӉT+\�\��\0V`-�jX%^,�1*\�?\�\�\�ߋ���o�%�\�\'\���Z<��{�9\0��ӟ�`|v�s�G\�n\�/��\�\�;� ��i�\�9l(�i�T(~_3}\�<�\�\�P�&\�\�\098/�f�y�pm��L��ف\�;*@G�l\�[�Ue��%A���I\�\�:\�T[9�\"[�f\�e�8*&.�\\jd�s\0K}<`��	횪k��!!L4��.\�B�[\�\\�`\�\�\�X�ZQ�e��;\�p�p)/or���<�?uV���\�XřM�<~fZY�&\�ïr\�ٳ\�eb�u�J�\�oi� }Y��\�\�x*U�\�d=�\��\�.����(\Z\�0l7��Q�39p\�V^���.U׆f:X6ub%}���\0���\�\�\nO�=\����TU�×��\��\�h�\�}O�\�','[\"5\",\"4\"]'),(2,'Gustavo','gustavo@yahoo.com','11996919109','$2a$12$uhqHyFc4xs0XdR4hAf.ND.wikbOeZxCTeeyJ5EQJ3QYW0bF5umveS','Couto',NULL,NULL);
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
