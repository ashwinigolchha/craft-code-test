-- MariaDB dump 10.19  Distrib 10.5.9-MariaDB, for osx10.16 (x86_64)
--
-- Host: localhost    Database: code_test
-- ------------------------------------------------------
-- Server version	10.5.9-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vpllywraxlxtpptnrlxadkqszgmfserngktl` (`sessionId`,`volumeId`),
  KEY `idx_nlvkvglveztjugcvuqpatyaupaptjitvfxni` (`volumeId`),
  CONSTRAINT `fk_bbyiuoiujpebujvazraojmgqtnuvammmokig` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vufrvjhsxbvofvzmiowobuequddyspxhremh` (`filename`,`folderId`),
  KEY `idx_anhxdxqrlykeljltzeknalxmphljugzeabbn` (`folderId`),
  KEY `idx_ycnmujydauyeajmwfsibxpzyfpwzmspowbii` (`volumeId`),
  KEY `fk_mowqupzqksuykbwkhvpocdrkqlvnvpikvqfl` (`uploaderId`),
  CONSTRAINT `fk_fadzeednizqiswnxpacplthunuarnllmbffv` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mowqupzqksuykbwkhvpocdrkqlvnvpikvqfl` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_priemhhaebcqklbwiryepcuzandznzttdryb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qaxaldoifwrgnsffyyshillvuilgsnafwpvj` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assettransformindex`
--

DROP TABLE IF EXISTS `assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ifcotnnrqfvedrrojevpxjcbfvfxilyxrsjz` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assettransforms`
--

DROP TABLE IF EXISTS `assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ppycrtufjbwzglykqlvcewgacdjnegkcvfoo` (`name`),
  KEY `idx_unttesxomquvrdqhgwlbrqoprwbvkbikvzda` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kcynmisywdvmmiuuofxnbbehidjrpmouxdrg` (`groupId`),
  KEY `fk_jcvprpcyxukmgzoqighlthwzzznzvmzgyfcd` (`parentId`),
  CONSTRAINT `fk_bqkqvvkfqltgalthbjvvwfkktkioiucbwymq` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gpgsixzekcjmpdihdxfpuzliatticvkpdzea` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jcvprpcyxukmgzoqighlthwzzznzvmzgyfcd` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zqzdplrtlztxhjgbgnhxhuvtnnblwekpmoib` (`name`),
  KEY `idx_kumspivhavhrzedulapjqguuycvjuihqjegt` (`handle`),
  KEY `idx_lalgilokdobxswpwuhfdlokpjayyidddwqbm` (`structureId`),
  KEY `idx_zormzteuazafjcwozbjosqkznprmaieuqcnf` (`fieldLayoutId`),
  KEY `idx_shrowbchrjghrizjyjtsxhmewttjvctpjxup` (`dateDeleted`),
  CONSTRAINT `fk_kbwsrfmrrssvnioavortwylzpqmmlijnffdu` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_occqnfkgcazipqucxmlmtyniqpqiqboxbyhf` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sdhzpzomfygfupdezzfrmkyptrtoklglbmrv` (`groupId`,`siteId`),
  KEY `idx_rsjxaoymspwztyjmievhvhxbdiutmtjgpikn` (`siteId`),
  CONSTRAINT `fk_siuzxomdkhnmlxvsorgqebyrcmljamnxenul` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tpgunvopcbghdxmqqapfelsscjfthqwgjjid` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_jnfbfzygtzviwpcrihjlnsuyovjfiyqglgfi` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_jjzywoxwmljyonqlgdtqcydgozkxtmvwhqhj` (`siteId`),
  KEY `fk_gcuyynldsakobungnvvxevbhprkihszvouav` (`userId`),
  CONSTRAINT `fk_davwvxkqrbfaeccqyhgffexodrqukaujzmho` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_gcuyynldsakobungnvvxevbhprkihszvouav` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_jjzywoxwmljyonqlgdtqcydgozkxtmvwhqhj` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_lypxieknxnxrkflmxpnwewlymrrirbqpcyed` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_dllhpborxsvgufqsykotixbzldvexgtsvebu` (`siteId`),
  KEY `fk_keeguadewniwtxebqpnrgqmmxvlsyqsimtnq` (`fieldId`),
  KEY `fk_hqeeurlbvxmowkgmtabgzsjwkuzvizujcrss` (`userId`),
  CONSTRAINT `fk_dllhpborxsvgufqsykotixbzldvexgtsvebu` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_hqeeurlbvxmowkgmtabgzsjwkuzvizujcrss` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_keeguadewniwtxebqpnrgqmmxvlsyqsimtnq` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_nllulohoolsjvqrivylfvgabnxowwrnlvtts` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_igwhdouomujfsjkrfxgrjyxcqowkoilvxvhh` (`elementId`,`siteId`),
  KEY `idx_ywrqhdqqxxhaudyqnencwhilrbjhfahkoslt` (`siteId`),
  KEY `idx_wdgurqvgarhzhdvhwtphtquolhorycndfmtq` (`title`),
  CONSTRAINT `fk_lbcwdpcterhrwqiuqinylmtpmohfclgbyvwv` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pzxpaydngxuwzybvzpmapxzvevjsfztvmgth` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_ythfbhmafkfqcacikcfpdwudsasjqzoujnyq` (`userId`),
  CONSTRAINT `fk_ythfbhmafkfqcacikcfpdwudsasjqzoujnyq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `traces` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_czmmqhipvhnvmaxgnbjioynfszsypouydtba` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_ixyztiolzzdyhkzflizipavqudkzadstmbsx` (`saved`),
  KEY `fk_nwojsxxfrjqvsmzvkfifeujgzqzuakqocpvh` (`creatorId`),
  KEY `fk_xgthygrcdawmfchxprcwigqvfuacbgpqjtpw` (`sourceId`),
  CONSTRAINT `fk_nwojsxxfrjqvsmzvkfifeujgzqzuakqocpvh` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xgthygrcdawmfchxprcwigqvfuacbgpqjtpw` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementindexsettings`
--

DROP TABLE IF EXISTS `elementindexsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_olzggkujipzllmalhdcacskenlludltorywh` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_azejqzbowzlumtgmqpdypdisekaurlnbdxvd` (`dateDeleted`),
  KEY `idx_qvcqfmsrdtljotlrcpaiwlvdvpgiazctjnio` (`fieldLayoutId`),
  KEY `idx_ftpuegrsngynzbhqjwobaujozxgijcgnpdwq` (`type`),
  KEY `idx_qmebllbxnilyxyvkdwossfbyuufxtxvroylm` (`enabled`),
  KEY `idx_mlwngwucqfhyjutkmilkmlquoidnvxvtizmw` (`archived`,`dateCreated`),
  KEY `idx_iibetuhzzpusvnyphlzcjavsdwfvokjloziv` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  KEY `fk_yqhzvgrufndlrynfrbshudxfqjfrspxsxmgz` (`draftId`),
  KEY `fk_vwynrsccobsgvbwbqbunvmgxklxssbcinqix` (`revisionId`),
  CONSTRAINT `fk_vwynrsccobsgvbwbqbunvmgxklxssbcinqix` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_whczynaqrzskvrlpsihpudwurmotywqdvkqq` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yqhzvgrufndlrynfrbshudxfqjfrspxsxmgz` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ouexrjymluthgdjpdgfjxydawlkrqfctublx` (`elementId`,`siteId`),
  KEY `idx_kucpefvrvbaswbfbloiyqikcsjdctgdvsxht` (`siteId`),
  KEY `idx_rarllntyitikuqaqpgnfxdzmeqrgujmwfuxg` (`slug`,`siteId`),
  KEY `idx_mcxigjvuslrbmrvbwlquikfltztuukzooxmb` (`enabled`),
  KEY `idx_iyglnfncczimvhxlivgwhybkisdtibpatcse` (`uri`,`siteId`),
  CONSTRAINT `fk_dadzrlcdpmckpgeclymroqzriflbxlkpjapu` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ptfvkmhnysdehzswbvkireetakpkmsfovcnl` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dznlwddoqvoluxtdydibyrgshtcevxnqinjc` (`postDate`),
  KEY `idx_jvhcrrsmwmysgmpzyrcrfqhwenqnvhtwwfxf` (`expiryDate`),
  KEY `idx_zhqbxfhhfiwckhfgtczzldnzvmhnpwpetzhq` (`authorId`),
  KEY `idx_kfnkffkxfhrhqvykrhgatdtlrhvxfgynobto` (`sectionId`),
  KEY `idx_fwqnahkrjqmejsviinvtltsebjtwfjmpyiyu` (`typeId`),
  KEY `fk_awsoybixwvithkchkfmjcmekfmojxwfcsktx` (`parentId`),
  CONSTRAINT `fk_avftsxlajsllvbyndjcenvmouzkrngmmitsh` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_awsoybixwvithkchkfmjcmekfmojxwfcsktx` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_opgcvyhkhsskyhzvjqblemecdkodfsdcelht` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sevxgefzkrmexowdziymcnxdiuaqvcibofgd` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xjljcupiunjvzpyqlwpgutdpdzwhbcyihtsz` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xzbzqamnpivyikinpiugledohstcgpzbmsid` (`name`,`sectionId`),
  KEY `idx_wuaegwilycqcnpquvmpqeqrxvepbsywhykmm` (`handle`,`sectionId`),
  KEY `idx_xfwldzkykufpapaiaoimzdrtlvuhvwobnkpf` (`sectionId`),
  KEY `idx_cppytfrhanxmsbrnqxsezxznbugrhjfjoonl` (`fieldLayoutId`),
  KEY `idx_ukzdbvfnptabgzqgedibealwkzortlpbygvm` (`dateDeleted`),
  CONSTRAINT `fk_lttsxatucwoafuwwitpjnsgeqzuinfjwjefm` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rjrwviiviqxwnfxxoegauvpmqwfxsznzmiww` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_otchgzntdpitdqawdofoullwztiwezgmtgov` (`name`),
  KEY `idx_eidvrakwyzsitmkbtuknzegalbekydwviljs` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kbtyiuscvtgxqxcdxqgzqgdovfyescbolrgl` (`layoutId`,`fieldId`),
  KEY `idx_gjhsjdpsyyllderlmxzwnhmifhnnxqetxvlu` (`sortOrder`),
  KEY `idx_yljvnfjqkfrdybpapazdomukaonyypfygcll` (`tabId`),
  KEY `idx_htuzqtabjmutbudwlyqwajsffvipwxokfloo` (`fieldId`),
  CONSTRAINT `fk_azzjeocdevbiuleysdjydsrjvmkjxmspikzc` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ftcnsjgfgxddlkpnyrnuilultmhvkhvvmaiy` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mkihggfsyrgsupgccwryzehksyhxypxdmbms` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qaertrvmkqlhopcuqhmifmjeizihgryifgoc` (`dateDeleted`),
  KEY `idx_oupcdnsorlazuusqxrglgtrsbwbtjfbxvqnd` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elements` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wriwzjaopwjadrkmjlsdsxxfphysccvydtzd` (`sortOrder`),
  KEY `idx_rcagrjtkisyybjdllgrbhrwybpgjyqgaaqkb` (`layoutId`),
  CONSTRAINT `fk_zkrxdtxnttcxeuqvxnfrkmnfjkbsvqtjaecw` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `instructions` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wfuolxxcwuzafyvbyofhzknrhmaovkfoyfhv` (`handle`,`context`),
  KEY `idx_dyoohsokotnzuxqrwieshfukwfvxiqeisrak` (`groupId`),
  KEY `idx_ivhprxslledtmqmgknvcehoyekgikupchjjx` (`context`),
  CONSTRAINT `fk_mhhbffjlocxeoxsiuzsrasbxqrfihyybxqmq` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cpdnycgdnikboeindojvbcigtqckkdihsfgl` (`name`),
  KEY `idx_muavrzdimiltgksozfppjqbdjidycxfvtuyy` (`handle`),
  KEY `idx_rgnkoqvxeduoqcqfegmntghioddmnaowchnk` (`fieldLayoutId`),
  CONSTRAINT `fk_dhwukqvrfasungrijqrifvhaabtgrgdjyyjt` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fgzwmvxasshmnjynlylvphapglxjkptmuwpe` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mbwkhjkeqswaecupvxteuphnxogvktqikrpc` (`accessToken`),
  UNIQUE KEY `idx_ceskpkycznhwgwnxzuhlianprqsvdfdcurmn` (`name`),
  KEY `fk_zesblqtqbmvhgpbohtaflvfyajgjctzoqsxo` (`schemaId`),
  CONSTRAINT `fk_zesblqtqbmvhgpbohtaflvfyajgjctzoqsxo` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kynvdmdiuturjikedqnaybidnfqktixvqpne` (`ownerId`),
  KEY `idx_kkvdfygbccrqmyfriupslyqexgyivppwgwyz` (`fieldId`),
  KEY `idx_icsuukpxdzjqppcszutlszbtzjodgtbqixhi` (`typeId`),
  KEY `idx_kpejfdcniydicwcjcxvmkrgyuoyairbygbaf` (`sortOrder`),
  CONSTRAINT `fk_gsirwpdffrebjeyriuvhdtyligiurjoubdip` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lmeyunasqnkbnhdyjbhsrboqgujjptoofzof` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ugvjdcbkjlpmxqxuwvkibdqqnosdskvvrvwu` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yevuuybmieuzavyjwisbvbfdwakiczbotoru` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ubvjxicqfzvrzkckkwqgivbpmozxyiqkroeg` (`name`,`fieldId`),
  KEY `idx_imknpdoyjqhtskxqqwqzhmtpenklcaehzkwf` (`handle`,`fieldId`),
  KEY `idx_novveieiugjowfljtibltinqbzxnanyzdcov` (`fieldId`),
  KEY `idx_qfjlzxnpbnbyrkwbdnorcuftkdslalgikfgh` (`fieldLayoutId`),
  CONSTRAINT `fk_ckksvmckclkmjzfnpqjievnmwtqtjmpsmfox` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_iqghprmcejdhvpvkcwamuxtneqgfbpeiggti` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixcontent_contentbuilder`
--

DROP TABLE IF EXISTS `matrixcontent_contentbuilder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_contentbuilder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_richtext_text` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_videoEmbed_embed` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mruojieqslvadgctlpmfdestfzhqntzmypga` (`elementId`,`siteId`),
  KEY `fk_ljsuujmakxpbkyxzqyuqdyphssbsoqsdmqvs` (`siteId`),
  CONSTRAINT `fk_dfpzqnmewcfzazbmhdlhbqmeoyeowzigkmhe` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ljsuujmakxpbkyxzqyuqdyphssbsoqsdmqvs` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixcontent_imagewithtext`
--

DROP TABLE IF EXISTS `matrixcontent_imagewithtext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_imagewithtext` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_block_text` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_block_headline` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fvhmdgtqjvrxsyutazovvvsbtrelnjvoquwn` (`elementId`,`siteId`),
  KEY `fk_jztjtimhdkmectyugmaxhjtdpigfxisbwnlz` (`siteId`),
  CONSTRAINT `fk_czunxnzzcmrdtxvitvikzgpaykipyqbsubfv` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jztjtimhdkmectyugmaxhjtdpigfxisbwnlz` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mpsswllzyzivmzdsyrupnoglietaenyijflr` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=367 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wbvlaoabrjbzjlotyjvrfwcczocypliznrjd` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfignames`
--

DROP TABLE IF EXISTS `projectconfignames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfignames` (
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) unsigned NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ghtordfoaaxsvypqrvbexflecdfusyezaryx` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_dkhxlwuxiyvjdirysnznokxuhdtifqblzpdn` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_awigbxkvemkyipfvtiytqrxgkcmweiuoommq` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_xvmgdfbvohjbejrhhtaideuvvpwppxncyfwd` (`sourceId`),
  KEY `idx_wuhfontsjyenfbtfdmsrttslpwzuwgpsucjm` (`targetId`),
  KEY `idx_fxnkfvfhprqtosrifethzjsqphzwndosetqt` (`sourceSiteId`),
  CONSTRAINT `fk_cgsrgxcllesuyrlwwhunriylycwtdoolhooy` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ckdmwyfwfhsyhcrcviqjpmadvoeujjybjutf` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ixjovauimpvserynbajhvomqtkwmbgzxrsyh` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_srironzolziqolozptiquiwlrxdonoemktep` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vumydypchritvcjhgsyfygsszagiftkbikly` (`sourceId`,`num`),
  KEY `fk_hjvrbqfwlxpmyzgpqrlrjdidhxqiqnmfmolb` (`creatorId`),
  CONSTRAINT `fk_hjvrbqfwlxpmyzgpqrlrjdidhxqiqnmfmolb` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xzkjwnqorelzskpumlvhxwafzdsucdhrfpdz` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_ksiqoqnikxrbpukdwucitawwbimzpwaxxnep` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `previewTargets` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uyqknlwyycfnghbxogcvmreabxivewtmbwly` (`handle`),
  KEY `idx_xwcaltixffzxauulzoithgkdtkpdiloahgjl` (`name`),
  KEY `idx_mtskskefoxpxlrcquubngwlgstmyhwjgxbqk` (`structureId`),
  KEY `idx_gywrgcihpsjzblssoiobjuzmxlblcbzbsjlj` (`dateDeleted`),
  CONSTRAINT `fk_vdiskfcrirykhmpusfxiuxhepikpkwjayyde` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xxjfmekhulpvnbssaiwwjjunrknloqtzrxxg` (`sectionId`,`siteId`),
  KEY `idx_httupfvowhlakwedtcntkkuavmisaizpiqmm` (`siteId`),
  CONSTRAINT `fk_grjuqoiimdztwiwkrtrcskyqauoguzqkemvl` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wyfvxkkdrftmqsrzdyhpcwdxacvttafmfumy` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rolowdsujyqmyncmaqrawvkkjaasexkhpkvr` (`uid`),
  KEY `idx_rtgdgvfuircgialoykkvmuutczktyamfydan` (`token`),
  KEY `idx_uyjjzdkhhugfhyisqzvqvyueutoayprbrgfw` (`dateUpdated`),
  KEY `idx_wmbfziomqgacmeptkqtlapyepxwxhqswivkt` (`userId`),
  CONSTRAINT `fk_mcbiswekmxduehshykfygpcfhbaibsgvvmed` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_biiwjkxdvqecgjjfjhcuexzskidlifdhkwpl` (`userId`,`message`),
  CONSTRAINT `fk_cdkocxqveyyririrdnghytjszdeaucdnwftf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hyrzephhczysbnfadusoxuohxghgvtseobtf` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lkzydckpktcmvtbdfotomogsxwvlysjcrvth` (`dateDeleted`),
  KEY `idx_mwnidqfkdjmwhrozvorayfrhipztmjhrasss` (`handle`),
  KEY `idx_bktufjaovzjarvilkhbvucjhdsbgrotpeapa` (`sortOrder`),
  KEY `fk_uncyhjnxqdopirddlxlsbzznfpowyvibfikn` (`groupId`),
  CONSTRAINT `fk_uncyhjnxqdopirddlxlsbzznfpowyvibfikn` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hpchacudmaoxmmycrnoyjmaelozztadqjzar` (`structureId`,`elementId`),
  KEY `idx_oziwlvbjchsmapualogimeaozyfarhkoulpa` (`root`),
  KEY `idx_ecktcjydqjoupparincxklrpdwzbzzmurvlm` (`lft`),
  KEY `idx_tiygoblwtkdkeizvliydsgvmudbxzjwozldh` (`rgt`),
  KEY `idx_uflyutzomgfknpoosjrvthrayykkdtnroslb` (`level`),
  KEY `idx_shxsaforybkuepybbcfbcakhriajdilnldqm` (`elementId`),
  CONSTRAINT `fk_arcurydorjawhqozjiezdpztiiwyybdwaenw` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xvrvlfpqacxztuepyrncohwfqdijrlijlwad` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_limqvvnnvyaocvliimibcftrjmfdxzbuhies` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supertableblocks`
--

DROP TABLE IF EXISTS `supertableblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supertableblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ncvrelbnndfwvovhdckqyjuqsvjtwwoeblaj` (`ownerId`),
  KEY `idx_dijknxlpryzfgxdollhxczppnrcdxenhinlx` (`fieldId`),
  KEY `idx_zsjkvordettcxfzscefhheartitznigbqwdk` (`typeId`),
  KEY `idx_ctzzeiqpdbdgifijvzpjtsdtrkeigufuhwrj` (`sortOrder`),
  CONSTRAINT `fk_hcnhznxpseqdhtvrxfjdmztdrzdouxvogbxz` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uzywqzbrapvyuflnmlayfsmgbslwuyllkvij` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xzmigxruhgftpwxchqktrvwbesmefcycydxd` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ywxnzrizktfuysyvmsttxbfxpmpvlnewpiha` FOREIGN KEY (`typeId`) REFERENCES `supertableblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supertableblocktypes`
--

DROP TABLE IF EXISTS `supertableblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supertableblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qzmoakmclzojpitbjkwlosvvmohxynakityt` (`fieldId`),
  KEY `idx_nahwfmpgviltavfrgmmwbmdhhsjbkusgmsfk` (`fieldLayoutId`),
  CONSTRAINT `fk_ffgwcmwuipfgesnzkpaxhuerjhhxzqrxggml` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tvdmyvxbtonpqmrbqszfjctxttnorjcfjbbf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tmpkgnatrebwbkpjzoshxpnhgrmxmaunjlro` (`key`,`language`),
  KEY `idx_fxhbljgrjmssagolepqflshzrkxpznvaxtvl` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kpflmevutnwqiorrqyopucgmsxhiqfwfadnq` (`name`),
  KEY `idx_mvpdfaidovfujpudufhdffsdjzqdnxrgkyks` (`handle`),
  KEY `idx_bhqbnhqqtogciexdwtojxlcgwsnsbgdmpfzj` (`dateDeleted`),
  KEY `fk_mtetgdzzdodsahgoyisphwadlzjbgkhnndng` (`fieldLayoutId`),
  CONSTRAINT `fk_mtetgdzzdodsahgoyisphwadlzjbgkhnndng` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lstnukfiltnwhpmbsxnuudhxaqpcdeynwzhw` (`groupId`),
  CONSTRAINT `fk_ilizooptwoxgrarqdvucsenxpegxcpitffte` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qklqdhdevtroqmkcwhufdsohhgbkshexmese` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatecacheelements`
--

DROP TABLE IF EXISTS `templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecacheelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mqdznclgggbvegzcqmfrkbveuratgcpcpfgo` (`cacheId`),
  KEY `idx_ruedrjkvfykibrontdglebfxajbunihrekyq` (`elementId`),
  CONSTRAINT `fk_fxlmuflreycixqjtdoxwspqolwedlqrutgmo` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rslvzejpmehzoamgjppxnoxjfsthyagzijce` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatecachequeries`
--

DROP TABLE IF EXISTS `templatecachequeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ntwzqytnfyetjstlpviwegjwenenlgqnnhhe` (`cacheId`),
  KEY `idx_hlrnzhbndravqwverytfkipvxiegufxtimnj` (`type`),
  CONSTRAINT `fk_trllhnvlxfztxnwyclcywjkxovitjdkzbprc` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatecaches`
--

DROP TABLE IF EXISTS `templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_grpkfhwzxrhpqpobxvkbgwzttyjdhhylyzby` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `idx_xmblggmmyaoydpcmkdglfwxpfmahgrhouseo` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `idx_gunnjhfymdphhazazmfpvywqmbkwnakzrbmo` (`siteId`),
  CONSTRAINT `fk_vvpzgnqttmuypveuxweynduzlwtnilqwcbcg` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dbaqmyjgtbbuleqkrtsafwedgrumffmysvcu` (`token`),
  KEY `idx_pvbclbzwgavygaxszxyrllvzmkkzmhnnqwdg` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_whdykhjsjgcbwwpyjyrnhufhzkonfyuijjbi` (`handle`),
  KEY `idx_zzwruvbtpfiosaesmkuieucuscxzpjnewshn` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tbmbgyxgmxhfszpifhdocqfyrekxezbeadru` (`groupId`,`userId`),
  KEY `idx_rkwnoezpyhgmwjldovbrbbzqwdmphkqsvtix` (`userId`),
  CONSTRAINT `fk_mwjaxsixxfjgbapaojgxvbjhcrjdkdjgucqo` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qthvlmdjqlubbnfrblltlnhjfbddicwhkfrt` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gqbfihvbuoqengqplymxdlqwfwldbcxdwjeq` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nkaqidzhyhwbqnqpmeidkfxworcuvtlqjqmz` (`permissionId`,`groupId`),
  KEY `idx_elomieaqpitghzlxaeqxxfchpkpdpwxhxkob` (`groupId`),
  CONSTRAINT `fk_hqkkshswranquoqwzorfgkgecplmlpszgxnt` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ivgildsxqbnblpagfcrqguoyahhojnqegdth` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dlkwdjznpzxnikrhtcbvuwerzgeoyysydfeb` (`permissionId`,`userId`),
  KEY `idx_vxlpjepzhlyadmebnhrjppukejdaplwfgdkw` (`userId`),
  CONSTRAINT `fk_ahzqyincsxcaaxdxzlpjsdejqowidtumqpdg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_borvwsjzmgnwxpxsdqsogojsgodeejunohvv` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_dpfqxmcowenoevepmazkdjlgdudgosjdlwjg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_sekfqlezrbpzbtembcdzonkjbtfyjrhwvxak` (`uid`),
  KEY `idx_almkzkyipjqlotcujvqvmyxkvymqzylqwykw` (`verificationCode`),
  KEY `idx_nofovdygmoadzaktirivgcjeibqjatuavmml` (`email`),
  KEY `idx_rgxemgmurryqdyiwbqvewkvqdrdlvkpcdhja` (`username`),
  KEY `fk_ikxafjxuzjqcxwgjtzsifptjoalvvjctptcy` (`photoId`),
  CONSTRAINT `fk_gxhocdewnmssaitcwhtricggfaqeyfyrmbfz` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ikxafjxuzjqcxwgjtzsifptjoalvvjctptcy` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wzmotbjizcuendbgxnuicalgmgvaethltfde` (`name`,`parentId`,`volumeId`),
  KEY `idx_kfkavqyiirhzsecangbjjxysrtneembhyyvs` (`parentId`),
  KEY `idx_kbccyllhcepknpojgrhsgnsbyfacesximftb` (`volumeId`),
  CONSTRAINT `fk_annzbemlzdzeocngwiyqtquehyiilzpplyii` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jikslfqmfphoydcjzydtnewissuovgggunyz` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jyvfupwkwoqovwpvrdhdsucmfxtaakhasvun` (`name`),
  KEY `idx_qmdkrcaqtvwrmkmmifjzzkoyhngvtupvffsy` (`handle`),
  KEY `idx_vtfuolrilasrqtaxdzxjmhturtvyrbsqwruu` (`fieldLayoutId`),
  KEY `idx_nrgqithkdwhtfifmygasxxdpqompglreggmi` (`dateDeleted`),
  CONSTRAINT `fk_evppbjhbgexlcsfsoltqimauvxekimlmxnbl` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aguivgsllcgffqvpygwmtorvilgoarwoptuv` (`userId`),
  CONSTRAINT `fk_mskklmzcutilvsalohxjwshrnkskvyqwhrvh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'code_test'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-29 13:08:03
-- MariaDB dump 10.19  Distrib 10.5.9-MariaDB, for osx10.16 (x86_64)
--
-- Host: localhost    Database: code_test
-- ------------------------------------------------------
-- Server version	10.5.9-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets` VALUES (6,1,1,2,'test.png','image',300,300,25849,NULL,NULL,NULL,'2021-06-28 21:15:19','2021-06-28 21:15:19','2021-06-28 21:15:19','90bc4dc9-6f2c-4603-acd4-f0afdd41d46a'),(12,1,1,2,'headphones.jpg','image',1024,1024,1189132,NULL,NULL,NULL,'2021-06-28 21:24:43','2021-06-28 21:24:43','2021-06-28 21:24:43','683e402a-e802-4fb8-9188-cc91696b4af3');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assettransforms`
--

LOCK TABLES `assettransforms` WRITE;
/*!40000 ALTER TABLE `assettransforms` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assettransforms` VALUES (1,'Profile Photo','profilePhoto','crop','center-center',250,250,NULL,30,'none','2021-06-28 19:50:10','2021-06-28 19:50:10','2021-06-28 19:50:10','8212eef9-36c8-47b5-ab4e-9892531926ac');
/*!40000 ALTER TABLE `assettransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (2,1,'email','2021-06-29 17:03:42',0,2),(2,1,'firstName','2021-06-28 21:19:01',0,2),(2,1,'lastName','2021-06-28 21:19:01',0,2),(2,1,'lastPasswordChangeDate','2021-06-29 17:03:42',0,2),(2,1,'password','2021-06-29 17:03:42',0,2),(3,1,'uri','2021-06-28 21:19:44',0,2);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (3,1,1,'2021-06-28 21:24:46',0,2),(20,1,5,'2021-06-29 14:54:13',0,2);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,2,1,NULL,'2021-06-28 19:28:48','2021-06-29 17:03:41','f85695c4-a3ec-46ba-9ed7-37db186be316'),(2,3,1,'Homepage','2021-06-28 19:36:56','2021-06-28 21:26:59','5f093116-70a9-43d7-9655-60981f439791'),(3,4,1,'Homepage','2021-06-28 19:36:56','2021-06-28 19:36:56','2317cc9f-a1d7-4536-9a2e-b16547b6aaf2'),(4,5,1,'Homepage','2021-06-28 21:14:33','2021-06-28 21:14:33','9c94caec-d09f-4e18-aa90-f68d31103b44'),(5,6,1,'Test','2021-06-28 21:15:19','2021-06-28 21:15:19','69044656-2349-4e4a-9dbe-acd9d786259d'),(6,8,1,'Homepage','2021-06-28 21:15:22','2021-06-28 21:15:22','beebab78-f51e-41aa-a739-e295f9807f8d'),(7,10,1,'Homepage','2021-06-28 21:19:44','2021-06-28 21:19:44','ed89cf30-d809-4f7e-adcc-3564ee5cf706'),(8,12,1,'Headphones','2021-06-28 21:24:42','2021-06-28 21:24:42','7313e706-4cbb-4d5e-9480-50834c4c23a9'),(9,14,1,'Homepage','2021-06-28 21:24:46','2021-06-28 21:24:46','16210d65-56e0-4d68-b3fa-b74516139656'),(10,17,1,'Homepage','2021-06-28 21:26:59','2021-06-28 21:26:59','9cc5e767-cc8e-46ab-b0af-6a1daee50ffb'),(11,20,1,'Example','2021-06-29 14:52:41','2021-06-29 14:59:33','a6c75c91-c914-4691-93cd-980104b538e9'),(12,21,1,'Example','2021-06-29 14:52:41','2021-06-29 14:52:41','25ed65b6-0770-4c61-bc50-9fc73a75545b'),(13,22,1,'Example','2021-06-29 14:53:06','2021-06-29 14:53:06','4a156638-2fab-44e1-b6e2-cca1cd22cee9'),(14,26,1,'Example','2021-06-29 14:54:13','2021-06-29 14:54:13','f405262d-0a9d-43a0-a748-f06f7eb56b7f'),(15,30,1,'Example','2021-06-29 14:59:33','2021-06-29 14:59:33','f39d8451-9ab3-42f1-930e-869bb84f15af');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementindexsettings`
--

LOCK TABLES `elementindexsettings` WRITE;
/*!40000 ALTER TABLE `elementindexsettings` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,'craft\\commerce\\elements\\Donation',1,0,'2021-06-28 19:28:46','2021-06-28 19:28:46',NULL,'84fa5202-b39c-4929-85e9-0f1c78aee348'),(2,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2021-06-28 19:28:48','2021-06-29 17:03:41',NULL,'a6618696-0553-4ff4-bd3e-bb640f6c5204'),(3,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2021-06-28 19:36:56','2021-06-28 21:26:59',NULL,'d6e23a44-a09c-4805-8c9f-3d3924377e5b'),(4,NULL,1,2,'craft\\elements\\Entry',1,0,'2021-06-28 19:36:56','2021-06-28 19:36:56',NULL,'1f30518f-9348-4276-969c-24fa6f520d03'),(5,NULL,2,2,'craft\\elements\\Entry',1,0,'2021-06-28 21:14:33','2021-06-28 21:14:33',NULL,'fb054a6d-1410-4a85-b436-f3641a772051'),(6,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2021-06-28 21:15:19','2021-06-28 21:15:19',NULL,'e8cc19b0-e74e-473b-bf33-2fd58f22a415'),(7,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-06-28 21:15:22','2021-06-28 21:24:46',NULL,'85c2cb6d-475f-4c0c-b2de-41b9a0616d3b'),(8,NULL,3,2,'craft\\elements\\Entry',1,0,'2021-06-28 21:15:22','2021-06-28 21:15:22',NULL,'37ba1ab9-6eb1-4f3c-a2c5-f53c6f72fee5'),(9,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-06-28 21:15:22','2021-06-28 21:15:22',NULL,'364bca85-7908-43da-8608-65eb5996dcb8'),(10,NULL,4,2,'craft\\elements\\Entry',1,0,'2021-06-28 21:19:44','2021-06-28 21:19:44',NULL,'b4a15217-1a30-434c-85f3-2be0776743eb'),(11,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-06-28 21:19:44','2021-06-28 21:15:22',NULL,'cf2a352d-f47c-4090-ad94-6390d7ef1cec'),(12,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2021-06-28 21:24:42','2021-06-28 21:24:42',NULL,'302558db-0a01-442f-8ca4-ef1dfc76118b'),(13,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-06-28 21:24:46','2021-06-28 21:24:46',NULL,'8c8feb16-b42e-48bc-aa1a-71330133aab7'),(14,NULL,5,2,'craft\\elements\\Entry',1,0,'2021-06-28 21:24:46','2021-06-28 21:24:46',NULL,'6771e198-3cb2-4f87-9fff-31a9b341156c'),(15,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-06-28 21:24:46','2021-06-28 21:24:46',NULL,'532cafae-b3c1-4d52-be9c-24dce422419c'),(16,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-06-28 21:24:46','2021-06-28 21:24:46',NULL,'3f39b5b8-ba04-4c6d-ac24-87732764d727'),(17,NULL,6,2,'craft\\elements\\Entry',1,0,'2021-06-28 21:26:59','2021-06-28 21:26:59',NULL,'eaa892d4-587e-4fd9-bed7-959497e42749'),(18,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-06-28 21:26:59','2021-06-28 21:24:46',NULL,'1c980c88-4813-4eae-9626-bcf1f8f6d152'),(19,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-06-28 21:26:59','2021-06-28 21:24:46',NULL,'031e64ba-e688-428f-988e-076421d607e6'),(20,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2021-06-29 14:52:41','2021-06-29 14:59:33',NULL,'f3f4eac6-d946-4510-8827-e2a2ee5d84f6'),(21,NULL,7,9,'craft\\elements\\Entry',1,0,'2021-06-29 14:52:41','2021-06-29 14:52:41',NULL,'d032af87-7515-45cc-8aab-0574ab666b4a'),(22,NULL,8,9,'craft\\elements\\Entry',1,0,'2021-06-29 14:53:06','2021-06-29 14:53:06',NULL,'db95bbf1-bbbb-43fb-9ffe-10c3cbf100ae'),(23,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-06-29 14:54:13','2021-06-29 14:54:13',NULL,'9cbd0966-17de-406f-9e7f-0f6fe58776b4'),(24,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2021-06-29 14:54:13','2021-06-29 14:54:13',NULL,'b4e2ac28-ed43-47cf-bb5b-227149d4de28'),(25,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-06-29 14:54:13','2021-06-29 14:54:13',NULL,'9ea088e7-7e49-495b-a4a7-236367e2647c'),(26,NULL,9,9,'craft\\elements\\Entry',1,0,'2021-06-29 14:54:13','2021-06-29 14:54:13',NULL,'46f4207f-910c-4163-8722-2c65e8ef5540'),(27,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-06-29 14:54:13','2021-06-29 14:54:13',NULL,'e634fa40-e034-4a74-b7d9-e7650f08997d'),(28,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2021-06-29 14:54:13','2021-06-29 14:54:13',NULL,'9794b47a-ddc0-4409-ae1d-6d91f68e6f24'),(29,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-06-29 14:54:13','2021-06-29 14:54:13',NULL,'ae31c3f4-4e07-43b3-a0fb-7576b347a503'),(30,NULL,10,9,'craft\\elements\\Entry',1,0,'2021-06-29 14:59:33','2021-06-29 14:59:33',NULL,'48ceebab-d276-4fe1-a35d-279b3c4bf0ee'),(31,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2021-06-29 14:59:33','2021-06-29 14:54:13',NULL,'9eb98a9b-b265-4a85-a986-af1e17c08835'),(32,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2021-06-29 14:59:33','2021-06-29 14:54:13',NULL,'fca82082-bbd9-4783-9722-22b41841c6d1'),(33,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-06-29 14:59:33','2021-06-29 14:54:13',NULL,'1d97a43f-42fe-42bb-a2a3-4992b16958db');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2021-06-28 19:28:46','2021-06-28 19:28:46','5489a792-9cb8-4954-971b-d22d73f89cfa'),(2,2,1,NULL,NULL,1,'2021-06-28 19:28:48','2021-06-28 19:28:48','a54537ce-17f5-423e-8f02-60ca5d490e50'),(3,3,1,'homepage','__home__',1,'2021-06-28 19:36:56','2021-06-28 21:19:44','ff0622a6-0b9d-4c62-83e5-8536ff6611ff'),(4,4,1,'homepage','homepage',1,'2021-06-28 19:36:56','2021-06-28 19:36:56','576b7d5e-b898-4cf0-a71f-8e06f44b6b84'),(5,5,1,'homepage','homepage',1,'2021-06-28 21:14:33','2021-06-28 21:14:33','c110dac5-a2e1-4849-a1db-325677ca5bf6'),(6,6,1,NULL,NULL,1,'2021-06-28 21:15:19','2021-06-28 21:15:19','fc50cef8-fc63-4f12-8873-be4caf2da39a'),(7,7,1,NULL,NULL,1,'2021-06-28 21:15:22','2021-06-28 21:15:22','033bb52b-56b3-4d59-9fed-77bf14fb025a'),(8,8,1,'homepage','homepage',1,'2021-06-28 21:15:22','2021-06-28 21:15:22','a2507021-a61d-442d-967d-62e05be11f3b'),(9,9,1,NULL,NULL,1,'2021-06-28 21:15:22','2021-06-28 21:15:22','b3b44628-87c4-4423-ab27-479eeb0ce85f'),(10,10,1,'homepage','__home__',1,'2021-06-28 21:19:44','2021-06-28 21:19:44','47c8c584-3479-4bb1-aa67-b7c9959a3085'),(11,11,1,NULL,NULL,1,'2021-06-28 21:19:44','2021-06-28 21:19:44','2b87fcd8-d105-4917-8488-c43bbeb508dc'),(12,12,1,NULL,NULL,1,'2021-06-28 21:24:42','2021-06-28 21:24:42','745c0ed7-28a3-4237-ae6c-ead885d17e05'),(13,13,1,NULL,NULL,1,'2021-06-28 21:24:46','2021-06-28 21:24:46','802a25ce-fb32-4a98-bfdd-1b98973bd318'),(14,14,1,'homepage','__home__',1,'2021-06-28 21:24:46','2021-06-28 21:24:46','35e8f6b4-96f4-4aaa-b9ce-bb9152201662'),(15,15,1,NULL,NULL,1,'2021-06-28 21:24:46','2021-06-28 21:24:46','94bbdc3c-f5e9-4433-9f1e-96e40a0561c1'),(16,16,1,NULL,NULL,1,'2021-06-28 21:24:46','2021-06-28 21:24:46','b97d5e3c-57f3-455a-89db-3e1dfaca0b41'),(17,17,1,'homepage','__home__',1,'2021-06-28 21:26:59','2021-06-28 21:26:59','cf5846a0-8a8a-4f0c-9784-e9bf2a19fcd2'),(18,18,1,NULL,NULL,1,'2021-06-28 21:26:59','2021-06-28 21:26:59','f4a301bf-5d17-485b-b004-20cecfca8cc9'),(19,19,1,NULL,NULL,1,'2021-06-28 21:26:59','2021-06-28 21:26:59','dc71ef39-1997-43c1-9a0a-b6f85df19c19'),(20,20,1,'example','example',1,'2021-06-29 14:52:41','2021-06-29 14:52:41','3a5af4c0-11ee-4446-8ec7-7f8e6a61dda1'),(21,21,1,'example','example',1,'2021-06-29 14:52:41','2021-06-29 14:52:41','77c32459-372e-4d7a-ae55-74baa82b0e0d'),(22,22,1,'example','example',1,'2021-06-29 14:53:06','2021-06-29 14:53:06','16fb0969-98d3-4d60-8157-a45b40235e43'),(23,23,1,NULL,NULL,1,'2021-06-29 14:54:13','2021-06-29 14:54:13','769cf7b5-3bde-4855-b039-c55261e8d493'),(24,24,1,NULL,NULL,1,'2021-06-29 14:54:13','2021-06-29 14:54:13','18ebb10c-158e-4523-9517-a9ec414b02c4'),(25,25,1,NULL,NULL,1,'2021-06-29 14:54:13','2021-06-29 14:54:13','155d5c38-b9d9-4f6e-8b84-729f405e467c'),(26,26,1,'example','example',1,'2021-06-29 14:54:13','2021-06-29 14:54:13','9f6d0d9d-b415-4169-8597-c08b7e0c2023'),(27,27,1,NULL,NULL,1,'2021-06-29 14:54:13','2021-06-29 14:54:13','7e7c1fb3-cb2f-4ce2-b141-ffa6bbad0dfd'),(28,28,1,NULL,NULL,1,'2021-06-29 14:54:13','2021-06-29 14:54:13','3d5f2dde-fb35-4a09-9f08-9f8bc793f762'),(29,29,1,NULL,NULL,1,'2021-06-29 14:54:13','2021-06-29 14:54:13','a76614bd-ffdc-4f6f-af1e-bb5ac1524d84'),(30,30,1,'example','example',1,'2021-06-29 14:59:33','2021-06-29 14:59:33','f2408501-863a-49d0-beb5-406fa399fb24'),(31,31,1,NULL,NULL,1,'2021-06-29 14:59:33','2021-06-29 14:59:33','d979e6ef-913a-4692-a078-138036b3c045'),(32,32,1,NULL,NULL,1,'2021-06-29 14:59:33','2021-06-29 14:59:33','9e3d9d50-b2b5-404b-97c0-0607bdc81d59'),(33,33,1,NULL,NULL,1,'2021-06-29 14:59:33','2021-06-29 14:59:33','dd30ec7c-bc68-4389-bf1a-5db1728c2c1f');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (3,1,NULL,1,NULL,'2021-06-28 19:36:00',NULL,NULL,'2021-06-28 19:36:56','2021-06-28 19:36:56','67bbb575-bc59-44fb-900e-6ff9f4b7e8dc'),(4,1,NULL,1,NULL,'2021-06-28 19:36:00',NULL,NULL,'2021-06-28 19:36:56','2021-06-28 19:36:56','be8927bb-ffa9-4c5e-b745-96d8322874cd'),(5,1,NULL,1,NULL,'2021-06-28 19:36:00',NULL,NULL,'2021-06-28 21:14:33','2021-06-28 21:14:33','afca99b4-c44e-40c5-b87d-0978efd056df'),(8,1,NULL,1,NULL,'2021-06-28 19:36:00',NULL,NULL,'2021-06-28 21:15:22','2021-06-28 21:15:22','3dfc8d9e-fa03-42cd-a062-c0a6a82ecf0f'),(10,1,NULL,1,NULL,'2021-06-28 19:36:00',NULL,NULL,'2021-06-28 21:19:44','2021-06-28 21:19:44','96d0ca55-8d63-403e-9b3b-d3d855216a5a'),(14,1,NULL,1,NULL,'2021-06-28 19:36:00',NULL,NULL,'2021-06-28 21:24:46','2021-06-28 21:24:46','66ccd476-77dc-423c-9aa4-e54c63c2aeb6'),(17,1,NULL,1,NULL,'2021-06-28 19:36:00',NULL,NULL,'2021-06-28 21:26:59','2021-06-28 21:26:59','ad7116c5-2eab-4f40-8c97-d1fe7fe2dd9c'),(20,3,NULL,3,NULL,'2021-06-29 14:52:00',NULL,NULL,'2021-06-29 14:52:41','2021-06-29 14:52:41','186559ef-c986-439b-8726-52ee75e716df'),(21,3,NULL,3,NULL,'2021-06-29 14:52:00',NULL,NULL,'2021-06-29 14:52:41','2021-06-29 14:52:41','ca168d1f-9a07-4b14-a773-75bb47e1ea85'),(22,3,NULL,3,NULL,'2021-06-29 14:52:00',NULL,NULL,'2021-06-29 14:53:06','2021-06-29 14:53:06','2220030b-6bb1-470e-9418-e29500052c2b'),(26,3,NULL,3,NULL,'2021-06-29 14:52:00',NULL,NULL,'2021-06-29 14:54:13','2021-06-29 14:54:13','cdd2fdff-cb5c-47e4-a5b5-960dffae6bd3'),(30,3,NULL,3,NULL,'2021-06-29 14:52:00',NULL,NULL,'2021-06-29 14:59:33','2021-06-29 14:59:33','01c59641-288c-4b89-b27d-9ca459dbc427');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,2,'Homepage','homepage',1,'site',NULL,'{section.name|raw}',1,'2021-06-28 19:36:56','2021-06-28 21:26:59',NULL,'bbb54962-2280-467a-a9f8-15522dd5e7b2'),(2,2,4,'EMployees','employees',1,'site',NULL,NULL,1,'2021-06-28 19:51:28','2021-06-28 19:51:28','2021-06-28 19:51:53','ac7f8f33-0854-4b6a-bbb5-06ea2af23de0'),(3,3,9,'Example','example',0,'site',NULL,'{section.name|raw}',1,'2021-06-29 14:52:41','2021-06-29 14:52:41',NULL,'03c99c5f-1d80-4e41-a0b5-07c33e763e93');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldgroups` VALUES (1,'Common','2021-06-28 19:28:48','2021-06-28 19:28:48',NULL,'acc7548f-3022-405c-b653-2c8760879e60');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayoutfields` VALUES (1,5,9,4,0,0,'2021-06-28 21:14:01','2021-06-28 21:14:01','aefff259-4d65-41c8-8e55-d91095d10d7f'),(2,5,9,2,1,1,'2021-06-28 21:14:01','2021-06-28 21:14:01','bfe8df89-3fed-4787-a4ce-0c390483f43f'),(3,5,9,3,0,2,'2021-06-28 21:14:01','2021-06-28 21:14:01','fd83d701-5337-424c-ab40-31cb7534ebcb'),(5,2,14,1,0,0,'2021-06-28 21:26:59','2021-06-28 21:26:59','42a6fd75-898e-4197-aa4f-e627320a3eba'),(9,9,19,5,0,1,'2021-06-29 14:53:06','2021-06-29 14:53:06','cf083eb8-911f-4cee-80b8-875de9ec3eff'),(10,6,20,6,1,0,'2021-06-29 15:04:33','2021-06-29 15:04:33','7bf68e0e-75a5-487d-9d0f-545d4ce3209c'),(11,7,21,7,1,0,'2021-06-29 15:04:33','2021-06-29 15:04:33','03b72830-911c-40f2-87d9-a1ae0c89c87e'),(12,8,22,8,1,0,'2021-06-29 15:04:33','2021-06-29 15:04:33','ce4a9d4e-6dd5-421f-b0cd-27b7120959ae');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\commerce\\elements\\Product','2021-06-28 19:28:48','2021-06-28 19:28:48',NULL,'a65a39e7-8abc-43be-9e40-0e51743a0ba2'),(2,'craft\\elements\\Entry','2021-06-28 19:36:56','2021-06-28 19:36:56',NULL,'6f0a658f-6a92-45f6-9233-a09f5a3e2780'),(3,'craft\\elements\\Asset','2021-06-28 19:49:22','2021-06-28 19:49:22',NULL,'61b9cee1-55ca-414f-b770-10bb39eedb6a'),(4,'craft\\elements\\Entry','2021-06-28 19:51:28','2021-06-28 19:51:28','2021-06-28 19:51:53','4357b72c-ea45-4b11-ac19-e65e6981308c'),(5,'craft\\elements\\MatrixBlock','2021-06-28 21:14:01','2021-06-28 21:14:01',NULL,'851107bf-8bb1-4128-afca-978e7d879427'),(6,'craft\\elements\\MatrixBlock','2021-06-29 14:47:21','2021-06-29 14:47:21',NULL,'afd7c9ae-6b20-443f-a1f6-c6fd326a7053'),(7,'craft\\elements\\MatrixBlock','2021-06-29 14:47:21','2021-06-29 14:47:21',NULL,'07d75d4d-e229-457b-870d-914abaa59bc6'),(8,'craft\\elements\\MatrixBlock','2021-06-29 14:47:21','2021-06-29 14:47:21',NULL,'ba2c1099-179f-4309-b345-f6f3776a2388'),(9,'craft\\elements\\Entry','2021-06-29 14:52:41','2021-06-29 14:52:41',NULL,'d73e14fe-045f-46c1-8bfb-df9f05627015');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouttabs` VALUES (4,1,'Content','[{\"type\":\"craft\\\\commerce\\\\fieldlayoutelements\\\\ProductTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2021-06-28 19:28:48','2021-06-28 19:28:48','fdef587f-4ac4-4bb1-8be3-4017f0c912f5'),(8,4,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2021-06-28 19:51:47','2021-06-28 19:51:47','ad33e186-c87a-43a7-ac3a-47c1e3870488'),(9,5,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"e5179a24-865e-4325-8f64-38c941595a2f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"9585679e-2fe1-4b57-b619-d1beeefdb9ad\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"e9ec26d4-6d05-4acf-90d3-9fa165204624\"}]',1,'2021-06-28 21:14:01','2021-06-28 21:14:01','7b622c07-73db-4240-9042-c241c90f5d4f'),(12,3,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2021-06-28 21:20:51','2021-06-28 21:20:51','ac641e94-11c7-416a-bcbd-7f26b65d2168'),(13,2,'Info','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2021-06-28 21:26:59','2021-06-28 21:26:59','e01fd9be-4c5e-46b1-a47c-ff5ba8438cbb'),(14,2,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4e579fce-80fb-40df-a0ab-5ade3e8ecb88\"}]',2,'2021-06-28 21:26:59','2021-06-28 21:26:59','7b15cf18-bd33-4f21-a956-bc7ef1ab975e'),(19,9,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"f0b26b60-9cd6-415f-928f-c63614f6e7b8\"}]',1,'2021-06-29 14:53:06','2021-06-29 14:53:06','7e856aae-dd08-4015-be2d-e4030c2aa447'),(20,6,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"7f794890-d66c-494d-84fc-e51a0683885c\"}]',1,'2021-06-29 15:04:33','2021-06-29 15:04:33','d9b040f3-16d5-4492-ba64-96f24f3c2053'),(21,7,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"709d71e0-6fd6-41c8-b407-527b866465d0\"}]',1,'2021-06-29 15:04:33','2021-06-29 15:04:33','bc220ca7-c043-45a5-bf9d-1ca9ae9aef22'),(22,8,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"a2aab963-b865-46cb-989b-eb68564777e1\"}]',1,'2021-06-29 15:04:33','2021-06-29 15:04:33','67c2926b-6a7a-48a5-ba2a-0c390cd1dc45');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,1,'Image with Text','imageWithText','global','',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_imagewithtext}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}','2021-06-28 21:14:00','2021-06-28 21:14:00','4e579fce-80fb-40df-a0ab-5ade3e8ecb88'),(2,NULL,'Text','text','matrixBlockType:3983b886-d522-4401-9459-daa1e6d61cdf','',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"normal\"}','2021-06-28 21:14:01','2021-06-28 21:14:01','9585679e-2fe1-4b57-b619-d1beeefdb9ad'),(3,NULL,'Image','image','matrixBlockType:3983b886-d522-4401-9459-daa1e6d61cdf','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:c9040c8c-87a7-43ef-9eaf-595dc38c1eed\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"1\",\"selectionLabel\":\"Add an image\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:c9040c8c-87a7-43ef-9eaf-595dc38c1eed\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"large\"}','2021-06-28 21:14:01','2021-06-28 21:14:01','e9ec26d4-6d05-4acf-90d3-9fa165204624'),(4,NULL,'Headline','headline','matrixBlockType:3983b886-d522-4401-9459-daa1e6d61cdf','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-06-28 21:14:01','2021-06-28 21:14:01','e5179a24-865e-4325-8f64-38c941595a2f'),(5,1,'Content Builder','contentBuilder','global','',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_contentbuilder}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}','2021-06-29 14:47:21','2021-06-29 14:47:21','f0b26b60-9cd6-415f-928f-c63614f6e7b8'),(6,NULL,'Text','text','matrixBlockType:692eb48c-e6ca-4a84-805e-1ef02e4d88f2','',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"normal\"}','2021-06-29 14:47:21','2021-06-29 14:47:21','7f794890-d66c-494d-84fc-e51a0683885c'),(7,NULL,'Article','article','matrixBlockType:7346608a-fffe-49fd-bbe6-efa57785bdf0','',0,'site',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"limit\":\"1\",\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2021-06-29 14:47:21','2021-06-29 15:04:33','709d71e0-6fd6-41c8-b407-527b866465d0'),(8,NULL,'Embed','embed','matrixBlockType:dfdd5d42-ea50-4a2a-ba15-b24a3f773356','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"1\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-06-29 14:47:21','2021-06-29 14:47:21','a2aab963-b865-46cb-989b-eb68564777e1');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqlschemas` VALUES (1,'Public Schema','[]',1,'2021-06-28 19:28:48','2021-06-28 19:28:48','7b77a83a-8dfb-4601-90b1-30c99c1c9505');
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqltokens` VALUES (1,'Public Token','__PUBLIC__',1,NULL,NULL,1,'2021-06-28 19:28:48','2021-06-28 19:28:48','b348e8f8-e7e2-4175-acb1-e28ce865145c');
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'3.6.17','3.6.8',0,'cqdimjkpqujf','amsgbyhhlaro','2021-06-28 19:28:37','2021-06-29 15:04:33','576857b5-5c2c-4502-9406-e44220133af2');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixblocks` VALUES (7,3,1,1,1,NULL,'2021-06-28 21:15:22','2021-06-28 21:15:22','260952a7-95a9-4607-96e4-9284e6e379b0'),(9,8,1,1,1,NULL,'2021-06-28 21:15:22','2021-06-28 21:15:22','95f88f28-5b15-4848-bec9-114c9bf76cb5'),(11,10,1,1,1,NULL,'2021-06-28 21:19:44','2021-06-28 21:19:44','be6adebc-f65e-424a-8b10-fcae2f378f19'),(13,3,1,1,2,NULL,'2021-06-28 21:24:46','2021-06-28 21:24:46','4b65cb94-7b13-41a2-884c-dae28a7fbff4'),(15,14,1,1,1,NULL,'2021-06-28 21:24:46','2021-06-28 21:24:46','d0097f98-9e02-4b92-92c7-f7854fe34955'),(16,14,1,1,2,NULL,'2021-06-28 21:24:46','2021-06-28 21:24:46','aabe3ca5-78e9-474c-88bc-450fb01a7acd'),(18,17,1,1,1,NULL,'2021-06-28 21:26:59','2021-06-28 21:26:59','28f32970-eae1-4428-8191-a0c05ee9b4a4'),(19,17,1,1,2,NULL,'2021-06-28 21:26:59','2021-06-28 21:26:59','f8a0325e-0fb2-4c80-a939-9d300b53ea96'),(23,20,5,2,1,NULL,'2021-06-29 14:54:13','2021-06-29 14:54:13','fa72da2f-aa7c-42ca-bf16-f3fd7a27960a'),(24,20,5,4,2,NULL,'2021-06-29 14:54:13','2021-06-29 14:54:13','4e696690-8dc9-49ac-affd-64878bf2c46d'),(25,20,5,3,3,NULL,'2021-06-29 14:54:13','2021-06-29 14:54:13','222d0816-2c4a-4099-b9cf-7fcddbd636df'),(27,26,5,2,1,NULL,'2021-06-29 14:54:13','2021-06-29 14:54:13','157a199f-1173-44d6-8f6c-183e5028f59f'),(28,26,5,4,2,NULL,'2021-06-29 14:54:13','2021-06-29 14:54:13','b070301b-ddfd-412c-83fa-7c5f012e45c8'),(29,26,5,3,3,NULL,'2021-06-29 14:54:13','2021-06-29 14:54:13','5a93fe40-454f-45c0-a473-4a9d056552e9'),(31,30,5,2,1,NULL,'2021-06-29 14:59:33','2021-06-29 14:59:33','3b1f9b73-78a2-4976-bed1-86e282aa471c'),(32,30,5,4,2,NULL,'2021-06-29 14:59:33','2021-06-29 14:59:33','244fd644-ef35-4409-b9af-64622550bde2'),(33,30,5,3,3,NULL,'2021-06-29 14:59:33','2021-06-29 14:59:33','be104156-64cc-4243-8036-b66f944ba3cb');
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixblocktypes` VALUES (1,1,5,'block','block',1,'2021-06-28 21:14:01','2021-06-28 21:14:01','3983b886-d522-4401-9459-daa1e6d61cdf'),(2,5,6,'Richtext','richtext',1,'2021-06-29 14:47:21','2021-06-29 14:47:21','692eb48c-e6ca-4a84-805e-1ef02e4d88f2'),(3,5,7,'Highlighted Article','highlightedArticle',2,'2021-06-29 14:47:21','2021-06-29 14:47:21','7346608a-fffe-49fd-bbe6-efa57785bdf0'),(4,5,8,'Video Embed','videoEmbed',3,'2021-06-29 14:47:21','2021-06-29 14:47:21','dfdd5d42-ea50-4a2a-ba15-b24a3f773356');
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixcontent_contentbuilder`
--

LOCK TABLES `matrixcontent_contentbuilder` WRITE;
/*!40000 ALTER TABLE `matrixcontent_contentbuilder` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixcontent_contentbuilder` VALUES (1,23,1,'2021-06-29 14:54:13','2021-06-29 14:54:13','4e1a5221-f648-4498-ae61-6dfd42d99d80','<p>This is an example richtext box.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut sem viverra aliquet eget sit amet tellus cras. At ultrices mi tempus imperdiet nulla malesuada. Eget nullam non nisi est sit amet facilisis.</p>',NULL),(2,24,1,'2021-06-29 14:54:13','2021-06-29 14:54:13','0568612a-3a8a-4ce6-8135-34190d1e30ea',NULL,'<div style=\"padding:56.25% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/362717333?title=0&byline=0&portrait=0\" style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>'),(3,25,1,'2021-06-29 14:54:13','2021-06-29 14:54:13','d908650e-6b6d-451b-93d4-1c9e0f52ed7b',NULL,NULL),(4,27,1,'2021-06-29 14:54:13','2021-06-29 14:54:13','c5d679b5-b956-47b6-910e-2d49061ff967','<p>This is an example richtext box.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut sem viverra aliquet eget sit amet tellus cras. At ultrices mi tempus imperdiet nulla malesuada. Eget nullam non nisi est sit amet facilisis.</p>',NULL),(5,28,1,'2021-06-29 14:54:13','2021-06-29 14:54:13','d37e2653-81fe-48e6-87f7-f7b414bb0073',NULL,'<div style=\"padding:56.25% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/362717333?title=0&byline=0&portrait=0\" style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>'),(6,29,1,'2021-06-29 14:54:13','2021-06-29 14:54:13','3022c8e7-5427-4064-bdb7-e0ba9505b1eb',NULL,NULL),(7,31,1,'2021-06-29 14:59:33','2021-06-29 14:59:33','b83a7ca7-bd30-488d-8450-01f158eb769d','<p>This is an example richtext box.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut sem viverra aliquet eget sit amet tellus cras. At ultrices mi tempus imperdiet nulla malesuada. Eget nullam non nisi est sit amet facilisis.</p>',NULL),(8,32,1,'2021-06-29 14:59:33','2021-06-29 14:59:33','6ae1b655-0918-4716-b9ee-befb574f466b',NULL,'<div style=\"padding:56.25% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/362717333?title=0&byline=0&portrait=0\" style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>'),(9,33,1,'2021-06-29 14:59:33','2021-06-29 14:59:33','33d1b4f4-dfe0-4fd3-97e2-7c656b99dc36',NULL,NULL);
/*!40000 ALTER TABLE `matrixcontent_contentbuilder` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixcontent_imagewithtext`
--

LOCK TABLES `matrixcontent_imagewithtext` WRITE;
/*!40000 ALTER TABLE `matrixcontent_imagewithtext` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixcontent_imagewithtext` VALUES (1,7,1,'2021-06-28 21:15:22','2021-06-28 21:24:46','6ac23289-e603-4d9b-a6fb-4be00c7df7c3','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.<br /></p>\n','First Block'),(2,9,1,'2021-06-28 21:15:22','2021-06-28 21:15:22','5b3244aa-6ff8-4bec-a6b9-67e928689c93','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.<br /></p>\n','First Block'),(3,11,1,'2021-06-28 21:19:44','2021-06-28 21:19:44','36376fa1-607b-46ef-8f36-1131795a2759','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.<br /></p>\n','First Block'),(4,13,1,'2021-06-28 21:24:46','2021-06-28 21:24:46','89c88020-9bd8-40fd-9805-ebafcf378cbb','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.</p>',NULL),(5,15,1,'2021-06-28 21:24:46','2021-06-28 21:24:46','cae52276-1649-4465-913c-4d71752d284a','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.<br /></p>\n','First Block'),(6,16,1,'2021-06-28 21:24:46','2021-06-28 21:24:46','b72ab45d-d83c-4485-96ff-f1cbca372419','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.</p>',NULL),(7,18,1,'2021-06-28 21:26:59','2021-06-28 21:26:59','b1e22b3e-9a02-4fe6-984c-dabb009fd7e1','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.<br /></p>\n','First Block'),(8,19,1,'2021-06-28 21:26:59','2021-06-28 21:26:59','7131e412-f093-454f-890f-eaed4c886b85','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.</p>',NULL);
/*!40000 ALTER TABLE `matrixcontent_imagewithtext` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (156,'plugin:redactor','m180430_204710_remove_old_plugins','2021-06-28 19:28:47','2021-06-28 19:28:47','2021-06-28 19:28:47','5a5b09be-3ed0-4715-abfb-291010cfa61f'),(157,'plugin:redactor','Install','2021-06-28 19:28:47','2021-06-28 19:28:47','2021-06-28 19:28:47','b3de342b-9922-4fce-ab2f-19f2c4ba8d2f'),(158,'plugin:redactor','m190225_003922_split_cleanup_html_settings','2021-06-28 19:28:47','2021-06-28 19:28:47','2021-06-28 19:28:47','bd5cce38-bf30-4fb7-9704-7ae202dab634'),(183,'craft','Install','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','66cdaec0-6869-4da9-806b-eea137b6bc80'),(184,'craft','m150403_183908_migrations_table_changes','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','41359588-1de3-46fd-bbb2-e6216526551a'),(185,'craft','m150403_184247_plugins_table_changes','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','40e39e63-2715-4e17-a05b-dcfbb7151bf7'),(186,'craft','m150403_184533_field_version','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','794969e4-2f5e-4dd9-8c96-607fa5e5024b'),(187,'craft','m150403_184729_type_columns','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','c3b067de-da32-47e7-97c0-26b2920764ef'),(188,'craft','m150403_185142_volumes','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','c318e864-bb79-43d6-aebe-b4a2fe8ce39c'),(189,'craft','m150428_231346_userpreferences','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','41917665-5662-4937-a543-25a752470ba6'),(190,'craft','m150519_150900_fieldversion_conversion','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','4a76bfce-d0ad-4db9-8c98-920c38fdf340'),(191,'craft','m150617_213829_update_email_settings','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','98e5b765-2e7e-4aba-936e-56c682239711'),(192,'craft','m150721_124739_templatecachequeries','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','1bc0c950-b062-476c-be5b-a488d2c3a795'),(193,'craft','m150724_140822_adjust_quality_settings','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','d548d00a-9feb-4bab-be3c-2ecf0d53a84b'),(194,'craft','m150815_133521_last_login_attempt_ip','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','abfddac3-3d55-4090-9f7b-a79e5afd1f05'),(195,'craft','m151002_095935_volume_cache_settings','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','68abb281-8fca-4032-b3f5-135be497f3db'),(196,'craft','m151005_142750_volume_s3_storage_settings','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','73e16477-5242-4714-9c3c-a9613860672a'),(197,'craft','m151016_133600_delete_asset_thumbnails','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','11400b9a-dea4-44a4-9dc4-8549820179d1'),(198,'craft','m151209_000000_move_logo','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','c80cc2d6-336e-4d73-a42f-d38a78a41756'),(199,'craft','m151211_000000_rename_fileId_to_assetId','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','c6693ba7-17b3-4576-b4cd-a8067d6de07c'),(200,'craft','m151215_000000_rename_asset_permissions','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','9f892295-cd4c-4736-afef-38f9c9eb26e5'),(201,'craft','m160707_000001_rename_richtext_assetsource_setting','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','2f55294f-1a1e-4b22-af9a-112fe56ef6d2'),(202,'craft','m160708_185142_volume_hasUrls_setting','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','cb4759d4-779c-4dc8-9758-65d0eda9b204'),(203,'craft','m160714_000000_increase_max_asset_filesize','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','bf089a6f-2028-4911-ac02-6f5c9816537d'),(204,'craft','m160727_194637_column_cleanup','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','6cba0a61-e5e8-40c4-8a2c-106a1b09cf9a'),(205,'craft','m160804_110002_userphotos_to_assets','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','a2831e0a-3561-4cc4-85f1-145eb9b945db'),(206,'craft','m160807_144858_sites','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','30c75118-84ba-4afd-877c-6b0600dab9f2'),(207,'craft','m160829_000000_pending_user_content_cleanup','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','0cebdc89-0ca9-41f5-9e7a-c553b829b46a'),(208,'craft','m160830_000000_asset_index_uri_increase','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','2444eb4d-3c2b-4173-8dd9-bb5f09c1422d'),(209,'craft','m160912_230520_require_entry_type_id','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','f8645ed3-37c6-43b6-a789-2a5420c6ad9e'),(210,'craft','m160913_134730_require_matrix_block_type_id','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','e542f2e0-0996-4fec-8c2b-378be5c1ff30'),(211,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','4773ff6b-cb86-4f63-bcfd-3faa8f829eef'),(212,'craft','m160920_231045_usergroup_handle_title_unique','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','ec61e9f1-251a-43a0-a311-ac72942d3a49'),(213,'craft','m160925_113941_route_uri_parts','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','12db5b54-3dbe-4c3e-9f76-fd6f23e49943'),(214,'craft','m161006_205918_schemaVersion_not_null','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','e9b88836-a970-42c8-9806-fda142e45013'),(215,'craft','m161007_130653_update_email_settings','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','0bb8e1be-fafd-48eb-b87a-a306dd0aa29a'),(216,'craft','m161013_175052_newParentId','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','77194773-53d8-4c11-9450-05e3eb6f48b7'),(217,'craft','m161021_102916_fix_recent_entries_widgets','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','b7624f28-6d8f-4124-b0df-d319ce67ba29'),(218,'craft','m161021_182140_rename_get_help_widget','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','02a0d7b9-3092-4903-88e7-541e16358439'),(219,'craft','m161025_000000_fix_char_columns','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','efacd00a-d926-49b2-b101-ec8026e0ab5b'),(220,'craft','m161029_124145_email_message_languages','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','42ae93f6-ca0a-43f8-a2ca-5848f667a5f2'),(221,'craft','m161108_000000_new_version_format','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','a358040a-03af-44c0-92fc-e090a2e7f1eb'),(222,'craft','m161109_000000_index_shuffle','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','711cd344-fd5c-4bc5-b7f2-96bbb5294f62'),(223,'craft','m161122_185500_no_craft_app','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','add6f618-55b1-4ec5-8084-603aefbdec0b'),(224,'craft','m161125_150752_clear_urlmanager_cache','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','4fe0cf6f-c1a1-4f26-80da-2b52105320ab'),(225,'craft','m161220_000000_volumes_hasurl_notnull','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','aaad39e1-1ef9-410b-9e4d-22c810166f55'),(226,'craft','m170114_161144_udates_permission','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','c4b8c87b-45cc-45c3-ade2-b89cfa566b00'),(227,'craft','m170120_000000_schema_cleanup','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','40e9923d-8f2c-4f70-bd3f-67b47182af46'),(228,'craft','m170126_000000_assets_focal_point','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','65035147-1f87-4647-9a94-076306c0d291'),(229,'craft','m170206_142126_system_name','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','074e5a16-de45-4e98-85eb-76972cc0be6f'),(230,'craft','m170217_044740_category_branch_limits','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','376860ee-e72f-4032-94f0-4ee598a9df66'),(231,'craft','m170217_120224_asset_indexing_columns','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','d211115f-1345-4c03-8fe6-10ff4f50a76b'),(232,'craft','m170223_224012_plain_text_settings','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','d9591730-388d-4b31-bd6b-8b6cce81b624'),(233,'craft','m170227_120814_focal_point_percentage','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','8502a4a5-5403-4371-b3a0-205e0af67a58'),(234,'craft','m170228_171113_system_messages','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','aead0e8e-5b16-473c-9a73-67861b03c7b1'),(235,'craft','m170303_140500_asset_field_source_settings','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','1ce4408b-8e35-4793-a354-5840a3e75fa4'),(236,'craft','m170306_150500_asset_temporary_uploads','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','7b79a1bb-d624-4ff1-bdfb-a8d4d3f061d6'),(237,'craft','m170523_190652_element_field_layout_ids','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','f38250fa-1b09-4452-b13b-dc99c6c75ce7'),(238,'craft','m170621_195237_format_plugin_handles','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','1d2b732c-ffee-46db-a1ac-dab4ff418052'),(239,'craft','m170630_161027_deprecation_line_nullable','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','289b24d5-4f5c-4761-92a0-0b585abf7f67'),(240,'craft','m170630_161028_deprecation_changes','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','b41d3945-77fd-4c42-8836-43b990eb3960'),(241,'craft','m170703_181539_plugins_table_tweaks','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','459e8026-52a5-4f6a-ab39-385ff1b40114'),(242,'craft','m170704_134916_sites_tables','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','f4931a6f-4f8d-4323-ba01-a09762c935bc'),(243,'craft','m170706_183216_rename_sequences','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','b21a40bc-1f4b-445e-abb3-c0edf66b3d3b'),(244,'craft','m170707_094758_delete_compiled_traits','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','1d6f8e7e-3a28-4da6-bdaa-110ee7b5bee4'),(245,'craft','m170731_190138_drop_asset_packagist','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','7f09ecd9-cc51-42ef-b4de-9d9a446fe230'),(246,'craft','m170810_201318_create_queue_table','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','3b3a5a76-cc57-4bc1-9b4e-9248fe1db2ee'),(247,'craft','m170903_192801_longblob_for_queue_jobs','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','f447944f-5450-4056-be8f-3d007528caed'),(248,'craft','m170914_204621_asset_cache_shuffle','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','1c665868-b8d3-49ab-a38e-6f3d9265e649'),(249,'craft','m171011_214115_site_groups','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','ca551406-7817-43be-a95f-9eaec24507ca'),(250,'craft','m171012_151440_primary_site','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','b1dd3b40-b0f5-44ac-992f-81da5e47e24f'),(251,'craft','m171013_142500_transform_interlace','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','b4bcba01-c19c-4726-95a6-e481aa99ef26'),(252,'craft','m171016_092553_drop_position_select','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','eba87c19-7556-4ac9-976f-3ca2d54661c5'),(253,'craft','m171016_221244_less_strict_translation_method','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','29ece444-2746-4f61-a24e-4e7f9c942caf'),(254,'craft','m171107_000000_assign_group_permissions','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','1fdcdf75-9786-4414-9341-07323fb5c95f'),(255,'craft','m171117_000001_templatecache_index_tune','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','fd0a5d7a-0b54-4876-b36f-1dc0414d9982'),(256,'craft','m171126_105927_disabled_plugins','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','6a98fdc8-bdb0-4e23-8fa2-d24982b259cc'),(257,'craft','m171130_214407_craftidtokens_table','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','07d6530a-2e91-4cc2-ac31-58ec710345ec'),(258,'craft','m171202_004225_update_email_settings','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','9d553d0c-376a-4087-b92f-a3516dddfe3d'),(259,'craft','m171204_000001_templatecache_index_tune_deux','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','c71888f3-2fee-45f5-b4e0-64af2d2978cf'),(260,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','ef3b8de8-d633-4ad0-a2eb-da43aebf196d'),(261,'craft','m171218_143135_longtext_query_column','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','91734973-57b0-4c7f-bdf5-1e9a90058d45'),(262,'craft','m171231_055546_environment_variables_to_aliases','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','8706d0bc-6fcb-4b2c-accb-bd7d66de173a'),(263,'craft','m180113_153740_drop_users_archived_column','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','5227afdd-45a3-4dc7-b091-7556fd136aba'),(264,'craft','m180122_213433_propagate_entries_setting','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','1bb865a6-d17f-44e1-83d2-515b2dd274f4'),(265,'craft','m180124_230459_fix_propagate_entries_values','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','5838351f-88ec-4b95-9d19-b7b2d9ced571'),(266,'craft','m180128_235202_set_tag_slugs','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','4fffcac2-f2b0-4794-8d28-304a78367e57'),(267,'craft','m180202_185551_fix_focal_points','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','31c661d2-6ea9-4515-ac06-6648cb9c8927'),(268,'craft','m180217_172123_tiny_ints','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','2abe4434-6979-4923-becb-ebe44904c0e2'),(269,'craft','m180321_233505_small_ints','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','b432819f-d497-4162-84d0-e042b17fc813'),(270,'craft','m180404_182320_edition_changes','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','d94d2d79-b2ad-4565-9849-197fcb090563'),(271,'craft','m180411_102218_fix_db_routes','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','9d9aae53-ab5c-4605-b6ce-a156f6717839'),(272,'craft','m180416_205628_resourcepaths_table','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','4f1e4ce5-86f8-4144-8324-46799138658d'),(273,'craft','m180418_205713_widget_cleanup','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','e9788486-fe34-4c30-87a3-9b2409136cfc'),(274,'craft','m180425_203349_searchable_fields','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','a8751236-fa5f-486b-b01f-23f63cd03535'),(275,'craft','m180516_153000_uids_in_field_settings','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','171cb723-c02f-4201-addf-91930f049c78'),(276,'craft','m180517_173000_user_photo_volume_to_uid','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','4da1c643-691b-4473-bcf3-b6b4fa1ad457'),(277,'craft','m180518_173000_permissions_to_uid','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','7262916b-d9d1-44f2-896a-80a42ed5f833'),(278,'craft','m180520_173000_matrix_context_to_uids','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','f3da65fa-8d5c-4cb3-b1c1-4fa7a7f7602c'),(279,'craft','m180521_172900_project_config_table','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','958064f3-00d7-4a48-9a20-9a7a69c35203'),(280,'craft','m180521_173000_initial_yml_and_snapshot','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','f4279573-f5bd-40f0-9be1-d82539341545'),(281,'craft','m180731_162030_soft_delete_sites','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','3fe8bfa2-9388-4010-9b1c-0a8ead40b29b'),(282,'craft','m180810_214427_soft_delete_field_layouts','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','23d11192-ca41-443a-b738-941218574080'),(283,'craft','m180810_214439_soft_delete_elements','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','c00dbd5a-d11f-4041-8522-1e728ac5ef59'),(284,'craft','m180824_193422_case_sensitivity_fixes','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','25333820-d87b-45d6-93b4-57461bc2e9c7'),(285,'craft','m180901_151639_fix_matrixcontent_tables','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','047b98ce-d51c-4e68-9e18-6c94b9b24600'),(286,'craft','m180904_112109_permission_changes','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','bf7024ee-4134-4939-826c-4c86c06633de'),(287,'craft','m180910_142030_soft_delete_sitegroups','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','f48a9b9d-23ee-4b93-ba74-0e9e532fce92'),(288,'craft','m181011_160000_soft_delete_asset_support','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','3500f762-7a9a-407c-9670-bdf4a92726ab'),(289,'craft','m181016_183648_set_default_user_settings','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','3b2b664b-c88c-45ef-b723-8b8a2ec84d6d'),(290,'craft','m181017_225222_system_config_settings','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','2328207c-bf62-4d7f-96fb-30cfba1f2663'),(291,'craft','m181018_222343_drop_userpermissions_from_config','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','9c505932-b1eb-4b95-b213-9a3f3cbbe8d7'),(292,'craft','m181029_130000_add_transforms_routes_to_config','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','b4f0e5b3-478b-4f20-b4f9-3e92dc099c6e'),(293,'craft','m181112_203955_sequences_table','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','ad109bee-1e48-4560-941a-d0855ed02032'),(294,'craft','m181121_001712_cleanup_field_configs','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','152e29d3-d776-4eab-a20d-320da72c115e'),(295,'craft','m181128_193942_fix_project_config','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','f3c0d3d4-29cd-4639-a43f-3e36c0fa9de7'),(296,'craft','m181130_143040_fix_schema_version','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','caee7735-5a1a-486b-951a-fd0f6334d3c4'),(297,'craft','m181211_143040_fix_entry_type_uids','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','89731af5-da0f-4fa5-a92c-9bc8cab7e86c'),(298,'craft','m181217_153000_fix_structure_uids','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','2e20a7d7-918e-45d6-86fd-1c8797393b89'),(299,'craft','m190104_152725_store_licensed_plugin_editions','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','30929f76-444e-4fd0-9de7-e4ba819432c6'),(300,'craft','m190108_110000_cleanup_project_config','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','60be0373-f651-4742-885a-0b417b8f0ba2'),(301,'craft','m190108_113000_asset_field_setting_change','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','13f95210-bc4e-412b-bd66-42c02a12f70b'),(302,'craft','m190109_172845_fix_colspan','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','785d78ff-d847-47ac-98bd-7d54b2d2f8e0'),(303,'craft','m190110_150000_prune_nonexisting_sites','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','ba68ad87-79ef-496b-978b-a617921ce300'),(304,'craft','m190110_214819_soft_delete_volumes','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','f21848e3-9b0f-437a-831d-4f6f0f5fac1d'),(305,'craft','m190112_124737_fix_user_settings','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','efb17bad-8f3c-470c-b086-37639e648da5'),(306,'craft','m190112_131225_fix_field_layouts','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','f65335bc-ecab-4190-8b9e-a5ae3f17e0a2'),(307,'craft','m190112_201010_more_soft_deletes','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','8a790bdd-e2a2-45ea-b6b3-0a3ec3b7d693'),(308,'craft','m190114_143000_more_asset_field_setting_changes','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','d02e8f86-0c3d-434c-a024-1528042727fd'),(309,'craft','m190121_120000_rich_text_config_setting','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','c7e28410-529d-4292-83ec-7d6c149212b9'),(310,'craft','m190125_191628_fix_email_transport_password','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','248ee574-b630-480b-a363-642284c67662'),(311,'craft','m190128_181422_cleanup_volume_folders','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','75677427-ca99-4a18-bcab-d4a08a0a9fbf'),(312,'craft','m190205_140000_fix_asset_soft_delete_index','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','6921457b-f47d-4e51-921e-8771bb06b447'),(313,'craft','m190218_143000_element_index_settings_uid','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','8d77c874-0c6b-434b-b5c5-416b2186a6a4'),(314,'craft','m190312_152740_element_revisions','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','803a26d0-e3cb-4176-a650-fe3709592e6c'),(315,'craft','m190327_235137_propagation_method','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','2451d522-4883-49a3-8aee-f6e5a723a286'),(316,'craft','m190401_223843_drop_old_indexes','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','a6d349a6-eb11-415a-b9ef-f90dd4e8d6b5'),(317,'craft','m190416_014525_drop_unique_global_indexes','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','78f31420-c973-4671-88c2-7adae3df6f8a'),(318,'craft','m190417_085010_add_image_editor_permissions','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','fe614ea7-5c55-46a8-8cc2-461af9f6540e'),(319,'craft','m190502_122019_store_default_user_group_uid','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','b7bd8a0b-202c-4493-90bf-9f4d2f35f98b'),(320,'craft','m190504_150349_preview_targets','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','09dbdb5a-b8b0-4664-b5bb-13c6beecf071'),(321,'craft','m190516_184711_job_progress_label','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','fc54fa70-719a-4598-8ed8-133625715c6a'),(322,'craft','m190523_190303_optional_revision_creators','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','3727ac44-24d1-4d59-b2b7-abe3e82705f5'),(323,'craft','m190529_204501_fix_duplicate_uids','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','c14aeea8-4e29-4db3-a2fb-1de21d615d23'),(324,'craft','m190605_223807_unsaved_drafts','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','09b8dffa-3ed0-48dc-a36a-abdbfa21dd0d'),(325,'craft','m190607_230042_entry_revision_error_tables','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','a5fd6e2d-81b6-456d-bbab-f741e18ec6ab'),(326,'craft','m190608_033429_drop_elements_uid_idx','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','02331953-745a-4276-92d8-aa9cf388cc2e'),(327,'craft','m190617_164400_add_gqlschemas_table','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','e79ae9bc-1239-4e65-ae64-3520bcd8fe1b'),(328,'craft','m190624_234204_matrix_propagation_method','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','935cadb3-7c90-4b17-9546-f10a80b8af4d'),(329,'craft','m190711_153020_drop_snapshots','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','1cc05d55-8492-42e5-8afc-99200cc3b7ad'),(330,'craft','m190712_195914_no_draft_revisions','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','6201aa95-ee56-48da-8a4e-6ea3905e6b64'),(331,'craft','m190723_140314_fix_preview_targets_column','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','f0ec2d52-b919-4e6c-8006-2d4afb97a7de'),(332,'craft','m190820_003519_flush_compiled_templates','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','2acabdab-d115-457b-9b10-2ad4885a420f'),(333,'craft','m190823_020339_optional_draft_creators','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','4ca50060-389a-446d-b88b-a829b66ea792'),(334,'craft','m190913_152146_update_preview_targets','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','ec09f9a1-99b9-498a-88a5-9340c88a696a'),(335,'craft','m191107_122000_add_gql_project_config_support','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','75f1b443-bb3b-4131-8b27-54a92b292e8e'),(336,'craft','m191204_085100_pack_savable_component_settings','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','a2b42098-6602-42a1-bcbb-bb193cf594d8'),(337,'craft','m191206_001148_change_tracking','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','ecea0be0-148c-4702-bf2b-377ce98c9aa0'),(338,'craft','m191216_191635_asset_upload_tracking','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','102b4ad7-5a6f-4985-8a20-7e400537ff53'),(339,'craft','m191222_002848_peer_asset_permissions','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','6c9d1441-1ab5-4087-b63e-21a9f4c74b2a'),(340,'craft','m200127_172522_queue_channels','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','1cea7e00-c057-468f-b5cc-69cc44b6e7dc'),(341,'craft','m200211_175048_truncate_element_query_cache','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','69bc34da-42aa-4df9-a76c-4c424d70cfff'),(342,'craft','m200213_172522_new_elements_index','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','5a51bf0f-01e6-4d43-952e-14594d3ae8fa'),(343,'craft','m200228_195211_long_deprecation_messages','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','0e3f9f23-1bbd-4ba1-9533-fc44f37a248f'),(344,'craft','m200306_054652_disabled_sites','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','afb30f58-dacf-4e2a-853e-6e004ea57e37'),(345,'craft','m200522_191453_clear_template_caches','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','09f43327-3efa-4128-93e3-6866e299d1a7'),(346,'craft','m200606_231117_migration_tracks','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','399f0c3e-37f7-4ba9-8669-e3242b61b2f5'),(347,'craft','m200619_215137_title_translation_method','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','b7470264-f96b-43dd-afa9-54a0464253e9'),(348,'craft','m200620_005028_user_group_descriptions','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','798e80b1-9922-43b9-9d2b-603cbc8644bb'),(349,'craft','m200620_230205_field_layout_changes','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','c5efc1c5-63bc-4f82-a69f-524f0050ed6b'),(350,'craft','m200625_131100_move_entrytypes_to_top_project_config','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','ef2f3c09-c9fb-4416-b4e1-b889fa11f28c'),(351,'craft','m200629_112700_remove_project_config_legacy_files','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','ecce3c3a-e241-41bf-9f1c-a026ff695653'),(352,'craft','m200630_183000_drop_configmap','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','f04da42f-4572-4919-9363-0af0c1f27b97'),(353,'craft','m200715_113400_transform_index_error_flag','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','352ab7c3-3111-4ad6-8c57-2e8a4c545407'),(354,'craft','m200716_110900_replace_file_asset_permissions','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','69ad84d2-acee-4b39-a689-639484cc5222'),(355,'craft','m200716_153800_public_token_settings_in_project_config','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','b305d532-0f61-4ddd-b2e6-1c87105e1195'),(356,'craft','m200720_175543_drop_unique_constraints','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','fe4ae63f-2997-41de-8fed-ab2607c4acbb'),(357,'craft','m200825_051217_project_config_version','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','a51258d0-2965-407e-a4e5-c4737bb8df3f'),(358,'craft','m201116_190500_asset_title_translation_method','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','a4086d7e-e97d-4691-b15f-a81a4c70498a'),(359,'craft','m201124_003555_plugin_trials','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','0ad8cece-a7da-49ff-8003-38c752278d5d'),(360,'craft','m210209_135503_soft_delete_field_groups','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','3d3ddb57-6e6e-4f05-a5cd-39309bba2ba9'),(361,'craft','m210212_223539_delete_invalid_drafts','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','ea229880-4600-44cb-aed9-b8f975feffe3'),(362,'craft','m210214_202731_track_saved_drafts','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','9f6c0fa7-c610-4363-bc29-9c8c770d2f41'),(363,'craft','m210223_150900_add_new_element_gql_schema_components','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','6f7f62e4-d698-48ac-bca6-33f1edb1117d'),(364,'craft','m210224_162000_add_projectconfignames_table','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','ab92ea90-3e3c-4936-9b6c-3041028efc43'),(365,'craft','m210326_132000_invalidate_projectconfig_cache','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','b037e7b2-cc66-43c2-9b1a-3511082c0c75'),(366,'craft','m210331_220322_null_author','2021-06-28 19:28:48','2021-06-28 19:28:48','2021-06-28 19:28:48','768fd457-55c2-4c22-b16a-499474bbe9f9');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (5,'logs','3.0.3','3.0.0','unknown',NULL,'2021-06-28 19:28:46','2021-06-28 19:28:46','2021-06-28 19:35:23','1c5de291-719e-4032-a60f-067b054be430'),(6,'mix','1.5.2','1.0.0','unknown',NULL,'2021-06-28 19:28:46','2021-06-28 19:28:46','2021-06-28 19:35:23','c199ffa9-17bb-4c21-9ebb-f4f77c12887f'),(9,'redactor','2.8.7','2.3.0','unknown',NULL,'2021-06-28 19:28:47','2021-06-28 19:28:47','2021-06-28 19:35:23','6d02765d-5e3f-4ad5-bf76-5dd3a1a939d1');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('dateModified','1624979073'),('email.fromEmail','\"alex@dodgyco.de\"'),('email.fromName','\"Craft Code Test\"'),('email.replyToEmail','null'),('email.template','\"\"'),('email.transportSettings.command','\"\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.autocapitalize','true'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.autocomplete','false'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.autocorrect','true'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.class','null'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.disabled','false'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.id','null'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.instructions','null'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.label','null'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.max','null'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.min','null'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.name','null'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.orientation','null'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.placeholder','null'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.readonly','false'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.requirable','false'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.size','null'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.step','null'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.tip','null'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.title','null'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.warning','null'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.width','100'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.1.fieldUid','\"f0b26b60-9cd6-415f-928f-c63614f6e7b8\"'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.1.instructions','null'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.1.label','null'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.1.required','false'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.1.tip','null'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.1.warning','null'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.1.width','100'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.name','\"Content\"'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.sortOrder','1'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.handle','\"example\"'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.hasTitleField','false'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.name','\"Example\"'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.section','\"7121f7fe-e16c-4776-bf07-811a25cd8b1e\"'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.sortOrder','1'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.titleFormat','\"{section.name|raw}\"'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.titleTranslationKeyFormat','null'),('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.titleTranslationMethod','\"site\"'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.autocapitalize','true'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.autocomplete','false'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.autocorrect','true'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.class','null'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.disabled','false'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.id','null'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.instructions','null'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.label','null'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.max','null'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.min','null'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.name','null'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.orientation','null'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.placeholder','null'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.readonly','false'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.requirable','false'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.size','null'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.step','null'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.tip','null'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.title','null'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.warning','null'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.width','100'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.name','\"Info\"'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.sortOrder','1'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.1.elements.0.fieldUid','\"4e579fce-80fb-40df-a0ab-5ade3e8ecb88\"'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.1.elements.0.instructions','null'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.1.elements.0.label','null'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.1.elements.0.required','false'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.1.elements.0.tip','null'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.1.elements.0.warning','null'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.1.elements.0.width','100'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.1.name','\"Content\"'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.1.sortOrder','2'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.handle','\"homepage\"'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.hasTitleField','true'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.name','\"Homepage\"'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.section','\"a887e226-ad5b-4ffc-b54e-6bd80d70fd34\"'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.sortOrder','1'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.titleFormat','\"{section.name|raw}\"'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.titleTranslationKeyFormat','null'),('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.titleTranslationMethod','\"site\"'),('fieldGroups.acc7548f-3022-405c-b653-2c8760879e60.name','\"Common\"'),('fields.4e579fce-80fb-40df-a0ab-5ade3e8ecb88.contentColumnType','\"string\"'),('fields.4e579fce-80fb-40df-a0ab-5ade3e8ecb88.fieldGroup','\"acc7548f-3022-405c-b653-2c8760879e60\"'),('fields.4e579fce-80fb-40df-a0ab-5ade3e8ecb88.handle','\"imageWithText\"'),('fields.4e579fce-80fb-40df-a0ab-5ade3e8ecb88.instructions','\"\"'),('fields.4e579fce-80fb-40df-a0ab-5ade3e8ecb88.name','\"Image with Text\"'),('fields.4e579fce-80fb-40df-a0ab-5ade3e8ecb88.searchable','false'),('fields.4e579fce-80fb-40df-a0ab-5ade3e8ecb88.settings.contentTable','\"{{%matrixcontent_imagewithtext}}\"'),('fields.4e579fce-80fb-40df-a0ab-5ade3e8ecb88.settings.maxBlocks','\"\"'),('fields.4e579fce-80fb-40df-a0ab-5ade3e8ecb88.settings.minBlocks','\"\"'),('fields.4e579fce-80fb-40df-a0ab-5ade3e8ecb88.settings.propagationMethod','\"all\"'),('fields.4e579fce-80fb-40df-a0ab-5ade3e8ecb88.translationKeyFormat','null'),('fields.4e579fce-80fb-40df-a0ab-5ade3e8ecb88.translationMethod','\"site\"'),('fields.4e579fce-80fb-40df-a0ab-5ade3e8ecb88.type','\"craft\\\\fields\\\\Matrix\"'),('fields.f0b26b60-9cd6-415f-928f-c63614f6e7b8.contentColumnType','\"string\"'),('fields.f0b26b60-9cd6-415f-928f-c63614f6e7b8.fieldGroup','\"acc7548f-3022-405c-b653-2c8760879e60\"'),('fields.f0b26b60-9cd6-415f-928f-c63614f6e7b8.handle','\"contentBuilder\"'),('fields.f0b26b60-9cd6-415f-928f-c63614f6e7b8.instructions','\"\"'),('fields.f0b26b60-9cd6-415f-928f-c63614f6e7b8.name','\"Content Builder\"'),('fields.f0b26b60-9cd6-415f-928f-c63614f6e7b8.searchable','false'),('fields.f0b26b60-9cd6-415f-928f-c63614f6e7b8.settings.contentTable','\"{{%matrixcontent_contentbuilder}}\"'),('fields.f0b26b60-9cd6-415f-928f-c63614f6e7b8.settings.maxBlocks','\"\"'),('fields.f0b26b60-9cd6-415f-928f-c63614f6e7b8.settings.minBlocks','\"\"'),('fields.f0b26b60-9cd6-415f-928f-c63614f6e7b8.settings.propagationMethod','\"all\"'),('fields.f0b26b60-9cd6-415f-928f-c63614f6e7b8.translationKeyFormat','null'),('fields.f0b26b60-9cd6-415f-928f-c63614f6e7b8.translationMethod','\"site\"'),('fields.f0b26b60-9cd6-415f-928f-c63614f6e7b8.type','\"craft\\\\fields\\\\Matrix\"'),('graphql.publicToken.enabled','true'),('graphql.publicToken.expiryDate','null'),('graphql.schemas.7b77a83a-8dfb-4601-90b1-30c99c1c9505.isPublic','true'),('graphql.schemas.7b77a83a-8dfb-4601-90b1-30c99c1c9505.name','\"Public Schema\"'),('imageTransforms.8212eef9-36c8-47b5-ab4e-9892531926ac.format','null'),('imageTransforms.8212eef9-36c8-47b5-ab4e-9892531926ac.handle','\"profilePhoto\"'),('imageTransforms.8212eef9-36c8-47b5-ab4e-9892531926ac.height','250'),('imageTransforms.8212eef9-36c8-47b5-ab4e-9892531926ac.interlace','\"none\"'),('imageTransforms.8212eef9-36c8-47b5-ab4e-9892531926ac.mode','\"crop\"'),('imageTransforms.8212eef9-36c8-47b5-ab4e-9892531926ac.name','\"Profile Photo\"'),('imageTransforms.8212eef9-36c8-47b5-ab4e-9892531926ac.position','\"center-center\"'),('imageTransforms.8212eef9-36c8-47b5-ab4e-9892531926ac.quality','30'),('imageTransforms.8212eef9-36c8-47b5-ab4e-9892531926ac.width','250'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.field','\"4e579fce-80fb-40df-a0ab-5ade3e8ecb88\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.0.fieldUid','\"e5179a24-865e-4325-8f64-38c941595a2f\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.0.label','null'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.0.required','false'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.0.tip','null'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.0.warning','null'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.0.width','100'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.1.fieldUid','\"9585679e-2fe1-4b57-b619-d1beeefdb9ad\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.1.label','null'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.1.required','true'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.1.tip','null'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.1.warning','null'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.1.width','100'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.2.fieldUid','\"e9ec26d4-6d05-4acf-90d3-9fa165204624\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.2.instructions','null'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.2.label','null'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.2.required','false'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.2.tip','null'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.2.warning','null'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.2.width','100'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.name','\"Content\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.sortOrder','1'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.contentColumnType','\"text\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.fieldGroup','null'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.handle','\"text\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.instructions','\"\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.name','\"Text\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.searchable','false'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.availableTransforms','\"*\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.availableVolumes','\"*\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.cleanupHtml','true'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.columnType','\"text\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.configSelectionMode','\"choose\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.defaultTransform','\"\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.manualConfig','\"\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.purifierConfig','\"\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.purifyHtml','\"1\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.redactorConfig','\"\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.removeEmptyTags','\"1\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.removeInlineStyles','\"1\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.removeNbsp','\"1\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.showHtmlButtonForNonAdmins','\"\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.showUnpermittedFiles','false'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.uiMode','\"normal\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.translationKeyFormat','null'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.translationMethod','\"none\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.type','\"craft\\\\redactor\\\\Field\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.contentColumnType','\"text\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.fieldGroup','null'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.handle','\"headline\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.instructions','\"\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.name','\"Headline\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.searchable','false'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.settings.byteLimit','null'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.settings.charLimit','null'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.settings.code','\"\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.settings.columnType','null'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.settings.initialRows','\"4\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.settings.multiline','\"\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.settings.placeholder','null'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.settings.uiMode','\"normal\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.translationKeyFormat','null'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.translationMethod','\"none\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.contentColumnType','\"string\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.fieldGroup','null'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.handle','\"image\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.instructions','\"\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.name','\"Image\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.searchable','false'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.allowedKinds.0','\"image\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.allowSelfRelations','false'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.allowUploads','true'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.defaultUploadLocationSource','\"volume:c9040c8c-87a7-43ef-9eaf-595dc38c1eed\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.defaultUploadLocationSubpath','\"\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.limit','\"1\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.localizeRelations','false'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.previewMode','\"full\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.restrictFiles','\"1\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.selectionLabel','\"Add an image\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.showSiteMenu','false'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.showUnpermittedFiles','false'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.singleUploadLocationSource','\"volume:c9040c8c-87a7-43ef-9eaf-595dc38c1eed\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.singleUploadLocationSubpath','\"\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.source','null'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.sources','\"*\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.targetSiteId','null'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.useSingleFolder','false'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.validateRelatedElements','false'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.viewMode','\"large\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.translationKeyFormat','null'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.translationMethod','\"site\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.type','\"craft\\\\fields\\\\Assets\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.handle','\"block\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.name','\"block\"'),('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.sortOrder','1'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.field','\"f0b26b60-9cd6-415f-928f-c63614f6e7b8\"'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fieldLayouts.afd7c9ae-6b20-443f-a1f6-c6fd326a7053.tabs.0.elements.0.fieldUid','\"7f794890-d66c-494d-84fc-e51a0683885c\"'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fieldLayouts.afd7c9ae-6b20-443f-a1f6-c6fd326a7053.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fieldLayouts.afd7c9ae-6b20-443f-a1f6-c6fd326a7053.tabs.0.elements.0.label','null'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fieldLayouts.afd7c9ae-6b20-443f-a1f6-c6fd326a7053.tabs.0.elements.0.required','true'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fieldLayouts.afd7c9ae-6b20-443f-a1f6-c6fd326a7053.tabs.0.elements.0.tip','null'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fieldLayouts.afd7c9ae-6b20-443f-a1f6-c6fd326a7053.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fieldLayouts.afd7c9ae-6b20-443f-a1f6-c6fd326a7053.tabs.0.elements.0.warning','null'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fieldLayouts.afd7c9ae-6b20-443f-a1f6-c6fd326a7053.tabs.0.elements.0.width','100'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fieldLayouts.afd7c9ae-6b20-443f-a1f6-c6fd326a7053.tabs.0.name','\"Content\"'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fieldLayouts.afd7c9ae-6b20-443f-a1f6-c6fd326a7053.tabs.0.sortOrder','1'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.contentColumnType','\"text\"'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.fieldGroup','null'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.handle','\"text\"'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.instructions','\"\"'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.name','\"Text\"'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.searchable','false'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.availableTransforms','\"*\"'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.availableVolumes','\"*\"'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.cleanupHtml','true'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.columnType','\"text\"'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.configSelectionMode','\"choose\"'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.defaultTransform','\"\"'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.manualConfig','\"\"'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.purifierConfig','\"\"'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.purifyHtml','\"1\"'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.redactorConfig','\"\"'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.removeEmptyTags','\"1\"'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.removeInlineStyles','\"1\"'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.removeNbsp','\"1\"'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.showHtmlButtonForNonAdmins','\"\"'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.showUnpermittedFiles','false'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.uiMode','\"normal\"'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.translationKeyFormat','null'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.translationMethod','\"none\"'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.type','\"craft\\\\redactor\\\\Field\"'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.handle','\"richtext\"'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.name','\"Richtext\"'),('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.sortOrder','1'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.field','\"f0b26b60-9cd6-415f-928f-c63614f6e7b8\"'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fieldLayouts.07d75d4d-e229-457b-870d-914abaa59bc6.tabs.0.elements.0.fieldUid','\"709d71e0-6fd6-41c8-b407-527b866465d0\"'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fieldLayouts.07d75d4d-e229-457b-870d-914abaa59bc6.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fieldLayouts.07d75d4d-e229-457b-870d-914abaa59bc6.tabs.0.elements.0.label','null'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fieldLayouts.07d75d4d-e229-457b-870d-914abaa59bc6.tabs.0.elements.0.required','true'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fieldLayouts.07d75d4d-e229-457b-870d-914abaa59bc6.tabs.0.elements.0.tip','null'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fieldLayouts.07d75d4d-e229-457b-870d-914abaa59bc6.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fieldLayouts.07d75d4d-e229-457b-870d-914abaa59bc6.tabs.0.elements.0.warning','null'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fieldLayouts.07d75d4d-e229-457b-870d-914abaa59bc6.tabs.0.elements.0.width','100'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fieldLayouts.07d75d4d-e229-457b-870d-914abaa59bc6.tabs.0.name','\"Content\"'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fieldLayouts.07d75d4d-e229-457b-870d-914abaa59bc6.tabs.0.sortOrder','1'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.contentColumnType','\"string\"'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.fieldGroup','null'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.handle','\"article\"'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.instructions','\"\"'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.name','\"Article\"'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.searchable','false'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.settings.allowSelfRelations','false'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.settings.limit','\"1\"'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.settings.localizeRelations','false'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.settings.selectionLabel','\"\"'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.settings.showSiteMenu','true'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.settings.source','null'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.settings.sources','\"*\"'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.settings.targetSiteId','null'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.settings.validateRelatedElements','false'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.settings.viewMode','null'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.translationKeyFormat','null'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.translationMethod','\"site\"'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.type','\"craft\\\\fields\\\\Entries\"'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.handle','\"highlightedArticle\"'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.name','\"Highlighted Article\"'),('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.sortOrder','2'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.field','\"f0b26b60-9cd6-415f-928f-c63614f6e7b8\"'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fieldLayouts.ba2c1099-179f-4309-b345-f6f3776a2388.tabs.0.elements.0.fieldUid','\"a2aab963-b865-46cb-989b-eb68564777e1\"'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fieldLayouts.ba2c1099-179f-4309-b345-f6f3776a2388.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fieldLayouts.ba2c1099-179f-4309-b345-f6f3776a2388.tabs.0.elements.0.label','null'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fieldLayouts.ba2c1099-179f-4309-b345-f6f3776a2388.tabs.0.elements.0.required','true'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fieldLayouts.ba2c1099-179f-4309-b345-f6f3776a2388.tabs.0.elements.0.tip','null'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fieldLayouts.ba2c1099-179f-4309-b345-f6f3776a2388.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fieldLayouts.ba2c1099-179f-4309-b345-f6f3776a2388.tabs.0.elements.0.warning','null'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fieldLayouts.ba2c1099-179f-4309-b345-f6f3776a2388.tabs.0.elements.0.width','100'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fieldLayouts.ba2c1099-179f-4309-b345-f6f3776a2388.tabs.0.name','\"Content\"'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fieldLayouts.ba2c1099-179f-4309-b345-f6f3776a2388.tabs.0.sortOrder','1'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.contentColumnType','\"text\"'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.fieldGroup','null'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.handle','\"embed\"'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.instructions','\"\"'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.name','\"Embed\"'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.searchable','false'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.settings.byteLimit','null'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.settings.charLimit','null'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.settings.code','\"\"'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.settings.columnType','null'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.settings.initialRows','\"4\"'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.settings.multiline','\"1\"'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.settings.placeholder','null'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.settings.uiMode','\"normal\"'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.translationKeyFormat','null'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.translationMethod','\"none\"'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.handle','\"videoEmbed\"'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.name','\"Video Embed\"'),('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.sortOrder','3'),('plugins.logs.edition','\"standard\"'),('plugins.logs.enabled','true'),('plugins.logs.schemaVersion','\"3.0.0\"'),('plugins.mix.edition','\"standard\"'),('plugins.mix.enabled','true'),('plugins.mix.schemaVersion','\"1.0.0\"'),('plugins.redactor.edition','\"standard\"'),('plugins.redactor.enabled','true'),('plugins.redactor.schemaVersion','\"2.3.0\"'),('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.enableVersioning','true'),('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.handle','\"example\"'),('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.name','\"Example\"'),('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.propagationMethod','\"all\"'),('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.siteSettings.9eb17f17-fb0c-4688-aaff-a09782aeacea.enabledByDefault','true'),('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.siteSettings.9eb17f17-fb0c-4688-aaff-a09782aeacea.hasUrls','true'),('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.siteSettings.9eb17f17-fb0c-4688-aaff-a09782aeacea.template','\"example\"'),('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.siteSettings.9eb17f17-fb0c-4688-aaff-a09782aeacea.uriFormat','\"example\"'),('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.type','\"single\"'),('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.enableVersioning','true'),('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.handle','\"homepage\"'),('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.name','\"Homepage\"'),('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.propagationMethod','\"all\"'),('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.siteSettings.9eb17f17-fb0c-4688-aaff-a09782aeacea.enabledByDefault','true'),('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.siteSettings.9eb17f17-fb0c-4688-aaff-a09782aeacea.hasUrls','true'),('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.siteSettings.9eb17f17-fb0c-4688-aaff-a09782aeacea.template','\"index\"'),('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.siteSettings.9eb17f17-fb0c-4688-aaff-a09782aeacea.uriFormat','\"__home__\"'),('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.type','\"single\"'),('siteGroups.8a59f26c-cff0-43ce-8f8c-389421035f87.name','\"Craft Code Test\"'),('sites.9eb17f17-fb0c-4688-aaff-a09782aeacea.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.9eb17f17-fb0c-4688-aaff-a09782aeacea.enabled','true'),('sites.9eb17f17-fb0c-4688-aaff-a09782aeacea.handle','\"default\"'),('sites.9eb17f17-fb0c-4688-aaff-a09782aeacea.hasUrls','true'),('sites.9eb17f17-fb0c-4688-aaff-a09782aeacea.language','\"en-US\"'),('sites.9eb17f17-fb0c-4688-aaff-a09782aeacea.name','\"Craft Code Test\"'),('sites.9eb17f17-fb0c-4688-aaff-a09782aeacea.primary','true'),('sites.9eb17f17-fb0c-4688-aaff-a09782aeacea.siteGroup','\"8a59f26c-cff0-43ce-8f8c-389421035f87\"'),('sites.9eb17f17-fb0c-4688-aaff-a09782aeacea.sortOrder','1'),('system.edition','\"pro\"'),('system.live','true'),('system.name','\"Craft Code Test\"'),('system.retryDuration','null'),('system.schemaVersion','\"3.6.8\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.autocapitalize','true'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.autocomplete','false'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.autocorrect','true'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.class','null'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.disabled','false'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.id','null'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.instructions','null'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.label','null'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.max','null'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.min','null'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.name','null'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.orientation','null'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.placeholder','null'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.readonly','false'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.requirable','false'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.size','null'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.step','null'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.tip','null'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.title','null'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\AssetTitleField\"'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.warning','null'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.width','100'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.name','\"Content\"'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.sortOrder','1'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.handle','\"images\"'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.hasUrls','true'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.name','\"Images\"'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.settings.path','\"@webroot/writable/images\"'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.sortOrder','1'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.titleTranslationKeyFormat','null'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.titleTranslationMethod','null'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.type','\"craft\\\\volumes\\\\Local\"'),('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.url','\"@web/writable/images\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfignames`
--

LOCK TABLES `projectconfignames` WRITE;
/*!40000 ALTER TABLE `projectconfignames` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfignames` VALUES ('03c99c5f-1d80-4e41-a0b5-07c33e763e93','Example'),('3983b886-d522-4401-9459-daa1e6d61cdf','block'),('4e579fce-80fb-40df-a0ab-5ade3e8ecb88','Image with Text'),('692eb48c-e6ca-4a84-805e-1ef02e4d88f2','Richtext'),('709d71e0-6fd6-41c8-b407-527b866465d0','Article'),('7121f7fe-e16c-4776-bf07-811a25cd8b1e','Example'),('7346608a-fffe-49fd-bbe6-efa57785bdf0','Highlighted Article'),('7b77a83a-8dfb-4601-90b1-30c99c1c9505','Public Schema'),('7f794890-d66c-494d-84fc-e51a0683885c','Text'),('8212eef9-36c8-47b5-ab4e-9892531926ac','Profile Photo'),('8a59f26c-cff0-43ce-8f8c-389421035f87','Craft Code Test'),('9585679e-2fe1-4b57-b619-d1beeefdb9ad','Text'),('9eb17f17-fb0c-4688-aaff-a09782aeacea','Craft Code Test'),('a2aab963-b865-46cb-989b-eb68564777e1','Embed'),('a887e226-ad5b-4ffc-b54e-6bd80d70fd34','Homepage'),('acc7548f-3022-405c-b653-2c8760879e60','Common'),('bbb54962-2280-467a-a9f8-15522dd5e7b2','Homepage'),('c9040c8c-87a7-43ef-9eaf-595dc38c1eed','Images'),('dfdd5d42-ea50-4a2a-ba15-b24a3f773356','Video Embed'),('e5179a24-865e-4325-8f64-38c941595a2f','Headline'),('e9ec26d4-6d05-4acf-90d3-9fa165204624','Image'),('f0b26b60-9cd6-415f-928f-c63614f6e7b8','Content Builder');
/*!40000 ALTER TABLE `projectconfignames` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `relations` VALUES (1,3,7,NULL,6,1,'2021-06-28 21:15:22','2021-06-28 21:15:22','a0e37cb3-4891-4d62-b42a-607d1d9ffa2b'),(2,3,9,NULL,6,1,'2021-06-28 21:15:22','2021-06-28 21:15:22','c05c01e4-7dae-483b-9077-fa7337e47850'),(3,3,11,NULL,6,1,'2021-06-28 21:19:44','2021-06-28 21:19:44','7a9d05ac-8df6-4036-8685-0c478c9f61e0'),(4,3,13,NULL,12,1,'2021-06-28 21:24:46','2021-06-28 21:24:46','96aa8440-8c41-4dd5-80c6-8d9a95e59dd4'),(5,3,15,NULL,6,1,'2021-06-28 21:24:46','2021-06-28 21:24:46','5f04ec22-700f-460f-b818-f709f754e013'),(6,3,16,NULL,12,1,'2021-06-28 21:24:46','2021-06-28 21:24:46','0e03c5bd-1ea7-4c8f-8d2b-11aed881409a'),(7,3,18,NULL,6,1,'2021-06-28 21:26:59','2021-06-28 21:26:59','94ed475a-c0c7-42ce-bb78-900ba9f2e7c6'),(8,3,19,NULL,12,1,'2021-06-28 21:26:59','2021-06-28 21:26:59','efd116a7-a6e4-482e-a1d7-e131c697b71c'),(9,7,25,NULL,3,1,'2021-06-29 14:54:13','2021-06-29 14:54:13','45cd9eac-1807-4600-b35e-56854d3c09f6'),(10,7,29,NULL,3,1,'2021-06-29 14:54:13','2021-06-29 14:54:13','272c9089-acd3-4244-bf78-79f15c1e3e62'),(11,7,33,NULL,3,1,'2021-06-29 14:59:33','2021-06-29 14:59:33','ab2059fc-18db-4130-a913-5cd74df527c5');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `resourcepaths` VALUES ('120c1352','@lib/element-resize-detector'),('13cc5358','@app/web/assets/login/dist'),('17f24626','@app/web/assets/cp/dist'),('18e3b8fa','@craft/web/assets/dashboard/dist'),('1ca07665','@craft/redactor/assets/redactor-plugins/dist/fullscreen'),('20a14fd4','@app/web/assets/generalsettings/dist'),('220767ab','@app/web/assets/installer/dist'),('242811b6','@craft/redactor/assets/field/dist'),('2688a050','@lib/axios'),('2c134fda','@lib/velocity'),('2c5fe019','@lib/jquery-ui'),('3034e032','@lib/jquery.payment'),('340523c5','@app/web/assets/updateswidget/dist'),('3946009c','@app/web/assets/fieldsettings/dist'),('3a978f04','@app/web/assets/craftsupport/dist'),('3b6c30d1','@app/web/assets/utilities/dist'),('3d9cb8a7','@bower/jquery/dist'),('415cb458','@app/web/assets/routes/dist'),('422f3f6b','@app/web/assets/pluginstore/dist'),('445a55cd','@app/web/assets/recententries/dist'),('45863743','@lib/vue'),('5741c00','@nystudio107/seomatic/assetbundles/seomatic/dist'),('59177240','@app/web/assets/cp/dist'),('59593f9b','@commerceLib'),('5ce92734','@lib/element-resize-detector'),('5eb5a375','@craft/web/assets/craftsupport/dist'),('5f2359f7','@app/web/assets/matrixsettings/dist'),('5f5b3b8','@commerceLib/deepmerge'),('61a09e31','@craft/web/assets/feed/dist'),('62bad47f','@lib/jquery-ui'),('62f67bbc','@lib/velocity'),('686d9436','@lib/axios'),('6ab5459c','@app/web/assets/updater/dist'),('6b6d2c9e','@app/web/assets/userpermissions/dist'),('73798cc1','@bower/jquery/dist'),('7472bb62','@app/web/assets/craftsupport/dist'),('758904b7','@app/web/assets/utilities/dist'),('7c0465ce','@craft/web/assets/plugins/dist'),('7ed1d454','@lib/jquery.payment'),('835834fb','@craft/commerce/web/assets/statwidgets/dist'),('85e7f37d','@app/web/assets/updates/dist'),('8a3acc3a','@app/web/assets/admintable/dist'),('8c2eb3f7','@lib/garnishjs'),('908356f1','@craft/web/assets/admintable/dist'),('96344579','@app/web/assets/plugins/dist'),('996867c9','@lib/fabric'),('9a1a3c0c','@app/web/assets/dashboard/dist'),('9c0b8e41','@app/web/assets/editsection/dist'),('a1c1d948','@lib/xregexp'),('a57dbac9','@lib/iframe-resizer'),('a9de85de','@lib/fileupload'),('abad9dc2','@lib/selectize'),('abf61ab','@app/web/assets/recententries/dist'),('acb30b33','@app/web/assets/edittransform/dist'),('b1243a2f','@craft/redactor/assets/redactor/dist'),('b1368420','@lib/picturefill'),('b371298c','@craft/redactor/assets/redactor-plugins/dist/video'),('b630325','@lib/vue'),('b692b8e2','@lib/jquery-touch-events'),('bc71b8b9','@app/web/assets/edituser/dist'),('bf93a471','@lib/d3'),('c2cb8791','@lib/garnishjs'),('c4dff85c','@app/web/assets/admintable/dist'),('c7a31712','@craft/web/assets/recententries/dist'),('cb02c71b','@app/web/assets/updates/dist'),('d3982624','@app/web/assets/fields/dist'),('d4ff086a','@app/web/assets/dashboard/dist'),('d78d53af','@lib/fabric'),('d8d1711f','@app/web/assets/plugins/dist'),('db2fbeac','@craft/commerce/web/assets/orderswidget/dist'),('e23261e4','@app/web/assets/sites/dist'),('e3678ced','@craft/web/assets/cp/dist'),('e548a9a4','@lib/selectize'),('e73bb1b8','@lib/fileupload'),('ea1cbc90','@craft/web/assets/pluginstore/dist'),('eb988eaf','@lib/iframe-resizer'),('ebb78749','@app/web/assets/dbbackup/dist'),('ef24ed2e','@lib/xregexp'),('f0360127','@craft/web/assets/generalsettings/dist'),('f1769017','@lib/d3'),('f459ca6a','@app/web/assets/editentry/dist'),('f8778c84','@lib/jquery-touch-events'),('f919557c','@craft/web/assets/updateswidget/dist'),('faf1860d','@lib/prismjs'),('fb7be85e','@app/web/assets/matrix/dist'),('ffd3b046','@lib/picturefill');
/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,3,2,1,NULL),(2,3,2,2,NULL),(3,3,2,3,''),(4,3,2,4,NULL),(5,3,2,5,''),(6,3,2,6,NULL),(7,20,2,1,NULL),(8,20,2,2,NULL),(9,20,2,3,''),(10,20,2,4,'');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'slug',0,1,''),(2,'lastname',0,1,''),(2,'username',0,1,' admin '),(3,'title',0,1,' homepage '),(3,'slug',0,1,' homepage '),(6,'filename',0,1,' test png '),(6,'extension',0,1,' png '),(6,'kind',0,1,' image '),(6,'slug',0,1,''),(6,'title',0,1,' test '),(7,'slug',0,1,''),(9,'slug',0,1,''),(2,'fullname',0,1,''),(2,'firstname',0,1,''),(11,'slug',0,1,''),(12,'filename',0,1,' headphones jpg '),(12,'extension',0,1,' jpg '),(12,'kind',0,1,' image '),(12,'slug',0,1,''),(12,'title',0,1,' headphones '),(13,'slug',0,1,''),(15,'slug',0,1,''),(16,'slug',0,1,''),(18,'slug',0,1,''),(19,'slug',0,1,''),(20,'slug',0,1,' example '),(31,'slug',0,1,''),(20,'title',0,1,' example '),(23,'slug',0,1,''),(24,'slug',0,1,''),(25,'slug',0,1,''),(27,'slug',0,1,''),(28,'slug',0,1,''),(29,'slug',0,1,''),(32,'slug',0,1,''),(33,'slug',0,1,''),(2,'email',0,1,' admin codetest test '),(2,'slug',0,1,'');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Homepage','homepage','single',1,'all','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2021-06-28 19:36:56','2021-06-28 19:36:56',NULL,'a887e226-ad5b-4ffc-b54e-6bd80d70fd34'),(2,NULL,'Employees','employees','channel',1,'all','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2021-06-28 19:51:28','2021-06-28 19:51:39','2021-06-28 19:51:53','534d7b90-54ea-4eec-ba48-cb7e05f42916'),(3,NULL,'Example','example','single',1,'all','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2021-06-29 14:52:41','2021-06-29 14:52:41',NULL,'7121f7fe-e16c-4776-bf07-811a25cd8b1e');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'__home__','index',1,'2021-06-28 19:36:56','2021-06-28 21:19:44','97ea547c-cc2a-4539-bdff-503f678e6967'),(2,2,1,1,'employees/{slug}','employees/_entry',1,'2021-06-28 19:51:28','2021-06-28 19:51:28','34d87f63-dc48-4587-a5e1-e6bb2ce48842'),(3,3,1,1,'example','example',1,'2021-06-29 14:52:41','2021-06-29 14:52:41','7c32e7b3-3fd3-4a8b-999c-d2f2f3896915');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'Craft Code Test','2021-06-28 19:28:37','2021-06-28 19:34:59',NULL,'8a59f26c-cff0-43ce-8f8c-389421035f87');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,1,'Craft Code Test','default','en-US',1,'$PRIMARY_SITE_URL',1,'2021-06-28 19:28:37','2021-06-28 19:28:48',NULL,'9eb17f17-fb0c-4688-aaff-a09782aeacea');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `supertableblocks`
--

LOCK TABLES `supertableblocks` WRITE;
/*!40000 ALTER TABLE `supertableblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `supertableblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `supertableblocktypes`
--

LOCK TABLES `supertableblocktypes` WRITE;
/*!40000 ALTER TABLE `supertableblocktypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `supertableblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (2,'{\"language\":\"en-US\",\"locale\":null,\"weekStartDay\":\"1\",\"useShapes\":false,\"underlineLinks\":false,\"showFieldHandles\":true,\"enableDebugToolbarForSite\":false,\"enableDebugToolbarForCp\":false,\"showExceptionView\":false,\"profileTemplates\":false}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (2,'admin',NULL,'','','admin@codetest.test','$2y$13$ypfYEFHXwUEcd4ep2d2HvO9RofZIAIQB4a50VOeIwLxPSMs.751li',1,0,0,0,'2021-06-29 14:38:24',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2021-06-29 17:03:42','2021-06-28 19:28:48','2021-06-29 17:03:42','f77d58c7-c071-4d52-b6e6-6416bbd1b4ad');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Images','','2021-06-28 19:49:22','2021-06-28 19:49:22','14fdc821-c942-4786-9072-120974d833a8'),(2,NULL,NULL,'Temporary source',NULL,'2021-06-28 21:14:38','2021-06-28 21:14:38','62dad683-0da4-4f4f-8e34-2d14b9ae5a30'),(3,2,NULL,'user_2','user_2/','2021-06-28 21:14:38','2021-06-28 21:14:38','a9199ee6-c8a9-4e72-a1a1-a5d2651968e5');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES (1,3,'Images','images','craft\\volumes\\Local',1,'@web/writable/images','site',NULL,'{\"path\":\"@webroot/writable/images\"}',1,'2021-06-28 19:49:22','2021-06-28 21:20:51',NULL,'c9040c8c-87a7-43ef-9eaf-595dc38c1eed');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,2,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2021-06-28 19:28:50','2021-06-28 19:28:50','de5e429f-ccf9-45c5-8954-487c0210f137'),(2,2,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2021-06-28 19:28:50','2021-06-28 19:28:50','af5cd48d-7308-405b-8739-d951bacf1951'),(3,2,'craft\\widgets\\Updates',3,NULL,'[]',1,'2021-06-28 19:28:50','2021-06-28 19:28:50','fc23350a-8f31-46fc-a0ff-1002efe3a778'),(4,2,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2021-06-28 19:28:50','2021-06-28 19:28:50','cca52830-62b9-40db-b5f1-9a0b81dfc7f4');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'code_test'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-29 13:08:03
