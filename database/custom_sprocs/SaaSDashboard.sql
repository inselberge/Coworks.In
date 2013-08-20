CREATE DATABASE  IF NOT EXISTS `SaaSDashBoard` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `SaaSDashBoard`;
-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: SaaSDashBoard
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
-- Table structure for table `cash`
--

DROP TABLE IF EXISTS `cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `start_of_month_cash` double unsigned NOT NULL,
  `incoming_cash` double unsigned NOT NULL,
  `outgoing_cash` double unsigned NOT NULL,
  `net_cash_burn` double NOT NULL,
  `end_of_month_cash` double unsigned NOT NULL,
  `runaway` float NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_acquisition_cost`
--

DROP TABLE IF EXISTS `customer_acquisition_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_acquisition_cost` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `marketing_spend` double unsigned NOT NULL,
  `spend_per_signup_blended` float unsigned NOT NULL,
  `spend_per_signup_paid` float unsigned NOT NULL,
  `sales_spend` double unsigned NOT NULL,
  `sales_spend_per_new_paying_customer` float unsigned NOT NULL,
  `total_customer_acquisition_cost_blended` float unsigned NOT NULL,
  `total_customer_acquisition_cost_paid` float unsigned NOT NULL,
  `time_to_recover_cac_in_months` float NOT NULL,
  `customer_lifetime_value` float unsigned NOT NULL,
  `customer_lifetime_value_acquisition_cost_multiple` float unsigned NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monthly_recurring_revenue`
--

DROP TABLE IF EXISTS `monthly_recurring_revenue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monthly_recurring_revenue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `start_of_month_recurring_revenue` double unsigned NOT NULL,
  `new_recurring_revenue_from_new_customers` double unsigned NOT NULL,
  `new_recurring_revenue_from_expansion` double unsigned NOT NULL,
  `lost_recurring_revenue_from_contraction` double unsigned NOT NULL,
  `churn_rate` float NOT NULL,
  `net_new_recurring_revenue` double NOT NULL,
  `end_of_month_recurring_revenue` double unsigned NOT NULL,
  `month_over_month_growth` float NOT NULL,
  `average_revenue_per_account` double unsigned NOT NULL,
  `average_revenue_per_new_account` double unsigned NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paying_customers`
--

DROP TABLE IF EXISTS `paying_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paying_customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `start_of_month_customers` int(10) unsigned NOT NULL,
  `new_customers` int(10) unsigned NOT NULL,
  `conversion_rate` float unsigned NOT NULL,
  `lost_customers` int(10) unsigned NOT NULL,
  `churn_rate` double NOT NULL,
  `net_new_customers` int(11) NOT NULL,
  `end_of_month_customers` int(10) unsigned NOT NULL,
  `growth_customers` double NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `signup`
--

DROP TABLE IF EXISTS `signup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'SaaSDashBoard'
--

--
-- Dumping routines for database 'SaaSDashBoard'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-06-24 22:50:43
