CREATE DATABASE  IF NOT EXISTS `coworks_in` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `coworks_in`;
-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: coworks_in
-- ------------------------------------------------------
-- Server version	5.5.31-0ubuntu0.13.04.1

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
-- Table structure for table `Billing_Plan`
--

DROP TABLE IF EXISTS `Billing_Plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Billing_Plan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `price` float(8,2) unsigned NOT NULL,
  `compounds` smallint(5) unsigned NOT NULL DEFAULT '30',
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Billing_Plan_Modify_User_idx` (`modify_user`),
  CONSTRAINT `fk_Billing_Plan_Modify_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Cash`
--

DROP TABLE IF EXISTS `Cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cash` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coworking_space_id` int(10) unsigned NOT NULL,
  `start_of_month_cash` double unsigned NOT NULL DEFAULT '0',
  `incoming_cash` double unsigned NOT NULL DEFAULT '0',
  `outgoing_cash` double unsigned NOT NULL DEFAULT '0',
  `net_cash_burn` double NOT NULL DEFAULT '0',
  `end_of_month_cash` double unsigned NOT NULL DEFAULT '0',
  `runaway` float NOT NULL DEFAULT '0',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_Cash_Coworking_Space_idx` (`coworking_space_id`),
  CONSTRAINT `fk_Cash_Coworking_Space` FOREIGN KEY (`coworking_space_id`) REFERENCES `Coworking_Space` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Circle`
--

DROP TABLE IF EXISTS `Circle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Circle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Circle_User_idx` (`user_id`),
  KEY `fk_Circle_Modify_User_idx` (`modify_user`),
  KEY `Circle_Title` (`title`),
  CONSTRAINT `fk_Circle_Modify_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Circle_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Circle_Tags`
--

DROP TABLE IF EXISTS `Circle_Tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Circle_Tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `circle_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Circle_Tags_Circle_idx` (`circle_id`),
  KEY `fk_Circle_Tags_Tag_idx` (`tag_id`),
  CONSTRAINT `fk_Circle_Tags_Circle` FOREIGN KEY (`circle_id`) REFERENCES `Circle` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Circle_Tags_Tag` FOREIGN KEY (`tag_id`) REFERENCES `Tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Company`
--

DROP TABLE IF EXISTS `Company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `url` varchar(128) NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Company_Title` (`title`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `fk_Company_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Company_Location`
--

DROP TABLE IF EXISTS `Company_Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Company_Location` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Company_Location_Company_idx` (`company_id`),
  KEY `fk_Company_Location_Location_idx` (`location_id`),
  KEY `company_location_index` (`id`,`company_id`,`location_id`,`status`),
  CONSTRAINT `fk_Company_Location_Company` FOREIGN KEY (`company_id`) REFERENCES `Company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Company_Location_Location` FOREIGN KEY (`location_id`) REFERENCES `Location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Company_Tags`
--

DROP TABLE IF EXISTS `Company_Tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Company_Tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Company_Tags_Company_idx` (`company_id`),
  KEY `fk_Company_Tags_Tag_idx` (`tag_id`),
  CONSTRAINT `fk_Company_Tags_Company` FOREIGN KEY (`company_id`) REFERENCES `Company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Company_Tags_Tag` FOREIGN KEY (`tag_id`) REFERENCES `Tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Conference_Room`
--

DROP TABLE IF EXISTS `Conference_Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Conference_Room` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `floor` tinyint(3) NOT NULL,
  `max_capacity` tinyint(3) NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Conference_Room_Location_idx` (`location_id`),
  KEY `fk_Conference_Room_User_idx` (`modify_user`),
  CONSTRAINT `fk_Conference_Room_Location` FOREIGN KEY (`location_id`) REFERENCES `Location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Conference_Room_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Contact_Description`
--

DROP TABLE IF EXISTS `Contact_Description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Contact_Description` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Contact_Description_Modify_User_idx` (`modify_user`),
  KEY `Contact_Description_Title` (`title`),
  CONSTRAINT `fk_Contact_Description_Modify_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Country`
--

DROP TABLE IF EXISTS `Country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Country` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Coworking_Space`
--

DROP TABLE IF EXISTS `Coworking_Space`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Coworking_Space` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `url` varchar(128) NOT NULL,
  `user_url_stub` varchar(128) NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Coworking_Space_Modify_User_idx` (`modify_user`),
  KEY `fk_Coworking_Space_User_idx` (`user_id`),
  KEY `coworking_space_name_index` (`name`,`status`),
  CONSTRAINT `fk_Coworking_Space_Modify_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Coworking_Space_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Coworking_Space_Billing_Plan`
--

DROP TABLE IF EXISTS `Coworking_Space_Billing_Plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Coworking_Space_Billing_Plan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coworking_space_id` int(10) unsigned NOT NULL,
  `billing_plan_id` int(10) unsigned NOT NULL,
  `stripe_status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Coworking_Space_Billing_Plan_Coworking_Space_idx` (`coworking_space_id`),
  KEY `fk_Coworking_Space_Billing_Plan_Billing_Plan_idx` (`billing_plan_id`),
  KEY `fk_Coworking_Space_Billing_Plan_Modify_idx` (`modify_user`),
  CONSTRAINT `fk_Coworking_Space_Billing_Plan_Billing_Plan` FOREIGN KEY (`billing_plan_id`) REFERENCES `Billing_Plan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Coworking_Space_Billing_Plan_Coworking_Space` FOREIGN KEY (`coworking_space_id`) REFERENCES `Coworking_Space` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Coworking_Space_Billing_Plan_Modify` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Coworking_Stripe`
--

DROP TABLE IF EXISTS `Coworking_Stripe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Coworking_Stripe` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coworking_id` int(10) unsigned NOT NULL,
  `live` enum('test','live') NOT NULL,
  `type` enum('public','private') NOT NULL,
  `key` varchar(64) NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Coworking_Stripe_Coworking_idx` (`coworking_id`),
  KEY `fk_Coworking_Stripe_Modify_User_idx` (`modify_user`),
  KEY `coworking_stripe_index` (`id`,`coworking_id`,`status`),
  CONSTRAINT `fk_Coworking_Stripe_Coworking` FOREIGN KEY (`coworking_id`) REFERENCES `Coworking_Space` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Coworking_Stripe_Modify_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Customer_Acquisition_Cost`
--

DROP TABLE IF EXISTS `Customer_Acquisition_Cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer_Acquisition_Cost` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coworking_space_id` int(10) unsigned NOT NULL,
  `marketing_spend` double unsigned NOT NULL DEFAULT '0',
  `spend_per_signup_blended` float unsigned NOT NULL DEFAULT '0',
  `spend_per_signup_paid` float unsigned NOT NULL DEFAULT '0',
  `sales_spend` double unsigned NOT NULL DEFAULT '0',
  `sales_spend_per_new_paying_customer` float unsigned NOT NULL DEFAULT '0',
  `total_customer_acquisition_cost_blended` float unsigned NOT NULL DEFAULT '0',
  `total_customer_acquisition_cost_paid` float unsigned NOT NULL DEFAULT '0',
  `time_to_recover_cac_in_months` float NOT NULL DEFAULT '0',
  `customer_lifetime_value` float unsigned NOT NULL DEFAULT '0',
  `customer_lifetime_value_acquisition_cost_multiple` float unsigned NOT NULL DEFAULT '0',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_Customer_Acquisition_Cost_Coworking_Space_idx` (`coworking_space_id`),
  CONSTRAINT `fk_Customer_Acquisition_Cost_Coworking_Space` FOREIGN KEY (`coworking_space_id`) REFERENCES `Coworking_Space` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Event`
--

DROP TABLE IF EXISTS `Event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `url` varchar(128) NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `thread` int(10) unsigned DEFAULT NULL,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Event_Host_idx` (`user_id`),
  KEY `fk_Event_Modify_User_idx` (`modify_user`),
  KEY `fk_Event_Event_Thread_idx` (`thread`),
  KEY `Event_Title` (`title`,`start_time`,`end_time`),
  CONSTRAINT `fk_Event_Event_Thread` FOREIGN KEY (`thread`) REFERENCES `Event` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Event_Host_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Event_Modify_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=540 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Event_Attendance`
--

DROP TABLE IF EXISTS `Event_Attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_Attendance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `attending` enum('yes','no','maybe','lead') NOT NULL,
  `checked_in` tinyint(1) unsigned DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modif_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Event_Attendance_User_idx` (`user_id`),
  KEY `fk_Event_Attendance_Event_idx` (`event_id`),
  CONSTRAINT `fk_Event_Attendance_Event` FOREIGN KEY (`event_id`) REFERENCES `Event` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Event_Attendance_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Event_Room`
--

DROP TABLE IF EXISTS `Event_Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_Room` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `conference_room_id` int(10) unsigned NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Event_Room_Event_idx` (`event_id`),
  KEY `fk_Event_Room_Conference_Room_idx` (`conference_room_id`),
  KEY `fk_Event_Room_Modify_User_idx` (`modify_user`),
  CONSTRAINT `fk_Event_Room_Conference_Room` FOREIGN KEY (`conference_room_id`) REFERENCES `Conference_Room` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Event_Room_Event` FOREIGN KEY (`event_id`) REFERENCES `Event` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Event_Room_Modify_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Event_Tags`
--

DROP TABLE IF EXISTS `Event_Tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Event_Tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_Event_Tags_Event_idx` (`event_id`),
  KEY `fk_Event_Tags_Tag_idx` (`tag_id`),
  CONSTRAINT `fk_Event_Tags_Event` FOREIGN KEY (`event_id`) REFERENCES `Event` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Event_Tags_Tag` FOREIGN KEY (`tag_id`) REFERENCES `Tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Geo_Names`
--

DROP TABLE IF EXISTS `Geo_Names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Geo_Names` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country code` char(2) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `place_name` varchar(180) DEFAULT NULL,
  `state_name` varchar(100) DEFAULT NULL,
  `state_code` varchar(20) DEFAULT NULL,
  `county_name` varchar(100) DEFAULT NULL,
  `county_code` varchar(20) DEFAULT NULL,
  `community_name` varchar(100) DEFAULT NULL,
  `community_code` varchar(20) DEFAULT NULL,
  `latitude` float(6,4) DEFAULT NULL,
  `longitude` float(6,4) DEFAULT NULL,
  `accuracy` tinyint(3) unsigned DEFAULT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coordinates_index` (`latitude`,`longitude`,`id`,`status`),
  KEY `postal_code_index` (`postal_code`,`id`,`status`),
  KEY `city_state_index` (`place_name`,`state_code`,`id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Help`
--

DROP TABLE IF EXISTS `Help`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Help` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `estimated_time` time NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Help_User_idx` (`user_id`),
  KEY `fk_Help_Modify_User_idx` (`modify_user`),
  CONSTRAINT `fk_Help_Modify_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Help_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Help_Tags`
--

DROP TABLE IF EXISTS `Help_Tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Help_Tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `help_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_Help_Tags_Help_idx` (`help_id`),
  KEY `fk_Help_Tags_Tag_idx` (`tag_id`),
  CONSTRAINT `fk_Help_Tags_Help` FOREIGN KEY (`help_id`) REFERENCES `Help` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Help_Tags_Tag` FOREIGN KEY (`tag_id`) REFERENCES `Tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Job`
--

DROP TABLE IF EXISTS `Job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Job` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `pay` float(8,2) unsigned NOT NULL,
  `compound` enum('hour','day','week','month','year','flat') NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` timestamp NULL DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Jobs_User_idx` (`user_id`),
  KEY `fk_Jobs_Modify_User_idx` (`modify_user`),
  KEY `job_index` (`id`,`pay`,`status`,`start_date`),
  CONSTRAINT `fk_Jobs_Modify_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jobs_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Job_Tags`
--

DROP TABLE IF EXISTS `Job_Tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Job_Tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_Job_Tags_Job_idx` (`job_id`),
  KEY `fk_Job_Tags_Tags_idx` (`tag_id`),
  CONSTRAINT `fk_Job_Tags_Job` FOREIGN KEY (`job_id`) REFERENCES `Job` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Job_Tags_Tags` FOREIGN KEY (`tag_id`) REFERENCES `Tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Link`
--

DROP TABLE IF EXISTS `Link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Link` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `url` varchar(128) NOT NULL,
  `clicks` int(10) unsigned NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Link_Users_idx` (`user_id`),
  KEY `fk_Link_Modify_User_idx` (`modify_user`),
  KEY `url_link` (`url`,`id`,`clicks`),
  CONSTRAINT `fk_Link_Modify_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Link_Users` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Link_Tags`
--

DROP TABLE IF EXISTS `Link_Tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Link_Tags` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_id` bigint(20) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_Link_Tags_Link_idx` (`link_id`),
  KEY `fk_Link_Tags_Tag_idx` (`tag_id`),
  CONSTRAINT `fk_Link_Tags_Link` FOREIGN KEY (`link_id`) REFERENCES `Link` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Link_Tags_Tag` FOREIGN KEY (`tag_id`) REFERENCES `Tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Location` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coworking_space_id` int(10) unsigned NOT NULL,
  `address1` varchar(128) NOT NULL,
  `address2` varchar(128) DEFAULT NULL,
  `city` varchar(128) NOT NULL,
  `state` char(2) NOT NULL,
  `zip` varchar(5) NOT NULL,
  `country` varchar(128) NOT NULL,
  `longitude` float(16,14) unsigned zerofill DEFAULT NULL,
  `latitude` float(16,14) unsigned zerofill DEFAULT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Location_User_idx` (`modify_user`),
  KEY `fk_Location_Coworking_Space_idx` (`coworking_space_id`),
  CONSTRAINT `fk_Location_Coworking_Space` FOREIGN KEY (`coworking_space_id`) REFERENCES `Coworking_Space` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Location_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Location_User_Status`
--

DROP TABLE IF EXISTS `Location_User_Status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Location_User_Status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `check_in` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `check_out` timestamp NULL DEFAULT NULL,
  `time_on_location` time DEFAULT NULL,
  `method` enum('key card','biometrics','login') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Location_User_Status_Location_idx` (`location_id`),
  KEY `fk_Location_User_Status_User_idx` (`user_id`),
  KEY `location_user_status_index` (`id`,`location_id`,`user_id`,`check_in`),
  CONSTRAINT `fk_Location_User_Status_Location` FOREIGN KEY (`location_id`) REFERENCES `Location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Location_User_Status_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mentor_Availability`
--

DROP TABLE IF EXISTS `Mentor_Availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Mentor_Availability` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Mentor_Availability_User_idx` (`user_id`),
  KEY `fk_Mentor_Availability_Modify_idx` (`modify_user`),
  KEY `mentor_availability_index` (`id`,`user_id`,`start_time`,`status`),
  CONSTRAINT `fk_Mentor_Availability_Modify` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mentor_Availability_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mentor_Meeting`
--

DROP TABLE IF EXISTS `Mentor_Meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Mentor_Meeting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mentor_availability_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Mentor_Meeting_Mentor_Availability_idx` (`mentor_availability_id`),
  KEY `fk_Mentor_Meeting_User_idx` (`user_id`),
  KEY `fk_Mentor_Meeting_Modify_User_idx` (`modify_user`),
  KEY `mentor_meeting_index` (`id`,`mentor_availability_id`,`user_id`,`status`),
  CONSTRAINT `fk_Mentor_Meeting_Mentor_Availability` FOREIGN KEY (`mentor_availability_id`) REFERENCES `Mentor_Availability` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mentor_Meeting_Modify_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mentor_Meeting_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Monthly_Recurring_Revenue`
--

DROP TABLE IF EXISTS `Monthly_Recurring_Revenue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Monthly_Recurring_Revenue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coworking_space_id` int(10) unsigned NOT NULL,
  `start_of_month_recurring_revenue` double unsigned NOT NULL DEFAULT '0',
  `new_recurring_revenue_from_new_customers` double unsigned NOT NULL DEFAULT '0',
  `new_recurring_revenue_from_expansion` double unsigned NOT NULL DEFAULT '0',
  `total_new_recurring_revenue` double unsigned NOT NULL DEFAULT '0',
  `lost_recurring_revenue_from_contraction` double unsigned NOT NULL DEFAULT '0',
  `churn_rate` float NOT NULL DEFAULT '0',
  `net_new_recurring_revenue` double NOT NULL DEFAULT '0',
  `end_of_month_recurring_revenue` double unsigned NOT NULL DEFAULT '0',
  `month_over_month_growth` float NOT NULL DEFAULT '0',
  `average_revenue_per_account` double unsigned NOT NULL DEFAULT '0',
  `average_revenue_per_new_account` double unsigned NOT NULL DEFAULT '0',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_Monthly_Recurring_Revenue_Coworking_Space_idx` (`coworking_space_id`),
  CONSTRAINT `fk_Monthly_Recurring_Revenue_Coworking_Space` FOREIGN KEY (`coworking_space_id`) REFERENCES `Coworking_Space` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Net_Promoter_Score`
--

DROP TABLE IF EXISTS `Net_Promoter_Score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Net_Promoter_Score` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coworking_space_id` int(10) unsigned NOT NULL,
  `quantitative_question` text NOT NULL,
  `quantitative_max` tinyint(4) NOT NULL,
  `qualitative_question` text NOT NULL,
  `views` int(10) unsigned NOT NULL,
  `incompletes` int(10) unsigned NOT NULL,
  `completes` int(10) unsigned NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Net_Promoter_Score_Coworking_idx` (`coworking_space_id`),
  KEY `fk_Net_Promoter_Score_Modify_User_idx` (`modify_user`),
  KEY `Net_Promoter_Score_Index` (`id`,`coworking_space_id`,`views`,`incompletes`,`completes`),
  CONSTRAINT `fk_Net_Promoter_Score_Coworking` FOREIGN KEY (`coworking_space_id`) REFERENCES `Coworking_Space` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Net_Promoter_Score_Modify_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Net_Promoter_Words`
--

DROP TABLE IF EXISTS `Net_Promoter_Words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Net_Promoter_Words` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `net_promoter_score_id` int(10) unsigned NOT NULL,
  `word` varchar(128) NOT NULL,
  `count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Net_Promoter_Words_Net_Promoter_idx` (`net_promoter_score_id`),
  KEY `Net_Promoter_Words_Index` (`id`,`net_promoter_score_id`,`count`),
  CONSTRAINT `fk_Net_Promoter_Words_Net_Promoter` FOREIGN KEY (`net_promoter_score_id`) REFERENCES `Net_Promoter_Score` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Office`
--

DROP TABLE IF EXISTS `Office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Office` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `floor` tinyint(3) NOT NULL,
  `max_capacity` tinyint(3) unsigned NOT NULL,
  `current_capacity` tinyint(3) unsigned NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Office_Location_idx` (`location_id`),
  KEY `fk_Office_Modify_User_idx` (`modify_user`),
  CONSTRAINT `fk_Office_Location` FOREIGN KEY (`location_id`) REFERENCES `Location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Office_Modify_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Paying_Customers`
--

DROP TABLE IF EXISTS `Paying_Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Paying_Customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coworking_space_id` int(10) unsigned NOT NULL,
  `start_of_month_customers` int(10) unsigned NOT NULL DEFAULT '0',
  `new_customers` int(10) unsigned NOT NULL DEFAULT '0',
  `conversion_rate` float unsigned NOT NULL DEFAULT '0',
  `lost_customers` int(10) unsigned NOT NULL DEFAULT '0',
  `churn_rate` double NOT NULL DEFAULT '0',
  `net_new_customers` int(11) NOT NULL DEFAULT '0',
  `end_of_month_customers` int(10) unsigned NOT NULL DEFAULT '0',
  `growth_customers` double NOT NULL DEFAULT '0',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_Paying_Customers_Coworking_Space_idx` (`coworking_space_id`),
  CONSTRAINT `fk_Paying_Customers_Coworking_Space` FOREIGN KEY (`coworking_space_id`) REFERENCES `Coworking_Space` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Question`
--

DROP TABLE IF EXISTS `Question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `thread` int(10) unsigned DEFAULT NULL,
  `answer_id` int(10) unsigned DEFAULT NULL,
  `views` int(10) unsigned DEFAULT '0',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Question_Modify_User_idx` (`modify_user`),
  KEY `fk_Question_Post_User_idx` (`user_id`),
  KEY `fk_Question_Thread_idx` (`thread`),
  KEY `question_search` (`id`,`title`),
  KEY `fk_Question_Answer_Response_idx` (`answer_id`),
  CONSTRAINT `fk_Question_Answer_Response` FOREIGN KEY (`answer_id`) REFERENCES `Response` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Question_Modify_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Question_Post_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Question_Thread` FOREIGN KEY (`thread`) REFERENCES `Question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Question_Tags`
--

DROP TABLE IF EXISTS `Question_Tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Question_Tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Question_Tags_Question_idx` (`question_id`),
  KEY `fk_Question_Tags_Tag_idx` (`tag_id`),
  KEY `fk_Question_Tags_Modify_User_idx` (`modify_user`),
  CONSTRAINT `fk_Question_Tags_Modify_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Question_Tags_Question` FOREIGN KEY (`question_id`) REFERENCES `Question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Question_Tags_Tag` FOREIGN KEY (`tag_id`) REFERENCES `Tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Question_Vote`
--

DROP TABLE IF EXISTS `Question_Vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Question_Vote` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `vote` tinyint(3) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Question_Vote_Question_idx` (`question_id`),
  KEY `fk_Question_Vote_User_idx` (`user_id`),
  KEY `fk_Question_Vote_Modify_User_idx` (`modify_user`),
  CONSTRAINT `fk_Question_Vote_Modify_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Question_Vote_Question` FOREIGN KEY (`question_id`) REFERENCES `Question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Question_Vote_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Referral`
--

DROP TABLE IF EXISTS `Referral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Referral` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `key` varchar(64) NOT NULL,
  `clicks` int(10) unsigned NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Referral_User_idx` (`user_id`),
  KEY `fk_Referral_Event_idx` (`event_id`),
  KEY `fk_Referral_Modify_User_idx` (`modify_user`),
  CONSTRAINT `fk_Referral_Event` FOREIGN KEY (`event_id`) REFERENCES `Event` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Referral_Modify_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Referral_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Response`
--

DROP TABLE IF EXISTS `Response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Response` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(128) NOT NULL,
  `response` text NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `thread` int(10) unsigned DEFAULT NULL,
  `flag` tinyint(3) unsigned DEFAULT NULL,
  `last_flagged` timestamp NULL DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Response_Question_idx` (`question_id`),
  KEY `fk_Response_User_idx` (`user_id`),
  KEY `fk_Response_Modify_User_idx` (`modify_user`),
  KEY `fk_Response_Thread_idx` (`thread`),
  CONSTRAINT `fk_Response_Modify_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Response_Question` FOREIGN KEY (`question_id`) REFERENCES `Question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Response_Thread` FOREIGN KEY (`thread`) REFERENCES `Response` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Response_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Response_Vote`
--

DROP TABLE IF EXISTS `Response_Vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Response_Vote` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `response_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `vote` tinyint(3) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Response_Vote_Response_idx` (`response_id`),
  KEY `fk_Response_Vote_User_idx` (`user_id`),
  KEY `fk_Response_Vote_Modify_User_idx` (`modify_user`),
  CONSTRAINT `fk_Response_Vote_Modify_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Response_Vote_Response` FOREIGN KEY (`response_id`) REFERENCES `Response` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Response_Vote_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Signup`
--

DROP TABLE IF EXISTS `Signup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Signup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coworking_space_id` int(10) unsigned NOT NULL,
  `last_month_visitors` int(10) unsigned NOT NULL DEFAULT '0',
  `current_visitors` int(10) unsigned NOT NULL DEFAULT '0',
  `growth_of_visitors` double NOT NULL DEFAULT '0',
  `start_of_month_signups` int(10) unsigned NOT NULL DEFAULT '0',
  `referral_signups` int(10) unsigned NOT NULL DEFAULT '0',
  `walk_in_signups` int(10) unsigned NOT NULL DEFAULT '0',
  `paid_signups` int(10) unsigned NOT NULL DEFAULT '0',
  `total_new_signups` int(10) unsigned NOT NULL DEFAULT '0',
  `last_month_signups` int(10) unsigned NOT NULL DEFAULT '0',
  `growth_of_signups` double NOT NULL DEFAULT '0',
  `conversion_rate` float unsigned NOT NULL DEFAULT '0',
  `total_referrals` int(10) unsigned NOT NULL DEFAULT '0',
  `referral_conversion_rate` float unsigned NOT NULL DEFAULT '0',
  `end_of_month_signups` int(10) unsigned NOT NULL DEFAULT '0',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_Signup_Coworking_Space_idx` (`coworking_space_id`),
  CONSTRAINT `fk_Signup_Coworking_Space` FOREIGN KEY (`coworking_space_id`) REFERENCES `Coworking_Space` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tags`
--

DROP TABLE IF EXISTS `Tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(64) NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_UNIQUE` (`tag`),
  KEY `fk_Tags_Modify_User_idx` (`modify_user`),
  KEY `tag` (`tag`),
  CONSTRAINT `fk_Tags_Modify_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=460 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Token`
--

DROP TABLE IF EXISTS `Token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `expire_length` int(10) unsigned NOT NULL,
  `authenticate_url` tinytext NOT NULL,
  `validate_url` tinytext NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Token_Status_Index` (`id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `fullName` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `server_id` varchar(128) DEFAULT NULL,
  `user_image_id` bigint(20) unsigned DEFAULT NULL,
  `birthday` date NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_User_Modify_User_idx` (`modify_user`),
  CONSTRAINT `fk_User_Modify_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=903 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User_Address`
--

DROP TABLE IF EXISTS `User_Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `address` varchar(128) NOT NULL,
  `address2` varchar(128) DEFAULT NULL,
  `city` varchar(128) NOT NULL,
  `state` char(2) NOT NULL,
  `zip` varchar(5) NOT NULL,
  `longitude` float(16,14) DEFAULT NULL,
  `latitude` float(16,14) DEFAULT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_User_Address_User_idx` (`user_id`),
  KEY `fk_User_Address_Modify_User_idx` (`modify_user`),
  KEY `user_address_index` (`id`,`user_id`,`status`),
  CONSTRAINT `fk_User_Address_Modify_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Address_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User_Application`
--

DROP TABLE IF EXISTS `User_Application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Application` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `languages` text NOT NULL,
  `skills` text NOT NULL,
  `started_business` tinyint(1) unsigned NOT NULL,
  `work_habit` tinyint(1) unsigned NOT NULL,
  `other` varchar(100) DEFAULT NULL,
  `interests` text NOT NULL,
  `special` text NOT NULL,
  `convicted_felon` tinyint(1) unsigned NOT NULL,
  `computer_fraud_or_theft` tinyint(1) unsigned NOT NULL,
  `promo_code` varchar(45) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_User_Application_User_idx` (`user_id`),
  CONSTRAINT `fk_User_Application_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User_Billing`
--

DROP TABLE IF EXISTS `User_Billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Billing` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `coworking_space_billing_plan_id` int(10) unsigned NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_User_Billing_User_idx` (`user_id`),
  KEY `fk_User_Billing_Coworking_Plan_idx` (`coworking_space_billing_plan_id`),
  KEY `fk_User_Billing_Modify_User_idx` (`modify_user`),
  CONSTRAINT `fk_User_Billing_Coworking_Plan` FOREIGN KEY (`coworking_space_billing_plan_id`) REFERENCES `Coworking_Space_Billing_Plan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Billing_Modify_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Billing_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2185 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User_Bio`
--

DROP TABLE IF EXISTS `User_Bio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Bio` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_User_Bio_User_idx` (`user_id`),
  KEY `fk_User_Bio_Modify_User_idx` (`modify_user`),
  KEY `user_bio_index` (`id`,`user_id`,`status`),
  CONSTRAINT `fk_User_Bio_Modify_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Bio_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=481 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User_Cave`
--

DROP TABLE IF EXISTS `User_Cave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Cave` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `flag_count` int(10) unsigned NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_User_Cave_User_idx` (`user_id`),
  KEY `fk_User_Cave_Modify_idx` (`modify_user`),
  CONSTRAINT `fk_User_Cave_Modify` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Cave_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User_Circle`
--

DROP TABLE IF EXISTS `User_Circle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Circle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `circle_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `member_type` enum('basic','manager','owner') NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_User_Circle_Circle_idx` (`circle_id`),
  KEY `fk_User_Circle_User_idx` (`user_id`),
  KEY `fk_User_Circle_Modify_User_idx` (`modify_user`),
  CONSTRAINT `fk_User_Circle_Circle` FOREIGN KEY (`circle_id`) REFERENCES `Circle` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Circle_Modify_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Circle_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User_Company`
--

DROP TABLE IF EXISTS `User_Company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_User_Company_Company_idx` (`company_id`),
  KEY `fk_User_Company_User_idx` (`user_id`),
  KEY `fk_User_Company_Modify_User_idx` (`modify_user`),
  CONSTRAINT `fk_User_Company_Company` FOREIGN KEY (`company_id`) REFERENCES `Company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Company_Modify_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Company_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=455 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User_Contact`
--

DROP TABLE IF EXISTS `User_Contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Contact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `contact_description_id` int(10) unsigned NOT NULL,
  `contact_value` varchar(128) NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `thread` int(10) unsigned DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_User_Contact_User_idx` (`user_id`),
  KEY `fk_User_Contact_Contact_Description_idx` (`contact_description_id`),
  KEY `fk_User_Contact_Modify_User_idx` (`modify_user`),
  KEY `fk_User_Contact_Thread_idx` (`thread`),
  CONSTRAINT `fk_User_Contact_Contact_Description` FOREIGN KEY (`contact_description_id`) REFERENCES `Contact_Description` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Contact_Modify_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Contact_Thread` FOREIGN KEY (`thread`) REFERENCES `User_Contact` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Contact_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2239 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User_Coworking_Space`
--

DROP TABLE IF EXISTS `User_Coworking_Space`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Coworking_Space` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `coworking_space_id` int(10) unsigned NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_User_Coworking_Space_User_idx` (`user_id`),
  KEY `fk_User_Coworking_Space_Coworking_idx` (`coworking_space_id`),
  KEY `fk_User_Coworking_Space_Modify_idx` (`modify_user`),
  KEY `user_coworking_space_index` (`id`,`user_id`,`coworking_space_id`,`status`),
  CONSTRAINT `fk_User_Coworking_Space_Coworking` FOREIGN KEY (`coworking_space_id`) REFERENCES `Coworking_Space` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Coworking_Space_Modify` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Coworking_Space_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User_Image`
--

DROP TABLE IF EXISTS `User_Image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Image` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `image` varchar(128) NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User_Invite`
--

DROP TABLE IF EXISTS `User_Invite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Invite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `email` varchar(128) NOT NULL,
  `key` varchar(64) NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expire_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `fk_User_Invite_User_idx` (`user_id`),
  CONSTRAINT `fk_User_Invite_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User_Login`
--

DROP TABLE IF EXISTS `User_Login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Login` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip` varchar(15) NOT NULL,
  `failure` tinyint(1) unsigned NOT NULL,
  `login_time` timestamp NULL DEFAULT NULL,
  `logout_time` timestamp NULL DEFAULT NULL,
  `time_online` time DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_User_Login_User_idx` (`user_id`),
  KEY `user_time_online` (`user_id`,`time_online`),
  CONSTRAINT `fk_User_Login_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User_Net_Promoter_Score`
--

DROP TABLE IF EXISTS `User_Net_Promoter_Score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Net_Promoter_Score` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `net_promoter_score_id` int(10) unsigned NOT NULL,
  `quantitative_score` tinyint(4) NOT NULL,
  `qualitative_response` text NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_User_Net_Promoter_Score_User_idx` (`user_id`),
  KEY `fk_User_Net_Promoter_Score_Net_Promoter_idx` (`net_promoter_score_id`),
  KEY `User_Net_Promoter_Index` (`id`,`user_id`,`quantitative_score`),
  CONSTRAINT `fk_User_Net_Promoter_Score_Net_Promoter` FOREIGN KEY (`net_promoter_score_id`) REFERENCES `Net_Promoter_Score` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Net_Promoter_Score_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User_Office`
--

DROP TABLE IF EXISTS `User_Office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Office` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `office_id` int(10) unsigned NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modfiy_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_User_Office_User_idx` (`user_id`),
  KEY `fk_User_Office_Office_idx` (`office_id`),
  KEY `fk_User_Office_Modify_idx` (`modfiy_user`),
  CONSTRAINT `fk_User_Office_Modify` FOREIGN KEY (`modfiy_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Office_Office` FOREIGN KEY (`office_id`) REFERENCES `Office` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Office_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User_Stripe`
--

DROP TABLE IF EXISTS `User_Stripe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Stripe` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `stripe_token` varchar(64) NOT NULL,
  `last_checked` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) unsigned NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_User_Stripe_User_idx` (`user_id`),
  KEY `fk_User_Stripe_Modify_User_idx` (`modify_user`),
  CONSTRAINT `fk_User_Stripe_Modify_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Stripe_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User_Tags`
--

DROP TABLE IF EXISTS `User_Tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `tags_id` int(10) unsigned NOT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_User_Tags_User_idx` (`user_id`),
  KEY `fk_User_Tags_Tags_idx` (`tags_id`),
  CONSTRAINT `fk_User_Tags_Tags` FOREIGN KEY (`tags_id`) REFERENCES `Tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Tags_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4575 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User_Time`
--

DROP TABLE IF EXISTS `User_Time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Time` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `giving_user_id` int(10) unsigned NOT NULL,
  `taking_user_id` int(10) unsigned NOT NULL,
  `help_id` int(10) unsigned DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp NULL DEFAULT NULL,
  `total_time` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_User_Time_User_idx` (`giving_user_id`),
  KEY `fk_User_Time_Taking_User_idx` (`taking_user_id`),
  KEY `user_giving_time` (`giving_user_id`,`start_time`,`total_time`),
  KEY `user_taking_time` (`taking_user_id`,`start_time`,`total_time`),
  CONSTRAINT `fk_User_Time_Giving_User` FOREIGN KEY (`giving_user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Time_Taking_User` FOREIGN KEY (`taking_user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User_Token`
--

DROP TABLE IF EXISTS `User_Token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `token_id` int(10) unsigned NOT NULL,
  `token` tinytext NOT NULL,
  `expires` timestamp NULL DEFAULT NULL,
  `status` enum('pending','enabled','disabled','retired') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_User_Token_Token_idx` (`token_id`),
  KEY `fk_User_Token_User_idx` (`user_id`),
  KEY `User_Token_Index` (`id`,`user_id`,`token_id`,`expires`),
  CONSTRAINT `fk_User_Token_Token` FOREIGN KEY (`token_id`) REFERENCES `Token` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Token_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User_Type`
--

DROP TABLE IF EXISTS `User_Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `type` enum('prospect','community','desk','mentor','operations_management','business_management','administrator') NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` timestamp NULL DEFAULT NULL,
  `modify_user` int(10) unsigned DEFAULT NULL,
  `modify_reason` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_User_Type_User_idx` (`user_id`),
  KEY `fk_User_Type_Modify_User_idx` (`modify_user`),
  CONSTRAINT `fk_User_Type_Modify_User` FOREIGN KEY (`modify_user`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Type_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `newMembershipsByPricePlanPerMonth`
--

DROP TABLE IF EXISTS `newMembershipsByPricePlanPerMonth`;
/*!50001 DROP VIEW IF EXISTS `newMembershipsByPricePlanPerMonth`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `newMembershipsByPricePlanPerMonth` (
  `title` tinyint NOT NULL,
  `count(1)` tinyint NOT NULL,
  `DATE_FORMAT(ub.``create_date``,'%M, %Y')` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `searchCircles`
--

DROP TABLE IF EXISTS `searchCircles`;
/*!50001 DROP VIEW IF EXISTS `searchCircles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `searchCircles` (
  `id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `fullName` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `tag_id` tinyint NOT NULL,
  `tag` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `searchCompany`
--

DROP TABLE IF EXISTS `searchCompany`;
/*!50001 DROP VIEW IF EXISTS `searchCompany`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `searchCompany` (
  `id` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `url` tinyint NOT NULL,
  `coworking_space_id` tinyint NOT NULL,
  `coworking_space_name` tinyint NOT NULL,
  `address1` tinyint NOT NULL,
  `address2` tinyint NOT NULL,
  `city` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `zip` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `searchConferenceRooms`
--

DROP TABLE IF EXISTS `searchConferenceRooms`;
/*!50001 DROP VIEW IF EXISTS `searchConferenceRooms`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `searchConferenceRooms` (
  `id` tinyint NOT NULL,
  `conference_room_name` tinyint NOT NULL,
  `floor` tinyint NOT NULL,
  `max_capacity` tinyint NOT NULL,
  `coworking_space_id` tinyint NOT NULL,
  `coworking_space_name` tinyint NOT NULL,
  `address1` tinyint NOT NULL,
  `address2` tinyint NOT NULL,
  `city` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `zip` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `searchCoworkingSpaces`
--

DROP TABLE IF EXISTS `searchCoworkingSpaces`;
/*!50001 DROP VIEW IF EXISTS `searchCoworkingSpaces`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `searchCoworkingSpaces` (
  `id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `url` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `searchEvents`
--

DROP TABLE IF EXISTS `searchEvents`;
/*!50001 DROP VIEW IF EXISTS `searchEvents`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `searchEvents` (
  `event_id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `hosted_by` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `url` tinyint NOT NULL,
  `month` tinyint NOT NULL,
  `day` tinyint NOT NULL,
  `time` tinyint NOT NULL,
  `start_time` tinyint NOT NULL,
  `end_time` tinyint NOT NULL,
  `coworking_space_id` tinyint NOT NULL,
  `coworking_space_name` tinyint NOT NULL,
  `conference_room_id` tinyint NOT NULL,
  `conference_room_name` tinyint NOT NULL,
  `floor` tinyint NOT NULL,
  `location_id` tinyint NOT NULL,
  `address1` tinyint NOT NULL,
  `address2` tinyint NOT NULL,
  `city` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `zip` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `searchEventsFuture`
--

DROP TABLE IF EXISTS `searchEventsFuture`;
/*!50001 DROP VIEW IF EXISTS `searchEventsFuture`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `searchEventsFuture` (
  `event_id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `hosted_by` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `url` tinyint NOT NULL,
  `month` tinyint NOT NULL,
  `day` tinyint NOT NULL,
  `time` tinyint NOT NULL,
  `start_time` tinyint NOT NULL,
  `end_time` tinyint NOT NULL,
  `coworking_space_id` tinyint NOT NULL,
  `coworking_space_name` tinyint NOT NULL,
  `conference_room_id` tinyint NOT NULL,
  `conference_room_name` tinyint NOT NULL,
  `floor` tinyint NOT NULL,
  `location_id` tinyint NOT NULL,
  `address1` tinyint NOT NULL,
  `address2` tinyint NOT NULL,
  `city` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `zip` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `searchHelp`
--

DROP TABLE IF EXISTS `searchHelp`;
/*!50001 DROP VIEW IF EXISTS `searchHelp`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `searchHelp` (
  `id` tinyint NOT NULL,
  `help_title` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `estimated_time` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `fullName` tinyint NOT NULL,
  `tag_id` tinyint NOT NULL,
  `tag` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `searchJobs`
--

DROP TABLE IF EXISTS `searchJobs`;
/*!50001 DROP VIEW IF EXISTS `searchJobs`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `searchJobs` (
  `id` tinyint NOT NULL,
  `job_title` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `pay` tinyint NOT NULL,
  `compound` tinyint NOT NULL,
  `start_date` tinyint NOT NULL,
  `end_date` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `fullName` tinyint NOT NULL,
  `tag_id` tinyint NOT NULL,
  `tag` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `searchLocation`
--

DROP TABLE IF EXISTS `searchLocation`;
/*!50001 DROP VIEW IF EXISTS `searchLocation`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `searchLocation` (
  `id` tinyint NOT NULL,
  `coworking_space_id` tinyint NOT NULL,
  `coworking_space_name` tinyint NOT NULL,
  `address1` tinyint NOT NULL,
  `address2` tinyint NOT NULL,
  `city` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `zip` tinyint NOT NULL,
  `latitude` tinyint NOT NULL,
  `longitude` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `searchOffices`
--

DROP TABLE IF EXISTS `searchOffices`;
/*!50001 DROP VIEW IF EXISTS `searchOffices`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `searchOffices` (
  `id` tinyint NOT NULL,
  `office_name` tinyint NOT NULL,
  `max_capacity` tinyint NOT NULL,
  `current_capacity` tinyint NOT NULL,
  `floor` tinyint NOT NULL,
  `coworking_space_id` tinyint NOT NULL,
  `coworking_space_name` tinyint NOT NULL,
  `address1` tinyint NOT NULL,
  `address2` tinyint NOT NULL,
  `city` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `zip` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `searchQuestionsAndResponses`
--

DROP TABLE IF EXISTS `searchQuestionsAndResponses`;
/*!50001 DROP VIEW IF EXISTS `searchQuestionsAndResponses`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `searchQuestionsAndResponses` (
  `question_id` tinyint NOT NULL,
  `question_title` tinyint NOT NULL,
  `question_user` tinyint NOT NULL,
  `fullName` tinyint NOT NULL,
  `tag` tinyint NOT NULL,
  `response_id` tinyint NOT NULL,
  `response` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `searchUserName`
--

DROP TABLE IF EXISTS `searchUserName`;
/*!50001 DROP VIEW IF EXISTS `searchUserName`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `searchUserName` (
  `id` tinyint NOT NULL,
  `fullName` tinyint NOT NULL,
  `user_image_id` tinyint NOT NULL,
  `coworking_space_name` tinyint NOT NULL,
  `office_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewBilling_Plan`
--

DROP TABLE IF EXISTS `viewBilling_Plan`;
/*!50001 DROP VIEW IF EXISTS `viewBilling_Plan`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewBilling_Plan` (
  `id` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `price` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewCircle`
--

DROP TABLE IF EXISTS `viewCircle`;
/*!50001 DROP VIEW IF EXISTS `viewCircle`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewCircle` (
  `id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewCircle_Tags`
--

DROP TABLE IF EXISTS `viewCircle_Tags`;
/*!50001 DROP VIEW IF EXISTS `viewCircle_Tags`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewCircle_Tags` (
  `id` tinyint NOT NULL,
  `circle_id` tinyint NOT NULL,
  `tag_id` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewCompany`
--

DROP TABLE IF EXISTS `viewCompany`;
/*!50001 DROP VIEW IF EXISTS `viewCompany`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewCompany` (
  `id` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `url` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewCompany_Location`
--

DROP TABLE IF EXISTS `viewCompany_Location`;
/*!50001 DROP VIEW IF EXISTS `viewCompany_Location`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewCompany_Location` (
  `id` tinyint NOT NULL,
  `company_id` tinyint NOT NULL,
  `location_id` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewCompany_Tags`
--

DROP TABLE IF EXISTS `viewCompany_Tags`;
/*!50001 DROP VIEW IF EXISTS `viewCompany_Tags`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewCompany_Tags` (
  `id` tinyint NOT NULL,
  `company_id` tinyint NOT NULL,
  `tag_id` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewConference_Room`
--

DROP TABLE IF EXISTS `viewConference_Room`;
/*!50001 DROP VIEW IF EXISTS `viewConference_Room`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewConference_Room` (
  `id` tinyint NOT NULL,
  `location_id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `floor` tinyint NOT NULL,
  `max_capacity` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewContact_Description`
--

DROP TABLE IF EXISTS `viewContact_Description`;
/*!50001 DROP VIEW IF EXISTS `viewContact_Description`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewContact_Description` (
  `id` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewCoworking_Space`
--

DROP TABLE IF EXISTS `viewCoworking_Space`;
/*!50001 DROP VIEW IF EXISTS `viewCoworking_Space`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewCoworking_Space` (
  `id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `url` tinyint NOT NULL,
  `user_url_stub` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewCoworking_Space_Billing_Plan`
--

DROP TABLE IF EXISTS `viewCoworking_Space_Billing_Plan`;
/*!50001 DROP VIEW IF EXISTS `viewCoworking_Space_Billing_Plan`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewCoworking_Space_Billing_Plan` (
  `id` tinyint NOT NULL,
  `coworking_space_id` tinyint NOT NULL,
  `billing_plan_id` tinyint NOT NULL,
  `stripe_status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewCoworking_Stripe`
--

DROP TABLE IF EXISTS `viewCoworking_Stripe`;
/*!50001 DROP VIEW IF EXISTS `viewCoworking_Stripe`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewCoworking_Stripe` (
  `id` tinyint NOT NULL,
  `coworking_id` tinyint NOT NULL,
  `live` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `key` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewEvent`
--

DROP TABLE IF EXISTS `viewEvent`;
/*!50001 DROP VIEW IF EXISTS `viewEvent`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewEvent` (
  `id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `start_time` tinyint NOT NULL,
  `end_time` tinyint NOT NULL,
  `url` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewEvent_Attendance`
--

DROP TABLE IF EXISTS `viewEvent_Attendance`;
/*!50001 DROP VIEW IF EXISTS `viewEvent_Attendance`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewEvent_Attendance` (
  `id` tinyint NOT NULL,
  `event_id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewEvent_Room`
--

DROP TABLE IF EXISTS `viewEvent_Room`;
/*!50001 DROP VIEW IF EXISTS `viewEvent_Room`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewEvent_Room` (
  `id` tinyint NOT NULL,
  `event_id` tinyint NOT NULL,
  `conference_room_id` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewEvent_Tags`
--

DROP TABLE IF EXISTS `viewEvent_Tags`;
/*!50001 DROP VIEW IF EXISTS `viewEvent_Tags`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewEvent_Tags` (
  `id` tinyint NOT NULL,
  `event_id` tinyint NOT NULL,
  `tag_id` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewHelp`
--

DROP TABLE IF EXISTS `viewHelp`;
/*!50001 DROP VIEW IF EXISTS `viewHelp`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewHelp` (
  `id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `estimated_time` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewHelp_Tags`
--

DROP TABLE IF EXISTS `viewHelp_Tags`;
/*!50001 DROP VIEW IF EXISTS `viewHelp_Tags`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewHelp_Tags` (
  `id` tinyint NOT NULL,
  `help_id` tinyint NOT NULL,
  `tag_id` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewJob`
--

DROP TABLE IF EXISTS `viewJob`;
/*!50001 DROP VIEW IF EXISTS `viewJob`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewJob` (
  `id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `pay` tinyint NOT NULL,
  `compound` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `start_date` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewJob_Tags`
--

DROP TABLE IF EXISTS `viewJob_Tags`;
/*!50001 DROP VIEW IF EXISTS `viewJob_Tags`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewJob_Tags` (
  `id` tinyint NOT NULL,
  `job_id` tinyint NOT NULL,
  `tag_id` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewLink`
--

DROP TABLE IF EXISTS `viewLink`;
/*!50001 DROP VIEW IF EXISTS `viewLink`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewLink` (
  `id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `url` tinyint NOT NULL,
  `clicks` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewLink_Tags`
--

DROP TABLE IF EXISTS `viewLink_Tags`;
/*!50001 DROP VIEW IF EXISTS `viewLink_Tags`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewLink_Tags` (
  `id` tinyint NOT NULL,
  `link_id` tinyint NOT NULL,
  `tag_id` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewLocation`
--

DROP TABLE IF EXISTS `viewLocation`;
/*!50001 DROP VIEW IF EXISTS `viewLocation`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewLocation` (
  `id` tinyint NOT NULL,
  `coworking_space_id` tinyint NOT NULL,
  `address1` tinyint NOT NULL,
  `city` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `zip` tinyint NOT NULL,
  `country` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewLocationCoworking`
--

DROP TABLE IF EXISTS `viewLocationCoworking`;
/*!50001 DROP VIEW IF EXISTS `viewLocationCoworking`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewLocationCoworking` (
  `id` tinyint NOT NULL,
  `coworking_space` tinyint NOT NULL,
  `address1` tinyint NOT NULL,
  `address2` tinyint NOT NULL,
  `city` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `zip` tinyint NOT NULL,
  `country` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewLocation_User_Status`
--

DROP TABLE IF EXISTS `viewLocation_User_Status`;
/*!50001 DROP VIEW IF EXISTS `viewLocation_User_Status`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewLocation_User_Status` (
  `id` tinyint NOT NULL,
  `location_id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `check_in` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewMentor_Availability`
--

DROP TABLE IF EXISTS `viewMentor_Availability`;
/*!50001 DROP VIEW IF EXISTS `viewMentor_Availability`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewMentor_Availability` (
  `id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `start_time` tinyint NOT NULL,
  `end_time` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewMentor_Meeting`
--

DROP TABLE IF EXISTS `viewMentor_Meeting`;
/*!50001 DROP VIEW IF EXISTS `viewMentor_Meeting`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewMentor_Meeting` (
  `id` tinyint NOT NULL,
  `mentor_availability_id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewOffice`
--

DROP TABLE IF EXISTS `viewOffice`;
/*!50001 DROP VIEW IF EXISTS `viewOffice`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewOffice` (
  `id` tinyint NOT NULL,
  `location_id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `floor` tinyint NOT NULL,
  `max_capacity` tinyint NOT NULL,
  `current_capacity` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewQuestion`
--

DROP TABLE IF EXISTS `viewQuestion`;
/*!50001 DROP VIEW IF EXISTS `viewQuestion`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewQuestion` (
  `id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `views` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewQuestion_Tags`
--

DROP TABLE IF EXISTS `viewQuestion_Tags`;
/*!50001 DROP VIEW IF EXISTS `viewQuestion_Tags`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewQuestion_Tags` (
  `id` tinyint NOT NULL,
  `question_id` tinyint NOT NULL,
  `tag_id` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewQuestion_Vote`
--

DROP TABLE IF EXISTS `viewQuestion_Vote`;
/*!50001 DROP VIEW IF EXISTS `viewQuestion_Vote`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewQuestion_Vote` (
  `id` tinyint NOT NULL,
  `question_id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `vote` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewReferral`
--

DROP TABLE IF EXISTS `viewReferral`;
/*!50001 DROP VIEW IF EXISTS `viewReferral`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewReferral` (
  `id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `event_id` tinyint NOT NULL,
  `key` tinyint NOT NULL,
  `clicks` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewResponse`
--

DROP TABLE IF EXISTS `viewResponse`;
/*!50001 DROP VIEW IF EXISTS `viewResponse`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewResponse` (
  `id` tinyint NOT NULL,
  `question_id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `response` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `thread` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewResponse_Vote`
--

DROP TABLE IF EXISTS `viewResponse_Vote`;
/*!50001 DROP VIEW IF EXISTS `viewResponse_Vote`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewResponse_Vote` (
  `id` tinyint NOT NULL,
  `response_id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `vote` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewTags`
--

DROP TABLE IF EXISTS `viewTags`;
/*!50001 DROP VIEW IF EXISTS `viewTags`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewTags` (
  `id` tinyint NOT NULL,
  `tag` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewUser`
--

DROP TABLE IF EXISTS `viewUser`;
/*!50001 DROP VIEW IF EXISTS `viewUser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewUser` (
  `id` tinyint NOT NULL,
  `fullName` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `password` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewUser_Address`
--

DROP TABLE IF EXISTS `viewUser_Address`;
/*!50001 DROP VIEW IF EXISTS `viewUser_Address`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewUser_Address` (
  `id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `address` tinyint NOT NULL,
  `city` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `zip` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewUser_Billing`
--

DROP TABLE IF EXISTS `viewUser_Billing`;
/*!50001 DROP VIEW IF EXISTS `viewUser_Billing`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewUser_Billing` (
  `id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `coworking_space_billing_plan_id` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewUser_Bio`
--

DROP TABLE IF EXISTS `viewUser_Bio`;
/*!50001 DROP VIEW IF EXISTS `viewUser_Bio`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewUser_Bio` (
  `id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewUser_Cave`
--

DROP TABLE IF EXISTS `viewUser_Cave`;
/*!50001 DROP VIEW IF EXISTS `viewUser_Cave`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewUser_Cave` (
  `id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewUser_Circle`
--

DROP TABLE IF EXISTS `viewUser_Circle`;
/*!50001 DROP VIEW IF EXISTS `viewUser_Circle`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewUser_Circle` (
  `id` tinyint NOT NULL,
  `circle_id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `member_type` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewUser_Company`
--

DROP TABLE IF EXISTS `viewUser_Company`;
/*!50001 DROP VIEW IF EXISTS `viewUser_Company`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewUser_Company` (
  `id` tinyint NOT NULL,
  `company_id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewUser_Contact`
--

DROP TABLE IF EXISTS `viewUser_Contact`;
/*!50001 DROP VIEW IF EXISTS `viewUser_Contact`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewUser_Contact` (
  `id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `contact_description_id` tinyint NOT NULL,
  `contact_value` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewUser_Image`
--

DROP TABLE IF EXISTS `viewUser_Image`;
/*!50001 DROP VIEW IF EXISTS `viewUser_Image`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewUser_Image` (
  `id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `image` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewUser_Invite`
--

DROP TABLE IF EXISTS `viewUser_Invite`;
/*!50001 DROP VIEW IF EXISTS `viewUser_Invite`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewUser_Invite` (
  `id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `key` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL,
  `expire_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewUser_Login`
--

DROP TABLE IF EXISTS `viewUser_Login`;
/*!50001 DROP VIEW IF EXISTS `viewUser_Login`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewUser_Login` (
  `id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `ip` tinyint NOT NULL,
  `login_time` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewUser_Office`
--

DROP TABLE IF EXISTS `viewUser_Office`;
/*!50001 DROP VIEW IF EXISTS `viewUser_Office`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewUser_Office` (
  `id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `office_id` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewUser_Stripe`
--

DROP TABLE IF EXISTS `viewUser_Stripe`;
/*!50001 DROP VIEW IF EXISTS `viewUser_Stripe`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewUser_Stripe` (
  `id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `stripe_token` tinyint NOT NULL,
  `last_checked` tinyint NOT NULL,
  `is_active` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewUser_Tags`
--

DROP TABLE IF EXISTS `viewUser_Tags`;
/*!50001 DROP VIEW IF EXISTS `viewUser_Tags`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewUser_Tags` (
  `id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `tags_id` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewUser_Time`
--

DROP TABLE IF EXISTS `viewUser_Time`;
/*!50001 DROP VIEW IF EXISTS `viewUser_Time`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewUser_Time` (
  `id` tinyint NOT NULL,
  `giving_user_id` tinyint NOT NULL,
  `taking_user_id` tinyint NOT NULL,
  `start_time` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewUser_Type`
--

DROP TABLE IF EXISTS `viewUser_Type`;
/*!50001 DROP VIEW IF EXISTS `viewUser_Type`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewUser_Type` (
  `id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `create_date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'coworks_in'
--

--
-- Dumping routines for database 'coworks_in'
--
/*!50003 DROP PROCEDURE IF EXISTS `addCustomerAcquisitionCostMarketingSpend` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addCustomerAcquisitionCostMarketingSpend`(IN COWORKING_SPACE_ID_VALUE INT(10) UNSIGNED,NEW_SPEND DOUBLE UNSIGNED)
BEGIN	
	SELECT id into @id FROM Customer_Acquisition_Cost WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
	IF @id > 0 THEN
		UPDATE Customer_Acquisition_Cost
		SET
			marketing_spend=marketing_spend+NEW_SPEND
		WHERE id=@id;
		CALL `updateCustomerAcquisitionCost`(COWORKING_SPACE_ID_VALUE); 
	ELSE
		CALL `updateCustomerAcquisitionCost`(COWORKING_SPACE_ID_VALUE); 
		CALL `addCustomerAcquisitionCostMarketingSpend`(COWORKING_SPACE_ID_VALUE,NEW_SPEND);
	END IF;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addCustomerAcquisitionCostSalesSpend` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addCustomerAcquisitionCostSalesSpend`(IN COWORKING_SPACE_ID_VALUE INT(10) UNSIGNED,NEW_SPEND DOUBLE UNSIGNED)
BEGIN	
	SELECT id into @id FROM Customer_Acquisition_Cost WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
	IF @id > 0 THEN
		UPDATE Customer_Acquisition_Cost
		SET
			sales_spend=sales_spend+NEW_SPEND
		WHERE id=@id;
		CALL `updateCustomerAcquisitionCost`(COWORKING_SPACE_ID_VALUE); 
	ELSE
		CALL `updateCustomerAcquisitionCost`(COWORKING_SPACE_ID_VALUE); 
		CALL `addCustomerAcquisitionCostSalesSpend`(COWORKING_SPACE_ID_VALUE,NEW_SPEND);
	END IF;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addMonthlyRecurringRevenueContraction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addMonthlyRecurringRevenueContraction`(IN COWORKING_SPACE_ID_VALUE INT(10) UNSIGNED,LOST_REVENUE DOUBLE UNSIGNED)
BEGIN
	SELECT id into @id FROM Monthly_Recurring_Revenue WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
	IF @id > 0 THEN
		UPDATE Monthly_Recurring_Revenue
		SET
			lost_recurring_revenue_from_contraction=lost_recurring_revenue_from_contraction+LOST_REVENUE
		WHERE id=@id;
		CALL `updateMonthlyRecurringRevenue`(COWORKING_SPACE_ID_VALUE); 
	ELSE
		CALL `updateMonthlyRecurringRevenue`(COWORKING_SPACE_ID_VALUE); 
		CALL `addMonthlyRecurringRevenueContraction`(COWORKING_SPACE_ID_VALUE,LOST_REVENUE);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addMonthlyRecurringRevenueExpansion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addMonthlyRecurringRevenueExpansion`(IN COWORKING_SPACE_ID_VALUE INT(10) UNSIGNED,NEW_REVENUE DOUBLE UNSIGNED)
BEGIN
	SELECT id into @id FROM Monthly_Recurring_Revenue WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
	IF @id > 0 THEN
		UPDATE Monthly_Recurring_Revenue
		SET
			new_recurring_revenue_from_expansion=new_recurring_revenue_from_expansion+NEW_REVENUE
		WHERE id=@id;
		CALL `updateMonthlyRecurringRevenue`(COWORKING_SPACE_ID_VALUE); 
	ELSE
		CALL `updateMonthlyRecurringRevenue`(COWORKING_SPACE_ID_VALUE); 
		CALL `addMonthlyRecurringRevenueExpansion`(COWORKING_SPACE_ID_VALUE,NEW_REVENUE);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addMonthlyRecurringRevenueNew` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addMonthlyRecurringRevenueNew`(IN COWORKING_SPACE_ID_VALUE INT(10) UNSIGNED,NEW_REVENUE DOUBLE UNSIGNED)
BEGIN
	SELECT id into @id FROM Monthly_Recurring_Revenue WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
	IF @id > 0 THEN
		UPDATE Monthly_Recurring_Revenue
		SET
			new_recurring_revenue_from_new_customers=new_recurring_revenue_from_new_customers+NEW_REVENUE
		WHERE id=@id;
		CALL `updateMonthlyRecurringRevenue`(COWORKING_SPACE_ID_VALUE); 
	ELSE
		CALL `updateMonthlyRecurringRevenue`(COWORKING_SPACE_ID_VALUE); 
		CALL `addMonthlyRecurringRevenueNew`(COWORKING_SPACE_ID_VALUE,NEW_REVENUE);
	END IF;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `availableConferenceRooms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `availableConferenceRooms`(IN LOCATION_ID_VALUE INT(10) UNSIGNED, START_TIME_VALUE timestamp, END_TIME_VALUE timestamp)
BEGIN
	SELECT id, name, floor, max_capacity 
		FROM Conference_Room 
		WHERE location_id=LOCATION_ID_VALUE
			AND status='enabled'
			AND id NOT IN (
				SELECT conference_room_id FROM Event_Room er
					JOIN Event e ON er.event_id=e.id
					WHERE e.status='enabled' 
						AND er.status='enabled'
						AND e.start_time<=START_TIME_VALUE 
						AND (e.end_time>=START_TIME_VALUE
						OR e.end_time<=END_TIME_VALUE)
			);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `checkAttendanceAvailability` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `checkAttendanceAvailability`(IN EVENT_ID_VALUE INT(10) UNSIGNED)
BEGIN
SELECT count(1) into @attending FROM Event_Attendance 
	WHERE attending='yes' AND event_id=EVENT_ID_VALUE;

SELECT max_capacity into @max FROM Conference_Room cr
	JOIN Event_Room er ON er.conference_room_id=cr.id
	WHERE er.event_id=EVENT_ID_VALUE;

IF @attending < @max THEN
   SELECT TRUE as response;
ELSE 
	SELECT FALSE as response;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getBilling_Plan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getBilling_Plan`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `title`, `description`, `price`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Billing_Plan` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCircle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCircle`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `title`, `description`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Circle` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCircle_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCircle_Tags`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `circle_id`, `tag_id`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Circle_Tags` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCompany` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCompany`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `title`, `description`, `url`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Company` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCompany_Location` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCompany_Location`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `company_id`, `location_id`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Company_Location` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCompany_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCompany_Tags`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `company_id`, `tag_id`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Company_Tags` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getConference_Room` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getConference_Room`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `location_id`, `name`, `floor`, `max_capacity`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Conference_Room` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getContact_Description` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getContact_Description`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `title`, `description`, `status`, `create_date`, `thread`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Contact_Description` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCoworking_Space` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCoworking_Space`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `name`, `description`, `url`, `user_url_stub`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Coworking_Space` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCoworking_Space_Billing_Plan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCoworking_Space_Billing_Plan`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `coworking_space_id`, `billing_plan_id`, `stripe_status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Coworking_Space_Billing_Plan` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCoworking_Stripe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCoworking_Stripe`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `coworking_id`, `live`, `type`, `key`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Coworking_Stripe` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getEvent`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `title`, `description`, `start_time`, `end_time`, `url`, `status`, `create_date`, `thread`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Event` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getEvent_Attendance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getEvent_Attendance`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `event_id`, `user_id`, `create_date` 
	FROM `Event_Attendance` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getEvent_Room` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getEvent_Room`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `event_id`, `conference_room_id`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Event_Room` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getEvent_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getEvent_Tags`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT `id`, `event_id`, `tag_id`, `create_date` 
	FROM `Event_Tags` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getHelp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getHelp`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `title`, `description`, `estimated_time`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Help` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getHelpByEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getHelpByEmail`(IN EMAIL_VALUE VARCHAR(128))
BEGIN
	SELECT h.id, title, estimated_time FROM Help as h
		JOIN User u ON h.user_id=u.id
		WHERE h.status='enabled'
			AND u.status='enabled'
			AND u.email=EMAIL_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getHelp_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getHelp_Tags`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT `id`, `help_id`, `tag_id`, `create_date` 
	FROM `Help_Tags` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getJob` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getJob`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `title`, `description`, `pay`, `compound`, `status`, `start_date`, `end_date`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Job` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getJob_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getJob_Tags`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT `id`, `job_id`, `tag_id`, `create_date` 
	FROM `Job_Tags` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getLink` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getLink`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT `id`, `user_id`, `url`, `clicks`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Link` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getLink_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getLink_Tags`(IN ID_VALUE int(20) unsigned)
BEGIN
	SELECT `id`, `link_id`, `tag_id`, `create_date` 
	FROM `Link_Tags` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getLocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getLocation`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `coworking_space_id`, `address1`, `address2`, `city`, `state`, `zip`, `country`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Location` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getLocationUserStatusNewbies` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getLocationUserStatusNewbies`(IN LOCATION_ID_VALUE INT(10) UNSIGNED)
BEGIN
	SELECT 
		lus.location_id, 
		l.coworking_space_id, 
		cs.name as coworking_space_name, 
		lus.user_id, 
		u.fullName,
		ui.image, 
		o.id as office_id, 
		o.name as office_name,
		o.floor
	FROM Location_User_Status lus
		JOIN Location l
			ON lus.location_id=l.id
		JOIN Coworking_Space cs
			ON l.coworking_space_id=cs.id
		JOIN User u
			ON lus.user_id=u.id
		JOIN User_Image ui						
			ON u.user_image_id=ui.id
		JOIN User_Office uo
			ON uo.user_id=lus.user_id
		JOIN Office o
			ON o.id = uo.office_id
		WHERE lus.location_id=LOCATION_ID_VALUE
		AND DATE(lus.check_in)=CURDATE()
		AND uo.status='enabled'
		AND o.status='enabled'
		AND DATE(u.create_date) > DATE_SUB(CURDATE(),INTERVAL 1 MONTH)
		AND lus.check_out=NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getLocationUserStatusReturning` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getLocationUserStatusReturning`(IN LOCATION_ID_VALUE INT(10) UNSIGNED)
BEGIN
	SELECT 
		lus.location_id, 
		l.coworking_space_id, 
		cs.name as coworking_space_name, 
		lus.user_id, 
		u.fullName,
		ui.image, 
		o.id as office_id, 
		o.name as office_name,
		o.floor
	FROM Location_User_Status lus
		JOIN Location l
			ON lus.location_id=l.id
		JOIN Coworking_Space cs
			ON l.coworking_space_id=cs.id
		JOIN User u
			ON lus.user_id=u.id
		JOIN User_Image ui						
			ON u.user_image_id=ui.id
		JOIN User_Office uo
			ON uo.user_id=lus.user_id
		JOIN Office o
			ON o.id = uo.office_id
		WHERE lus.location_id=LOCATION_ID_VALUE
		AND DATE(lus.check_in)=CURDATE()
		AND uo.status='enabled'
		AND o.status='enabled'
		AND DATE(u.create_date) < DATE_SUB(CURDATE(),INTERVAL 1 MONTH)
		AND lus.check_out=NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getLocation_User_Status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getLocation_User_Status`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `location_id`, `user_id`, `check_in`, `check_out`, `time_on_location` 
	FROM `Location_User_Status` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getMentorMeetingAvailabilityByUserID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getMentorMeetingAvailabilityByUserID`(USER_ID_VALUE INT(10) UNSIGNED)
BEGIN
	SELECT ma.id, DATE_FORMAT(ma.start_time,'%M') as `month`, DATE_FORMAT(ma.start_time,'%D') as `day`, DATE_FORMAT(ma.start_time,'%r') as `start_time`,DATE_FORMAT(ma.end_time,'%r') as `end_time`
	FROM Mentor_Availability ma	
	WHERE 
		ma.start_time > NOW()
		AND ma.status='enabled'	
		AND ma.user_id=USER_ID_VALUE
		AND ma.id NOT IN (
			SELECT mentor_availability_id FROM Mentor_Meeting WHERE status='enabled'
		);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getMentor_Availability` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getMentor_Availability`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `start_time`, `end_time`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Mentor_Availability` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getMentor_Meeting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getMentor_Meeting`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `mentor_availability_id`, `user_id`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Mentor_Meeting` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getOffice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getOffice`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `location_id`, `name`, `floor`, `max_capacity`, `current_capacity`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Office` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPassword`(IN EMAIL_VALUE VARCHAR(128))
BEGIN
	SELECT `id`,`password` FROM User WHERE email=EMAIL_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getQuestion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getQuestion`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `title`, `description`, `status`, `thread`, `answer_id`, `views`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Question` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getQuestionByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getQuestionByID`(QUESTION_ID_VALUE INT(10) UNSIGNED)
BEGIN
	SELECT SUM(qv.vote) as vote,q.id,q.user_id, u.fullName, q.title, q.description, date_format(q.create_date,'%r  %M %D, %Y') as create_date
	FROM Question q
	JOIN Question_Vote qv
		ON qv.question_id=q.id
	JOIN User u
		ON u.id=q.user_id
	WHERE q.id=QUESTION_ID_VALUE;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getQuestionByIDSafe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getQuestionByIDSafe`(QUESTION_ID_VALUE INT(10) UNSIGNED)
BEGIN
	SELECT SUM(qv.vote) as vote,q.id,q.user_id, u.fullName, q.title, q.description, date_format(q.create_date,'%r  %M %D, %Y') as create_date
	FROM Question q
	JOIN Question_Vote qv
		ON qv.question_id=q.id
	JOIN User u
		ON u.id=q.user_id
	WHERE q.id=QUESTION_ID_VALUE
	AND q.user_id NOT IN (select user_id FROM User_Cave WHERE status='enabled');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getQuestionTagsByQuestionID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getQuestionTagsByQuestionID`(QUESTION_ID_VALUE INT(10) UNSIGNED)
BEGIN
	SELECT qt.tag_id, t.tag FROM Question_Tags qt
	JOIN Tags t
		ON t.id=qt.tag_id
	WHERE qt.question_id=QUESTION_ID_VALUE
	AND qt.status='enabled'
	ORDER BY t.tag;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getQuestion_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getQuestion_Tags`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `question_id`, `tag_id`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Question_Tags` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getQuestion_Vote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getQuestion_Vote`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `question_id`, `user_id`, `vote`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Question_Vote` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getReferral` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getReferral`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT `id`, `user_id`, `event_id`, `key`, `clicks`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Referral` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getResponse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getResponse`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `question_id`, `user_id`, `response`, `status`, `thread`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Response` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getResponsesByQuestionID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getResponsesByQuestionID`(QUESTION_ID_VALUE INT(10) UNSIGNED)
BEGIN	
		SELECT SUM(rv.vote) as vote,r.id,r.title, r.response, date_format(r.create_date,'%r  %M %D, %Y') as create_date,r.user_id,u.fullName
		FROM Response r
		LEFT JOIN User u
			ON u.id=r.user_id
		LEFT JOIN Response_Vote rv
			ON rv.response_id=r.id
		WHERE r.question_id=QUESTION_ID_VALUE
		ORDER BY r.create_date DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getResponsesByQuestionIDSafe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getResponsesByQuestionIDSafe`(QUESTION_ID_VALUE INT(10) UNSIGNED)
BEGIN
		SELECT SUM(rv.vote) as vote,r.id,r.title, r.response, date_format(r.create_date,'%r  %M %D, %Y') as create_date,r.user_id,u.fullName
		FROM Response r
		LEFT JOIN User u
			ON r.user_id=u.id
		LEFT JOIN Response_Vote rv			
			ON rv.response_id=r.id
		WHERE r.question_id=QUESTION_ID_VALUE
		AND r.user_id NOT IN (SELECT user_id FROM User_Cave WHERE status='enabled')
		ORDER BY r.create_date DESC
		;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getResponse_Vote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getResponse_Vote`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `response_id`, `user_id`, `vote`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Response_Vote` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getTags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getTags`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `tag`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `Tags` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUser`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `fullName`, `email`, `password`, `server_id`, `user_image_id`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `User` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserBioByUserID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserBioByUserID`(USER_ID_VALUE INT(10) UNSIGNED)
BEGIN
	SELECT id, description
	FROM User_Bio
		WHERE 
			user_id=USER_ID_VALUE
			AND status='enabled'
		ORDER BY create_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserCirclesByUserID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserCirclesByUserID`(USER_ID_VALUE INT(10) UNSIGNED)
BEGIN
	SELECT uc.id, uc.circle_id, c.title, uc.member_type
	FROM User_Circle uc
	JOIN Circle c
		ON uc.circle_id=c.id
	WHERE uc.status='enabled'
		AND c.status='enabled'
		AND uc.user_id=USER_ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserCompanyByUserID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserCompanyByUserID`(USER_ID_VALUE INT(10) UNSIGNED)
BEGIN
	SELECT
		uc.id,uc.company_id, c.title, c.status as company_status, c.description, c.url,uc.status as user_status
	FROM User_Company uc
	JOIN Company c
		ON uc.company_id=c.id
	WHERE uc.user_id=USER_ID_VALUE
	ORDER BY uc.create_date DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserNameAndCave` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserNameAndCave`(IN USER_ID_VALUE INT(10) UNSIGNED)
BEGIN
SELECT u.`fullName`, uc.`status` FROM User u
	LEFT JOIN User_Cave uc ON uc.`user_id`=u.`id`
	WHERE u.id=USER_ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserTagsByUserID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserTagsByUserID`(USER_ID_VALUE INT(10) UNSIGNED)
BEGIN
	SELECT ut.tags_id,t.tag 
	FROM User_Tags ut
	JOIN Tags t
		ON ut.tags_id=t.id
	WHERE 
		ut.status='enabled' 
		AND ut.user_id=USER_ID_VALUE
	ORDER BY t.tag;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserTypeByUserID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserTypeByUserID`(IN USER_ID_VALUE INT(10) UNSIGNED)
BEGIN
	SELECT `type` FROM User_Type WHERE `user_id`=USER_ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUser_Address` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUser_Address`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `address`, `address2`, `city`, `state`, `zip`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `User_Address` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUser_Billing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUser_Billing`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `coworking_space_billing_plan_id`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `User_Billing` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUser_Bio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUser_Bio`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `description`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `User_Bio` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUser_Cave` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUser_Cave`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `User_Cave` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUser_Circle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUser_Circle`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `circle_id`, `user_id`, `member_type`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `User_Circle` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUser_Company` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUser_Company`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `company_id`, `user_id`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `User_Company` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUser_Contact` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUser_Contact`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `contact_description_id`, `contact_value`, `status`, `thread`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `User_Contact` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUser_Image` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUser_Image`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT `id`, `user_id`, `image`, `status`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `User_Image` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUser_Invite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUser_Invite`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `email`, `key`, `status`, `create_date`, `expire_date` 
	FROM `User_Invite` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUser_Login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUser_Login`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT `id`, `user_id`, `ip`, `login_time`, `logout_time`, `time_online` 
	FROM `User_Login` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUser_Office` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUser_Office`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `office_id`, `status`, `create_date`, `modify_date`, `modfiy_user`, `modify_reason` 
	FROM `User_Office` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUser_Stripe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUser_Stripe`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `stripe_token`, `last_checked`, `is_active`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `User_Stripe` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUser_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUser_Tags`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT `id`, `user_id`, `tags_id`, `status`, `create_date`, `modify_date` 
	FROM `User_Tags` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUser_Time` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUser_Time`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `giving_user_id`, `taking_user_id`, `start_time`, `end_time`, `total_time` 
	FROM `User_Time` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUser_Type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUser_Type`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT `id`, `user_id`, `type`, `create_date`, `modify_date`, `modify_user`, `modify_reason` 
	FROM `User_Type` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertBilling_Plan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertBilling_Plan`(IN TITLE_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN PRICE_VALUE float(8,2) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Billing_Plan` (`title`, `description`, `price`, `status`, `create_date`) 
	VALUES (TITLE_VALUE, DESCRIPTION_VALUE, PRICE_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertCircle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertCircle`(IN USER_ID_VALUE int(10) unsigned, IN TITLE_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Circle` (`user_id`, `title`, `description`, `status`, `create_date`) 
	VALUES (USER_ID_VALUE, TITLE_VALUE, DESCRIPTION_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertCircle_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertCircle_Tags`(IN CIRCLE_ID_VALUE int(10) unsigned, IN TAG_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Circle_Tags` (`circle_id`, `tag_id`, `status`, `create_date`) 
	VALUES (CIRCLE_ID_VALUE, TAG_ID_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertCompany` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertCompany`(IN TITLE_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN URL_VALUE varchar(128), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Company` (`title`, `description`, `url`, `status`, `create_date`) 
	VALUES (TITLE_VALUE, DESCRIPTION_VALUE, URL_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertCompany_Location` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertCompany_Location`(IN COMPANY_ID_VALUE int(10) unsigned, IN LOCATION_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Company_Location` (`company_id`, `location_id`, `status`, `create_date`) 
	VALUES (COMPANY_ID_VALUE, LOCATION_ID_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertCompany_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertCompany_Tags`(IN COMPANY_ID_VALUE int(10) unsigned, IN TAG_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Company_Tags` (`company_id`, `tag_id`, `status`, `create_date`) 
	VALUES (COMPANY_ID_VALUE, TAG_ID_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertConference_Room` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertConference_Room`(IN LOCATION_ID_VALUE int(10) unsigned, IN NAME_VALUE varchar(128), IN FLOOR_VALUE tinyint(3), IN MAX_CAPACITY_VALUE tinyint(3), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Conference_Room` (`location_id`, `name`, `floor`, `max_capacity`, `status`, `create_date`) 
	VALUES (LOCATION_ID_VALUE, NAME_VALUE, FLOOR_VALUE, MAX_CAPACITY_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertContact_Description` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertContact_Description`(IN TITLE_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Contact_Description` (`title`, `description`, `status`, `create_date`) 
	VALUES (TITLE_VALUE, DESCRIPTION_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertCoworking_Space` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertCoworking_Space`(IN NAME_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN URL_VALUE varchar(128), IN USER_URL_STUB_VALUE varchar(128), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Coworking_Space` (`name`, `description`, `url`, `user_url_stub`, `status`, `create_date`) 
	VALUES (NAME_VALUE, DESCRIPTION_VALUE, URL_VALUE, USER_URL_STUB_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertCoworking_Space_Billing_Plan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertCoworking_Space_Billing_Plan`(IN COWORKING_SPACE_ID_VALUE int(10) unsigned, IN BILLING_PLAN_ID_VALUE int(10) unsigned, IN STRIPE_STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Coworking_Space_Billing_Plan` (`coworking_space_id`, `billing_plan_id`, `stripe_status`, `create_date`) 
	VALUES (COWORKING_SPACE_ID_VALUE, BILLING_PLAN_ID_VALUE, STRIPE_STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertCoworking_Stripe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertCoworking_Stripe`(IN COWORKING_ID_VALUE int(10) unsigned, IN LIVE_VALUE enum('test','live'), IN TYPE_VALUE enum('public','private'), IN KEY_VALUE varchar(64), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Coworking_Stripe` (`coworking_id`, `live`, `type`, `key`, `status`, `create_date`) 
	VALUES (COWORKING_ID_VALUE, LIVE_VALUE, TYPE_VALUE, KEY_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertEvent`(IN USER_ID_VALUE int(10) unsigned, IN TITLE_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN START_TIME_VALUE timestamp, IN END_TIME_VALUE timestamp, IN URL_VALUE varchar(128), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Event` (`user_id`, `title`, `description`, `start_time`, `end_time`, `url`, `status`, `create_date`) 
	VALUES (USER_ID_VALUE, TITLE_VALUE, DESCRIPTION_VALUE, START_TIME_VALUE, END_TIME_VALUE, URL_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertEvent_Attendance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertEvent_Attendance`(IN EVENT_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Event_Attendance` (`event_id`, `user_id`, `create_date`) 
	VALUES (EVENT_ID_VALUE, USER_ID_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertEvent_Room` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertEvent_Room`(IN EVENT_ID_VALUE int(10) unsigned, IN CONFERENCE_ROOM_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Event_Room` (`event_id`, `conference_room_id`, `status`, `create_date`) 
	VALUES (EVENT_ID_VALUE, CONFERENCE_ROOM_ID_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertEvent_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertEvent_Tags`(IN EVENT_ID_VALUE int(10) unsigned, IN TAG_ID_VALUE int(10) unsigned, IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE bigint(20) unsigned)
BEGIN
	INSERT INTO `Event_Tags` (`event_id`, `tag_id`, `create_date`) 
	VALUES (EVENT_ID_VALUE, TAG_ID_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertHelp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertHelp`(IN USER_ID_VALUE int(10) unsigned, IN TITLE_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN ESTIMATED_TIME_VALUE time, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Help` (`user_id`, `title`, `description`, `estimated_time`, `status`, `create_date`) 
	VALUES (USER_ID_VALUE, TITLE_VALUE, DESCRIPTION_VALUE, ESTIMATED_TIME_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertHelp_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertHelp_Tags`(IN HELP_ID_VALUE int(10) unsigned, IN TAG_ID_VALUE int(10) unsigned, IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE bigint(20) unsigned)
BEGIN
	INSERT INTO `Help_Tags` (`help_id`, `tag_id`, `create_date`) 
	VALUES (HELP_ID_VALUE, TAG_ID_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertJob` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertJob`(IN USER_ID_VALUE int(10) unsigned, IN TITLE_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN PAY_VALUE float(8,2) unsigned, IN COMPOUND_VALUE enum('hour','day','week','month','year','flat'), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN START_DATE_VALUE timestamp, IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Job` (`user_id`, `title`, `description`, `pay`, `compound`, `status`, `start_date`, `create_date`) 
	VALUES (USER_ID_VALUE, TITLE_VALUE, DESCRIPTION_VALUE, PAY_VALUE, COMPOUND_VALUE, STATUS_VALUE, START_DATE_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertJob_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertJob_Tags`(IN JOB_ID_VALUE int(10) unsigned, IN TAG_ID_VALUE int(10) unsigned, IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE bigint(20) unsigned)
BEGIN
	INSERT INTO `Job_Tags` (`job_id`, `tag_id`, `create_date`) 
	VALUES (JOB_ID_VALUE, TAG_ID_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertLink` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertLink`(IN USER_ID_VALUE int(10) unsigned, IN URL_VALUE varchar(128), IN CLICKS_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE bigint(20) unsigned)
BEGIN
	INSERT INTO `Link` (`user_id`, `url`, `clicks`, `status`, `create_date`) 
	VALUES (USER_ID_VALUE, URL_VALUE, CLICKS_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertLink_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertLink_Tags`(IN LINK_ID_VALUE bigint(20) unsigned, IN TAG_ID_VALUE int(10) unsigned, IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(20) unsigned)
BEGIN
	INSERT INTO `Link_Tags` (`link_id`, `tag_id`, `create_date`) 
	VALUES (LINK_ID_VALUE, TAG_ID_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertLocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertLocation`(IN COWORKING_SPACE_ID_VALUE int(10) unsigned, IN ADDRESS1_VALUE varchar(128), IN CITY_VALUE varchar(128), IN STATE_VALUE char(2), IN ZIP_VALUE varchar(5), IN COUNTRY_VALUE varchar(128), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Location` (`coworking_space_id`, `address1`, `city`, `state`, `zip`, `country`, `status`, `create_date`) 
	VALUES (COWORKING_SPACE_ID_VALUE, ADDRESS1_VALUE, CITY_VALUE, STATE_VALUE, ZIP_VALUE, COUNTRY_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertLocation_User_Status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertLocation_User_Status`(IN LOCATION_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN CHECK_IN_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Location_User_Status` (`location_id`, `user_id`, `check_in`) 
	VALUES (LOCATION_ID_VALUE, USER_ID_VALUE, CHECK_IN_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertMentor_Availability` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertMentor_Availability`(IN USER_ID_VALUE int(10) unsigned, IN START_TIME_VALUE timestamp, IN END_TIME_VALUE timestamp, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Mentor_Availability` (`user_id`, `start_time`, `end_time`, `status`, `create_date`) 
	VALUES (USER_ID_VALUE, START_TIME_VALUE, END_TIME_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertMentor_Meeting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertMentor_Meeting`(IN MENTOR_AVAILABILITY_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Mentor_Meeting` (`mentor_availability_id`, `user_id`, `status`, `create_date`) 
	VALUES (MENTOR_AVAILABILITY_ID_VALUE, USER_ID_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertOffice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertOffice`(IN LOCATION_ID_VALUE int(10) unsigned, IN NAME_VALUE varchar(128), IN FLOOR_VALUE tinyint(3), IN MAX_CAPACITY_VALUE tinyint(3) unsigned, IN CURRENT_CAPACITY_VALUE tinyint(3) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Office` (`location_id`, `name`, `floor`, `max_capacity`, `current_capacity`, `status`, `create_date`) 
	VALUES (LOCATION_ID_VALUE, NAME_VALUE, FLOOR_VALUE, MAX_CAPACITY_VALUE, CURRENT_CAPACITY_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertQuestion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertQuestion`(IN USER_ID_VALUE int(10) unsigned, IN TITLE_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN STATUS_VALUE enum('pending','enabled','disabled','retired'),  OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Question` (`user_id`, `title`, `description`, `status`, `views`, `create_date`) 
	VALUES (USER_ID_VALUE, TITLE_VALUE, DESCRIPTION_VALUE, STATUS_VALUE,  0, NOW());
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertQuestion_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertQuestion_Tags`(IN QUESTION_ID_VALUE int(10) unsigned, IN TAG_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Question_Tags` (`question_id`, `tag_id`, `status`, `create_date`) 
	VALUES (QUESTION_ID_VALUE, TAG_ID_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertQuestion_Vote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertQuestion_Vote`(IN QUESTION_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN VOTE_VALUE tinyint(3), OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Question_Vote` (`question_id`, `user_id`, `vote`, `create_date`) 
	VALUES (QUESTION_ID_VALUE, USER_ID_VALUE, VOTE_VALUE, NOW());
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertReferral` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertReferral`(IN USER_ID_VALUE int(10) unsigned, IN EVENT_ID_VALUE int(10) unsigned, IN KEY_VALUE varchar(64), IN CLICKS_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE bigint(20) unsigned)
BEGIN
	INSERT INTO `Referral` (`user_id`, `event_id`, `key`, `clicks`, `status`, `create_date`) 
	VALUES (USER_ID_VALUE, EVENT_ID_VALUE, KEY_VALUE, CLICKS_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertResponse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertResponse`(IN QUESTION_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN RESPONSE_VALUE text, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN THREAD_VALUE int(10) unsigned, IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Response` (`question_id`, `user_id`, `response`, `status`, `thread`, `create_date`) 
	VALUES (QUESTION_ID_VALUE, USER_ID_VALUE, RESPONSE_VALUE, STATUS_VALUE, THREAD_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertResponse_Vote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertResponse_Vote`(IN RESPONSE_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN VOTE_VALUE tinyint(3), OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Response_Vote` (`response_id`, `user_id`, `vote`, `create_date`) 
	VALUES (RESPONSE_ID_VALUE, USER_ID_VALUE, VOTE_VALUE, NOW());
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertTags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertTags`(IN TAG_VALUE varchar(64), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `Tags` (`tag`, `status`, `create_date`) 
	VALUES (TAG_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUser`(IN FULLNAME_VALUE varchar(128), IN EMAIL_VALUE varchar(128), IN PASSWORD_VALUE varchar(128), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `User` (`fullName`, `email`, `password`, `status`, `create_date`) 
	VALUES (FULLNAME_VALUE, EMAIL_VALUE, PASSWORD_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUser_Address` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUser_Address`(IN USER_ID_VALUE int(10) unsigned, IN ADDRESS_VALUE varchar(128), IN CITY_VALUE varchar(128), IN STATE_VALUE char(2), IN ZIP_VALUE varchar(5), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `User_Address` (`user_id`, `address`, `city`, `state`, `zip`, `status`, `create_date`) 
	VALUES (USER_ID_VALUE, ADDRESS_VALUE, CITY_VALUE, STATE_VALUE, ZIP_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUser_Billing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUser_Billing`(IN USER_ID_VALUE int(10) unsigned, IN COWORKING_SPACE_BILLING_PLAN_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `User_Billing` (`user_id`, `coworking_space_billing_plan_id`, `status`, `create_date`) 
	VALUES (USER_ID_VALUE, COWORKING_SPACE_BILLING_PLAN_ID_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUser_Bio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUser_Bio`(IN USER_ID_VALUE int(10) unsigned, IN DESCRIPTION_VALUE text, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `User_Bio` (`user_id`, `description`, `status`, `create_date`) 
	VALUES (USER_ID_VALUE, DESCRIPTION_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUser_Cave` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUser_Cave`(IN USER_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `User_Cave` (`user_id`, `status`, `create_date`) 
	VALUES (USER_ID_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUser_Circle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUser_Circle`(IN CIRCLE_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN MEMBER_TYPE_VALUE enum('basic','manager','owner'), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `User_Circle` (`circle_id`, `user_id`, `member_type`, `status`, `create_date`) 
	VALUES (CIRCLE_ID_VALUE, USER_ID_VALUE, MEMBER_TYPE_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUser_Company` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUser_Company`(IN COMPANY_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `User_Company` (`company_id`, `user_id`, `status`, `create_date`) 
	VALUES (COMPANY_ID_VALUE, USER_ID_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUser_Contact` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUser_Contact`(IN USER_ID_VALUE int(10) unsigned, IN CONTACT_DESCRIPTION_ID_VALUE int(10) unsigned, IN CONTACT_VALUE_VALUE varchar(128), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `User_Contact` (`user_id`, `contact_description_id`, `contact_value`, `status`, `create_date`) 
	VALUES (USER_ID_VALUE, CONTACT_DESCRIPTION_ID_VALUE, CONTACT_VALUE_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUser_Image` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUser_Image`(IN USER_ID_VALUE int(10) unsigned, IN IMAGE_VALUE varchar(128), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE bigint(20) unsigned)
BEGIN
	INSERT INTO `User_Image` (`user_id`, `image`, `status`, `create_date`) 
	VALUES (USER_ID_VALUE, IMAGE_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUser_Invite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUser_Invite`(IN USER_ID_VALUE int(10) unsigned, IN EMAIL_VALUE varchar(128), IN KEY_VALUE varchar(64), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN EXPIRE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `User_Invite` (`user_id`, `email`, `key`, `status`, `create_date`, `expire_date`) 
	VALUES (USER_ID_VALUE, EMAIL_VALUE, KEY_VALUE, STATUS_VALUE, CREATE_DATE_VALUE, EXPIRE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUser_Login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUser_Login`(IN USER_ID_VALUE int(10) unsigned, IN IP_VALUE varchar(15), IN LOGIN_TIME_VALUE timestamp, OUT ID_VALUE bigint(20) unsigned)
BEGIN
	INSERT INTO `User_Login` (`user_id`, `ip`, `login_time`) 
	VALUES (USER_ID_VALUE, IP_VALUE, LOGIN_TIME_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUser_Office` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUser_Office`(IN USER_ID_VALUE int(10) unsigned, IN OFFICE_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `User_Office` (`user_id`, `office_id`, `status`, `create_date`) 
	VALUES (USER_ID_VALUE, OFFICE_ID_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUser_Stripe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUser_Stripe`(IN USER_ID_VALUE int(10) unsigned, IN STRIPE_TOKEN_VALUE varchar(64), IN LAST_CHECKED_VALUE timestamp, IN IS_ACTIVE_VALUE tinyint(1) unsigned, IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `User_Stripe` (`user_id`, `stripe_token`, `last_checked`, `is_active`, `create_date`) 
	VALUES (USER_ID_VALUE, STRIPE_TOKEN_VALUE, LAST_CHECKED_VALUE, IS_ACTIVE_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUser_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUser_Tags`(IN USER_ID_VALUE int(10) unsigned, IN TAGS_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE bigint(20) unsigned)
BEGIN
	INSERT INTO `User_Tags` (`user_id`, `tags_id`, `status`, `create_date`) 
	VALUES (USER_ID_VALUE, TAGS_ID_VALUE, STATUS_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUser_Time` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUser_Time`(IN GIVING_USER_ID_VALUE int(10) unsigned, IN TAKING_USER_ID_VALUE int(10) unsigned, IN START_TIME_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `User_Time` (`giving_user_id`, `taking_user_id`, `start_time`) 
	VALUES (GIVING_USER_ID_VALUE, TAKING_USER_ID_VALUE, START_TIME_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUser_Type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUser_Type`(IN USER_ID_VALUE int(10) unsigned, IN TYPE_VALUE enum('prospect','community','desk','management','administrator'), IN CREATE_DATE_VALUE timestamp, OUT ID_VALUE int(10) unsigned)
BEGIN
	INSERT INTO `User_Type` (`user_id`, `type`, `create_date`) 
	VALUES (USER_ID_VALUE, TYPE_VALUE, CREATE_DATE_VALUE);
	SELECT LAST_INSERT_ID() INTO ID_VALUE; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `loginAttempt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `loginAttempt`(IN EMAIL_VALUE VARCHAR(128), IN PASSWORD_VALUE VARCHAR(128), IN IP_VALUE VARCHAR(15), OUT USER_ID_VALUE INT(10))
BEGIN
	SELECT id INTO @id FROM User WHERE email=EMAIL_VALUE;
	SELECT 1 INTO @login_okay FROM User WHERE email=EMAIL_VALUE AND password=PASSWORD_VALUE AND status='enabled';
	SELECT NOW() INTO @tmstmp;
	IF @login_okay > 0 THEN
		-- they logged in earlier
		SELECT id INTO @last_login FROM User_Login WHERE user_id=@id AND DATE(login_time)=DATE(@tmstmp) AND logout_time IS NULL ORDER BY login_time DESC LIMIT 1;
		IF @last_login > 0 THEN
			UPDATE User_Login SET logout_time=@tmstmp, time_online=(logout_time - login_time) WHERE id=@last_login;
		END IF;
		INSERT INTO User_Login (user_id,ip,failure,login_time,create_date) VALUES (@id,IP_VALUE,0,@tmstmp,@tmstmp);
		SELECT @id INTO USER_ID_VALUE;
	ELSE 
		INSERT INTO User_Login (user_id,ip,failure,create_date) VALUES (@id,IP_VALUE,1,@tmstmp);
		SELECT count(1) INTO @failure_count FROM User_Login WHERE user_id=@id AND create_date=DATE(@tmstmp);		
		IF @failure_count > 5 THEN
			UPDATE User SET status='disabled',modify_date=@tmstmp,modify_user=1,modify_reason='Excessive login failures' WHERE id=@id;			
		END IF;
		SELECT -@failure_count INTO USER_ID_VALUE;
	END IF;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `migrateUserBilling` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `migrateUserBilling`()
BEGIN
-- Migrate Non-state Members
INSERT INTO coworks_in.`User_Billing`(`user_id`,`coworking_space_billing_plan_id`,`status`,`create_date`,`modify_date`,`modify_user`,`modify_reason`)
SELECT gpmp.`user_id` , '1', 'enabled', gpau.`date_joined` , NOW( ) , '587', 'Migrating over billing plans'
FROM geekdom_production.`manager_userprofile` gpmp
JOIN geekdom_production.`auth_user` gpau ON gpmp.`user_id` = gpau.`id`
WHERE gpau.`id`
IN (SELECT `id`
FROM coworks_in.`User`
)
AND gpmp.`membership_type_id` =7;

-- Migrate Students
INSERT INTO coworks_in.`User_Billing`(`user_id`,`coworking_space_billing_plan_id`,`status`,`create_date`,`modify_date`,`modify_user`,`modify_reason`)
SELECT gpmp.`user_id` , '2', 'enabled', gpau.`date_joined` , NOW( ) , '587', 'Migrating over billing plans'
FROM geekdom_production.`manager_userprofile` gpmp
JOIN geekdom_production.`auth_user` gpau ON gpmp.`user_id` = gpau.`id`
WHERE gpau.`id`
IN (SELECT `id`
FROM coworks_in.`User`
)
AND gpmp.`membership_type_id` =3;

-- Migrate Rackspace Members
INSERT INTO coworks_in.`User_Billing`(`user_id`,`coworking_space_billing_plan_id`,`status`,`create_date`,`modify_date`,`modify_user`,`modify_reason`)
SELECT gpmp.`user_id` , '3', 'enabled', gpau.`date_joined` , NOW( ) , '587', 'Migrating over billing plans'
FROM geekdom_production.`manager_userprofile` gpmp
JOIN geekdom_production.`auth_user` gpau ON gpmp.`user_id` = gpau.`id`
WHERE gpau.`id`
IN (SELECT `id`
FROM coworks_in.`User`
)
AND gpmp.`membership_type_id` =9;

-- Migrate Community Members
INSERT INTO coworks_in.`User_Billing`(`user_id`,`coworking_space_billing_plan_id`,`status`,`create_date`,`modify_date`,`modify_user`,`modify_reason`)
SELECT gpmp.`user_id` , '4', 'enabled', gpau.`date_joined` , NOW( ) , '587', 'Migrating over billing plans'
FROM geekdom_production.`manager_userprofile` gpmp
JOIN geekdom_production.`auth_user` gpau ON gpmp.`user_id` = gpau.`id`
WHERE gpau.`id`
IN (SELECT `id`
FROM coworks_in.`User`
)
AND gpmp.`membership_type_id` =1;

-- Migrate Old Startup Price
INSERT INTO coworks_in.`User_Billing`(`user_id`,`coworking_space_billing_plan_id`,`status`,`create_date`,`modify_date`,`modify_user`,`modify_reason`)
SELECT gpmp.`user_id` , '5', 'retired', gpau.`date_joined` , '2012-12-31 23:59:59' , '587', 'Migrating over billing plans'
FROM geekdom_production.`manager_userprofile` gpmp
JOIN geekdom_production.`auth_user` gpau ON gpmp.`user_id` = gpau.`id`
WHERE gpau.`id`
IN (SELECT `id`
FROM coworks_in.`User`
)
AND gpmp.`membership_type_id` =5;

-- Old Business Price
INSERT INTO coworks_in.`User_Billing`(`user_id`,`coworking_space_billing_plan_id`,`status`,`create_date`,`modify_date`,`modify_user`,`modify_reason`)
SELECT gpmp.`user_id` , '6', 'retired', gpau.`date_joined` , '2012-12-31 23:59:59' , '587', 'Migrating over billing plans'
FROM geekdom_production.`manager_userprofile` gpmp
JOIN geekdom_production.`auth_user` gpau ON gpmp.`user_id` = gpau.`id`
WHERE gpau.`id`
IN (SELECT `id`
FROM coworks_in.`User`
)
AND gpmp.`membership_type_id` =4;

-- Old Dedicated Desk
INSERT INTO coworks_in.`User_Billing`(`user_id`,`coworking_space_billing_plan_id`,`status`,`create_date`,`modify_date`,`modify_user`,`modify_reason`)
SELECT gpmp.`user_id` , '7', 'retired', gpau.`date_joined` , '2012-12-31 23:59:59' , '587', 'Migrating over billing plans'
FROM geekdom_production.`manager_userprofile` gpmp
JOIN geekdom_production.`auth_user` gpau ON gpmp.`user_id` = gpau.`id`
WHERE gpau.`id`
IN (SELECT `id`
FROM coworks_in.`User`
)
AND gpmp.`membership_type_id` =2;

-- New Startup Pricing For New Members
INSERT INTO coworks_in.`User_Billing`(`user_id`,`coworking_space_billing_plan_id`,`status`,`create_date`,`modify_date`,`modify_user`,`modify_reason`)
SELECT gpmp.`user_id` , '8', 'enabled', gpau.`date_joined` , NOW( ) , '587', 'Migrating over billing plans'
FROM geekdom_production.`manager_userprofile` gpmp
JOIN geekdom_production.`auth_user` gpau ON gpmp.`user_id` = gpau.`id`
WHERE gpau.`id`
IN (SELECT `id`
FROM coworks_in.`User`
)
AND gpmp.`membership_type_id` =5
AND DATE(gpau.`date_joined`) > DATE("2013-01-01");

-- New Startup Pricing For Existing Members
INSERT INTO coworks_in.`User_Billing`(`user_id`,`coworking_space_billing_plan_id`,`status`,`create_date`,`modify_date`,`modify_user`,`modify_reason`)
SELECT gpmp.`user_id` , '8', 'enabled', DATE("2013-01-01") , NOW() , '587', 'Migrating over billing plans'
FROM geekdom_production.`manager_userprofile` gpmp
JOIN geekdom_production.`auth_user` gpau ON gpmp.`user_id` = gpau.`id`
WHERE gpau.`id`
IN (SELECT `id`
FROM coworks_in.`User`
)
AND gpmp.`membership_type_id` =5
AND DATE(gpau.`date_joined`) < DATE("2013-01-01");

-- New Business Desk Pricing for New Members
INSERT INTO coworks_in.`User_Billing`(`user_id`,`coworking_space_billing_plan_id`,`status`,`create_date`,`modify_date`,`modify_user`,`modify_reason`)
SELECT gpmp.`user_id` , '9', 'enabled', gpau.`date_joined` , NOW( ) , '587', 'Migrating over billing plans'
FROM geekdom_production.`manager_userprofile` gpmp
JOIN geekdom_production.`auth_user` gpau ON gpmp.`user_id` = gpau.`id`
WHERE gpau.`id`
IN (SELECT `id`
FROM coworks_in.`User`
)
AND gpmp.`membership_type_id` =4
AND DATE(gpau.`date_joined`) > DATE("2013-01-01");

-- New Business Desk Pricing for Existing Members
INSERT INTO coworks_in.`User_Billing`(`user_id`,`coworking_space_billing_plan_id`,`status`,`create_date`,`modify_date`,`modify_user`,`modify_reason`)
SELECT gpmp.`user_id` , '9', 'enabled', DATE("2013-01-01") , NOW( ) , '587', 'Migrating over billing plans'
FROM geekdom_production.`manager_userprofile` gpmp
JOIN geekdom_production.`auth_user` gpau ON gpmp.`user_id` = gpau.`id`
WHERE gpau.`id`
IN (SELECT `id`
FROM coworks_in.`User`
)
AND gpmp.`membership_type_id` =4
AND DATE(gpau.`date_joined`) < DATE("2013-01-01");

-- Migrate Staff Pricing
INSERT INTO coworks_in.`User_Billing`(`user_id`,`coworking_space_billing_plan_id`,`status`,`create_date`,`modify_date`,`modify_user`,`modify_reason`)
SELECT gpmp.`user_id` , '10', 'enabled', gpau.`date_joined` , NOW( ) , '587', 'Migrating over billing plans'
FROM geekdom_production.`manager_userprofile` gpmp
JOIN geekdom_production.`auth_user` gpau ON gpmp.`user_id` = gpau.`id`
WHERE gpau.`id`
IN (SELECT `id`
FROM coworks_in.`User`
)
AND gpmp.`membership_type_id` =8;

-- Migrate Techstars
INSERT INTO coworks_in.`User_Billing`
(`user_id`,`coworking_space_billing_plan_id`,`status`,`create_date`,`modify_date`,`modify_user`,`modify_reason`)
SELECT gpmp.`user_id` , '11', 'enabled', gpau.`date_joined` , NOW( ) , '587', 'Migrating over billing plans'
FROM geekdom_production.`manager_userprofile` gpmp
JOIN geekdom_production.`auth_user` gpau ON gpmp.`user_id` = gpau.`id`
WHERE gpau.`id`
IN (SELECT `id`
FROM coworks_in.`User`
)
AND gpmp.`membership_type_id` =10;

-- Migrate Geekdom Fund
INSERT INTO coworks_in.`User_Billing`(`user_id`,`coworking_space_billing_plan_id`,`status`,`create_date`,`modify_date`,`modify_user`,`modify_reason`)
SELECT gpmp.`user_id` , '12', 'enabled', gpau.`date_joined` , NOW( ) , '587', 'Migrating over billing plans'
FROM geekdom_production.`manager_userprofile` gpmp
JOIN geekdom_production.`auth_user` gpau ON gpmp.`user_id` = gpau.`id`
WHERE gpau.`id`
IN (SELECT `id`
FROM coworks_in.`User`
)
AND gpmp.`membership_type_id` =11;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `migrateUserCompany` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `migrateUserCompany`()
BEGIN
SET @position=2;
select max(id) INTO @max FROM coworks_in.Company;
WHILE @position <= @max DO
	-- get the current tag
	SELECT title INTO @current_company FROM coworks_in.Company WHERE id=@position;
	IF @current_company !='' THEN
		-- insert the users
		INSERT INTO coworks_in.User_Company (`user_id`,`company_id`,`status`,`create_date`)
			SELECT gp.user_id,@position,'enabled',NOW() 
						FROM geekdom_production.manager_userprofile as gp
						WHERE gp.user_id IN (select id FROM coworks_in.User)
							AND company_name !=''
							AND company_name = @current_company;

	END IF;
	-- update the position
	SET @position=@position+1;
END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `migrateUserSkills` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `migrateUserSkills`()
BEGIN
SET @position=1;
select count(tag) INTO @max FROM coworks_in.Tags;
WHILE @position <= @max DO
	-- get the current tag
	SELECT tag INTO @current_tag FROM coworks_in.Tags WHERE id=@position;
	-- insert the users
	INSERT INTO coworks_in.User_Tags (`user_id`,`tags_id`,`status`,`create_date`)
		SELECT user_id,@position,'enabled',NOW() 
					FROM geekdom_production.manager_userprofile 
					WHERE user_id IN (select id FROM coworks_in.User) 
						AND skills LIKE CONCAT("%",@current_tag,"%");
	-- update the position
	SET @position=@position+1;
END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `searchCountry` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchCountry`(IN NAME_VALUE VARCHAR(128))
BEGIN
	SELECT id, name FROM Country WHERE status='enabled' AND name LIKE "%NAME_VALUE%";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `searchCoworkingSpace` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchCoworkingSpace`(IN NAME_VALUE VARCHAR(128))
BEGIN
	SELECT id, name FROM Coworking_Space WHERE status='enabled' AND NAME LIKE "%NAME_VALUE%";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `searchLocations` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchLocations`(IN COWORKING_ID_VALUE INT(10) UNSIGNED)
BEGIN
	SELECT id, address1,address2,city, state, zip, country 
		FROM Location 
		WHERE coworking_space_id=COWORKING_ID_VALUE AND status='enabled';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `unlockUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `unlockUser`(IN EMAIL_VALUE VARCHAR(128))
BEGIN
	SELECT id INTO @id FROM Users WHERE email=EMAIL_VALUE;
	SELECT 1 INTO @login_locked FROM Users WHERE email=EMAIL_VALUE AND modify_user=1 AND status='disabled';	
	IF @login_locked > 0 THEN
		UPDATE User SET status='enabled',modify_date=NOW(),modify_user=1,modify_reason='Unlocking account' WHERE id=@id;			
	END IF;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateBilling_Plan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateBilling_Plan`(IN ID_VALUE int(10) unsigned, IN TITLE_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN PRICE_VALUE float(8,2) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Billing_Plan` 
	SET `title` = TITLE_VALUE, `description` = DESCRIPTION_VALUE, `price` = PRICE_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateCash` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateCash`(IN COWORKING_SPACE_ID_VALUE INT(10) UNSIGNED)
BEGIN
	-- current month
	SELECT id into @id FROM Cash WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
	IF @id > 0 THEN
		-- current month
		UPDATE Cash
		SET 
			net_cash_burn=outgoing_cash-incoming_cash,
			end_of_month_cash=start_of_month_cash-net_cash_burn,
			runaway=end_of_month_cash/net_cash_burn
		WHERE id=@id;
	ELSE 
		SELECT id into @prev_id FROM Cash WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(DATE_SUB(CURDATE(),INTERVAL 1 MONTH),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
		IF @prev_id > 0 THEN
			-- new month for an existing customer
			INSERT INTO Cash (coworking_space_id, start_of_month_cash, incoming_cash, outgoing_cash, net_cash_burn,end_of_month_cash,runaway,create_date)
				SELECT COWORKING_SPACE_ID, 
						end_of_month_cash,
						incoming_cash,
						outgoing_cash,
						net_cash_burn,
						end_of_month_cash,
						runaway,
						NOW() 
				FROM Cash
				WHERE id=@prev_id;
		ELSE
			-- first month ever
			INSERT INTO Cash (coworking_space_id,create_date)
				VALUES (COWORKING_SPACE_ID, NOW());
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateCircle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateCircle`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN TITLE_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Circle` 
	SET `user_id` = USER_ID_VALUE, `title` = TITLE_VALUE, `description` = DESCRIPTION_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateCircle_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateCircle_Tags`(IN ID_VALUE int(10) unsigned, IN CIRCLE_ID_VALUE int(10) unsigned, IN TAG_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Circle_Tags` 
	SET `circle_id` = CIRCLE_ID_VALUE, `tag_id` = TAG_ID_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Circle` WHERE `id` = CIRCLE_ID_VALUE)
		 AND (SELECT 1 FROM `Tags` WHERE `id` = TAG_ID_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateCompany` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateCompany`(IN ID_VALUE int(10) unsigned, IN TITLE_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN URL_VALUE varchar(128), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Company` 
	SET `title` = TITLE_VALUE, `description` = DESCRIPTION_VALUE, `url` = URL_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateCompany_Location` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateCompany_Location`(IN ID_VALUE int(10) unsigned, IN COMPANY_ID_VALUE int(10) unsigned, IN LOCATION_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Company_Location` 
	SET `company_id` = COMPANY_ID_VALUE, `location_id` = LOCATION_ID_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Company` WHERE `id` = COMPANY_ID_VALUE)
		 AND (SELECT 1 FROM `Location` WHERE `id` = LOCATION_ID_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateCompany_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateCompany_Tags`(IN ID_VALUE int(10) unsigned, IN COMPANY_ID_VALUE int(10) unsigned, IN TAG_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Company_Tags` 
	SET `company_id` = COMPANY_ID_VALUE, `tag_id` = TAG_ID_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Company` WHERE `id` = COMPANY_ID_VALUE)
		 AND (SELECT 1 FROM `Tags` WHERE `id` = TAG_ID_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateConference_Room` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateConference_Room`(IN ID_VALUE int(10) unsigned, IN LOCATION_ID_VALUE int(10) unsigned, IN NAME_VALUE varchar(128), IN FLOOR_VALUE tinyint(3), IN MAX_CAPACITY_VALUE tinyint(3), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Conference_Room` 
	SET `location_id` = LOCATION_ID_VALUE, `name` = NAME_VALUE, `floor` = FLOOR_VALUE, `max_capacity` = MAX_CAPACITY_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Location` WHERE `id` = LOCATION_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateContact_Description` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateContact_Description`(IN ID_VALUE int(10) unsigned, IN TITLE_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN THREAD_VALUE int(10) unsigned, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Contact_Description` 
	SET `title` = TITLE_VALUE, `description` = DESCRIPTION_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `thread` = THREAD_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Contact_Description` WHERE `id` = THREAD_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateCoworking_Space` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateCoworking_Space`(IN ID_VALUE int(10) unsigned, IN NAME_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN URL_VALUE varchar(128), IN USER_URL_STUB_VALUE varchar(128), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Coworking_Space` 
	SET `name` = NAME_VALUE, `description` = DESCRIPTION_VALUE, `url` = URL_VALUE, `user_url_stub` = USER_URL_STUB_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateCoworking_Space_Billing_Plan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateCoworking_Space_Billing_Plan`(IN ID_VALUE int(10) unsigned, IN COWORKING_SPACE_ID_VALUE int(10) unsigned, IN BILLING_PLAN_ID_VALUE int(10) unsigned, IN STRIPE_STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Coworking_Space_Billing_Plan` 
	SET `coworking_space_id` = COWORKING_SPACE_ID_VALUE, `billing_plan_id` = BILLING_PLAN_ID_VALUE, `stripe_status` = STRIPE_STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Coworking_Space` WHERE `id` = COWORKING_SPACE_ID_VALUE)
		 AND (SELECT 1 FROM `Billing_Plan` WHERE `id` = BILLING_PLAN_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateCoworking_Stripe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateCoworking_Stripe`(IN ID_VALUE int(10) unsigned, IN COWORKING_ID_VALUE int(10) unsigned, IN LIVE_VALUE enum('test','live'), IN TYPE_VALUE enum('public','private'), IN KEY_VALUE varchar(64), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Coworking_Stripe` 
	SET `coworking_id` = COWORKING_ID_VALUE, `live` = LIVE_VALUE, `type` = TYPE_VALUE, `key` = KEY_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Coworking_Space` WHERE `id` = COWORKING_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateCustomerAcquisitionCost` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateCustomerAcquisitionCost`(IN COWORKING_SPACE_ID_VALUE INT(10) UNSIGNED)
BEGIN
	SELECT DATE_FORMAT(CURDATE(),'%Y-%m') INTO @date_key;
	-- current month
	SELECT id into @id FROM Customer_Acquisition_Cost WHERE DATE_FORMAT(create_date,'%Y-%m')=@date_key AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
	
	IF @id > 0 THEN
		SELECT total_new_signups INTO @total_new_signups FROM Signup WHERE DATE_FORMAT(create_date,'%Y-%m')=@date_key AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
		
		SELECT paid_signups INTO @paid_signups FROM Signup WHERE DATE_FORMAT(create_date,'%Y-%m')=@date_key AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
		
		SELECT new_customers INTO @new_customers FROM Paying_Customers WHERE DATE_FORMAT(create_date,'%Y-%m')=@date_key AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
		
		SELECT average_revenue_per_account INTO @arpa FROM Monthly_Recurring_Revenue WHERE DATE_FORMAT(create_date,'%Y-%m')=@date_key AND coworking_space_id=COWORKING_SPACE_ID_VALUE;		

		SELECT average_revenue_per_new_account INTO @arpa_new FROM Monthly_Recurring_Revenue WHERE DATE_FORMAT(create_date,'%Y-%m')=@date_key AND coworking_space_id=COWORKING_SPACE_ID_VALUE;

		SELECT AVG(churn_rate) INTO @avg_churn FROM Paying_Customers WHERE coworking_space_id=COWORKING_SPACE_ID_VALUE;

		-- current month
		UPDATE Customer_Acquisition_Cost
		SET 
			spend_per_signup_blended=marketing_spend/@total_new_signups,
			spend_per_signup_paid=marketing_spend/@paid_signups,
			sales_spend_per_new_paying_customer=sales_spend/@new_customers,
			total_customer_acquisition_cost_blended=(marketing_spend+sales_spend)/@new_customers,
			total_customer_acquisition_cost_paid=(marketing_spend+sales_spend*(@paid_signups/@total_new_signups))/(@new_customers*(@paid_signups/@total_new_signups)),
			time_to_recover_cac_in_months=total_customer_acquisition_cost_paid/@arpa_new,
			customer_lifetime_value=(1/@avg_churn)*@arpa,
			customer_lifetime_value_acquisition_cost_multiple=customer_lifetime_value/total_customer_acquisition_cost_paid
		WHERE id=@id;
	ELSE 
		INSERT INTO Customer_Acquisition_Cost (coworking_space_id,create_date)
			VALUES (COWORKING_SPACE_ID, NOW());
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEvent`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN TITLE_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN START_TIME_VALUE timestamp, IN END_TIME_VALUE timestamp, IN URL_VALUE varchar(128), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN THREAD_VALUE int(10) unsigned, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Event` 
	SET `user_id` = USER_ID_VALUE, `title` = TITLE_VALUE, `description` = DESCRIPTION_VALUE, `start_time` = START_TIME_VALUE, `end_time` = END_TIME_VALUE, `url` = URL_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `thread` = THREAD_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `Event` WHERE `id` = THREAD_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateEvent_Attendance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEvent_Attendance`(IN ID_VALUE int(10) unsigned, IN EVENT_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN CREATE_DATE_VALUE timestamp)
BEGIN
	UPDATE `Event_Attendance` 
	SET `event_id` = EVENT_ID_VALUE, `user_id` = USER_ID_VALUE, `create_date` = CREATE_DATE_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Event` WHERE `id` = EVENT_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateEvent_Room` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEvent_Room`(IN ID_VALUE int(10) unsigned, IN EVENT_ID_VALUE int(10) unsigned, IN CONFERENCE_ROOM_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Event_Room` 
	SET `event_id` = EVENT_ID_VALUE, `conference_room_id` = CONFERENCE_ROOM_ID_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Event` WHERE `id` = EVENT_ID_VALUE)
		 AND (SELECT 1 FROM `Conference_Room` WHERE `id` = CONFERENCE_ROOM_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateEvent_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEvent_Tags`(IN ID_VALUE bigint(20) unsigned, IN EVENT_ID_VALUE int(10) unsigned, IN TAG_ID_VALUE int(10) unsigned, IN CREATE_DATE_VALUE timestamp)
BEGIN
	UPDATE `Event_Tags` 
	SET `event_id` = EVENT_ID_VALUE, `tag_id` = TAG_ID_VALUE, `create_date` = CREATE_DATE_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Event` WHERE `id` = EVENT_ID_VALUE)
		 AND (SELECT 1 FROM `Tags` WHERE `id` = TAG_ID_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateHelp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateHelp`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN TITLE_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN ESTIMATED_TIME_VALUE time, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Help` 
	SET `user_id` = USER_ID_VALUE, `title` = TITLE_VALUE, `description` = DESCRIPTION_VALUE, `estimated_time` = ESTIMATED_TIME_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateHelp_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateHelp_Tags`(IN ID_VALUE bigint(20) unsigned, IN HELP_ID_VALUE int(10) unsigned, IN TAG_ID_VALUE int(10) unsigned, IN CREATE_DATE_VALUE timestamp)
BEGIN
	UPDATE `Help_Tags` 
	SET `help_id` = HELP_ID_VALUE, `tag_id` = TAG_ID_VALUE, `create_date` = CREATE_DATE_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Help` WHERE `id` = HELP_ID_VALUE)
		 AND (SELECT 1 FROM `Tags` WHERE `id` = TAG_ID_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateIncomingCash` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateIncomingCash`(IN COWORKING_SPACE_ID_VALUE INT(10) UNSIGNED,IN CASH_IN DOUBLE UNSIGNED)
BEGIN
	-- current month
	SELECT id into @id FROM Cash WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
	IF @id > 0 THEN
		-- current month
		UPDATE Cash
		SET incoming_cash=CASH_IN,
			net_cash_burn=outgoing_cash-CASH_IN,
			end_of_month_cash=start_of_month_cash-net_cash_burn,
			runaway=end_of_month_cash/net_cash_burn,
			modify_date=NOW()
		WHERE id=@id;
	ELSE 
		SELECT id into @prev_id FROM Cash WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(DATE_SUB(CURDATE(),INTERVAL 1 MONTH),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
		IF @prev_id > 0 THEN
			-- new month for an existing customer
			INSERT INTO Cash (coworking_space_id, start_of_month_cash, incoming_cash,net_cash_burn,end_of_month_cash,runaway,create_date)
				SELECT COWORKING_SPACE_ID, 
						end_of_month_cash,
						CASH_IN,
						CASH_IN-outgoing_cash,
						end_of_month_cash-(CASH_IN-outgoing_cash),
						(end_of_month_cash-(CASH_IN-outgoing_cash))/(CASH_IN-outgoing_cash),
						NOW() 
				FROM Cash
				WHERE id=@prev_id;
		ELSE
			-- first month ever
			INSERT INTO Cash (coworking_space_id,incoming_cash,net_cash_burn,end_of_month_cash,runaway,create_date)
				VALUES (COWORKING_SPACE_ID, CASH_IN,CASH_IN,CASH_IN,1,NOW());
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateJob` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateJob`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN TITLE_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN PAY_VALUE float(8,2) unsigned, IN COMPOUND_VALUE enum('hour','day','week','month','year','flat'), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN START_DATE_VALUE timestamp, IN END_DATE_VALUE timestamp, IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Job` 
	SET `user_id` = USER_ID_VALUE, `title` = TITLE_VALUE, `description` = DESCRIPTION_VALUE, `pay` = PAY_VALUE, `compound` = COMPOUND_VALUE, `status` = STATUS_VALUE, `start_date` = START_DATE_VALUE, `end_date` = END_DATE_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateJob_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateJob_Tags`(IN ID_VALUE bigint(20) unsigned, IN JOB_ID_VALUE int(10) unsigned, IN TAG_ID_VALUE int(10) unsigned, IN CREATE_DATE_VALUE timestamp)
BEGIN
	UPDATE `Job_Tags` 
	SET `job_id` = JOB_ID_VALUE, `tag_id` = TAG_ID_VALUE, `create_date` = CREATE_DATE_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Job` WHERE `id` = JOB_ID_VALUE)
		 AND (SELECT 1 FROM `Tags` WHERE `id` = TAG_ID_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateLink` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateLink`(IN ID_VALUE bigint(20) unsigned, IN USER_ID_VALUE int(10) unsigned, IN URL_VALUE varchar(128), IN CLICKS_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Link` 
	SET `user_id` = USER_ID_VALUE, `url` = URL_VALUE, `clicks` = CLICKS_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateLink_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateLink_Tags`(IN ID_VALUE int(20) unsigned, IN LINK_ID_VALUE bigint(20) unsigned, IN TAG_ID_VALUE int(10) unsigned, IN CREATE_DATE_VALUE timestamp)
BEGIN
	UPDATE `Link_Tags` 
	SET `link_id` = LINK_ID_VALUE, `tag_id` = TAG_ID_VALUE, `create_date` = CREATE_DATE_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Link` WHERE `id` = LINK_ID_VALUE)
		 AND (SELECT 1 FROM `Tags` WHERE `id` = TAG_ID_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateLocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateLocation`(IN ID_VALUE int(10) unsigned, IN COWORKING_SPACE_ID_VALUE int(10) unsigned, IN ADDRESS1_VALUE varchar(128), IN ADDRESS2_VALUE varchar(128), IN CITY_VALUE varchar(128), IN STATE_VALUE char(2), IN ZIP_VALUE varchar(5), IN COUNTRY_VALUE varchar(128), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Location` 
	SET `coworking_space_id` = COWORKING_SPACE_ID_VALUE, `address1` = ADDRESS1_VALUE, `address2` = ADDRESS2_VALUE, `city` = CITY_VALUE, `state` = STATE_VALUE, `zip` = ZIP_VALUE, `country` = COUNTRY_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Coworking_Space` WHERE `id` = COWORKING_SPACE_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateLocation_User_Status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateLocation_User_Status`(IN ID_VALUE int(10) unsigned, IN LOCATION_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN CHECK_IN_VALUE timestamp, IN CHECK_OUT_VALUE timestamp, IN TIME_ON_LOCATION_VALUE time)
BEGIN
	UPDATE `Location_User_Status` 
	SET `location_id` = LOCATION_ID_VALUE, `user_id` = USER_ID_VALUE, `check_in` = CHECK_IN_VALUE, `check_out` = CHECK_OUT_VALUE, `time_on_location` = TIME_ON_LOCATION_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Location` WHERE `id` = LOCATION_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateLostPayingCustomers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateLostPayingCustomers`(IN COWORKING_SPACE_ID_VALUE INT(10) UNSIGNED,IN LOST_CUSTOMERS_VALUE INT(10) UNSIGNED)
BEGIN
	
	SELECT id into @id FROM Paying_Customers WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
	-- last month signups
	SELECT total_new_signups INTO @last_month_signups FROM Signup WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(DATE_SUB(CURDATE(),INTERVAL 1 MONTH),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE; 

	IF @id > 0 THEN
		-- current month
		UPDATE Paying_Customers
		SET 
			lost_customers=LOST_CUSTOMERS_VALUE,
			churn_rate=LOST_CUSTOMERS_VALUE/start_of_month_customers,
			net_new_customers=new_customers-LOST_CUSTOMERS_VALUE,
			end_of_month_customers=start_of_month_customers+net_new_customers,
			growth_customers=(end_of_month_customers/start_of_month_customers)-1
		WHERE id=@id;
	ELSE 
		SELECT id into @prev_id FROM Paying_Customers WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(DATE_SUB(CURDATE(),INTERVAL 1 MONTH),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
		IF @prev_id > 0 THEN
			-- new month for an existing customer
			INSERT INTO Paying_Customers (coworking_space_id, start_of_month_customers,end_of_month_customers,create_date)
				SELECT COWORKING_SPACE_ID_VALUE, end_of_month_customers, end_of_month_customers, NOW()
				FROM PayingCustomers
				WHERE id=@prev_id;
		ELSE
			-- first month ever
			INSERT INTO Paying_Customers (coworking_space_id,create_date)
				VALUES (COWORKING_SPACE_ID_VALUE,NOW());
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateMentor_Availability` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateMentor_Availability`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN START_TIME_VALUE timestamp, IN END_TIME_VALUE timestamp, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Mentor_Availability` 
	SET `user_id` = USER_ID_VALUE, `start_time` = START_TIME_VALUE, `end_time` = END_TIME_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateMentor_Meeting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateMentor_Meeting`(IN ID_VALUE int(10) unsigned, IN MENTOR_AVAILABILITY_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Mentor_Meeting` 
	SET `mentor_availability_id` = MENTOR_AVAILABILITY_ID_VALUE, `user_id` = USER_ID_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Mentor_Availability` WHERE `id` = MENTOR_AVAILABILITY_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateMonthlyRecurringRevenue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateMonthlyRecurringRevenue`(IN COWORKING_SPACE_ID_VALUE INT(10) UNSIGNED)
BEGIN
	-- current month
	SELECT id into @id FROM Monthly_Recurring_Revenue WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;

	IF @id > 0 THEN

		SELECT end_of_month_customers INTO @end_customers FROM Paying_Customers WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
		SELECT new_customers INTO @new_customers FROM Paying_Customers WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;

		-- current month
		UPDATE Monthly_Recurring_Revenue
		SET 
			churn_rate=lost_recurring_revenue_from_contraction/start_of_month_recurring_revenue,
			total_new_recurring_revenue=new_recurring_revenue_from_new_customers+new_recurring_revenue_from_expansion,
			net_new_recurring_revenue=(total_new_recurring_revenue-lost_recurring_revenue_from_contraction),
			churn_rate=lost_recurring_revenue_from_contraction/start_of_month_recurring_revenue,
			end_of_month_recurring_revenue=start_of_month_recurring_revenue+net_new_recurring_revenue,
			month_over_month_growth= (end_of_month_recurring_revenue/start_of_month_recurring_revenue)-1,
			average_revenue_per_account=end_of_month_recurring_revenue/@end_customers,
			average_revenue_per_new_account=new_recurring_revenue_from_new_customers/@new_customers
		WHERE id=@id;
	ELSE 
		SELECT id into @prev_id FROM Monthly_Recurring_Revenue WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(DATE_SUB(CURDATE(),INTERVAL 1 MONTH),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
		IF @prev_id > 0 THEN
			-- new month for an existing customer
			INSERT INTO Monthly_Recurring_Revenue (coworking_space_id, start_of_month_recurring_revenue, end_of_month_recurring_revenue, create_date)
				SELECT COWORKING_SPACE_ID, 
						end_of_month_recurring_revenue,
						end_of_month_recurring_revenue,
						NOW() 
				FROM Monthly_Recurring_Revenue
				WHERE id=@prev_id;
		ELSE
			-- first month ever
			INSERT INTO Monthly_Recurring_Revenue (coworking_space_id,create_date)
				VALUES (COWORKING_SPACE_ID, NOW());
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateNewPayingCustomers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateNewPayingCustomers`(IN COWORKING_SPACE_ID_VALUE INT(10) UNSIGNED,IN NEW_CUSTOMERS_VALUE INT(10) UNSIGNED)
BEGIN
	-- current month
	SELECT id into @id FROM Paying_Customers WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
	-- last month signups
	SELECT total_new_signups INTO @last_month_signups FROM Signup WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(DATE_SUB(CURDATE(),INTERVAL 1 MONTH),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE; 

	IF @id > 0 THEN
		-- current month
		UPDATE Paying_Customers
		SET 
			new_customers=NEW_CUSTOMERS_VALUE,
			conversion_rate=NEW_CUSTOMERS_VALUE/@last_month_signups,
			churn_rate=lost_customers/start_of_month_customers,
			net_new_customers=NEW_CUSTOMERS_VALUE-lost_customers,
			end_of_month_customers=start_of_month_customers+net_new_customers,
			growth_customers=(end_of_month_customers/start_of_month_customers)-1
		WHERE id=@id;
	ELSE 
		SELECT id into @prev_id FROM Paying_Customers WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(DATE_SUB(CURDATE(),INTERVAL 1 MONTH),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
		IF @prev_id > 0 THEN
			-- new month for an existing customer
			INSERT INTO Paying_Customers (coworking_space_id,start_of_month_customers, end_of_month_customers,create_date)
				SELECT COWORKING_SPACE_ID_VALUE, end_of_month_customers, end_of_month_customers, NOW()
				FROM Paying_Customers
				WHERE id=@prev_id;
		ELSE
			-- first month ever
			INSERT INTO Paying_Customers (coworking_space_id,create_date)
				VALUES (COWORKING_SPACE_ID_VALUE,NOW());
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateOffice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateOffice`(IN ID_VALUE int(10) unsigned, IN LOCATION_ID_VALUE int(10) unsigned, IN NAME_VALUE varchar(128), IN FLOOR_VALUE tinyint(3), IN MAX_CAPACITY_VALUE tinyint(3) unsigned, IN CURRENT_CAPACITY_VALUE tinyint(3) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Office` 
	SET `location_id` = LOCATION_ID_VALUE, `name` = NAME_VALUE, `floor` = FLOOR_VALUE, `max_capacity` = MAX_CAPACITY_VALUE, `current_capacity` = CURRENT_CAPACITY_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Location` WHERE `id` = LOCATION_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateOutgoingCash` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateOutgoingCash`(IN COWORKING_SPACE_ID_VALUE INT(10) UNSIGNED,IN CASH_OUT DOUBLE UNSIGNED)
BEGIN
	
	SELECT id into @id FROM Cash WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;

	IF @id > 0 THEN
		-- current month
		UPDATE Cash
		SET outgoing_cash=CASH_OUT,
			net_cash_burn=CASH_OUT-incoming_cash,
			end_of_month_cash=start_of_month_cash-net_cash_burn,
			runaway=end_of_month_cash/net_cash_burn
		WHERE id=@id;
	ELSE 
		SELECT id into @prev_id FROM Cash WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(DATE_SUB(CURDATE(),INTERVAL 1 MONTH),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
		IF @prev_id > 0 THEN
			-- new month for an existing customer
			INSERT INTO Cash (coworking_space_id, start_of_month_cash, outgoing_cash,net_cash_burn,end_of_month_cash,runaway,create_date)
				SELECT COWORKING_SPACE_ID, 
						end_of_month_cash,
						CASH_OUT,
						incoming_cash-CASH_OUT,
						end_of_month_cash-(incoming_cash-CASH_OUT),
						(end_of_month_cash-(incoming_cash-CASH_OUT))/(incoming_cash-CASH_OUT),
						NOW() 
				FROM Cash
				WHERE id=@prev_id;
		ELSE
			-- first month ever
			INSERT INTO Cash (coworking_space_id,outgoing_cash,net_cash_burn,end_of_month_cash,runaway,create_date)
				VALUES (COWORKING_SPACE_ID, CASH_OUT,-CASH_OUT,-CASH_OUT,-1,NOW());
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updatePassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePassword`(IN EMAIL_VALUE VARCHAR(128), IN PASSWORD_VALUE VARCHAR(128))
BEGIN
	SELECT id INTO @id FROM User WHERE email=EMAIL_VALUE;
	IF @id > 0
		THEN
		UPDATE User 
			SET password=PASSWORD_VALUE, 
				modify_date=NOW(),
				modify_user=@id,
				modify_reason='forgot password'
			WHERE
			id=@id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updatePayingCustomers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePayingCustomers`(IN COWORKING_SPACE_ID_VALUE INT(10) UNSIGNED)
BEGIN
	-- current month
	SELECT id into @id FROM Paying_Customers WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
	-- last month signups
	SELECT total_new_signups INTO @last_month_signups FROM Signup WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(DATE_SUB(CURDATE(),INTERVAL 1 MONTH),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE; 
	IF @id > 0 THEN		
		-- current month
		UPDATE Paying_Customers
		SET 
			conversion_rate=new_customers/@last_month_signups,
			churn_rate=lost_customers/start_of_month_customers,
			net_new_customers=new_customers-lost_customers,
			end_of_month_customers=start_of_month_customers+net_new_customers,
			growth_customers=(end_of_month_customers/start_of_month_customers)-1
		WHERE id=@id;
	ELSE 
		SELECT id into @prev_id FROM Paying_Customers WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(DATE_SUB(CURDATE(),INTERVAL 1 MONTH),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
		IF @prev_id > 0 THEN
			-- new month for an existing customer
			INSERT INTO Paying_Customers (coworking_space_id,start_of_month_customers,end_of_month_customers,create_date)
				SELECT COWORKING_SPACE_ID_VALUE, end_of_month_customers, end_of_month_customers, NOW() 
				FROM Paying_Customers
				WHERE id=@prev_id;
		ELSE
			-- first month ever
			INSERT INTO Paying_Customers (coworking_space_id,create_date)
				VALUES (COWORKING_SPACE_ID, NOW());
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateQuestion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateQuestion`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN TITLE_VALUE varchar(128), IN DESCRIPTION_VALUE text, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN THREAD_VALUE int(10) unsigned, IN ANSWER_ID_VALUE int(10) unsigned, IN VIEWS_VALUE int(10) unsigned, IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Question` 
	SET `user_id` = USER_ID_VALUE, `title` = TITLE_VALUE, `description` = DESCRIPTION_VALUE, `status` = STATUS_VALUE, `thread` = THREAD_VALUE, `answer_id` = ANSWER_ID_VALUE, `views` = VIEWS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `Question` WHERE `id` = THREAD_VALUE)
		 AND (SELECT 1 FROM `Response` WHERE `id` = ANSWER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateQuestion_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateQuestion_Tags`(IN ID_VALUE int(10) unsigned, IN QUESTION_ID_VALUE int(10) unsigned, IN TAG_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Question_Tags` 
	SET `question_id` = QUESTION_ID_VALUE, `tag_id` = TAG_ID_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Question` WHERE `id` = QUESTION_ID_VALUE)
		 AND (SELECT 1 FROM `Tags` WHERE `id` = TAG_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateQuestion_Vote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateQuestion_Vote`(IN ID_VALUE int(10) unsigned, IN QUESTION_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN VOTE_VALUE tinyint(3), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Question_Vote` 
	SET `question_id` = QUESTION_ID_VALUE, `user_id` = USER_ID_VALUE, `vote` = VOTE_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Question` WHERE `id` = QUESTION_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateReferral` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateReferral`(IN ID_VALUE bigint(20) unsigned, IN USER_ID_VALUE int(10) unsigned, IN EVENT_ID_VALUE int(10) unsigned, IN KEY_VALUE varchar(64), IN CLICKS_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Referral` 
	SET `user_id` = USER_ID_VALUE, `event_id` = EVENT_ID_VALUE, `key` = KEY_VALUE, `clicks` = CLICKS_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `Event` WHERE `id` = EVENT_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateResponse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateResponse`(IN ID_VALUE int(10) unsigned, IN QUESTION_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN RESPONSE_VALUE text, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN THREAD_VALUE int(10) unsigned, IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Response` 
	SET `question_id` = QUESTION_ID_VALUE, `user_id` = USER_ID_VALUE, `response` = RESPONSE_VALUE, `status` = STATUS_VALUE, `thread` = THREAD_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Question` WHERE `id` = QUESTION_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `Response` WHERE `id` = THREAD_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateResponse_Vote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateResponse_Vote`(IN ID_VALUE int(10) unsigned, IN RESPONSE_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN VOTE_VALUE tinyint(3), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Response_Vote` 
	SET `response_id` = RESPONSE_ID_VALUE, `user_id` = USER_ID_VALUE, `vote` = VOTE_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Response` WHERE `id` = RESPONSE_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateSignups` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSignups`(IN COWORKING_SPACE_ID_VALUE INT(10) UNSIGNED)
BEGIN
	-- current month
	SELECT id into @id FROM Signup WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(CURDATE(),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;
	-- previous month
	SELECT id into @prev_id FROM Signup WHERE DATE_FORMAT(create_date,'%Y-%m')=DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 MONTH),'%Y-%m') AND coworking_space_id=COWORKING_SPACE_ID_VALUE;

	IF @id > 0 THEN
		IF @prev_id > 0 THEN
			-- current month, with a previous month
			UPDATE Signup 
				SET growth_of_visitors=(current_visitors/last_month_visitors)-1,
					total_new_signups=(referral_signups+paid_signups+walk_in_signups),
					growth_of_signups=(total_new_signups/last_month_signups)-1,
					conversion_rate=(total_new_signups/current_visitors),
					referral_conversion_rate=(referral_signups/total_referrals),
					end_of_month_signups=start_of_month_signups+total_new_signups
			WHERE id=@id;
		ELSE 
			-- current month with no previous month
			UPDATE Signup 
				SET 
					total_new_signups=(referral_signups+paid_signups+walk_in_signups),					
					conversion_rate=(total_new_signups/current_visitors),
					referral_conversion_rate=(referral_signups/total_referrals),
					end_of_month_signups=start_of_month_signups+total_new_signups
			WHERE id=@id;
		END IF;
	ELSE
		-- need to create a new record
		IF @prev_id > 0 THEN
			-- just a new month setup
			INSERT INTO Signup 
				(coworking_space_id,last_month_visitors, start_of_month_signups, last_month_signups, create_date)
				SELECT coworking_space_id,last_month_visitors, start_of_month_signups, last_month_signups, NOW() FROM Signups WHERE id=@prev_id;
		ELSE
			-- first setup ever
			INSERT INTO Signup (coworking_space_id,create_date) VALUES (COWORKING_SPACE_ID_VALUE,NOW());
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateTags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateTags`(IN ID_VALUE int(10) unsigned, IN TAG_VALUE varchar(64), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `Tags` 
	SET `tag` = TAG_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateUser`(IN ID_VALUE int(10) unsigned, IN FULLNAME_VALUE varchar(128), IN EMAIL_VALUE varchar(128), IN PASSWORD_VALUE varchar(128), IN SERVER_ID_VALUE varchar(128), IN USER_IMAGE_ID_VALUE bigint(20) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `User` 
	SET `fullName` = FULLNAME_VALUE, `email` = EMAIL_VALUE, `password` = PASSWORD_VALUE, `server_id` = SERVER_ID_VALUE, `user_image_id` = USER_IMAGE_ID_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateUser_Address` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateUser_Address`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN ADDRESS_VALUE varchar(128), IN ADDRESS2_VALUE varchar(128), IN CITY_VALUE varchar(128), IN STATE_VALUE char(2), IN ZIP_VALUE varchar(5), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `User_Address` 
	SET `user_id` = USER_ID_VALUE, `address` = ADDRESS_VALUE, `address2` = ADDRESS2_VALUE, `city` = CITY_VALUE, `state` = STATE_VALUE, `zip` = ZIP_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateUser_Billing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateUser_Billing`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN COWORKING_SPACE_BILLING_PLAN_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `User_Billing` 
	SET `user_id` = USER_ID_VALUE, `coworking_space_billing_plan_id` = COWORKING_SPACE_BILLING_PLAN_ID_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `Coworking_Space_Billing_Plan` WHERE `id` = COWORKING_SPACE_BILLING_PLAN_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateUser_Bio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateUser_Bio`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN DESCRIPTION_VALUE text, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `User_Bio` 
	SET `user_id` = USER_ID_VALUE, `description` = DESCRIPTION_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateUser_Cave` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateUser_Cave`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `User_Cave` 
	SET `user_id` = USER_ID_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateUser_Circle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateUser_Circle`(IN ID_VALUE int(10) unsigned, IN CIRCLE_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN MEMBER_TYPE_VALUE enum('basic','manager','owner'), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `User_Circle` 
	SET `circle_id` = CIRCLE_ID_VALUE, `user_id` = USER_ID_VALUE, `member_type` = MEMBER_TYPE_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Circle` WHERE `id` = CIRCLE_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateUser_Company` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateUser_Company`(IN ID_VALUE int(10) unsigned, IN COMPANY_ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `User_Company` 
	SET `company_id` = COMPANY_ID_VALUE, `user_id` = USER_ID_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `Company` WHERE `id` = COMPANY_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateUser_Contact` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateUser_Contact`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN CONTACT_DESCRIPTION_ID_VALUE int(10) unsigned, IN CONTACT_VALUE_VALUE varchar(128), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN THREAD_VALUE int(10) unsigned, IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `User_Contact` 
	SET `user_id` = USER_ID_VALUE, `contact_description_id` = CONTACT_DESCRIPTION_ID_VALUE, `contact_value` = CONTACT_VALUE_VALUE, `status` = STATUS_VALUE, `thread` = THREAD_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `Contact_Description` WHERE `id` = CONTACT_DESCRIPTION_ID_VALUE)
		 AND (SELECT 1 FROM `User_Contact` WHERE `id` = THREAD_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateUser_Image` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateUser_Image`(IN ID_VALUE bigint(20) unsigned, IN USER_ID_VALUE int(10) unsigned, IN IMAGE_VALUE varchar(128), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `User_Image` 
	SET `user_id` = USER_ID_VALUE, `image` = IMAGE_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateUser_Invite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateUser_Invite`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN EMAIL_VALUE varchar(128), IN KEY_VALUE varchar(64), IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN EXPIRE_DATE_VALUE timestamp)
BEGIN
	UPDATE `User_Invite` 
	SET `user_id` = USER_ID_VALUE, `email` = EMAIL_VALUE, `key` = KEY_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `expire_date` = EXPIRE_DATE_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateUser_Login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateUser_Login`(IN ID_VALUE bigint(20) unsigned, IN USER_ID_VALUE int(10) unsigned, IN IP_VALUE varchar(15), IN LOGIN_TIME_VALUE timestamp, IN LOGOUT_TIME_VALUE timestamp, IN TIME_ONLINE_VALUE time)
BEGIN
	UPDATE `User_Login` 
	SET `user_id` = USER_ID_VALUE, `ip` = IP_VALUE, `login_time` = LOGIN_TIME_VALUE, `logout_time` = LOGOUT_TIME_VALUE, `time_online` = TIME_ONLINE_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateUser_Office` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateUser_Office`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN OFFICE_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODFIY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `User_Office` 
	SET `user_id` = USER_ID_VALUE, `office_id` = OFFICE_ID_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modfiy_user` = MODFIY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `Office` WHERE `id` = OFFICE_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODFIY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateUser_Stripe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateUser_Stripe`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN STRIPE_TOKEN_VALUE varchar(64), IN LAST_CHECKED_VALUE timestamp, IN IS_ACTIVE_VALUE tinyint(1) unsigned, IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `User_Stripe` 
	SET `user_id` = USER_ID_VALUE, `stripe_token` = STRIPE_TOKEN_VALUE, `last_checked` = LAST_CHECKED_VALUE, `is_active` = IS_ACTIVE_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateUser_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateUser_Tags`(IN ID_VALUE bigint(20) unsigned, IN USER_ID_VALUE int(10) unsigned, IN TAGS_ID_VALUE int(10) unsigned, IN STATUS_VALUE enum('pending','enabled','disabled','retired'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp)
BEGIN
	UPDATE `User_Tags` 
	SET `user_id` = USER_ID_VALUE, `tags_id` = TAGS_ID_VALUE, `status` = STATUS_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `Tags` WHERE `id` = TAGS_ID_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateUser_Time` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateUser_Time`(IN ID_VALUE int(10) unsigned, IN GIVING_USER_ID_VALUE int(10) unsigned, IN TAKING_USER_ID_VALUE int(10) unsigned, IN START_TIME_VALUE timestamp, IN END_TIME_VALUE timestamp, IN TOTAL_TIME_VALUE time)
BEGIN
	UPDATE `User_Time` 
	SET `giving_user_id` = GIVING_USER_ID_VALUE, `taking_user_id` = TAKING_USER_ID_VALUE, `start_time` = START_TIME_VALUE, `end_time` = END_TIME_VALUE, `total_time` = TOTAL_TIME_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = GIVING_USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = TAKING_USER_ID_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateUser_Type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateUser_Type`(IN ID_VALUE int(10) unsigned, IN USER_ID_VALUE int(10) unsigned, IN TYPE_VALUE enum('prospect','community','desk','management','administrator'), IN CREATE_DATE_VALUE timestamp, IN MODIFY_DATE_VALUE timestamp, IN MODIFY_USER_VALUE int(10) unsigned, IN MODIFY_REASON_VALUE varchar(128))
BEGIN
	UPDATE `User_Type` 
	SET `user_id` = USER_ID_VALUE, `type` = TYPE_VALUE, `create_date` = CREATE_DATE_VALUE, `modify_date` = MODIFY_DATE_VALUE, `modify_user` = MODIFY_USER_VALUE, `modify_reason` = MODIFY_REASON_VALUE 
	WHERE `id` = ID_VALUE
		 AND (SELECT 1 FROM `User` WHERE `id` = USER_ID_VALUE)
		 AND (SELECT 1 FROM `User` WHERE `id` = MODIFY_USER_VALUE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateBilling_Plan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateBilling_Plan`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Billing_Plan` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateCircle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateCircle`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Circle` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateCircle_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateCircle_Tags`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Circle_Tags` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateCompany` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateCompany`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Company` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateCompany_Location` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateCompany_Location`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Company_Location` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateCompany_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateCompany_Tags`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Company_Tags` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateConference_Room` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateConference_Room`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Conference_Room` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateContact_Description` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateContact_Description`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Contact_Description` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateCoworking_Space` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateCoworking_Space`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Coworking_Space` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateCoworking_Space_Billing_Plan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateCoworking_Space_Billing_Plan`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Coworking_Space_Billing_Plan` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateCoworking_Stripe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateCoworking_Stripe`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Coworking_Stripe` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateEvent`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Event` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateEvent_Attendance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateEvent_Attendance`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Event_Attendance` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateEvent_Room` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateEvent_Room`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Event_Room` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateEvent_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateEvent_Tags`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT 1 
	FROM `Event_Tags` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateHelp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateHelp`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Help` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateHelp_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateHelp_Tags`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT 1 
	FROM `Help_Tags` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateJob` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateJob`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Job` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateJob_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateJob_Tags`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT 1 
	FROM `Job_Tags` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateLink` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateLink`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT 1 
	FROM `Link` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateLink_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateLink_Tags`(IN ID_VALUE int(20) unsigned)
BEGIN
	SELECT 1 
	FROM `Link_Tags` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateLocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateLocation`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Location` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateLocation_User_Status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateLocation_User_Status`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Location_User_Status` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateMentor_Availability` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateMentor_Availability`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Mentor_Availability` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateMentor_Meeting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateMentor_Meeting`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Mentor_Meeting` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateOffice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateOffice`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Office` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateQuestion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateQuestion`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Question` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateQuestion_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateQuestion_Tags`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Question_Tags` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateQuestion_Vote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateQuestion_Vote`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Question_Vote` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateReferral` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateReferral`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT 1 
	FROM `Referral` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateResponse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateResponse`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Response` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateResponse_Vote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateResponse_Vote`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Response_Vote` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateTags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateTags`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `Tags` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateUser`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `User` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateUser_Address` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateUser_Address`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Address` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateUser_Billing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateUser_Billing`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Billing` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateUser_Bio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateUser_Bio`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Bio` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateUser_Cave` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateUser_Cave`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Cave` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateUser_Circle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateUser_Circle`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Circle` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateUser_Company` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateUser_Company`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Company` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateUser_Contact` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateUser_Contact`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Contact` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateUser_Image` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateUser_Image`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Image` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateUser_Invite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateUser_Invite`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Invite` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateUser_Login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateUser_Login`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Login` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateUser_Office` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateUser_Office`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Office` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateUser_Stripe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateUser_Stripe`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Stripe` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateUser_Tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateUser_Tags`(IN ID_VALUE bigint(20) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Tags` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateUser_Time` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateUser_Time`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Time` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateUser_Type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateUser_Type`(IN ID_VALUE int(10) unsigned)
BEGIN
	SELECT 1 
	FROM `User_Type` 
	WHERE `id` = ID_VALUE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `newMembershipsByPricePlanPerMonth`
--

/*!50001 DROP TABLE IF EXISTS `newMembershipsByPricePlanPerMonth`*/;
/*!50001 DROP VIEW IF EXISTS `newMembershipsByPricePlanPerMonth`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `newMembershipsByPricePlanPerMonth` AS select `bp`.`title` AS `title`,count(1) AS `count(1)`,date_format(`ub`.`create_date`,'%M, %Y') AS `DATE_FORMAT(ub.``create_date``,'%M, %Y')` from ((`User_Billing` `ub` join `Coworking_Space_Billing_Plan` `csbp` on((`csbp`.`id` = `ub`.`coworking_space_billing_plan_id`))) join `Billing_Plan` `bp` on((`bp`.`id` = `csbp`.`billing_plan_id`))) group by date_format(`ub`.`create_date`,'%M, %Y'),`ub`.`coworking_space_billing_plan_id` order by `ub`.`create_date`,`ub`.`coworking_space_billing_plan_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `searchCircles`
--

/*!50001 DROP TABLE IF EXISTS `searchCircles`*/;
/*!50001 DROP VIEW IF EXISTS `searchCircles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `searchCircles` AS select `c`.`id` AS `id`,`c`.`user_id` AS `user_id`,`u`.`fullName` AS `fullName`,`c`.`title` AS `title`,`c`.`description` AS `description`,`ct`.`tag_id` AS `tag_id`,`t`.`tag` AS `tag` from (((`Circle` `c` join `User` `u` on((`u`.`id` = `c`.`user_id`))) join `Circle_Tags` `ct` on((`ct`.`circle_id` = `c`.`id`))) join `Tags` `t` on((`t`.`id` = `ct`.`tag_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `searchCompany`
--

/*!50001 DROP TABLE IF EXISTS `searchCompany`*/;
/*!50001 DROP VIEW IF EXISTS `searchCompany`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `searchCompany` AS select `c`.`id` AS `id`,`c`.`title` AS `title`,`c`.`url` AS `url`,`l`.`coworking_space_id` AS `coworking_space_id`,`cs`.`name` AS `coworking_space_name`,`l`.`address1` AS `address1`,`l`.`address2` AS `address2`,`l`.`city` AS `city`,`l`.`state` AS `state`,`l`.`zip` AS `zip` from (((`Company` `c` join `Company_Location` `cl` on((`cl`.`company_id` = `c`.`id`))) join `Location` `l` on((`l`.`id` = `cl`.`location_id`))) join `Coworking_Space` `cs` on((`cs`.`id` = `l`.`coworking_space_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `searchConferenceRooms`
--

/*!50001 DROP TABLE IF EXISTS `searchConferenceRooms`*/;
/*!50001 DROP VIEW IF EXISTS `searchConferenceRooms`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `searchConferenceRooms` AS select `cr`.`id` AS `id`,`cr`.`name` AS `conference_room_name`,`cr`.`floor` AS `floor`,`cr`.`max_capacity` AS `max_capacity`,`l`.`coworking_space_id` AS `coworking_space_id`,`cs`.`name` AS `coworking_space_name`,`l`.`address1` AS `address1`,`l`.`address2` AS `address2`,`l`.`city` AS `city`,`l`.`state` AS `state`,`l`.`zip` AS `zip` from ((`Conference_Room` `cr` join `Location` `l` on((`l`.`id` = `cr`.`location_id`))) join `Coworking_Space` `cs` on((`cs`.`id` = `l`.`coworking_space_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `searchCoworkingSpaces`
--

/*!50001 DROP TABLE IF EXISTS `searchCoworkingSpaces`*/;
/*!50001 DROP VIEW IF EXISTS `searchCoworkingSpaces`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `searchCoworkingSpaces` AS select `cs`.`id` AS `id`,`cs`.`name` AS `name`,`cs`.`description` AS `description`,`cs`.`url` AS `url` from `Coworking_Space` `cs` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `searchEvents`
--

/*!50001 DROP TABLE IF EXISTS `searchEvents`*/;
/*!50001 DROP VIEW IF EXISTS `searchEvents`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `searchEvents` AS select `e`.`id` AS `event_id`,`u`.`id` AS `user_id`,`u`.`fullName` AS `hosted_by`,`e`.`title` AS `title`,`e`.`url` AS `url`,date_format(`e`.`start_time`,'%M') AS `month`,date_format(`e`.`start_time`,'%D') AS `day`,date_format(`e`.`start_time`,'%r') AS `time`,`e`.`start_time` AS `start_time`,`e`.`end_time` AS `end_time`,`cs`.`id` AS `coworking_space_id`,`cs`.`name` AS `coworking_space_name`,`cr`.`id` AS `conference_room_id`,`cr`.`name` AS `conference_room_name`,`cr`.`floor` AS `floor`,`l`.`id` AS `location_id`,`l`.`address1` AS `address1`,`l`.`address2` AS `address2`,`l`.`city` AS `city`,`l`.`state` AS `state`,`l`.`zip` AS `zip` from (((((`Event` `e` join `User` `u` on((`u`.`id` = `e`.`user_id`))) join `Event_Room` `er` on((`er`.`event_id` = `e`.`id`))) join `Conference_Room` `cr` on((`cr`.`id` = `er`.`conference_room_id`))) join `Location` `l` on((`l`.`id` = `cr`.`location_id`))) join `Coworking_Space` `cs` on((`cs`.`id` = `l`.`coworking_space_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `searchEventsFuture`
--

/*!50001 DROP TABLE IF EXISTS `searchEventsFuture`*/;
/*!50001 DROP VIEW IF EXISTS `searchEventsFuture`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `searchEventsFuture` AS select `e`.`id` AS `event_id`,`u`.`id` AS `user_id`,`u`.`fullName` AS `hosted_by`,`e`.`title` AS `title`,`e`.`url` AS `url`,date_format(`e`.`start_time`,'%M') AS `month`,date_format(`e`.`start_time`,'%D') AS `day`,date_format(`e`.`start_time`,'%r') AS `time`,`e`.`start_time` AS `start_time`,`e`.`end_time` AS `end_time`,`cs`.`id` AS `coworking_space_id`,`cs`.`name` AS `coworking_space_name`,`cr`.`id` AS `conference_room_id`,`cr`.`name` AS `conference_room_name`,`cr`.`floor` AS `floor`,`l`.`id` AS `location_id`,`l`.`address1` AS `address1`,`l`.`address2` AS `address2`,`l`.`city` AS `city`,`l`.`state` AS `state`,`l`.`zip` AS `zip` from (((((`Event` `e` join `User` `u` on((`u`.`id` = `e`.`user_id`))) join `Event_Room` `er` on((`er`.`event_id` = `e`.`id`))) join `Conference_Room` `cr` on((`cr`.`id` = `er`.`conference_room_id`))) join `Location` `l` on((`l`.`id` = `cr`.`location_id`))) join `Coworking_Space` `cs` on((`cs`.`id` = `l`.`coworking_space_id`))) where ((`e`.`start_time` > now()) and (`e`.`status` = 'enabled')) order by `e`.`start_time` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `searchHelp`
--

/*!50001 DROP TABLE IF EXISTS `searchHelp`*/;
/*!50001 DROP VIEW IF EXISTS `searchHelp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `searchHelp` AS select `h`.`id` AS `id`,`h`.`title` AS `help_title`,`h`.`description` AS `description`,`h`.`estimated_time` AS `estimated_time`,`h`.`user_id` AS `user_id`,`u`.`fullName` AS `fullName`,`ht`.`tag_id` AS `tag_id`,`t`.`tag` AS `tag` from (((`Help` `h` join `User` `u` on((`u`.`id` = `h`.`user_id`))) join `Help_Tags` `ht` on((`ht`.`help_id` = `h`.`id`))) join `Tags` `t` on((`t`.`id` = `ht`.`tag_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `searchJobs`
--

/*!50001 DROP TABLE IF EXISTS `searchJobs`*/;
/*!50001 DROP VIEW IF EXISTS `searchJobs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `searchJobs` AS select `j`.`id` AS `id`,`j`.`title` AS `job_title`,`j`.`description` AS `description`,`j`.`pay` AS `pay`,`j`.`compound` AS `compound`,`j`.`start_date` AS `start_date`,`j`.`end_date` AS `end_date`,`j`.`user_id` AS `user_id`,`u`.`fullName` AS `fullName`,`jt`.`tag_id` AS `tag_id`,`t`.`tag` AS `tag` from (((`Job` `j` join `User` `u` on((`u`.`id` = `j`.`user_id`))) join `Job_Tags` `jt` on((`jt`.`job_id` = `j`.`id`))) join `Tags` `t` on((`t`.`id` = `jt`.`tag_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `searchLocation`
--

/*!50001 DROP TABLE IF EXISTS `searchLocation`*/;
/*!50001 DROP VIEW IF EXISTS `searchLocation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `searchLocation` AS select `l`.`id` AS `id`,`l`.`coworking_space_id` AS `coworking_space_id`,`cs`.`name` AS `coworking_space_name`,`l`.`address1` AS `address1`,`l`.`address2` AS `address2`,`l`.`city` AS `city`,`l`.`state` AS `state`,`l`.`zip` AS `zip`,`l`.`latitude` AS `latitude`,`l`.`longitude` AS `longitude` from (`Location` `l` join `Coworking_Space` `cs` on((`cs`.`id` = `l`.`coworking_space_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `searchOffices`
--

/*!50001 DROP TABLE IF EXISTS `searchOffices`*/;
/*!50001 DROP VIEW IF EXISTS `searchOffices`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `searchOffices` AS select `o`.`id` AS `id`,`o`.`name` AS `office_name`,`o`.`max_capacity` AS `max_capacity`,`o`.`current_capacity` AS `current_capacity`,`o`.`floor` AS `floor`,`l`.`coworking_space_id` AS `coworking_space_id`,`cs`.`name` AS `coworking_space_name`,`l`.`address1` AS `address1`,`l`.`address2` AS `address2`,`l`.`city` AS `city`,`l`.`state` AS `state`,`l`.`zip` AS `zip` from ((`Office` `o` join `Location` `l` on((`l`.`id` = `o`.`location_id`))) join `Coworking_Space` `cs` on((`cs`.`id` = `l`.`coworking_space_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `searchQuestionsAndResponses`
--

/*!50001 DROP TABLE IF EXISTS `searchQuestionsAndResponses`*/;
/*!50001 DROP VIEW IF EXISTS `searchQuestionsAndResponses`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `searchQuestionsAndResponses` AS select `q`.`id` AS `question_id`,`q`.`title` AS `question_title`,`q`.`user_id` AS `question_user`,`u`.`fullName` AS `fullName`,`t`.`tag` AS `tag`,`r`.`id` AS `response_id`,`r`.`response` AS `response` from ((((`Question` `q` join `User` `u` on((`u`.`id` = `q`.`user_id`))) join `Question_Tags` `qt` on((`qt`.`question_id` = `q`.`id`))) join `Tags` `t` on((`t`.`id` = `qt`.`tag_id`))) join `Response` `r` on((`r`.`question_id` = `q`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `searchUserName`
--

/*!50001 DROP TABLE IF EXISTS `searchUserName`*/;
/*!50001 DROP VIEW IF EXISTS `searchUserName`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `searchUserName` AS select `u`.`id` AS `id`,`u`.`fullName` AS `fullName`,`u`.`user_image_id` AS `user_image_id`,`cs`.`name` AS `coworking_space_name`,`o`.`name` AS `office_name` from ((((`User` `u` join `User_Office` `uo` on((`uo`.`user_id` = `u`.`id`))) join `Office` `o` on((`o`.`id` = `uo`.`office_id`))) join `User_Coworking_Space` `ucs` on((`ucs`.`user_id` = `u`.`id`))) join `Coworking_Space` `cs` on((`cs`.`id` = `ucs`.`coworking_space_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewBilling_Plan`
--

/*!50001 DROP TABLE IF EXISTS `viewBilling_Plan`*/;
/*!50001 DROP VIEW IF EXISTS `viewBilling_Plan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewBilling_Plan` AS select `Billing_Plan`.`id` AS `id`,`Billing_Plan`.`title` AS `title`,`Billing_Plan`.`description` AS `description`,`Billing_Plan`.`price` AS `price`,`Billing_Plan`.`status` AS `status`,`Billing_Plan`.`create_date` AS `create_date` from `Billing_Plan` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewCircle`
--

/*!50001 DROP TABLE IF EXISTS `viewCircle`*/;
/*!50001 DROP VIEW IF EXISTS `viewCircle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewCircle` AS select `Circle`.`id` AS `id`,`Circle`.`user_id` AS `user_id`,`Circle`.`title` AS `title`,`Circle`.`description` AS `description`,`Circle`.`status` AS `status`,`Circle`.`create_date` AS `create_date` from `Circle` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewCircle_Tags`
--

/*!50001 DROP TABLE IF EXISTS `viewCircle_Tags`*/;
/*!50001 DROP VIEW IF EXISTS `viewCircle_Tags`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewCircle_Tags` AS select `Circle_Tags`.`id` AS `id`,`Circle_Tags`.`circle_id` AS `circle_id`,`Circle_Tags`.`tag_id` AS `tag_id`,`Circle_Tags`.`status` AS `status`,`Circle_Tags`.`create_date` AS `create_date` from `Circle_Tags` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewCompany`
--

/*!50001 DROP TABLE IF EXISTS `viewCompany`*/;
/*!50001 DROP VIEW IF EXISTS `viewCompany`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewCompany` AS select `Company`.`id` AS `id`,`Company`.`title` AS `title`,`Company`.`description` AS `description`,`Company`.`url` AS `url`,`Company`.`status` AS `status`,`Company`.`create_date` AS `create_date` from `Company` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewCompany_Location`
--

/*!50001 DROP TABLE IF EXISTS `viewCompany_Location`*/;
/*!50001 DROP VIEW IF EXISTS `viewCompany_Location`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewCompany_Location` AS select `Company_Location`.`id` AS `id`,`Company_Location`.`company_id` AS `company_id`,`Company_Location`.`location_id` AS `location_id`,`Company_Location`.`status` AS `status`,`Company_Location`.`create_date` AS `create_date` from `Company_Location` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewCompany_Tags`
--

/*!50001 DROP TABLE IF EXISTS `viewCompany_Tags`*/;
/*!50001 DROP VIEW IF EXISTS `viewCompany_Tags`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewCompany_Tags` AS select `Company_Tags`.`id` AS `id`,`Company_Tags`.`company_id` AS `company_id`,`Company_Tags`.`tag_id` AS `tag_id`,`Company_Tags`.`status` AS `status`,`Company_Tags`.`create_date` AS `create_date` from `Company_Tags` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewConference_Room`
--

/*!50001 DROP TABLE IF EXISTS `viewConference_Room`*/;
/*!50001 DROP VIEW IF EXISTS `viewConference_Room`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewConference_Room` AS select `Conference_Room`.`id` AS `id`,`Conference_Room`.`location_id` AS `location_id`,`Conference_Room`.`name` AS `name`,`Conference_Room`.`floor` AS `floor`,`Conference_Room`.`max_capacity` AS `max_capacity`,`Conference_Room`.`status` AS `status`,`Conference_Room`.`create_date` AS `create_date` from `Conference_Room` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewContact_Description`
--

/*!50001 DROP TABLE IF EXISTS `viewContact_Description`*/;
/*!50001 DROP VIEW IF EXISTS `viewContact_Description`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewContact_Description` AS select `Contact_Description`.`id` AS `id`,`Contact_Description`.`title` AS `title`,`Contact_Description`.`description` AS `description`,`Contact_Description`.`status` AS `status`,`Contact_Description`.`create_date` AS `create_date` from `Contact_Description` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewCoworking_Space`
--

/*!50001 DROP TABLE IF EXISTS `viewCoworking_Space`*/;
/*!50001 DROP VIEW IF EXISTS `viewCoworking_Space`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewCoworking_Space` AS select `Coworking_Space`.`id` AS `id`,`Coworking_Space`.`name` AS `name`,`Coworking_Space`.`description` AS `description`,`Coworking_Space`.`url` AS `url`,`Coworking_Space`.`user_url_stub` AS `user_url_stub`,`Coworking_Space`.`status` AS `status`,`Coworking_Space`.`create_date` AS `create_date` from `Coworking_Space` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewCoworking_Space_Billing_Plan`
--

/*!50001 DROP TABLE IF EXISTS `viewCoworking_Space_Billing_Plan`*/;
/*!50001 DROP VIEW IF EXISTS `viewCoworking_Space_Billing_Plan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewCoworking_Space_Billing_Plan` AS select `Coworking_Space_Billing_Plan`.`id` AS `id`,`Coworking_Space_Billing_Plan`.`coworking_space_id` AS `coworking_space_id`,`Coworking_Space_Billing_Plan`.`billing_plan_id` AS `billing_plan_id`,`Coworking_Space_Billing_Plan`.`stripe_status` AS `stripe_status`,`Coworking_Space_Billing_Plan`.`create_date` AS `create_date` from `Coworking_Space_Billing_Plan` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewCoworking_Stripe`
--

/*!50001 DROP TABLE IF EXISTS `viewCoworking_Stripe`*/;
/*!50001 DROP VIEW IF EXISTS `viewCoworking_Stripe`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewCoworking_Stripe` AS select `Coworking_Stripe`.`id` AS `id`,`Coworking_Stripe`.`coworking_id` AS `coworking_id`,`Coworking_Stripe`.`live` AS `live`,`Coworking_Stripe`.`type` AS `type`,`Coworking_Stripe`.`key` AS `key`,`Coworking_Stripe`.`status` AS `status`,`Coworking_Stripe`.`create_date` AS `create_date` from `Coworking_Stripe` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewEvent`
--

/*!50001 DROP TABLE IF EXISTS `viewEvent`*/;
/*!50001 DROP VIEW IF EXISTS `viewEvent`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewEvent` AS select `Event`.`id` AS `id`,`Event`.`user_id` AS `user_id`,`Event`.`title` AS `title`,`Event`.`description` AS `description`,`Event`.`start_time` AS `start_time`,`Event`.`end_time` AS `end_time`,`Event`.`url` AS `url`,`Event`.`status` AS `status`,`Event`.`create_date` AS `create_date` from `Event` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewEvent_Attendance`
--

/*!50001 DROP TABLE IF EXISTS `viewEvent_Attendance`*/;
/*!50001 DROP VIEW IF EXISTS `viewEvent_Attendance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewEvent_Attendance` AS select `Event_Attendance`.`id` AS `id`,`Event_Attendance`.`event_id` AS `event_id`,`Event_Attendance`.`user_id` AS `user_id`,`Event_Attendance`.`create_date` AS `create_date` from `Event_Attendance` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewEvent_Room`
--

/*!50001 DROP TABLE IF EXISTS `viewEvent_Room`*/;
/*!50001 DROP VIEW IF EXISTS `viewEvent_Room`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewEvent_Room` AS select `Event_Room`.`id` AS `id`,`Event_Room`.`event_id` AS `event_id`,`Event_Room`.`conference_room_id` AS `conference_room_id`,`Event_Room`.`status` AS `status`,`Event_Room`.`create_date` AS `create_date` from `Event_Room` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewEvent_Tags`
--

/*!50001 DROP TABLE IF EXISTS `viewEvent_Tags`*/;
/*!50001 DROP VIEW IF EXISTS `viewEvent_Tags`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewEvent_Tags` AS select `Event_Tags`.`id` AS `id`,`Event_Tags`.`event_id` AS `event_id`,`Event_Tags`.`tag_id` AS `tag_id`,`Event_Tags`.`create_date` AS `create_date` from `Event_Tags` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewHelp`
--

/*!50001 DROP TABLE IF EXISTS `viewHelp`*/;
/*!50001 DROP VIEW IF EXISTS `viewHelp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewHelp` AS select `Help`.`id` AS `id`,`Help`.`user_id` AS `user_id`,`Help`.`title` AS `title`,`Help`.`description` AS `description`,`Help`.`estimated_time` AS `estimated_time`,`Help`.`status` AS `status`,`Help`.`create_date` AS `create_date` from `Help` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewHelp_Tags`
--

/*!50001 DROP TABLE IF EXISTS `viewHelp_Tags`*/;
/*!50001 DROP VIEW IF EXISTS `viewHelp_Tags`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewHelp_Tags` AS select `Help_Tags`.`id` AS `id`,`Help_Tags`.`help_id` AS `help_id`,`Help_Tags`.`tag_id` AS `tag_id`,`Help_Tags`.`create_date` AS `create_date` from `Help_Tags` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewJob`
--

/*!50001 DROP TABLE IF EXISTS `viewJob`*/;
/*!50001 DROP VIEW IF EXISTS `viewJob`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewJob` AS select `Job`.`id` AS `id`,`Job`.`user_id` AS `user_id`,`Job`.`title` AS `title`,`Job`.`description` AS `description`,`Job`.`pay` AS `pay`,`Job`.`compound` AS `compound`,`Job`.`status` AS `status`,`Job`.`start_date` AS `start_date`,`Job`.`create_date` AS `create_date` from `Job` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewJob_Tags`
--

/*!50001 DROP TABLE IF EXISTS `viewJob_Tags`*/;
/*!50001 DROP VIEW IF EXISTS `viewJob_Tags`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewJob_Tags` AS select `Job_Tags`.`id` AS `id`,`Job_Tags`.`job_id` AS `job_id`,`Job_Tags`.`tag_id` AS `tag_id`,`Job_Tags`.`create_date` AS `create_date` from `Job_Tags` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewLink`
--

/*!50001 DROP TABLE IF EXISTS `viewLink`*/;
/*!50001 DROP VIEW IF EXISTS `viewLink`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewLink` AS select `Link`.`id` AS `id`,`Link`.`user_id` AS `user_id`,`Link`.`url` AS `url`,`Link`.`clicks` AS `clicks`,`Link`.`status` AS `status`,`Link`.`create_date` AS `create_date` from `Link` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewLink_Tags`
--

/*!50001 DROP TABLE IF EXISTS `viewLink_Tags`*/;
/*!50001 DROP VIEW IF EXISTS `viewLink_Tags`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewLink_Tags` AS select `Link_Tags`.`id` AS `id`,`Link_Tags`.`link_id` AS `link_id`,`Link_Tags`.`tag_id` AS `tag_id`,`Link_Tags`.`create_date` AS `create_date` from `Link_Tags` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewLocation`
--

/*!50001 DROP TABLE IF EXISTS `viewLocation`*/;
/*!50001 DROP VIEW IF EXISTS `viewLocation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewLocation` AS select `Location`.`id` AS `id`,`Location`.`coworking_space_id` AS `coworking_space_id`,`Location`.`address1` AS `address1`,`Location`.`city` AS `city`,`Location`.`state` AS `state`,`Location`.`zip` AS `zip`,`Location`.`country` AS `country`,`Location`.`status` AS `status`,`Location`.`create_date` AS `create_date` from `Location` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewLocationCoworking`
--

/*!50001 DROP TABLE IF EXISTS `viewLocationCoworking`*/;
/*!50001 DROP VIEW IF EXISTS `viewLocationCoworking`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewLocationCoworking` AS select `Location`.`id` AS `id`,`Coworking_Space`.`name` AS `coworking_space`,`Location`.`address1` AS `address1`,`Location`.`address2` AS `address2`,`Location`.`city` AS `city`,`Location`.`state` AS `state`,`Location`.`zip` AS `zip`,`Location`.`country` AS `country`,`Location`.`status` AS `status`,`Location`.`create_date` AS `create_date` from (`Location` join `Coworking_Space` on((`Location`.`coworking_space_id` = `Coworking_Space`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewLocation_User_Status`
--

/*!50001 DROP TABLE IF EXISTS `viewLocation_User_Status`*/;
/*!50001 DROP VIEW IF EXISTS `viewLocation_User_Status`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewLocation_User_Status` AS select `Location_User_Status`.`id` AS `id`,`Location_User_Status`.`location_id` AS `location_id`,`Location_User_Status`.`user_id` AS `user_id`,`Location_User_Status`.`check_in` AS `check_in` from `Location_User_Status` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewMentor_Availability`
--

/*!50001 DROP TABLE IF EXISTS `viewMentor_Availability`*/;
/*!50001 DROP VIEW IF EXISTS `viewMentor_Availability`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewMentor_Availability` AS select `Mentor_Availability`.`id` AS `id`,`Mentor_Availability`.`user_id` AS `user_id`,`Mentor_Availability`.`start_time` AS `start_time`,`Mentor_Availability`.`end_time` AS `end_time`,`Mentor_Availability`.`status` AS `status`,`Mentor_Availability`.`create_date` AS `create_date` from `Mentor_Availability` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewMentor_Meeting`
--

/*!50001 DROP TABLE IF EXISTS `viewMentor_Meeting`*/;
/*!50001 DROP VIEW IF EXISTS `viewMentor_Meeting`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewMentor_Meeting` AS select `Mentor_Meeting`.`id` AS `id`,`Mentor_Meeting`.`mentor_availability_id` AS `mentor_availability_id`,`Mentor_Meeting`.`user_id` AS `user_id`,`Mentor_Meeting`.`status` AS `status`,`Mentor_Meeting`.`create_date` AS `create_date` from `Mentor_Meeting` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewOffice`
--

/*!50001 DROP TABLE IF EXISTS `viewOffice`*/;
/*!50001 DROP VIEW IF EXISTS `viewOffice`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewOffice` AS select `Office`.`id` AS `id`,`Office`.`location_id` AS `location_id`,`Office`.`name` AS `name`,`Office`.`floor` AS `floor`,`Office`.`max_capacity` AS `max_capacity`,`Office`.`current_capacity` AS `current_capacity`,`Office`.`status` AS `status`,`Office`.`create_date` AS `create_date` from `Office` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewQuestion`
--

/*!50001 DROP TABLE IF EXISTS `viewQuestion`*/;
/*!50001 DROP VIEW IF EXISTS `viewQuestion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewQuestion` AS select `Question`.`id` AS `id`,`Question`.`user_id` AS `user_id`,`Question`.`title` AS `title`,`Question`.`description` AS `description`,`Question`.`status` AS `status`,`Question`.`views` AS `views`,`Question`.`create_date` AS `create_date` from `Question` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewQuestion_Tags`
--

/*!50001 DROP TABLE IF EXISTS `viewQuestion_Tags`*/;
/*!50001 DROP VIEW IF EXISTS `viewQuestion_Tags`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewQuestion_Tags` AS select `Question_Tags`.`id` AS `id`,`Question_Tags`.`question_id` AS `question_id`,`Question_Tags`.`tag_id` AS `tag_id`,`Question_Tags`.`status` AS `status`,`Question_Tags`.`create_date` AS `create_date` from `Question_Tags` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewQuestion_Vote`
--

/*!50001 DROP TABLE IF EXISTS `viewQuestion_Vote`*/;
/*!50001 DROP VIEW IF EXISTS `viewQuestion_Vote`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewQuestion_Vote` AS select `Question_Vote`.`id` AS `id`,`Question_Vote`.`question_id` AS `question_id`,`Question_Vote`.`user_id` AS `user_id`,`Question_Vote`.`vote` AS `vote`,`Question_Vote`.`create_date` AS `create_date` from `Question_Vote` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewReferral`
--

/*!50001 DROP TABLE IF EXISTS `viewReferral`*/;
/*!50001 DROP VIEW IF EXISTS `viewReferral`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewReferral` AS select `Referral`.`id` AS `id`,`Referral`.`user_id` AS `user_id`,`Referral`.`event_id` AS `event_id`,`Referral`.`key` AS `key`,`Referral`.`clicks` AS `clicks`,`Referral`.`status` AS `status`,`Referral`.`create_date` AS `create_date` from `Referral` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewResponse`
--

/*!50001 DROP TABLE IF EXISTS `viewResponse`*/;
/*!50001 DROP VIEW IF EXISTS `viewResponse`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewResponse` AS select `Response`.`id` AS `id`,`Response`.`question_id` AS `question_id`,`Response`.`user_id` AS `user_id`,`Response`.`response` AS `response`,`Response`.`status` AS `status`,`Response`.`thread` AS `thread`,`Response`.`create_date` AS `create_date` from `Response` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewResponse_Vote`
--

/*!50001 DROP TABLE IF EXISTS `viewResponse_Vote`*/;
/*!50001 DROP VIEW IF EXISTS `viewResponse_Vote`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewResponse_Vote` AS select `Response_Vote`.`id` AS `id`,`Response_Vote`.`response_id` AS `response_id`,`Response_Vote`.`user_id` AS `user_id`,`Response_Vote`.`vote` AS `vote`,`Response_Vote`.`create_date` AS `create_date` from `Response_Vote` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewTags`
--

/*!50001 DROP TABLE IF EXISTS `viewTags`*/;
/*!50001 DROP VIEW IF EXISTS `viewTags`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewTags` AS select `Tags`.`id` AS `id`,`Tags`.`tag` AS `tag`,`Tags`.`status` AS `status`,`Tags`.`create_date` AS `create_date` from `Tags` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewUser`
--

/*!50001 DROP TABLE IF EXISTS `viewUser`*/;
/*!50001 DROP VIEW IF EXISTS `viewUser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewUser` AS select `User`.`id` AS `id`,`User`.`fullName` AS `fullName`,`User`.`email` AS `email`,`User`.`password` AS `password`,`User`.`status` AS `status`,`User`.`create_date` AS `create_date` from `User` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewUser_Address`
--

/*!50001 DROP TABLE IF EXISTS `viewUser_Address`*/;
/*!50001 DROP VIEW IF EXISTS `viewUser_Address`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewUser_Address` AS select `User_Address`.`id` AS `id`,`User_Address`.`user_id` AS `user_id`,`User_Address`.`address` AS `address`,`User_Address`.`city` AS `city`,`User_Address`.`state` AS `state`,`User_Address`.`zip` AS `zip`,`User_Address`.`status` AS `status`,`User_Address`.`create_date` AS `create_date` from `User_Address` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewUser_Billing`
--

/*!50001 DROP TABLE IF EXISTS `viewUser_Billing`*/;
/*!50001 DROP VIEW IF EXISTS `viewUser_Billing`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewUser_Billing` AS select `User_Billing`.`id` AS `id`,`User_Billing`.`user_id` AS `user_id`,`User_Billing`.`coworking_space_billing_plan_id` AS `coworking_space_billing_plan_id`,`User_Billing`.`status` AS `status`,`User_Billing`.`create_date` AS `create_date` from `User_Billing` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewUser_Bio`
--

/*!50001 DROP TABLE IF EXISTS `viewUser_Bio`*/;
/*!50001 DROP VIEW IF EXISTS `viewUser_Bio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewUser_Bio` AS select `User_Bio`.`id` AS `id`,`User_Bio`.`user_id` AS `user_id`,`User_Bio`.`description` AS `description`,`User_Bio`.`status` AS `status`,`User_Bio`.`create_date` AS `create_date` from `User_Bio` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewUser_Cave`
--

/*!50001 DROP TABLE IF EXISTS `viewUser_Cave`*/;
/*!50001 DROP VIEW IF EXISTS `viewUser_Cave`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewUser_Cave` AS select `User_Cave`.`id` AS `id`,`User_Cave`.`user_id` AS `user_id`,`User_Cave`.`status` AS `status`,`User_Cave`.`create_date` AS `create_date` from `User_Cave` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewUser_Circle`
--

/*!50001 DROP TABLE IF EXISTS `viewUser_Circle`*/;
/*!50001 DROP VIEW IF EXISTS `viewUser_Circle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewUser_Circle` AS select `User_Circle`.`id` AS `id`,`User_Circle`.`circle_id` AS `circle_id`,`User_Circle`.`user_id` AS `user_id`,`User_Circle`.`member_type` AS `member_type`,`User_Circle`.`status` AS `status`,`User_Circle`.`create_date` AS `create_date` from `User_Circle` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewUser_Company`
--

/*!50001 DROP TABLE IF EXISTS `viewUser_Company`*/;
/*!50001 DROP VIEW IF EXISTS `viewUser_Company`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewUser_Company` AS select `User_Company`.`id` AS `id`,`User_Company`.`company_id` AS `company_id`,`User_Company`.`user_id` AS `user_id`,`User_Company`.`status` AS `status`,`User_Company`.`create_date` AS `create_date` from `User_Company` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewUser_Contact`
--

/*!50001 DROP TABLE IF EXISTS `viewUser_Contact`*/;
/*!50001 DROP VIEW IF EXISTS `viewUser_Contact`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewUser_Contact` AS select `User_Contact`.`id` AS `id`,`User_Contact`.`user_id` AS `user_id`,`User_Contact`.`contact_description_id` AS `contact_description_id`,`User_Contact`.`contact_value` AS `contact_value`,`User_Contact`.`status` AS `status`,`User_Contact`.`create_date` AS `create_date` from `User_Contact` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewUser_Image`
--

/*!50001 DROP TABLE IF EXISTS `viewUser_Image`*/;
/*!50001 DROP VIEW IF EXISTS `viewUser_Image`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewUser_Image` AS select `User_Image`.`id` AS `id`,`User_Image`.`user_id` AS `user_id`,`User_Image`.`image` AS `image`,`User_Image`.`status` AS `status`,`User_Image`.`create_date` AS `create_date` from `User_Image` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewUser_Invite`
--

/*!50001 DROP TABLE IF EXISTS `viewUser_Invite`*/;
/*!50001 DROP VIEW IF EXISTS `viewUser_Invite`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewUser_Invite` AS select `User_Invite`.`id` AS `id`,`User_Invite`.`user_id` AS `user_id`,`User_Invite`.`email` AS `email`,`User_Invite`.`key` AS `key`,`User_Invite`.`status` AS `status`,`User_Invite`.`create_date` AS `create_date`,`User_Invite`.`expire_date` AS `expire_date` from `User_Invite` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewUser_Login`
--

/*!50001 DROP TABLE IF EXISTS `viewUser_Login`*/;
/*!50001 DROP VIEW IF EXISTS `viewUser_Login`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewUser_Login` AS select `User_Login`.`id` AS `id`,`User_Login`.`user_id` AS `user_id`,`User_Login`.`ip` AS `ip`,`User_Login`.`login_time` AS `login_time` from `User_Login` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewUser_Office`
--

/*!50001 DROP TABLE IF EXISTS `viewUser_Office`*/;
/*!50001 DROP VIEW IF EXISTS `viewUser_Office`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewUser_Office` AS select `User_Office`.`id` AS `id`,`User_Office`.`user_id` AS `user_id`,`User_Office`.`office_id` AS `office_id`,`User_Office`.`status` AS `status`,`User_Office`.`create_date` AS `create_date` from `User_Office` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewUser_Stripe`
--

/*!50001 DROP TABLE IF EXISTS `viewUser_Stripe`*/;
/*!50001 DROP VIEW IF EXISTS `viewUser_Stripe`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewUser_Stripe` AS select `User_Stripe`.`id` AS `id`,`User_Stripe`.`user_id` AS `user_id`,`User_Stripe`.`stripe_token` AS `stripe_token`,`User_Stripe`.`last_checked` AS `last_checked`,`User_Stripe`.`is_active` AS `is_active`,`User_Stripe`.`create_date` AS `create_date` from `User_Stripe` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewUser_Tags`
--

/*!50001 DROP TABLE IF EXISTS `viewUser_Tags`*/;
/*!50001 DROP VIEW IF EXISTS `viewUser_Tags`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewUser_Tags` AS select `User_Tags`.`id` AS `id`,`User_Tags`.`user_id` AS `user_id`,`User_Tags`.`tags_id` AS `tags_id`,`User_Tags`.`status` AS `status`,`User_Tags`.`create_date` AS `create_date` from `User_Tags` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewUser_Time`
--

/*!50001 DROP TABLE IF EXISTS `viewUser_Time`*/;
/*!50001 DROP VIEW IF EXISTS `viewUser_Time`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewUser_Time` AS select `User_Time`.`id` AS `id`,`User_Time`.`giving_user_id` AS `giving_user_id`,`User_Time`.`taking_user_id` AS `taking_user_id`,`User_Time`.`start_time` AS `start_time` from `User_Time` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewUser_Type`
--

/*!50001 DROP TABLE IF EXISTS `viewUser_Type`*/;
/*!50001 DROP VIEW IF EXISTS `viewUser_Type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewUser_Type` AS select `User_Type`.`id` AS `id`,`User_Type`.`user_id` AS `user_id`,`User_Type`.`type` AS `type`,`User_Type`.`create_date` AS `create_date` from `User_Type` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-07-12  2:31:50
