-- MySQL dump 10.13  Distrib 8.0.28, for macos12.2 (x86_64)
--
-- Host: local-db.cj4enm8xzu30.ap-northeast-1.rds.amazonaws.com    Database: four_keys
-- ------------------------------------------------------
-- Server version	5.7.12-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `mst_git_hub_release`
--

DROP TABLE IF EXISTS `mst_git_hub_release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_git_hub_release` (
  `mgr_git_hub_release_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'GitHubリリースID',
  `mgr_project_id` int(11) NOT NULL COMMENT 'プロジェクトID',
  `mgr_id` bigint(20) NOT NULL COMMENT 'ID',
  `mgr_name` varchar(255) NOT NULL COMMENT 'リリース名',
  `mgr_tag_name` varchar(255) NOT NULL COMMENT 'リリースタグ名',
  `mgr_published_at` datetime NOT NULL COMMENT 'リリース日時',
  `mgr_html_url` varchar(255) NOT NULL COMMENT 'リリースページURL',
  `mgr_delete_flag` char(1) NOT NULL DEFAULT '0' COMMENT '削除フラグ',
  `mgr_deletion_datetime` datetime DEFAULT NULL COMMENT '削除日時',
  `mgr_registration_datetime` datetime NOT NULL COMMENT '登録日時',
  `mgr_update_datetime` datetime NOT NULL COMMENT '更新日時',
  `mgr_update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'システム更新日時',
  PRIMARY KEY (`mgr_git_hub_release_id`),
  KEY `idx:mgr_git_hub_release_id` (`mgr_git_hub_release_id`),
  KEY `fk:mgr_project_id` (`mgr_project_id`),
  CONSTRAINT `fk:mgr_project_id` FOREIGN KEY (`mgr_project_id`) REFERENCES `mst_project` (`mpr_project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mst_organization`
--

DROP TABLE IF EXISTS `mst_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_organization` (
  `mor_organization_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '組織ID',
  `mor_organization_name` varchar(255) NOT NULL COMMENT '組織名',
  `mor_git_hub_app_id` int(11) NOT NULL COMMENT 'GitHubAppId',
  `mor_git_hub_app_secret_key` text COMMENT 'GitHubApp秘密鍵',
  `mor_delete_flag` char(1) NOT NULL DEFAULT '0' COMMENT '削除フラグ',
  `mor_deletion_datetime` datetime DEFAULT NULL COMMENT '削除日時',
  `mor_registration_datetime` datetime NOT NULL COMMENT '登録日時',
  `mor_update_datetime` datetime NOT NULL COMMENT '更新日時',
  `mor_update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'システム更新日時',
  PRIMARY KEY (`mor_organization_id`),
  KEY `idx:mor_organization_id` (`mor_organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mst_project`
--

DROP TABLE IF EXISTS `mst_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_project` (
  `mpr_project_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'プロジェクトID',
  `mpr_organization_id` int(11) NOT NULL COMMENT '組織ID',
  `mpr_repository_name` varchar(255) NOT NULL COMMENT 'リポジトリ名',
  `mpr_project_name` varchar(255) NOT NULL COMMENT 'プロジェクト名',
  `mpr_delete_flag` char(1) NOT NULL DEFAULT '0' COMMENT '削除フラグ',
  `mpr_deletion_datetime` datetime DEFAULT NULL COMMENT '削除日時',
  `mpr_registration_datetime` datetime NOT NULL COMMENT '登録日時',
  `mpr_update_datetime` datetime NOT NULL COMMENT '更新日時',
  `mpr_update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'システム更新日時',
  PRIMARY KEY (`mpr_project_id`),
  KEY `idx:mpr_project_id` (`mpr_project_id`),
  KEY `fk:mpr_organization_id` (`mpr_organization_id`),
  CONSTRAINT `fk:mpr_organization_id` FOREIGN KEY (`mpr_organization_id`) REFERENCES `mst_organization` (`mor_organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mst_team`
--

DROP TABLE IF EXISTS `mst_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_team` (
  `mte_team_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'チームID',
  `mte_organization_id` int(11) NOT NULL COMMENT '組織ID',
  `mte_team_name` varchar(255) NOT NULL COMMENT 'チーム名',
  `mte_delete_flag` char(1) NOT NULL DEFAULT '0' COMMENT '削除フラグ',
  `mte_deletion_datetime` datetime DEFAULT NULL COMMENT '削除日時',
  `mte_registration_datetime` datetime NOT NULL COMMENT '登録日時',
  `mte_update_datetime` datetime NOT NULL COMMENT '更新日時',
  `mte_update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'システム更新日時',
  PRIMARY KEY (`mte_team_id`),
  KEY `idx:mte_team_id` (`mte_team_id`),
  KEY `fk:mte_organaization_id` (`mte_organization_id`),
  CONSTRAINT `fk:mte_organaization_id` FOREIGN KEY (`mte_organization_id`) REFERENCES `mst_organization` (`mor_organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trx_incident`
--

DROP TABLE IF EXISTS `trx_incident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trx_incident` (
  `tin_incident_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'インシデントID',
  `tin_team_id` int(11) NOT NULL COMMENT 'チームID',
  `tin_release_id` int(11) DEFAULT NULL COMMENT 'リリースID',
  `tin_incident_name` varchar(255) NOT NULL COMMENT 'インシデント名',
  `tin_incident_detection_datetime` datetime NOT NULL COMMENT 'インシデント発覚日時',
  `tin_delete_flag` char(1) NOT NULL DEFAULT '0' COMMENT '削除フラグ',
  `tin_deletion_datetime` datetime DEFAULT NULL COMMENT '削除日時',
  `tin_registration_datetime` datetime NOT NULL COMMENT '登録日時',
  `tin_update_datetime` datetime NOT NULL COMMENT '更新日時',
  `tin_update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'システム更新日時',
  PRIMARY KEY (`tin_incident_id`),
  KEY `idx:tin_incident_id` (`tin_incident_id`),
  KEY `fk:tin_team_id` (`tin_team_id`),
  KEY `fk:tin_release_id` (`tin_release_id`),
  CONSTRAINT `fk:tin_release_id` FOREIGN KEY (`tin_release_id`) REFERENCES `trx_release` (`tre_release_id`),
  CONSTRAINT `fk:tin_team_id` FOREIGN KEY (`tin_team_id`) REFERENCES `mst_team` (`mte_team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trx_release`
--

DROP TABLE IF EXISTS `trx_release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trx_release` (
  `tre_release_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'リリースID',
  `tre_git_hub_release_id` int(11) NOT NULL COMMENT 'githubリリースID',
  `tre_team_id` int(11) NOT NULL COMMENT 'チームID',
  `tre_first_commit_datetime` datetime NOT NULL COMMENT '1stコミット日時',
  `tre_release_datetime` datetime NOT NULL COMMENT 'リリース日時',
  `tre_delete_flag` char(1) NOT NULL DEFAULT '0' COMMENT '削除フラグ',
  `tre_deletion_datetime` datetime DEFAULT NULL COMMENT '削除日時',
  `tre_registration_datetime` datetime NOT NULL COMMENT '登録日時',
  `tre_update_datetime` datetime NOT NULL COMMENT '更新日時',
  `tre_update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'システム更新日時',
  PRIMARY KEY (`tre_release_id`),
  KEY `idx:tre_release_id` (`tre_release_id`),
  KEY `fk:tre_git_hub_release_id` (`tre_git_hub_release_id`),
  KEY `fk:tre_team_id` (`tre_team_id`),
  CONSTRAINT `fk:tre_git_hub_release_id` FOREIGN KEY (`tre_git_hub_release_id`) REFERENCES `mst_git_hub_release` (`mgr_git_hub_release_id`),
  CONSTRAINT `fk:tre_team_id` FOREIGN KEY (`tre_team_id`) REFERENCES `mst_team` (`mte_team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trx_restore_service_release`
--

DROP TABLE IF EXISTS `trx_restore_service_release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trx_restore_service_release` (
  `trs_restore_service_release_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'サービス復旧リリースID',
  `trs_release_id` int(11) NOT NULL COMMENT 'リリースID',
  `trs_incident_id` int(11) NOT NULL COMMENT 'インシデントID',
  `trs_delete_flag` char(1) NOT NULL DEFAULT '0' COMMENT '削除フラグ',
  `trs_deletion_datetime` datetime DEFAULT NULL COMMENT '削除日時',
  `trs_registration_datetime` datetime NOT NULL COMMENT '登録日時',
  `trs_update_datetime` datetime NOT NULL COMMENT '更新日時',
  `trs_update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'システム更新日時',
  PRIMARY KEY (`trs_restore_service_release_id`),
  KEY `idx:trs_restore_service_release_id` (`trs_restore_service_release_id`),
  KEY `fk:trs_release_id` (`trs_release_id`),
  KEY `fk:trs_incident_id` (`trs_incident_id`),
  CONSTRAINT `fk:trs_incident_id` FOREIGN KEY (`trs_incident_id`) REFERENCES `trx_incident` (`tin_incident_id`),
  CONSTRAINT `fk:trs_release_id` FOREIGN KEY (`trs_release_id`) REFERENCES `trx_release` (`tre_release_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
    `restaurant_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'レストランID',
    `name` varchar(255) NOT NULL COMMENT 'レストラン名',
    `fee` int(11) DEFAULT NULL COMMENT '配送手数料',
    `time_required` varchar(255) NOT NULL COMMENT '配送時間',
    `registration_datetime` datetime NOT NULL COMMENT '登録日時',
    `update_datetime` datetime NOT NULL COMMENT '更新日時',
    `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'システム更新日時',
    PRIMARY KEY (`restaurant_id`),
    KEY `idx:restaurant_id` (`restaurant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `foods`
--

DROP TABLE IF EXISTS `foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foods` (
    `food_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'フードID',
    `restaurant_id` int(11) NOT NULL COMMENT 'レストランID',
    `name` varchar(255) NOT NULL COMMENT 'フード名',
    `price` int(11) DEFAULT NULL COMMENT 'フード価格 ',
    `description` varchar(255) NOT NULL COMMENT 'フード説明',
    `registration_datetime` datetime NOT NULL COMMENT '登録日時',
    `update_datetime` datetime NOT NULL COMMENT '更新日時',
    `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'システム更新日時',
    PRIMARY KEY (`food_id`),
    KEY `idx:food_id` (`food_id`),
    KEY `fk:restaurant_id` (`restaurant_id`),
    CONSTRAINT `fk:restaurant_id` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;


SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-17 18:31:02
