-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 10, 2021 at 11:45 PM
-- Server version: 8.0.25-0ubuntu0.20.04.1
-- PHP Version: 7.2.34-23+ubuntu20.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `craftCMS`
--

-- --------------------------------------------------------

--
-- Table structure for table `assetindexdata`
--

CREATE TABLE `assetindexdata` (
  `id` int NOT NULL,
  `sessionId` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int NOT NULL,
  `uri` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `size` bigint UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int UNSIGNED DEFAULT NULL,
  `height` int UNSIGNED DEFAULT NULL,
  `size` bigint UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(6, 1, 1, 2, 'test.png', 'image', 300, 300, 25849, NULL, NULL, NULL, '2021-06-28 21:15:19', '2021-06-28 21:15:19', '2021-06-28 21:15:19', '90bc4dc9-6f2c-4603-acd4-f0afdd41d46a'),
(12, 1, 1, 2, 'headphones.jpg', 'image', 1024, 1024, 1189132, NULL, NULL, NULL, '2021-06-28 21:24:43', '2021-06-28 21:24:43', '2021-06-28 21:24:43', '683e402a-e802-4fb8-9188-cc91696b4af3');

-- --------------------------------------------------------

--
-- Table structure for table `assettransformindex`
--

CREATE TABLE `assettransformindex` (
  `id` int NOT NULL,
  `assetId` int NOT NULL,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `volumeId` int DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assettransforms`
--

CREATE TABLE `assettransforms` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int UNSIGNED DEFAULT NULL,
  `height` int UNSIGNED DEFAULT NULL,
  `format` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `assettransforms`
--

INSERT INTO `assettransforms` (`id`, `name`, `handle`, `mode`, `position`, `width`, `height`, `format`, `quality`, `interlace`, `dimensionChangeTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Profile Photo', 'profilePhoto', 'crop', 'center-center', 250, 250, NULL, 30, 'none', '2021-06-28 19:50:10', '2021-06-28 19:50:10', '2021-06-28 19:50:10', '8212eef9-36c8-47b5-ab4e-9892531926ac');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups`
--

CREATE TABLE `categorygroups` (
  `id` int NOT NULL,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups_sites`
--

CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `template` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `changedattributes`
--

CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `changedattributes`
--

INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES
(2, 1, 'email', '2021-06-29 17:03:42', 0, 2),
(2, 1, 'firstName', '2021-06-28 21:19:01', 0, 2),
(2, 1, 'lastName', '2021-06-28 21:19:01', 0, 2),
(2, 1, 'lastPasswordChangeDate', '2021-06-29 17:03:42', 0, 2),
(2, 1, 'password', '2021-06-29 17:03:42', 0, 2),
(3, 1, 'uri', '2021-06-28 21:19:44', 0, 2),
(43, 1, 'authorId', '2021-07-09 17:59:00', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `changedfields`
--

CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `changedfields`
--

INSERT INTO `changedfields` (`elementId`, `siteId`, `fieldId`, `dateUpdated`, `propagated`, `userId`) VALUES
(3, 1, 1, '2021-07-09 18:20:24', 0, 2),
(3, 1, 5, '2021-07-09 22:42:07', 0, 2),
(20, 1, 5, '2021-07-09 19:04:56', 0, 2),
(43, 1, 9, '2021-07-09 18:06:38', 0, 2),
(43, 1, 10, '2021-07-09 18:06:38', 0, 2),
(43, 1, 11, '2021-07-09 18:06:38', 0, 2),
(59, 1, 5, '2021-07-09 19:10:56', 0, 2),
(59, 1, 10, '2021-07-09 18:47:27', 0, 2),
(63, 1, 10, '2021-07-09 18:48:02', 0, 2),
(67, 1, 10, '2021-07-09 18:48:12', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int NOT NULL,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_firstName` text COLLATE utf8_unicode_ci,
  `field_lastName` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_firstName`, `field_lastName`) VALUES
(1, 2, 1, NULL, '2021-06-28 19:28:48', '2021-06-29 17:03:41', 'f85695c4-a3ec-46ba-9ed7-37db186be316', NULL, NULL),
(2, 3, 1, 'Homepage', '2021-06-28 19:36:56', '2021-07-09 22:42:42', '5f093116-70a9-43d7-9655-60981f439791', NULL, NULL),
(3, 4, 1, 'Homepage', '2021-06-28 19:36:56', '2021-06-28 19:36:56', '2317cc9f-a1d7-4536-9a2e-b16547b6aaf2', NULL, NULL),
(4, 5, 1, 'Homepage', '2021-06-28 21:14:33', '2021-06-28 21:14:33', '9c94caec-d09f-4e18-aa90-f68d31103b44', NULL, NULL),
(5, 6, 1, 'Test', '2021-06-28 21:15:19', '2021-06-28 21:15:19', '69044656-2349-4e4a-9dbe-acd9d786259d', NULL, NULL),
(6, 8, 1, 'Homepage', '2021-06-28 21:15:22', '2021-06-28 21:15:22', 'beebab78-f51e-41aa-a739-e295f9807f8d', NULL, NULL),
(7, 10, 1, 'Homepage', '2021-06-28 21:19:44', '2021-06-28 21:19:44', 'ed89cf30-d809-4f7e-adcc-3564ee5cf706', NULL, NULL),
(8, 12, 1, 'Headphones', '2021-06-28 21:24:42', '2021-06-28 21:24:42', '7313e706-4cbb-4d5e-9480-50834c4c23a9', NULL, NULL),
(9, 14, 1, 'Homepage', '2021-06-28 21:24:46', '2021-06-28 21:24:46', '16210d65-56e0-4d68-b3fa-b74516139656', NULL, NULL),
(10, 17, 1, 'Homepage', '2021-06-28 21:26:59', '2021-06-28 21:26:59', '9cc5e767-cc8e-46ab-b0af-6a1daee50ffb', NULL, NULL),
(11, 20, 1, 'Example', '2021-06-29 14:52:41', '2021-07-09 19:05:55', 'a6c75c91-c914-4691-93cd-980104b538e9', NULL, NULL),
(12, 21, 1, 'Example', '2021-06-29 14:52:41', '2021-06-29 14:52:41', '25ed65b6-0770-4c61-bc50-9fc73a75545b', NULL, NULL),
(13, 22, 1, 'Example', '2021-06-29 14:53:06', '2021-06-29 14:53:06', '4a156638-2fab-44e1-b6e2-cca1cd22cee9', NULL, NULL),
(14, 26, 1, 'Example', '2021-06-29 14:54:13', '2021-06-29 14:54:13', 'f405262d-0a9d-43a0-a748-f06f7eb56b7f', NULL, NULL),
(15, 30, 1, 'Example', '2021-06-29 14:59:33', '2021-06-29 14:59:33', 'f39d8451-9ab3-42f1-930e-869bb84f15af', NULL, NULL),
(16, 35, 1, 'Homepage', '2021-07-09 17:41:08', '2021-07-09 17:41:08', '1663585f-6b71-4534-af16-75810c682c4c', NULL, NULL),
(17, 39, 1, 'Homepage', '2021-07-09 17:41:38', '2021-07-09 17:41:38', '869a4078-0f4b-4a90-8b33-295649da1bb3', NULL, NULL),
(18, 43, 1, 'Employees', '2021-07-09 17:48:51', '2021-07-09 18:07:05', '183ce761-642a-4da2-a47c-c1caf20a8426', 'FirstName1', 'LastName1'),
(19, 44, 1, 'Employees', '2021-07-09 17:48:51', '2021-07-09 17:48:51', '44842015-0095-42e4-8cbd-cf888868ca21', NULL, NULL),
(20, 45, 1, 'Employees', '2021-07-09 17:55:20', '2021-07-09 17:55:20', '502b4985-3a61-480c-be74-50df2e9d745c', NULL, NULL),
(21, 46, 1, 'Employees', '2021-07-09 18:01:26', '2021-07-09 18:01:26', 'a8eabdcc-c2c9-4ac1-ad26-6b8301a4fc57', 'FirstName1', 'LastName1'),
(22, 47, 1, 'Employees', '2021-07-09 18:05:53', '2021-07-09 18:05:53', '6437bae8-2a7a-4994-9ddd-8c8baa4399aa', 'FirstName1', 'LastName1'),
(23, 48, 1, 'Employees', '2021-07-09 18:05:53', '2021-07-09 18:05:53', '365e0df4-15ca-43c1-8ee2-091096ffbfc0', NULL, NULL),
(24, 49, 1, 'Employees', '2021-07-09 18:07:05', '2021-07-09 18:07:05', 'cdc242c8-103c-42d4-8d1f-a8ba44086c23', 'FirstName1', 'LastName1'),
(26, 51, 1, 'Title 2', '2021-07-09 18:07:52', '2021-07-09 18:07:59', '683a4544-f4cc-43ec-bacb-697abca5d885', 'First Name 2', 'Last Name 2'),
(27, 52, 1, 'Title 2', '2021-07-09 18:07:52', '2021-07-09 18:07:52', '61a4d592-e05b-49a0-8e9a-61c488a13637', 'First Name 2', 'Last Name 2'),
(28, 53, 1, 'Title 2', '2021-07-09 18:07:59', '2021-07-09 18:07:59', '21d7120f-11a1-4d4f-bbf0-54135fe176d8', 'First Name 2', 'Last Name 2'),
(30, 55, 1, 'Employee2', '2021-07-09 18:09:50', '2021-07-09 18:09:55', 'eb4533ff-de1f-4c54-9d04-033ea4d266fa', 'Jhon', 'Doe'),
(31, 56, 1, 'Employee2', '2021-07-09 18:09:50', '2021-07-09 18:09:50', 'ad5c2fd0-35b9-41a9-85b6-dba6ed87592c', 'Jhon', 'Doe'),
(32, 57, 1, 'Employee2', '2021-07-09 18:09:55', '2021-07-09 18:09:55', 'd1921701-d07c-4222-877b-8b03db539c58', 'Jhon', 'Doe'),
(34, 59, 1, 'Jhon', '2021-07-09 18:17:16', '2021-07-09 19:10:56', '8d1f4b8a-fbc9-47fd-baa1-9cf1551792f5', 'Jhon', 'xyz'),
(35, 60, 1, 'Jhon', '2021-07-09 18:17:16', '2021-07-09 18:17:16', '462a532c-478d-4f8e-9dcf-6a6567c24f21', 'Jhon', 'Deo'),
(36, 61, 1, 'Jhon', '2021-07-09 18:17:20', '2021-07-09 18:17:20', 'd36ab99f-943f-453f-964b-6bebdb7dd78d', 'Jhon', 'Deo'),
(38, 63, 1, 'Jane', '2021-07-09 18:18:01', '2021-07-09 18:48:02', 'e720837d-b3fe-41e4-b0fe-20199b6cc876', 'Jane', 'abc'),
(39, 64, 1, 'Jane', '2021-07-09 18:18:01', '2021-07-09 18:18:01', '7f2b384c-e986-4156-bc8c-147184f7c6a4', 'Jane', 'Doe'),
(40, 65, 1, 'Jane', '2021-07-09 18:18:04', '2021-07-09 18:18:04', 'abbadd0e-bfa3-4724-a777-9d2624e67bdf', 'Jane', 'Doe'),
(42, 67, 1, 'Frank', '2021-07-09 18:18:23', '2021-07-09 18:48:12', 'fce96657-0f32-4701-8cb1-5ec2d95d05a7', 'Frank', 'jkl'),
(43, 68, 1, 'Frank', '2021-07-09 18:18:23', '2021-07-09 18:18:23', '5d531697-a927-4f3e-aa37-0ba2d8663368', 'Frank', 'Deo'),
(44, 69, 1, 'Frank', '2021-07-09 18:18:28', '2021-07-09 18:18:28', '4f2e221a-5754-480f-bb34-bc991218a359', 'Frank', 'Deo'),
(45, 70, 1, 'Frank', '2021-07-09 18:18:59', '2021-07-09 18:18:59', 'b2a5d47f-58ce-4a17-b2c4-6a56a8dd9677', 'Frank', 'Deo'),
(46, 71, 1, 'Jane', '2021-07-09 18:19:29', '2021-07-09 18:19:29', '4573d1f9-fbd4-4441-8ac2-c4c1c5fced95', 'Jane', 'Doe'),
(47, 72, 1, 'Homepage', '2021-07-09 18:20:24', '2021-07-09 18:20:24', '14aa1c19-c6bb-41d6-90f9-a5b96399907e', NULL, NULL),
(48, 75, 1, 'Jhon', '2021-07-09 18:47:27', '2021-07-09 18:47:27', 'bff2d4c1-cee5-49d1-b751-efadef7c0107', 'Jhon', 'xyz'),
(49, 76, 1, 'Jane', '2021-07-09 18:48:02', '2021-07-09 18:48:02', '2aec3ec0-f455-43b5-8821-0f8a4b87ce93', 'Jane', 'abc'),
(50, 77, 1, 'Frank', '2021-07-09 18:48:12', '2021-07-09 18:48:12', '7225bbbe-5e04-44c9-8256-f706c7df2179', 'Frank', 'jkl'),
(51, 79, 1, 'Example', '2021-07-09 18:57:19', '2021-07-09 18:57:19', 'dc0b98cc-71dd-4bb5-b8b5-885673a2d69c', NULL, NULL),
(52, 84, 1, 'Example', '2021-07-09 19:04:56', '2021-07-09 19:04:56', 'd7b70961-3ea5-4b5b-8e16-f27b70b08dab', NULL, NULL),
(53, 88, 1, 'Example', '2021-07-09 19:05:55', '2021-07-09 19:05:55', 'e3ae71ab-911e-4aed-8ff7-e20d05949d2d', NULL, NULL),
(54, 93, 1, 'Jhon', '2021-07-09 19:10:56', '2021-07-09 19:10:56', 'd7deaf9b-2550-4120-9909-cdff52d3c54d', 'Jhon', 'xyz'),
(55, 95, 1, 'Homepage', '2021-07-09 19:23:17', '2021-07-09 19:23:17', '1a81d0f3-cc54-46b3-809e-aa366e7e6ca4', NULL, NULL),
(56, 99, 1, 'Homepage', '2021-07-09 19:23:47', '2021-07-09 19:23:47', 'b8b2a6da-756a-4d73-901e-df97186c91d1', NULL, NULL),
(57, 103, 1, 'Homepage', '2021-07-09 22:42:07', '2021-07-09 22:42:07', '3fd80673-8fe5-4b0d-b204-9b025490e26d', NULL, NULL),
(58, 106, 1, 'Homepage', '2021-07-09 22:42:42', '2021-07-09 22:42:42', '78e3504d-bb25-4264-96e5-893eb747cd5e', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `craftidtokens`
--

CREATE TABLE `craftidtokens` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `accessToken` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deprecationerrors`
--

CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint UNSIGNED DEFAULT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `traces` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drafts`
--

CREATE TABLE `drafts` (
  `id` int NOT NULL,
  `sourceId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `notes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `drafts`
--

INSERT INTO `drafts` (`id`, `sourceId`, `creatorId`, `name`, `notes`, `trackChanges`, `dateLastMerged`, `saved`) VALUES
(1, NULL, 2, 'First draft', NULL, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `elementindexsettings`
--

CREATE TABLE `elementindexsettings` (
  `id` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `settings` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `elementindexsettings`
--

INSERT INTO `elementindexsettings` (`id`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft\\elements\\Entry', '{\"sourceOrder\":[[\"key\",\"*\"],[\"heading\",\"Singles\"],[\"key\",\"single:7121f7fe-e16c-4776-bf07-811a25cd8b1e\"],[\"key\",\"single:a887e226-ad5b-4ffc-b54e-6bd80d70fd34\"],[\"key\",\"section:cc7b6c50-7a1c-4169-a014-ed8976aa0170\"]],\"sources\":{\"*\":{\"tableAttributes\":{\"1\":\"section\",\"2\":\"postDate\",\"3\":\"expiryDate\",\"4\":\"author\",\"5\":\"link\"}},\"single:7121f7fe-e16c-4776-bf07-811a25cd8b1e\":{\"tableAttributes\":{\"1\":\"postDate\",\"2\":\"expiryDate\",\"3\":\"author\",\"4\":\"link\"}},\"single:a887e226-ad5b-4ffc-b54e-6bd80d70fd34\":{\"tableAttributes\":{\"1\":\"postDate\",\"2\":\"expiryDate\",\"3\":\"author\",\"4\":\"link\"}},\"section:cc7b6c50-7a1c-4169-a014-ed8976aa0170\":{\"tableAttributes\":{\"1\":\"postDate\",\"2\":\"expiryDate\",\"3\":\"link\"}}}}', '2021-07-09 18:21:06', '2021-07-09 18:21:06', '52abe051-4b29-4e50-a8f1-295ea4c6a316');

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

CREATE TABLE `elements` (
  `id` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `elements`
--

INSERT INTO `elements` (`id`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, NULL, NULL, 'craft\\commerce\\elements\\Donation', 1, 0, '2021-06-28 19:28:46', '2021-06-28 19:28:46', NULL, '84fa5202-b39c-4929-85e9-0f1c78aee348'),
(2, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2021-06-28 19:28:48', '2021-06-29 17:03:41', NULL, 'a6618696-0553-4ff4-bd3e-bb640f6c5204'),
(3, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2021-06-28 19:36:56', '2021-07-09 22:42:42', NULL, 'd6e23a44-a09c-4805-8c9f-3d3924377e5b'),
(4, NULL, 1, 2, 'craft\\elements\\Entry', 1, 0, '2021-06-28 19:36:56', '2021-06-28 19:36:56', NULL, '1f30518f-9348-4276-969c-24fa6f520d03'),
(5, NULL, 2, 2, 'craft\\elements\\Entry', 1, 0, '2021-06-28 21:14:33', '2021-06-28 21:14:33', NULL, 'fb054a6d-1410-4a85-b436-f3641a772051'),
(6, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2021-06-28 21:15:19', '2021-06-28 21:15:19', NULL, 'e8cc19b0-e74e-473b-bf33-2fd58f22a415'),
(7, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-28 21:15:22', '2021-07-09 18:20:24', NULL, '85c2cb6d-475f-4c0c-b2de-41b9a0616d3b'),
(8, NULL, 3, 2, 'craft\\elements\\Entry', 1, 0, '2021-06-28 21:15:22', '2021-06-28 21:15:22', NULL, '37ba1ab9-6eb1-4f3c-a2c5-f53c6f72fee5'),
(9, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-28 21:15:22', '2021-06-28 21:15:22', NULL, '364bca85-7908-43da-8608-65eb5996dcb8'),
(10, NULL, 4, 2, 'craft\\elements\\Entry', 1, 0, '2021-06-28 21:19:44', '2021-06-28 21:19:44', NULL, 'b4a15217-1a30-434c-85f3-2be0776743eb'),
(11, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-28 21:19:44', '2021-06-28 21:15:22', NULL, 'cf2a352d-f47c-4090-ad94-6390d7ef1cec'),
(12, NULL, NULL, 3, 'craft\\elements\\Asset', 1, 0, '2021-06-28 21:24:42', '2021-06-28 21:24:42', NULL, '302558db-0a01-442f-8ca4-ef1dfc76118b'),
(13, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-28 21:24:46', '2021-07-09 18:20:24', NULL, '8c8feb16-b42e-48bc-aa1a-71330133aab7'),
(14, NULL, 5, 2, 'craft\\elements\\Entry', 1, 0, '2021-06-28 21:24:46', '2021-06-28 21:24:46', NULL, '6771e198-3cb2-4f87-9fff-31a9b341156c'),
(15, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-28 21:24:46', '2021-06-28 21:24:46', NULL, '532cafae-b3c1-4d52-be9c-24dce422419c'),
(16, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-28 21:24:46', '2021-06-28 21:24:46', NULL, '3f39b5b8-ba04-4c6d-ac24-87732764d727'),
(17, NULL, 6, 2, 'craft\\elements\\Entry', 1, 0, '2021-06-28 21:26:59', '2021-06-28 21:26:59', NULL, 'eaa892d4-587e-4fd9-bed7-959497e42749'),
(18, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-28 21:26:59', '2021-06-28 21:24:46', NULL, '1c980c88-4813-4eae-9626-bcf1f8f6d152'),
(19, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-28 21:26:59', '2021-06-28 21:24:46', NULL, '031e64ba-e688-428f-988e-076421d607e6'),
(20, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2021-06-29 14:52:41', '2021-07-09 19:05:55', NULL, 'f3f4eac6-d946-4510-8827-e2a2ee5d84f6'),
(21, NULL, 7, 9, 'craft\\elements\\Entry', 1, 0, '2021-06-29 14:52:41', '2021-06-29 14:52:41', NULL, 'd032af87-7515-45cc-8aab-0574ab666b4a'),
(22, NULL, 8, 9, 'craft\\elements\\Entry', 1, 0, '2021-06-29 14:53:06', '2021-06-29 14:53:06', NULL, 'db95bbf1-bbbb-43fb-9ffe-10c3cbf100ae'),
(23, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-29 14:54:13', '2021-07-09 19:04:56', NULL, '9cbd0966-17de-406f-9e7f-0f6fe58776b4'),
(24, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-29 14:54:13', '2021-07-09 19:04:56', NULL, 'b4e2ac28-ed43-47cf-bb5b-227149d4de28'),
(25, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-29 14:54:13', '2021-07-09 19:04:56', NULL, '9ea088e7-7e49-495b-a4a7-236367e2647c'),
(26, NULL, 9, 9, 'craft\\elements\\Entry', 1, 0, '2021-06-29 14:54:13', '2021-06-29 14:54:13', NULL, '46f4207f-910c-4163-8722-2c65e8ef5540'),
(27, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-29 14:54:13', '2021-06-29 14:54:13', NULL, 'e634fa40-e034-4a74-b7d9-e7650f08997d'),
(28, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-29 14:54:13', '2021-06-29 14:54:13', NULL, '9794b47a-ddc0-4409-ae1d-6d91f68e6f24'),
(29, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-29 14:54:13', '2021-06-29 14:54:13', NULL, 'ae31c3f4-4e07-43b3-a0fb-7576b347a503'),
(30, NULL, 10, 9, 'craft\\elements\\Entry', 1, 0, '2021-06-29 14:59:33', '2021-06-29 14:59:33', NULL, '48ceebab-d276-4fe1-a35d-279b3c4bf0ee'),
(31, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-29 14:59:33', '2021-06-29 14:54:13', NULL, '9eb98a9b-b265-4a85-a986-af1e17c08835'),
(32, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-29 14:59:33', '2021-06-29 14:54:13', NULL, 'fca82082-bbd9-4783-9722-22b41841c6d1'),
(33, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-06-29 14:59:33', '2021-06-29 14:54:13', NULL, '1d97a43f-42fe-42bb-a2a3-4992b16958db'),
(34, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 0, 0, '2021-07-09 17:41:07', '2021-07-09 17:41:38', '2021-07-09 18:20:24', 'b8c2575d-9884-44f4-abfa-9a1a1404a39b'),
(35, NULL, 11, 2, 'craft\\elements\\Entry', 1, 0, '2021-07-09 17:41:07', '2021-07-09 17:41:07', NULL, '81079d9e-dac0-4aaf-a223-913697cee879'),
(36, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 17:41:08', '2021-07-09 17:41:07', NULL, '834a6104-497c-4f62-8b0f-1fcd8630c608'),
(37, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 17:41:08', '2021-07-09 17:41:07', NULL, '4b2d485e-f83e-400c-b9ae-964bd14ad2fd'),
(38, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 17:41:08', '2021-07-09 17:41:07', NULL, '775c48a3-00c0-41ec-ae19-19fa81f4584d'),
(39, NULL, 12, 2, 'craft\\elements\\Entry', 1, 0, '2021-07-09 17:41:38', '2021-07-09 17:41:38', NULL, '75cad925-e196-4c7d-95ee-d331faea0555'),
(40, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 17:41:38', '2021-07-09 17:41:38', NULL, '43267206-b34d-438b-bcfe-3af56fa06fb3'),
(41, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 17:41:38', '2021-07-09 17:41:38', NULL, 'a615ad83-512a-4f7b-ab66-5ca98de332c0'),
(42, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 0, 0, '2021-07-09 17:41:38', '2021-07-09 17:41:38', NULL, '29668bcb-2b98-43df-b53d-fee6750af428'),
(43, NULL, NULL, 10, 'craft\\elements\\Entry', 1, 0, '2021-07-09 17:48:51', '2021-07-09 18:07:05', '2021-07-09 18:12:37', 'fbed6973-11c0-4b03-9ab8-444b5b9d06ce'),
(44, NULL, 13, 10, 'craft\\elements\\Entry', 1, 0, '2021-07-09 17:48:51', '2021-07-09 17:48:51', '2021-07-09 18:12:37', 'f80ef397-7f66-4888-9814-79170fc9aec9'),
(45, NULL, 14, 10, 'craft\\elements\\Entry', 1, 0, '2021-07-09 17:55:20', '2021-07-09 17:55:20', '2021-07-09 18:12:37', 'f5e71c07-8851-4eb6-8282-23b294f87704'),
(46, NULL, 15, 10, 'craft\\elements\\Entry', 1, 0, '2021-07-09 18:01:26', '2021-07-09 18:01:26', '2021-07-09 18:12:37', '502e1f58-cebc-470f-aadd-083bae2cc4d0'),
(47, NULL, 16, 10, 'craft\\elements\\Entry', 1, 0, '2021-07-09 18:05:53', '2021-07-09 18:05:53', '2021-07-09 18:12:37', 'e544ef1c-aadb-469e-8012-1d1012a1b697'),
(48, 1, NULL, 10, 'craft\\elements\\Entry', 1, 0, '2021-07-09 18:05:53', '2021-07-09 18:05:53', '2021-07-09 18:12:56', '7114f120-ab59-4bb9-a3a7-9baaf73a9994'),
(49, NULL, 17, 10, 'craft\\elements\\Entry', 1, 0, '2021-07-09 18:07:05', '2021-07-09 18:07:05', '2021-07-09 18:12:37', '4cda9f4d-372d-418e-9752-04b17e9ff6a8'),
(51, NULL, NULL, 10, 'craft\\elements\\Entry', 0, 0, '2021-07-09 18:07:52', '2021-07-09 18:07:59', '2021-07-09 18:09:10', '36871131-c4f7-4f91-9b4a-891bd09bf0bd'),
(52, NULL, 18, 10, 'craft\\elements\\Entry', 0, 0, '2021-07-09 18:07:52', '2021-07-09 18:07:52', '2021-07-09 18:09:10', 'aee76042-f989-40d8-a613-2701ae2b725e'),
(53, NULL, 19, 10, 'craft\\elements\\Entry', 0, 0, '2021-07-09 18:07:59', '2021-07-09 18:07:59', '2021-07-09 18:09:10', 'ec534059-f9e6-459d-8a6d-0721464a3991'),
(55, NULL, NULL, 10, 'craft\\elements\\Entry', 0, 0, '2021-07-09 18:09:50', '2021-07-09 18:09:55', '2021-07-09 18:12:37', 'be2c0df8-828d-4ac1-8282-c6ae797425aa'),
(56, NULL, 20, 10, 'craft\\elements\\Entry', 0, 0, '2021-07-09 18:09:50', '2021-07-09 18:09:50', '2021-07-09 18:12:37', '00ae974d-d3a7-4d59-a1a3-ac7f629572fe'),
(57, NULL, 21, 10, 'craft\\elements\\Entry', 0, 0, '2021-07-09 18:09:55', '2021-07-09 18:09:55', '2021-07-09 18:12:37', 'e8939ad1-1584-4ac1-9d3e-e54e0b728ce2'),
(59, NULL, NULL, 12, 'craft\\elements\\Entry', 1, 0, '2021-07-09 18:17:16', '2021-07-09 19:10:56', NULL, '53aae2eb-3fe4-48a7-8fe5-bd7aba040546'),
(60, NULL, 22, 12, 'craft\\elements\\Entry', 1, 0, '2021-07-09 18:17:16', '2021-07-09 18:17:16', NULL, '086eb3b1-17ea-4088-a59b-58e29c42fdeb'),
(61, NULL, 23, 12, 'craft\\elements\\Entry', 1, 0, '2021-07-09 18:17:20', '2021-07-09 18:17:20', NULL, '3c9b6f23-8d61-4c0d-b01e-2ed5ef08fa57'),
(63, NULL, NULL, 12, 'craft\\elements\\Entry', 1, 0, '2021-07-09 18:18:01', '2021-07-09 18:48:02', NULL, 'f03bdc29-0731-4c07-92d5-c4889d75cfc5'),
(64, NULL, 24, 12, 'craft\\elements\\Entry', 1, 0, '2021-07-09 18:18:01', '2021-07-09 18:18:01', NULL, 'b82c4629-8cbb-42bc-b5da-69c9a9600c82'),
(65, NULL, 25, 12, 'craft\\elements\\Entry', 1, 0, '2021-07-09 18:18:04', '2021-07-09 18:18:04', NULL, '58e1870a-4966-4b9c-9cc6-153524012f89'),
(67, NULL, NULL, 12, 'craft\\elements\\Entry', 1, 0, '2021-07-09 18:18:23', '2021-07-09 18:48:12', NULL, '56a9abe3-7cd0-4684-b504-d179ea787f20'),
(68, NULL, 26, 12, 'craft\\elements\\Entry', 1, 0, '2021-07-09 18:18:23', '2021-07-09 18:18:23', NULL, 'a4dd62ce-a96d-40d2-8e35-2e593baeced7'),
(69, NULL, 27, 12, 'craft\\elements\\Entry', 1, 0, '2021-07-09 18:18:28', '2021-07-09 18:18:28', NULL, 'be2fb9eb-09ea-49c3-8d84-2fc0300ce51c'),
(70, NULL, 28, 12, 'craft\\elements\\Entry', 1, 0, '2021-07-09 18:18:59', '2021-07-09 18:18:59', NULL, '10db33f3-c001-477d-aade-ed598c3ad5a5'),
(71, NULL, 29, 12, 'craft\\elements\\Entry', 1, 0, '2021-07-09 18:19:29', '2021-07-09 18:19:29', NULL, '1aa45f48-72fc-487d-b3f6-e55b2cfb87bd'),
(72, NULL, 30, 2, 'craft\\elements\\Entry', 1, 0, '2021-07-09 18:20:24', '2021-07-09 18:20:24', NULL, '5b4ebe8b-f692-4dad-90a5-197789a2a34e'),
(73, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 18:20:24', '2021-07-09 18:20:24', NULL, '75703fd4-a19b-4e2e-8015-9e0a3faf792f'),
(74, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 18:20:24', '2021-07-09 18:20:24', NULL, '95a9ff5d-8ab9-4ec4-91f9-1f2ac14ef5d0'),
(75, NULL, 31, 12, 'craft\\elements\\Entry', 1, 0, '2021-07-09 18:47:27', '2021-07-09 18:47:27', NULL, 'a9c0021f-34c7-47f4-9db6-3f3f0d6b74c3'),
(76, NULL, 32, 12, 'craft\\elements\\Entry', 1, 0, '2021-07-09 18:48:02', '2021-07-09 18:48:02', NULL, 'afab0801-7248-4448-b958-96ff68376c3e'),
(77, NULL, 33, 12, 'craft\\elements\\Entry', 1, 0, '2021-07-09 18:48:12', '2021-07-09 18:48:12', NULL, 'ad930a55-e41f-4dc8-89a5-cfe03de448cf'),
(78, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 18:57:19', '2021-07-09 18:57:19', '2021-07-09 19:04:56', '88dbee6c-83bd-4a1d-9546-884756417c3d'),
(79, NULL, 34, 9, 'craft\\elements\\Entry', 1, 0, '2021-07-09 18:57:19', '2021-07-09 18:57:19', NULL, '8cbf097c-0347-4522-a7c0-f6b5cd1eae34'),
(80, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 18:57:19', '2021-07-09 18:57:19', NULL, 'f944f57c-cc04-4c66-a2ad-1c7baa8d52e4'),
(81, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 18:57:19', '2021-07-09 18:57:19', NULL, '344f3686-d7b1-49e8-ae3e-62d85f1cc6a8'),
(82, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 18:57:19', '2021-07-09 18:57:19', NULL, '4f5a6790-1ec2-41d9-8838-07900fd96956'),
(83, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 18:57:19', '2021-07-09 18:57:19', NULL, 'e83c50ed-6b7e-416f-97a8-74dd02f00477'),
(84, NULL, 35, 9, 'craft\\elements\\Entry', 1, 0, '2021-07-09 19:04:56', '2021-07-09 19:04:56', NULL, '33353c9d-be08-491f-b6f9-1f73265d0e77'),
(85, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 19:04:56', '2021-07-09 19:04:56', NULL, '1088684f-8b66-41c9-af96-4ce5c238eecb'),
(86, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 19:04:56', '2021-07-09 19:04:56', NULL, '53cf7ff7-f6d9-43c4-a1ba-e84324bc1297'),
(87, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 19:04:56', '2021-07-09 19:04:56', NULL, 'bd321ef1-1126-4f6a-b2e0-4cbd0bf35de6'),
(88, NULL, 36, 9, 'craft\\elements\\Entry', 1, 0, '2021-07-09 19:05:55', '2021-07-09 19:05:55', NULL, 'b0c6355a-04ad-4186-8c12-ee8dce9e186f'),
(89, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 19:05:55', '2021-07-09 19:04:56', NULL, '416b27fe-3691-4f1b-8cec-a053fdd784c8'),
(90, NULL, NULL, 8, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 19:05:55', '2021-07-09 19:04:56', NULL, '3d966c1a-33f4-435b-8534-5296666ed39b'),
(91, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 19:05:55', '2021-07-09 19:04:56', NULL, '9057fe88-d6ec-4ada-907a-1a4f62bb1a21'),
(92, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 19:10:56', '2021-07-09 19:10:56', NULL, 'c579856e-af99-41cd-9120-8b4c03ad80dd'),
(93, NULL, 37, 12, 'craft\\elements\\Entry', 1, 0, '2021-07-09 19:10:56', '2021-07-09 19:10:56', NULL, '8bb58332-635d-4202-b8a5-a64e929ca3be'),
(94, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 19:10:56', '2021-07-09 19:10:56', NULL, 'd972e1ce-7908-4569-bc91-bd4b781149b5'),
(95, NULL, 38, 2, 'craft\\elements\\Entry', 1, 0, '2021-07-09 19:23:17', '2021-07-09 19:23:17', NULL, '429c20b9-6fd0-44de-be15-f7541985ff54'),
(96, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 19:23:17', '2021-07-09 18:20:24', NULL, '5a2da4c3-da0f-4d8c-a188-76a04b474fe8'),
(97, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 19:23:17', '2021-07-09 18:20:24', NULL, '5b0fb3bc-1c35-441b-ae1a-8e78e02911d8'),
(98, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 19:23:47', '2021-07-09 19:23:47', '2021-07-09 22:42:07', '36858f4e-4928-43f1-9ad8-284f716caf60'),
(99, NULL, 39, 2, 'craft\\elements\\Entry', 1, 0, '2021-07-09 19:23:47', '2021-07-09 19:23:47', NULL, '39256413-56ee-4ed0-9cc3-e23432cf2834'),
(100, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 19:23:47', '2021-07-09 18:20:24', NULL, '2e88b662-3e9e-4637-9366-f9ea3c813226'),
(101, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 19:23:47', '2021-07-09 18:20:24', NULL, '7c802588-8429-4870-a93e-53db199b8357'),
(102, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 19:23:47', '2021-07-09 19:23:47', NULL, '22ae0581-bab1-467b-803d-53c0cc15a540'),
(103, NULL, 40, 2, 'craft\\elements\\Entry', 1, 0, '2021-07-09 22:42:07', '2021-07-09 22:42:07', NULL, 'c8d9714f-e208-47d5-89a8-43886d15d8d6'),
(104, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 22:42:07', '2021-07-09 18:20:24', NULL, '53a017c9-33ad-4a89-b7d0-bbfdc21fcf44'),
(105, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 22:42:07', '2021-07-09 18:20:24', NULL, '0ff70686-dcfb-4c5c-8c10-2f8f2323052d'),
(106, NULL, 41, 2, 'craft\\elements\\Entry', 1, 0, '2021-07-09 22:42:42', '2021-07-09 22:42:42', NULL, 'f491a77a-733c-4f4b-95dc-31f9075c3ace'),
(107, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 22:42:42', '2021-07-09 18:20:24', NULL, 'fcc667f2-6ad9-41a6-8e96-825b92c7969c'),
(108, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-09 22:42:42', '2021-07-09 18:20:24', NULL, '0a8c11db-bc22-45b9-8276-15d5e600b992');

-- --------------------------------------------------------

--
-- Table structure for table `elements_sites`
--

CREATE TABLE `elements_sites` (
  `id` int NOT NULL,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `elements_sites`
--

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2021-06-28 19:28:46', '2021-06-28 19:28:46', '5489a792-9cb8-4954-971b-d22d73f89cfa'),
(2, 2, 1, NULL, NULL, 1, '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'a54537ce-17f5-423e-8f02-60ca5d490e50'),
(3, 3, 1, 'homepage', '__home__', 1, '2021-06-28 19:36:56', '2021-06-28 21:19:44', 'ff0622a6-0b9d-4c62-83e5-8536ff6611ff'),
(4, 4, 1, 'homepage', 'homepage', 1, '2021-06-28 19:36:56', '2021-06-28 19:36:56', '576b7d5e-b898-4cf0-a71f-8e06f44b6b84'),
(5, 5, 1, 'homepage', 'homepage', 1, '2021-06-28 21:14:33', '2021-06-28 21:14:33', 'c110dac5-a2e1-4849-a1db-325677ca5bf6'),
(6, 6, 1, NULL, NULL, 1, '2021-06-28 21:15:19', '2021-06-28 21:15:19', 'fc50cef8-fc63-4f12-8873-be4caf2da39a'),
(7, 7, 1, NULL, NULL, 1, '2021-06-28 21:15:22', '2021-06-28 21:15:22', '033bb52b-56b3-4d59-9fed-77bf14fb025a'),
(8, 8, 1, 'homepage', 'homepage', 1, '2021-06-28 21:15:22', '2021-06-28 21:15:22', 'a2507021-a61d-442d-967d-62e05be11f3b'),
(9, 9, 1, NULL, NULL, 1, '2021-06-28 21:15:22', '2021-06-28 21:15:22', 'b3b44628-87c4-4423-ab27-479eeb0ce85f'),
(10, 10, 1, 'homepage', '__home__', 1, '2021-06-28 21:19:44', '2021-06-28 21:19:44', '47c8c584-3479-4bb1-aa67-b7c9959a3085'),
(11, 11, 1, NULL, NULL, 1, '2021-06-28 21:19:44', '2021-06-28 21:19:44', '2b87fcd8-d105-4917-8488-c43bbeb508dc'),
(12, 12, 1, NULL, NULL, 1, '2021-06-28 21:24:42', '2021-06-28 21:24:42', '745c0ed7-28a3-4237-ae6c-ead885d17e05'),
(13, 13, 1, NULL, NULL, 1, '2021-06-28 21:24:46', '2021-06-28 21:24:46', '802a25ce-fb32-4a98-bfdd-1b98973bd318'),
(14, 14, 1, 'homepage', '__home__', 1, '2021-06-28 21:24:46', '2021-06-28 21:24:46', '35e8f6b4-96f4-4aaa-b9ce-bb9152201662'),
(15, 15, 1, NULL, NULL, 1, '2021-06-28 21:24:46', '2021-06-28 21:24:46', '94bbdc3c-f5e9-4433-9f1e-96e40a0561c1'),
(16, 16, 1, NULL, NULL, 1, '2021-06-28 21:24:46', '2021-06-28 21:24:46', 'b97d5e3c-57f3-455a-89db-3e1dfaca0b41'),
(17, 17, 1, 'homepage', '__home__', 1, '2021-06-28 21:26:59', '2021-06-28 21:26:59', 'cf5846a0-8a8a-4f0c-9784-e9bf2a19fcd2'),
(18, 18, 1, NULL, NULL, 1, '2021-06-28 21:26:59', '2021-06-28 21:26:59', 'f4a301bf-5d17-485b-b004-20cecfca8cc9'),
(19, 19, 1, NULL, NULL, 1, '2021-06-28 21:26:59', '2021-06-28 21:26:59', 'dc71ef39-1997-43c1-9a0a-b6f85df19c19'),
(20, 20, 1, 'example', 'example', 1, '2021-06-29 14:52:41', '2021-06-29 14:52:41', '3a5af4c0-11ee-4446-8ec7-7f8e6a61dda1'),
(21, 21, 1, 'example', 'example', 1, '2021-06-29 14:52:41', '2021-06-29 14:52:41', '77c32459-372e-4d7a-ae55-74baa82b0e0d'),
(22, 22, 1, 'example', 'example', 1, '2021-06-29 14:53:06', '2021-06-29 14:53:06', '16fb0969-98d3-4d60-8157-a45b40235e43'),
(23, 23, 1, NULL, NULL, 1, '2021-06-29 14:54:13', '2021-06-29 14:54:13', '769cf7b5-3bde-4855-b039-c55261e8d493'),
(24, 24, 1, NULL, NULL, 1, '2021-06-29 14:54:13', '2021-06-29 14:54:13', '18ebb10c-158e-4523-9517-a9ec414b02c4'),
(25, 25, 1, NULL, NULL, 1, '2021-06-29 14:54:13', '2021-06-29 14:54:13', '155d5c38-b9d9-4f6e-8b84-729f405e467c'),
(26, 26, 1, 'example', 'example', 1, '2021-06-29 14:54:13', '2021-06-29 14:54:13', '9f6d0d9d-b415-4169-8597-c08b7e0c2023'),
(27, 27, 1, NULL, NULL, 1, '2021-06-29 14:54:13', '2021-06-29 14:54:13', '7e7c1fb3-cb2f-4ce2-b141-ffa6bbad0dfd'),
(28, 28, 1, NULL, NULL, 1, '2021-06-29 14:54:13', '2021-06-29 14:54:13', '3d5f2dde-fb35-4a09-9f08-9f8bc793f762'),
(29, 29, 1, NULL, NULL, 1, '2021-06-29 14:54:13', '2021-06-29 14:54:13', 'a76614bd-ffdc-4f6f-af1e-bb5ac1524d84'),
(30, 30, 1, 'example', 'example', 1, '2021-06-29 14:59:33', '2021-06-29 14:59:33', 'f2408501-863a-49d0-beb5-406fa399fb24'),
(31, 31, 1, NULL, NULL, 1, '2021-06-29 14:59:33', '2021-06-29 14:59:33', 'd979e6ef-913a-4692-a078-138036b3c045'),
(32, 32, 1, NULL, NULL, 1, '2021-06-29 14:59:33', '2021-06-29 14:59:33', '9e3d9d50-b2b5-404b-97c0-0607bdc81d59'),
(33, 33, 1, NULL, NULL, 1, '2021-06-29 14:59:33', '2021-06-29 14:59:33', 'dd30ec7c-bc68-4389-bf1a-5db1728c2c1f'),
(34, 34, 1, NULL, NULL, 1, '2021-07-09 17:41:07', '2021-07-09 17:41:07', 'a0137ad5-8cbc-4f72-9ad9-8db5aec98a6f'),
(35, 35, 1, 'homepage', '__home__', 1, '2021-07-09 17:41:08', '2021-07-09 17:41:08', 'cb497d7a-8c60-45cf-b1e5-518c7a1dedda'),
(36, 36, 1, NULL, NULL, 1, '2021-07-09 17:41:08', '2021-07-09 17:41:08', '330d2338-a930-4ac4-8553-5d48d34d1bcc'),
(37, 37, 1, NULL, NULL, 1, '2021-07-09 17:41:08', '2021-07-09 17:41:08', '7ba0c9e2-ce55-4d28-8050-f504a73baeb8'),
(38, 38, 1, NULL, NULL, 1, '2021-07-09 17:41:08', '2021-07-09 17:41:08', '123d06e2-f5f2-4566-9d16-33a1207f7198'),
(39, 39, 1, 'homepage', '__home__', 1, '2021-07-09 17:41:38', '2021-07-09 17:41:38', '4267931e-e507-4ffd-972a-3c2d7b77fc64'),
(40, 40, 1, NULL, NULL, 1, '2021-07-09 17:41:38', '2021-07-09 17:41:38', '68ca1f22-0d5f-40d0-92de-893ba36b5d7d'),
(41, 41, 1, NULL, NULL, 1, '2021-07-09 17:41:38', '2021-07-09 17:41:38', 'f291f2e3-5738-49d7-8736-c0bf8fb8a48a'),
(42, 42, 1, NULL, NULL, 1, '2021-07-09 17:41:38', '2021-07-09 17:41:38', '97bd8420-f858-4657-aba8-f749db07c448'),
(43, 43, 1, 'employees', 'employees', 1, '2021-07-09 17:48:51', '2021-07-09 17:48:51', '1444a52d-95c4-4265-9dcc-3f94d71be377'),
(44, 44, 1, 'employees', 'employees', 1, '2021-07-09 17:48:51', '2021-07-09 17:48:51', 'f3551fe6-41d8-44b4-bef4-d6a95894e0f4'),
(45, 45, 1, 'employees', 'employees', 1, '2021-07-09 17:55:20', '2021-07-09 17:55:20', 'ee012bb1-786d-4d09-84d4-e1dcf811adad'),
(46, 46, 1, 'employees', 'employees', 1, '2021-07-09 18:01:26', '2021-07-09 18:01:26', '73570615-42ba-4bd3-aa2d-6812ac752dfc'),
(47, 47, 1, 'employees', 'employees', 1, '2021-07-09 18:05:53', '2021-07-09 18:05:53', '2ae67d17-1b2f-46ed-823c-5f310d226ced'),
(48, 48, 1, '__temp_khrfjugbjxzohoqprghojrayufwyctfgxvxn', NULL, 1, '2021-07-09 18:05:53', '2021-07-09 18:05:53', '6bfb1b5f-bebf-4471-bc08-04c2dc926fd2'),
(49, 49, 1, 'employees', 'employees', 1, '2021-07-09 18:07:05', '2021-07-09 18:07:05', '0e56cb5e-25d1-403d-b788-b0bcdc5b0bd0'),
(51, 51, 1, 'title-2', NULL, 1, '2021-07-09 18:07:52', '2021-07-09 18:07:52', 'de862649-79be-4f4d-9645-e994571d596a'),
(52, 52, 1, 'title-2', NULL, 1, '2021-07-09 18:07:52', '2021-07-09 18:07:52', '4015fa48-0e91-495e-9b05-04b2756e4c6b'),
(53, 53, 1, 'title-2', NULL, 1, '2021-07-09 18:07:59', '2021-07-09 18:07:59', '955db902-e692-423b-ab51-0d90c13f4b64'),
(55, 55, 1, 'employee2', NULL, 1, '2021-07-09 18:09:50', '2021-07-09 18:09:50', '59ffb281-ffbf-4b72-9429-fdd8543fd129'),
(56, 56, 1, 'employee2', NULL, 1, '2021-07-09 18:09:50', '2021-07-09 18:09:50', '6e4839c8-0d49-4555-8546-0a98e8a5880b'),
(57, 57, 1, 'employee2', NULL, 1, '2021-07-09 18:09:55', '2021-07-09 18:09:55', '832ef9e3-a256-4a58-8ce5-1e30c7d136a2'),
(59, 59, 1, 'jhon', 'employees/jhon', 1, '2021-07-09 18:17:16', '2021-07-09 18:17:17', '58daf868-eea2-45d9-a38b-50192485a83f'),
(60, 60, 1, 'jhon', 'employees/jhon', 1, '2021-07-09 18:17:16', '2021-07-09 18:17:16', 'f2329c20-30e1-466e-8bf0-29f16b9e8e40'),
(61, 61, 1, 'jhon', 'employees/jhon', 1, '2021-07-09 18:17:20', '2021-07-09 18:17:20', '3796898e-81e4-4846-8259-c88f838f30b6'),
(63, 63, 1, 'jane', 'employees/jane', 1, '2021-07-09 18:18:01', '2021-07-09 18:18:02', 'cf4a34a6-eade-4747-a508-505798d1d970'),
(64, 64, 1, 'jane', 'employees/jane', 1, '2021-07-09 18:18:01', '2021-07-09 18:18:01', 'e506b4f7-3a0a-4814-8e0a-d1fd16ace78a'),
(65, 65, 1, 'jane', 'employees/jane', 1, '2021-07-09 18:18:04', '2021-07-09 18:18:04', '5c506070-f957-472b-b677-70f4ad317975'),
(67, 67, 1, 'frank', 'employees/frank', 1, '2021-07-09 18:18:23', '2021-07-09 18:18:23', '6e16bc59-1550-43a7-9789-7181c108db59'),
(68, 68, 1, 'frank', 'employees/frank', 1, '2021-07-09 18:18:23', '2021-07-09 18:18:23', 'd4562451-6052-400c-b8b3-4ea7509f404c'),
(69, 69, 1, 'frank', 'employees/frank', 1, '2021-07-09 18:18:28', '2021-07-09 18:18:28', '04eaa973-b74c-4b6b-b176-d0cf8ae18d29'),
(70, 70, 1, 'frank', 'employees/frank', 1, '2021-07-09 18:18:59', '2021-07-09 18:18:59', '75d89c6f-f468-41cb-be86-20391d6173be'),
(71, 71, 1, 'jane', 'employees/jane', 1, '2021-07-09 18:19:29', '2021-07-09 18:19:29', 'bfb66b5c-b2ba-4b5c-9e00-da5d536f3796'),
(72, 72, 1, 'homepage', '__home__', 1, '2021-07-09 18:20:24', '2021-07-09 18:20:24', '4cd2be36-b70d-4b39-9d87-52d890024041'),
(73, 73, 1, NULL, NULL, 1, '2021-07-09 18:20:24', '2021-07-09 18:20:24', 'e820f11c-6592-4466-a688-2af55ec4c610'),
(74, 74, 1, NULL, NULL, 1, '2021-07-09 18:20:24', '2021-07-09 18:20:24', 'a30ad874-7615-4625-a676-180a026b6789'),
(75, 75, 1, 'jhon', 'employees/jhon', 1, '2021-07-09 18:47:27', '2021-07-09 18:47:27', 'f4e51a89-ad07-49db-884b-ca92f3e7bab8'),
(76, 76, 1, 'jane', 'employees/jane', 1, '2021-07-09 18:48:02', '2021-07-09 18:48:02', '8f27a18b-d29c-45a7-8692-9ff3f66187b5'),
(77, 77, 1, 'frank', 'employees/frank', 1, '2021-07-09 18:48:12', '2021-07-09 18:48:12', '8869c84a-9c8b-4493-8257-43446a395d47'),
(78, 78, 1, NULL, NULL, 1, '2021-07-09 18:57:19', '2021-07-09 18:57:19', 'b62d224c-a029-4160-be44-33ba0504b274'),
(79, 79, 1, 'example', 'example', 1, '2021-07-09 18:57:19', '2021-07-09 18:57:19', 'b14f7d5c-1f1d-44f7-9086-50eb31a60f60'),
(80, 80, 1, NULL, NULL, 1, '2021-07-09 18:57:19', '2021-07-09 18:57:19', '739d76b7-ae0d-4dab-bd19-8b1e71788361'),
(81, 81, 1, NULL, NULL, 1, '2021-07-09 18:57:19', '2021-07-09 18:57:19', 'ea88ab8d-009e-4ca3-924f-512d9dba7480'),
(82, 82, 1, NULL, NULL, 1, '2021-07-09 18:57:19', '2021-07-09 18:57:19', '245ae9e9-fc9d-4919-8615-891af27fc9fc'),
(83, 83, 1, NULL, NULL, 1, '2021-07-09 18:57:19', '2021-07-09 18:57:19', '5c6a2613-49b3-4841-afb7-5cb70b7f7037'),
(84, 84, 1, 'example', 'example', 1, '2021-07-09 19:04:56', '2021-07-09 19:04:56', '6beec089-cc3e-4c1b-9b6b-df74051c1e3a'),
(85, 85, 1, NULL, NULL, 1, '2021-07-09 19:04:56', '2021-07-09 19:04:56', '6d35ee63-9cb7-4cca-b2d0-b291939af74d'),
(86, 86, 1, NULL, NULL, 1, '2021-07-09 19:04:56', '2021-07-09 19:04:56', '547b5f14-81bd-4064-96ff-9ed237637a07'),
(87, 87, 1, NULL, NULL, 1, '2021-07-09 19:04:56', '2021-07-09 19:04:56', '7fb282ec-598f-41c0-8071-5029aa249b64'),
(88, 88, 1, 'example', 'example', 1, '2021-07-09 19:05:55', '2021-07-09 19:05:55', 'fbd4c126-12cc-4f8c-afd8-37c521209072'),
(89, 89, 1, NULL, NULL, 1, '2021-07-09 19:05:55', '2021-07-09 19:05:55', 'd09ad2b2-b7bd-4c6e-b0df-f88a9148c8da'),
(90, 90, 1, NULL, NULL, 1, '2021-07-09 19:05:55', '2021-07-09 19:05:55', '8387de1e-210a-4004-86c1-5595cc80477b'),
(91, 91, 1, NULL, NULL, 1, '2021-07-09 19:05:55', '2021-07-09 19:05:55', 'e5ae67ed-ee42-41d9-b59c-952c64347985'),
(92, 92, 1, NULL, NULL, 1, '2021-07-09 19:10:56', '2021-07-09 19:10:56', 'b12b9701-9ee9-421a-92ed-828315f6a45c'),
(93, 93, 1, 'jhon', 'employees/jhon', 1, '2021-07-09 19:10:56', '2021-07-09 19:10:56', '5bf4e5ef-9617-4277-b9f9-08aaa6f57161'),
(94, 94, 1, NULL, NULL, 1, '2021-07-09 19:10:56', '2021-07-09 19:10:56', '55394e83-8bdc-4416-95ee-71d1b5eeef2d'),
(95, 95, 1, 'homepage', '__home__', 1, '2021-07-09 19:23:17', '2021-07-09 19:23:17', 'f69b7206-151e-4067-a6d7-567a0d12602b'),
(96, 96, 1, NULL, NULL, 1, '2021-07-09 19:23:17', '2021-07-09 19:23:17', 'eacc4ea7-a08f-4583-acaa-2bf1208c3e5e'),
(97, 97, 1, NULL, NULL, 1, '2021-07-09 19:23:17', '2021-07-09 19:23:17', '9c84b639-1ee8-4207-a56c-41e4bb28244d'),
(98, 98, 1, NULL, NULL, 1, '2021-07-09 19:23:47', '2021-07-09 19:23:47', 'd96aafc0-8c44-4537-9798-ba582e0018c8'),
(99, 99, 1, 'homepage', '__home__', 1, '2021-07-09 19:23:47', '2021-07-09 19:23:47', 'be2517a5-d705-4940-95f1-64a06082cb73'),
(100, 100, 1, NULL, NULL, 1, '2021-07-09 19:23:47', '2021-07-09 19:23:47', 'c7993d9a-c5c4-4664-b94f-a22d7ff08ce8'),
(101, 101, 1, NULL, NULL, 1, '2021-07-09 19:23:47', '2021-07-09 19:23:47', 'bfd9a442-f447-45e9-a7f2-24878700ef02'),
(102, 102, 1, NULL, NULL, 1, '2021-07-09 19:23:47', '2021-07-09 19:23:47', '8d10a08d-1ecc-4151-bb2f-8f5aef0fdff9'),
(103, 103, 1, 'homepage', '__home__', 1, '2021-07-09 22:42:07', '2021-07-09 22:42:07', '929a8145-9635-4d62-a3aa-619e011bf84e'),
(104, 104, 1, NULL, NULL, 1, '2021-07-09 22:42:07', '2021-07-09 22:42:07', '11418b15-7c6f-410e-845b-f8115397463f'),
(105, 105, 1, NULL, NULL, 1, '2021-07-09 22:42:07', '2021-07-09 22:42:07', '98fc9a8b-86e5-4806-af38-0600e32d06f9'),
(106, 106, 1, 'homepage', '__home__', 1, '2021-07-09 22:42:42', '2021-07-09 22:42:42', '245156f2-8d68-4979-81e7-2f4a6e5b8f13'),
(107, 107, 1, NULL, NULL, 1, '2021-07-09 22:42:42', '2021-07-09 22:42:42', 'ea06efc2-2e02-4310-b342-daa40a83564c'),
(108, 108, 1, NULL, NULL, 1, '2021-07-09 22:42:42', '2021-07-09 22:42:42', '068356e8-962e-4f72-b655-3d6c6ed0b015');

-- --------------------------------------------------------

--
-- Table structure for table `entries`
--

CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `authorId` int DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `entries`
--

INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(3, 1, NULL, 1, NULL, '2021-06-28 19:36:00', NULL, NULL, '2021-06-28 19:36:56', '2021-06-28 19:36:56', '67bbb575-bc59-44fb-900e-6ff9f4b7e8dc'),
(4, 1, NULL, 1, NULL, '2021-06-28 19:36:00', NULL, NULL, '2021-06-28 19:36:56', '2021-06-28 19:36:56', 'be8927bb-ffa9-4c5e-b745-96d8322874cd'),
(5, 1, NULL, 1, NULL, '2021-06-28 19:36:00', NULL, NULL, '2021-06-28 21:14:33', '2021-06-28 21:14:33', 'afca99b4-c44e-40c5-b87d-0978efd056df'),
(8, 1, NULL, 1, NULL, '2021-06-28 19:36:00', NULL, NULL, '2021-06-28 21:15:22', '2021-06-28 21:15:22', '3dfc8d9e-fa03-42cd-a062-c0a6a82ecf0f'),
(10, 1, NULL, 1, NULL, '2021-06-28 19:36:00', NULL, NULL, '2021-06-28 21:19:44', '2021-06-28 21:19:44', '96d0ca55-8d63-403e-9b3b-d3d855216a5a'),
(14, 1, NULL, 1, NULL, '2021-06-28 19:36:00', NULL, NULL, '2021-06-28 21:24:46', '2021-06-28 21:24:46', '66ccd476-77dc-423c-9aa4-e54c63c2aeb6'),
(17, 1, NULL, 1, NULL, '2021-06-28 19:36:00', NULL, NULL, '2021-06-28 21:26:59', '2021-06-28 21:26:59', 'ad7116c5-2eab-4f40-8c97-d1fe7fe2dd9c'),
(20, 3, NULL, 3, NULL, '2021-06-29 14:52:00', NULL, NULL, '2021-06-29 14:52:41', '2021-06-29 14:52:41', '186559ef-c986-439b-8726-52ee75e716df'),
(21, 3, NULL, 3, NULL, '2021-06-29 14:52:00', NULL, NULL, '2021-06-29 14:52:41', '2021-06-29 14:52:41', 'ca168d1f-9a07-4b14-a773-75bb47e1ea85'),
(22, 3, NULL, 3, NULL, '2021-06-29 14:52:00', NULL, NULL, '2021-06-29 14:53:06', '2021-06-29 14:53:06', '2220030b-6bb1-470e-9418-e29500052c2b'),
(26, 3, NULL, 3, NULL, '2021-06-29 14:52:00', NULL, NULL, '2021-06-29 14:54:13', '2021-06-29 14:54:13', 'cdd2fdff-cb5c-47e4-a5b5-960dffae6bd3'),
(30, 3, NULL, 3, NULL, '2021-06-29 14:52:00', NULL, NULL, '2021-06-29 14:59:33', '2021-06-29 14:59:33', '01c59641-288c-4b89-b27d-9ca459dbc427'),
(35, 1, NULL, 1, NULL, '2021-06-28 19:36:00', NULL, NULL, '2021-07-09 17:41:08', '2021-07-09 17:41:08', 'd9a09116-7446-4cce-ab49-1c7cf2d73de6'),
(39, 1, NULL, 1, NULL, '2021-06-28 19:36:00', NULL, NULL, '2021-07-09 17:41:38', '2021-07-09 17:41:38', '9836caab-d106-4e81-b0e4-1554b90a055d'),
(43, 4, NULL, 4, 2, '2021-07-09 17:48:00', NULL, 0, '2021-07-09 17:48:51', '2021-07-09 17:59:00', 'f44d85e4-a9f9-41b4-9d98-36448106c805'),
(44, 4, NULL, 4, NULL, '2021-07-09 17:48:00', NULL, NULL, '2021-07-09 17:48:51', '2021-07-09 17:48:51', '0797f3d9-72fd-4a72-9c9f-69c202db07eb'),
(45, 4, NULL, 4, NULL, '2021-07-09 17:48:00', NULL, NULL, '2021-07-09 17:55:20', '2021-07-09 17:55:20', '898cfdcf-e082-4e74-bf2a-99154f114ac4'),
(46, 4, NULL, 4, 2, '2021-07-09 17:48:00', NULL, NULL, '2021-07-09 18:01:26', '2021-07-09 18:01:26', 'f6148fe2-fb20-4cdb-97ee-80c40b7419d3'),
(47, 4, NULL, 4, 2, '2021-07-09 17:48:00', NULL, NULL, '2021-07-09 18:05:53', '2021-07-09 18:05:53', 'f991c542-ec69-4e05-9407-d02df81d7500'),
(48, 4, NULL, 4, 2, '2021-07-09 18:05:00', NULL, 1, '2021-07-09 18:05:53', '2021-07-09 18:05:53', '58fb31a7-7b69-41d9-a367-0cfcabc53c37'),
(49, 4, NULL, 4, 2, '2021-07-09 17:48:00', NULL, NULL, '2021-07-09 18:07:05', '2021-07-09 18:07:05', '7a766adf-b790-4fd9-a05e-52dc4e038cf2'),
(51, 4, NULL, 4, 2, '2021-07-09 18:07:00', NULL, 0, '2021-07-09 18:07:52', '2021-07-09 18:07:52', '9d097ecd-95c8-418d-ad95-82707722e7ea'),
(52, 4, NULL, 4, 2, '2021-07-09 18:07:00', NULL, NULL, '2021-07-09 18:07:52', '2021-07-09 18:07:52', '33ec3115-34a5-406e-850d-dd9196732810'),
(53, 4, NULL, 4, 2, '2021-07-09 18:07:00', NULL, NULL, '2021-07-09 18:07:59', '2021-07-09 18:07:59', 'cf2d9196-24be-41c3-a88b-378fd4f34694'),
(55, 4, NULL, 4, 2, '2021-07-09 18:09:00', NULL, 0, '2021-07-09 18:09:50', '2021-07-09 18:09:50', 'dae104ea-35cf-4fb3-9a11-3591988d3294'),
(56, 4, NULL, 4, 2, '2021-07-09 18:09:00', NULL, NULL, '2021-07-09 18:09:50', '2021-07-09 18:09:50', 'f3a8ad38-822e-406c-8f42-fe63c981cd2b'),
(57, 4, NULL, 4, 2, '2021-07-09 18:09:00', NULL, NULL, '2021-07-09 18:09:55', '2021-07-09 18:09:55', '7c401ad5-6a1e-4ccc-acda-560e682cde58'),
(59, 5, NULL, 6, 2, '2021-07-09 18:16:00', NULL, NULL, '2021-07-09 18:17:16', '2021-07-09 18:17:16', '63d71c88-be24-4a87-989a-364bd0d8a49b'),
(60, 5, NULL, 6, 2, '2021-07-09 18:16:00', NULL, NULL, '2021-07-09 18:17:16', '2021-07-09 18:17:16', 'f394e8ee-8e14-471f-98c8-11f0ba67c457'),
(61, 5, NULL, 6, 2, '2021-07-09 18:16:00', NULL, NULL, '2021-07-09 18:17:20', '2021-07-09 18:17:20', '5f5faf00-042c-41d8-9cba-39d81f6590dd'),
(63, 5, NULL, 6, 2, '2021-07-09 18:17:00', NULL, NULL, '2021-07-09 18:18:01', '2021-07-09 18:18:01', 'c0ef0f24-819d-45f8-869b-5420bd0f6cdd'),
(64, 5, NULL, 6, 2, '2021-07-09 18:17:00', NULL, NULL, '2021-07-09 18:18:01', '2021-07-09 18:18:01', 'fdee8fe3-0b98-4008-9183-75bcd00d29cc'),
(65, 5, NULL, 6, 2, '2021-07-09 18:17:00', NULL, NULL, '2021-07-09 18:18:04', '2021-07-09 18:18:04', '3014fbd5-2428-4472-a240-c2efbd9c681b'),
(67, 5, NULL, 6, 2, '2021-07-09 18:18:00', NULL, NULL, '2021-07-09 18:18:23', '2021-07-09 18:18:23', '84d494d4-3add-4ab8-9b27-c4a9db1cb653'),
(68, 5, NULL, 6, 2, '2021-07-09 18:18:00', NULL, NULL, '2021-07-09 18:18:23', '2021-07-09 18:18:23', '3d0ca3e3-367c-4ae1-bec3-2852e189d9b4'),
(69, 5, NULL, 6, 2, '2021-07-09 18:18:00', NULL, NULL, '2021-07-09 18:18:28', '2021-07-09 18:18:28', '175b30ce-f3de-442d-a43f-ab8d1f2199f0'),
(70, 5, NULL, 6, 2, '2021-07-09 18:18:00', NULL, NULL, '2021-07-09 18:18:59', '2021-07-09 18:18:59', 'ef14eee3-6789-4c10-811a-dbf23182a020'),
(71, 5, NULL, 6, 2, '2021-07-09 18:17:00', NULL, NULL, '2021-07-09 18:19:29', '2021-07-09 18:19:29', '15f56075-96a8-4361-aaa2-58f6b7310ffb'),
(72, 1, NULL, 1, NULL, '2021-06-28 19:36:00', NULL, NULL, '2021-07-09 18:20:24', '2021-07-09 18:20:24', '7da29c84-9a30-4018-b894-382d978d46dc'),
(75, 5, NULL, 6, 2, '2021-07-09 18:16:00', NULL, NULL, '2021-07-09 18:47:27', '2021-07-09 18:47:27', '2b4ea158-aa27-4255-9cd9-1acc84462783'),
(76, 5, NULL, 6, 2, '2021-07-09 18:17:00', NULL, NULL, '2021-07-09 18:48:02', '2021-07-09 18:48:02', '165631ae-aae5-4bf5-9f94-5b40ff33630b'),
(77, 5, NULL, 6, 2, '2021-07-09 18:18:00', NULL, NULL, '2021-07-09 18:48:12', '2021-07-09 18:48:12', 'eeba95b7-ca75-4311-a224-8f58a53e6c52'),
(79, 3, NULL, 3, NULL, '2021-06-29 14:52:00', NULL, NULL, '2021-07-09 18:57:19', '2021-07-09 18:57:19', '11054810-9700-44a7-a586-a0e734c1aa99'),
(84, 3, NULL, 3, NULL, '2021-06-29 14:52:00', NULL, NULL, '2021-07-09 19:04:56', '2021-07-09 19:04:56', '32b6cd6b-8dd4-4ad3-adc6-5e7af29bffcd'),
(88, 3, NULL, 3, NULL, '2021-06-29 14:52:00', NULL, NULL, '2021-07-09 19:05:55', '2021-07-09 19:05:55', '44dcfcd8-d4e8-4f65-b904-c08fc85e530a'),
(93, 5, NULL, 6, 2, '2021-07-09 18:16:00', NULL, NULL, '2021-07-09 19:10:56', '2021-07-09 19:10:56', '7a57dc02-3d93-49c1-b52e-7be970b27bb7'),
(95, 1, NULL, 1, NULL, '2021-06-28 19:36:00', NULL, NULL, '2021-07-09 19:23:17', '2021-07-09 19:23:17', 'fe955763-d016-4ea6-bbc1-af69e098e487'),
(99, 1, NULL, 1, NULL, '2021-06-28 19:36:00', NULL, NULL, '2021-07-09 19:23:47', '2021-07-09 19:23:47', 'b35ba84e-cc39-4ac0-953c-06d0b0ec93a4'),
(103, 1, NULL, 1, NULL, '2021-06-28 19:36:00', NULL, NULL, '2021-07-09 22:42:07', '2021-07-09 22:42:07', '74d11fb6-099b-4384-a730-c737230e11d5'),
(106, 1, NULL, 1, NULL, '2021-06-28 19:36:00', NULL, NULL, '2021-07-09 22:42:42', '2021-07-09 22:42:42', '7dfdc587-e179-4898-95bc-7c793245038b');

-- --------------------------------------------------------

--
-- Table structure for table `entrytypes`
--

CREATE TABLE `entrytypes` (
  `id` int NOT NULL,
  `sectionId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `titleFormat` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `entrytypes`
--

INSERT INTO `entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 2, 'Homepage', 'homepage', 1, 'site', NULL, '{section.name|raw}', 1, '2021-06-28 19:36:56', '2021-06-28 21:26:59', NULL, 'bbb54962-2280-467a-a9f8-15522dd5e7b2'),
(2, 2, 4, 'EMployees', 'employees', 1, 'site', NULL, NULL, 1, '2021-06-28 19:51:28', '2021-06-28 19:51:28', '2021-06-28 19:51:53', 'ac7f8f33-0854-4b6a-bbb5-06ea2af23de0'),
(3, 3, 9, 'Example', 'example', 1, 'site', NULL, '{section.name|raw}', 1, '2021-06-29 14:52:41', '2021-07-09 19:05:55', NULL, '03c99c5f-1d80-4e41-a0b5-07c33e763e93'),
(4, 4, 10, 'Employees', 'employees', 1, 'site', NULL, '{section.name|raw}', 1, '2021-07-09 17:48:51', '2021-07-09 18:06:37', '2021-07-09 18:12:56', '128b3b6f-f360-4851-ac0c-0dc4becb476a'),
(5, 5, 11, 'Employees', 'employees', 1, 'site', NULL, NULL, 1, '2021-07-09 18:13:33', '2021-07-09 18:13:33', '2021-07-09 18:15:55', 'dcff7ef3-1aba-4927-bd7f-40b7253bb73d'),
(6, 5, 12, 'NewEmployees', 'new_employees', 0, 'site', NULL, '{firstName}', 2, '2021-07-09 18:15:44', '2021-07-09 18:15:44', NULL, 'ae5bd065-3d9c-4e8e-9ac4-35a80decc537');

-- --------------------------------------------------------

--
-- Table structure for table `fieldgroups`
--

CREATE TABLE `fieldgroups` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fieldgroups`
--

INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Common', '2021-06-28 19:28:48', '2021-06-28 19:28:48', NULL, 'acc7548f-3022-405c-b653-2c8760879e60');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayoutfields`
--

CREATE TABLE `fieldlayoutfields` (
  `id` int NOT NULL,
  `layoutId` int NOT NULL,
  `tabId` int NOT NULL,
  `fieldId` int NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fieldlayoutfields`
--

INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 5, 9, 4, 0, 0, '2021-06-28 21:14:01', '2021-06-28 21:14:01', 'aefff259-4d65-41c8-8e55-d91095d10d7f'),
(2, 5, 9, 2, 1, 1, '2021-06-28 21:14:01', '2021-06-28 21:14:01', 'bfe8df89-3fed-4787-a4ce-0c390483f43f'),
(3, 5, 9, 3, 0, 2, '2021-06-28 21:14:01', '2021-06-28 21:14:01', 'fd83d701-5337-424c-ab40-31cb7534ebcb'),
(10, 6, 20, 6, 1, 0, '2021-06-29 15:04:33', '2021-06-29 15:04:33', '7bf68e0e-75a5-487d-9d0f-545d4ce3209c'),
(11, 7, 21, 7, 1, 0, '2021-06-29 15:04:33', '2021-06-29 15:04:33', '03b72830-911c-40f2-87d9-a1ae0c89c87e'),
(12, 8, 22, 8, 1, 0, '2021-06-29 15:04:33', '2021-06-29 15:04:33', 'ce4a9d4e-6dd5-421f-b0cd-27b7120959ae'),
(16, 10, 29, 9, 0, 1, '2021-07-09 18:06:37', '2021-07-09 18:06:37', '4efb8181-6bd6-4c3c-bac7-de2c64323a4e'),
(17, 10, 29, 10, 0, 2, '2021-07-09 18:06:37', '2021-07-09 18:06:37', 'f3113621-5021-46e6-919b-242aa5c7ecaa'),
(18, 10, 29, 11, 0, 3, '2021-07-09 18:06:37', '2021-07-09 18:06:37', '558f8737-d8c2-45f6-92e3-a5e8f2dc7e18'),
(22, 9, 32, 5, 0, 1, '2021-07-09 19:05:55', '2021-07-09 19:05:55', '2203a48d-1f4e-42ad-a4ec-5a0fe5c89b42'),
(29, 2, 37, 1, 0, 0, '2021-07-09 22:42:42', '2021-07-09 22:42:42', 'b45962a5-8921-4c06-a545-b1635ea1130a'),
(30, 12, 38, 9, 0, 3, '2021-07-10 17:24:26', '2021-07-10 17:24:26', 'e39a988b-3aec-4fec-9c8f-ef6923b10277'),
(31, 12, 38, 10, 0, 5, '2021-07-10 17:24:26', '2021-07-10 17:24:26', '8a0b7538-be9d-4708-99d4-5678f85e14a8'),
(32, 12, 38, 11, 0, 7, '2021-07-10 17:24:26', '2021-07-10 17:24:26', '80d2bb41-ad22-4f48-ab02-3618dd30d7b7');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouts`
--

CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fieldlayouts`
--

INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'craft\\commerce\\elements\\Product', '2021-06-28 19:28:48', '2021-06-28 19:28:48', NULL, 'a65a39e7-8abc-43be-9e40-0e51743a0ba2'),
(2, 'craft\\elements\\Entry', '2021-06-28 19:36:56', '2021-06-28 19:36:56', NULL, '6f0a658f-6a92-45f6-9233-a09f5a3e2780'),
(3, 'craft\\elements\\Asset', '2021-06-28 19:49:22', '2021-06-28 19:49:22', NULL, '61b9cee1-55ca-414f-b770-10bb39eedb6a'),
(4, 'craft\\elements\\Entry', '2021-06-28 19:51:28', '2021-06-28 19:51:28', '2021-06-28 19:51:53', '4357b72c-ea45-4b11-ac19-e65e6981308c'),
(5, 'craft\\elements\\MatrixBlock', '2021-06-28 21:14:01', '2021-06-28 21:14:01', NULL, '851107bf-8bb1-4128-afca-978e7d879427'),
(6, 'craft\\elements\\MatrixBlock', '2021-06-29 14:47:21', '2021-06-29 14:47:21', NULL, 'afd7c9ae-6b20-443f-a1f6-c6fd326a7053'),
(7, 'craft\\elements\\MatrixBlock', '2021-06-29 14:47:21', '2021-06-29 14:47:21', NULL, '07d75d4d-e229-457b-870d-914abaa59bc6'),
(8, 'craft\\elements\\MatrixBlock', '2021-06-29 14:47:21', '2021-06-29 14:47:21', NULL, 'ba2c1099-179f-4309-b345-f6f3776a2388'),
(9, 'craft\\elements\\Entry', '2021-06-29 14:52:41', '2021-06-29 14:52:41', NULL, 'd73e14fe-045f-46c1-8bfb-df9f05627015'),
(10, 'craft\\elements\\Entry', '2021-07-09 17:48:51', '2021-07-09 17:48:51', '2021-07-09 18:12:56', '5bd9cdbb-33ec-4b50-af81-9e16da58c25c'),
(11, 'craft\\elements\\Entry', '2021-07-09 18:13:33', '2021-07-09 18:13:33', '2021-07-09 18:15:55', '6fa47987-44be-4d67-a750-7ee35bedb7ef'),
(12, 'craft\\elements\\Entry', '2021-07-09 18:15:44', '2021-07-09 18:15:44', NULL, '376d30a5-e009-4035-8887-2fdce04cd82d');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouttabs`
--

CREATE TABLE `fieldlayouttabs` (
  `id` int NOT NULL,
  `layoutId` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `elements` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fieldlayouttabs`
--

INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(4, 1, 'Content', '[{\"type\":\"craft\\\\commerce\\\\fieldlayoutelements\\\\ProductTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'fdef587f-4ac4-4bb1-8be3-4017f0c912f5'),
(8, 4, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2021-06-28 19:51:47', '2021-06-28 19:51:47', 'ad33e186-c87a-43a7-ac3a-47c1e3870488'),
(9, 5, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"e5179a24-865e-4325-8f64-38c941595a2f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"9585679e-2fe1-4b57-b619-d1beeefdb9ad\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"e9ec26d4-6d05-4acf-90d3-9fa165204624\"}]', 1, '2021-06-28 21:14:01', '2021-06-28 21:14:01', '7b622c07-73db-4240-9042-c241c90f5d4f'),
(12, 3, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2021-06-28 21:20:51', '2021-06-28 21:20:51', 'ac641e94-11c7-416a-bcbd-7f26b65d2168'),
(20, 6, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"7f794890-d66c-494d-84fc-e51a0683885c\"}]', 1, '2021-06-29 15:04:33', '2021-06-29 15:04:33', 'd9b040f3-16d5-4492-ba64-96f24f3c2053'),
(21, 7, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"709d71e0-6fd6-41c8-b407-527b866465d0\"}]', 1, '2021-06-29 15:04:33', '2021-06-29 15:04:33', 'bc220ca7-c043-45a5-bf9d-1ca9ae9aef22'),
(22, 8, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"a2aab963-b865-46cb-989b-eb68564777e1\"}]', 1, '2021-06-29 15:04:33', '2021-06-29 15:04:33', '67c2926b-6a7a-48a5-ba2a-0c390cd1dc45'),
(29, 10, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":\"Test Tiel\",\"instructions\":\"show me your ID\",\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1bbbd3b6-8526-433d-b7a1-74b5bd094c7c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"5e38f338-d0a4-4fa3-bfd5-9b494d31a442\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"0c93d9fd-ac15-4c59-988d-36af9f3f6527\"}]', 1, '2021-07-09 18:06:37', '2021-07-09 18:06:37', '33868d7d-9194-420b-af52-0bf6db89fc3d'),
(30, 11, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2021-07-09 18:13:33', '2021-07-09 18:13:33', '9e9484da-e998-410b-97d9-3db2fb1811b8'),
(32, 9, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"f0b26b60-9cd6-415f-928f-c63614f6e7b8\"}]', 1, '2021-07-09 19:05:55', '2021-07-09 19:05:55', 'bfa6f13c-eef5-4c62-aa6e-d5f95e0bd158'),
(36, 2, 'Info', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2021-07-09 22:42:42', '2021-07-09 22:42:42', 'dc6a18a2-f018-4848-bc2c-8c4a1db5af8a'),
(37, 2, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4e579fce-80fb-40df-a0ab-5ade3e8ecb88\"}]', 2, '2021-07-09 22:42:42', '2021-07-09 22:42:42', '073e3215-ce84-4879-bdd0-76fc62f79071'),
(38, 12, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\Template\",\"template\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\Heading\",\"heading\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1bbbd3b6-8526-433d-b7a1-74b5bd094c7c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"5e38f338-d0a4-4fa3-bfd5-9b494d31a442\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"0c93d9fd-ac15-4c59-988d-36af9f3f6527\"}]', 1, '2021-07-10 17:24:26', '2021-07-10 17:24:26', '62a327a2-95cf-4f48-83cc-4d661c2670f6');

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` int NOT NULL,
  `groupId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `instructions` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `settings` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'Image with Text', 'imageWithText', 'global', '', 0, 'site', NULL, 'craft\\fields\\Matrix', '{\"contentTable\":\"{{%matrixcontent_imagewithtext}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}', '2021-06-28 21:14:00', '2021-06-28 21:14:00', '4e579fce-80fb-40df-a0ab-5ade3e8ecb88'),
(2, NULL, 'Text', 'text', 'matrixBlockType:3983b886-d522-4401-9459-daa1e6d61cdf', '', 0, 'none', NULL, 'craft\\redactor\\Field', '{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"normal\"}', '2021-06-28 21:14:01', '2021-06-28 21:14:01', '9585679e-2fe1-4b57-b619-d1beeefdb9ad'),
(3, NULL, 'Image', 'image', 'matrixBlockType:3983b886-d522-4401-9459-daa1e6d61cdf', '', 0, 'site', NULL, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:c9040c8c-87a7-43ef-9eaf-595dc38c1eed\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"1\",\"selectionLabel\":\"Add an image\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:c9040c8c-87a7-43ef-9eaf-595dc38c1eed\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"large\"}', '2021-06-28 21:14:01', '2021-06-28 21:14:01', 'e9ec26d4-6d05-4acf-90d3-9fa165204624'),
(4, NULL, 'Headline', 'headline', 'matrixBlockType:3983b886-d522-4401-9459-daa1e6d61cdf', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}', '2021-06-28 21:14:01', '2021-06-28 21:14:01', 'e5179a24-865e-4325-8f64-38c941595a2f'),
(5, 1, 'Content Builder', 'contentBuilder', 'global', '', 0, 'site', NULL, 'craft\\fields\\Matrix', '{\"contentTable\":\"{{%matrixcontent_contentbuilder}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}', '2021-06-29 14:47:21', '2021-06-29 14:47:21', 'f0b26b60-9cd6-415f-928f-c63614f6e7b8'),
(6, NULL, 'Text', 'text', 'matrixBlockType:692eb48c-e6ca-4a84-805e-1ef02e4d88f2', '', 0, 'none', NULL, 'craft\\redactor\\Field', '{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"normal\"}', '2021-06-29 14:47:21', '2021-06-29 14:47:21', '7f794890-d66c-494d-84fc-e51a0683885c'),
(7, NULL, 'Article', 'article', 'matrixBlockType:7346608a-fffe-49fd-bbe6-efa57785bdf0', '', 0, 'site', NULL, 'craft\\fields\\Entries', '{\"allowSelfRelations\":false,\"limit\":\"1\",\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}', '2021-06-29 14:47:21', '2021-06-29 15:04:33', '709d71e0-6fd6-41c8-b407-527b866465d0'),
(8, NULL, 'Embed', 'embed', 'matrixBlockType:dfdd5d42-ea50-4a2a-ba15-b24a3f773356', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"1\",\"placeholder\":null,\"uiMode\":\"normal\"}', '2021-06-29 14:47:21', '2021-06-29 14:47:21', 'a2aab963-b865-46cb-989b-eb68564777e1'),
(9, 1, 'First Name', 'firstName', 'global', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}', '2021-07-09 17:56:05', '2021-07-09 17:56:05', '1bbbd3b6-8526-433d-b7a1-74b5bd094c7c'),
(10, 1, 'Last Name', 'lastName', 'global', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}', '2021-07-09 17:56:44', '2021-07-09 17:56:44', '5e38f338-d0a4-4fa3-bfd5-9b494d31a442'),
(11, 1, 'Profile Image', 'profileImage', 'global', '', 0, 'site', NULL, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:c9040c8c-87a7-43ef-9eaf-595dc38c1eed\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"\",\"localizeRelations\":false,\"previewMode\":\"thumbs\",\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:c9040c8c-87a7-43ef-9eaf-595dc38c1eed\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:c9040c8c-87a7-43ef-9eaf-595dc38c1eed\"],\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}', '2021-07-09 17:57:36', '2021-07-10 17:23:26', '0c93d9fd-ac15-4c59-988d-36af9f3f6527');

-- --------------------------------------------------------

--
-- Table structure for table `globalsets`
--

CREATE TABLE `globalsets` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gqlschemas`
--

CREATE TABLE `gqlschemas` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `scope` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gqlschemas`
--

INSERT INTO `gqlschemas` (`id`, `name`, `scope`, `isPublic`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Public Schema', '[]', 1, '2021-06-28 19:28:48', '2021-06-28 19:28:48', '7b77a83a-8dfb-4601-90b1-30c99c1c9505');

-- --------------------------------------------------------

--
-- Table structure for table `gqltokens`
--

CREATE TABLE `gqltokens` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gqltokens`
--

INSERT INTO `gqltokens` (`id`, `name`, `accessToken`, `enabled`, `expiryDate`, `lastUsed`, `schemaId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Public Token', '__PUBLIC__', 1, NULL, NULL, 1, '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'b348e8f8-e7e2-4175-acb1-e28ce865145c');

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id` int NOT NULL,
  `version` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.6.17', '3.6.8', 0, 'dkthkkpuleyk', 'kxaxkwkuddqt', '2021-06-28 19:28:37', '2021-07-10 17:24:26', '576857b5-5c2c-4502-9406-e44220133af2');

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocks`
--

CREATE TABLE `matrixblocks` (
  `id` int NOT NULL,
  `ownerId` int NOT NULL,
  `fieldId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `matrixblocks`
--

INSERT INTO `matrixblocks` (`id`, `ownerId`, `fieldId`, `typeId`, `sortOrder`, `deletedWithOwner`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(7, 3, 1, 1, 1, NULL, '2021-06-28 21:15:22', '2021-06-28 21:15:22', '260952a7-95a9-4607-96e4-9284e6e379b0'),
(9, 8, 1, 1, 1, NULL, '2021-06-28 21:15:22', '2021-06-28 21:15:22', '95f88f28-5b15-4848-bec9-114c9bf76cb5'),
(11, 10, 1, 1, 1, NULL, '2021-06-28 21:19:44', '2021-06-28 21:19:44', 'be6adebc-f65e-424a-8b10-fcae2f378f19'),
(13, 3, 1, 1, 2, NULL, '2021-06-28 21:24:46', '2021-06-28 21:24:46', '4b65cb94-7b13-41a2-884c-dae28a7fbff4'),
(15, 14, 1, 1, 1, NULL, '2021-06-28 21:24:46', '2021-06-28 21:24:46', 'd0097f98-9e02-4b92-92c7-f7854fe34955'),
(16, 14, 1, 1, 2, NULL, '2021-06-28 21:24:46', '2021-06-28 21:24:46', 'aabe3ca5-78e9-474c-88bc-450fb01a7acd'),
(18, 17, 1, 1, 1, NULL, '2021-06-28 21:26:59', '2021-06-28 21:26:59', '28f32970-eae1-4428-8191-a0c05ee9b4a4'),
(19, 17, 1, 1, 2, NULL, '2021-06-28 21:26:59', '2021-06-28 21:26:59', 'f8a0325e-0fb2-4c80-a939-9d300b53ea96'),
(23, 20, 5, 2, 1, NULL, '2021-06-29 14:54:13', '2021-06-29 14:54:13', 'fa72da2f-aa7c-42ca-bf16-f3fd7a27960a'),
(24, 20, 5, 4, 2, NULL, '2021-06-29 14:54:13', '2021-06-29 14:54:13', '4e696690-8dc9-49ac-affd-64878bf2c46d'),
(25, 20, 5, 3, 3, NULL, '2021-06-29 14:54:13', '2021-06-29 14:54:13', '222d0816-2c4a-4099-b9cf-7fcddbd636df'),
(27, 26, 5, 2, 1, NULL, '2021-06-29 14:54:13', '2021-06-29 14:54:13', '157a199f-1173-44d6-8f6c-183e5028f59f'),
(28, 26, 5, 4, 2, NULL, '2021-06-29 14:54:13', '2021-06-29 14:54:13', 'b070301b-ddfd-412c-83fa-7c5f012e45c8'),
(29, 26, 5, 3, 3, NULL, '2021-06-29 14:54:13', '2021-06-29 14:54:13', '5a93fe40-454f-45c0-a473-4a9d056552e9'),
(31, 30, 5, 2, 1, NULL, '2021-06-29 14:59:33', '2021-06-29 14:59:33', '3b1f9b73-78a2-4976-bed1-86e282aa471c'),
(32, 30, 5, 4, 2, NULL, '2021-06-29 14:59:33', '2021-06-29 14:59:33', '244fd644-ef35-4409-b9af-64622550bde2'),
(33, 30, 5, 3, 3, NULL, '2021-06-29 14:59:33', '2021-06-29 14:59:33', 'be104156-64cc-4243-8036-b66f944ba3cb'),
(34, 3, 1, 1, 3, 0, '2021-07-09 17:41:07', '2021-07-09 17:41:07', 'c50f95ad-0563-4078-a5d4-decf79b14ed1'),
(36, 35, 1, 1, 1, NULL, '2021-07-09 17:41:08', '2021-07-09 17:41:08', '8bd25d4e-dd5c-42e8-8a80-e3246c8ee9f9'),
(37, 35, 1, 1, 2, NULL, '2021-07-09 17:41:08', '2021-07-09 17:41:08', 'e58cb516-b3c4-4309-89e4-11b2db08cd33'),
(38, 35, 1, 1, 3, NULL, '2021-07-09 17:41:08', '2021-07-09 17:41:08', '39924fd3-a176-47e7-93b0-31b69337612a'),
(40, 39, 1, 1, 1, NULL, '2021-07-09 17:41:38', '2021-07-09 17:41:38', '956d63ce-f242-4a12-841a-98fa6590ccfd'),
(41, 39, 1, 1, 2, NULL, '2021-07-09 17:41:38', '2021-07-09 17:41:38', 'f3433af9-ca5d-437a-bf15-49273a82003d'),
(42, 39, 1, 1, 3, NULL, '2021-07-09 17:41:38', '2021-07-09 17:41:38', 'ce92f649-a8bb-43b6-a848-28f343981558'),
(73, 72, 1, 1, 1, NULL, '2021-07-09 18:20:24', '2021-07-09 18:20:24', '72b58884-826e-4161-b985-206178403cd4'),
(74, 72, 1, 1, 2, NULL, '2021-07-09 18:20:24', '2021-07-09 18:20:24', 'a32657ba-868c-4797-af70-2579974c9704'),
(78, 20, 5, 3, 4, 0, '2021-07-09 18:57:19', '2021-07-09 18:57:19', 'd75dc9ac-1c0c-41e0-8886-7180d8d86630'),
(80, 79, 5, 2, 1, NULL, '2021-07-09 18:57:19', '2021-07-09 18:57:19', 'b11ab5a5-755b-4602-abbf-f144368006af'),
(81, 79, 5, 4, 2, NULL, '2021-07-09 18:57:19', '2021-07-09 18:57:19', '94917d8d-34e1-42ef-86bc-9f09fd422374'),
(82, 79, 5, 3, 3, NULL, '2021-07-09 18:57:19', '2021-07-09 18:57:19', 'e4275ea8-49a8-4171-9e33-6f7a1f1fff34'),
(83, 79, 5, 3, 4, NULL, '2021-07-09 18:57:19', '2021-07-09 18:57:19', '72e6119a-4521-42f2-92cf-4803e5ac663a'),
(85, 84, 5, 2, 1, NULL, '2021-07-09 19:04:56', '2021-07-09 19:04:56', '8ad088da-3507-43ce-a7e6-ee7fcb5df474'),
(86, 84, 5, 4, 2, NULL, '2021-07-09 19:04:56', '2021-07-09 19:04:56', '1ec34fbd-1a8b-44a6-8654-b907bc20b8bf'),
(87, 84, 5, 3, 3, NULL, '2021-07-09 19:04:56', '2021-07-09 19:04:56', 'e9ef5789-762d-4615-9e21-861da2146d69'),
(89, 88, 5, 2, 1, NULL, '2021-07-09 19:05:55', '2021-07-09 19:05:55', 'b6f2c4a8-6df3-4b33-805e-704eceeb182d'),
(90, 88, 5, 4, 2, NULL, '2021-07-09 19:05:55', '2021-07-09 19:05:55', 'b22a0cdd-ce6f-4446-b5f7-a95bce1954d6'),
(91, 88, 5, 3, 3, NULL, '2021-07-09 19:05:55', '2021-07-09 19:05:55', '06ca12e6-4d23-46f8-b203-e78701f7de60'),
(92, 59, 5, 3, 1, NULL, '2021-07-09 19:10:56', '2021-07-09 19:10:56', 'ea063471-247b-4a0d-9406-c7f37732842e'),
(94, 93, 5, 3, 1, NULL, '2021-07-09 19:10:56', '2021-07-09 19:10:56', '4944a2fb-611a-4ae3-97a7-384338b9c7a2'),
(96, 95, 1, 1, 1, NULL, '2021-07-09 19:23:17', '2021-07-09 19:23:17', '545c9afc-65b1-4f5f-bcdd-8028a334265b'),
(97, 95, 1, 1, 2, NULL, '2021-07-09 19:23:17', '2021-07-09 19:23:17', '68cd675c-5fb7-441a-96c9-495820318804'),
(98, 3, 5, 3, 1, 0, '2021-07-09 19:23:47', '2021-07-09 19:23:47', '5299859c-e3e6-4ed5-a90e-d6b2fbdb420c'),
(100, 99, 1, 1, 1, NULL, '2021-07-09 19:23:47', '2021-07-09 19:23:47', '7066a860-bbea-4a1f-b7c0-ed051d25c5e0'),
(101, 99, 1, 1, 2, NULL, '2021-07-09 19:23:47', '2021-07-09 19:23:47', '1db82664-8ed6-4c44-b701-63635ece613e'),
(102, 99, 5, 3, 1, NULL, '2021-07-09 19:23:47', '2021-07-09 19:23:47', 'ea62df74-fbd8-40a4-8dc1-7bbede66cec6'),
(104, 103, 1, 1, 1, NULL, '2021-07-09 22:42:07', '2021-07-09 22:42:07', 'b62eefef-f8b1-4b09-be23-ae7012c56262'),
(105, 103, 1, 1, 2, NULL, '2021-07-09 22:42:07', '2021-07-09 22:42:07', 'cb4420fa-f948-4071-9433-840410feb8d7'),
(107, 106, 1, 1, 1, NULL, '2021-07-09 22:42:42', '2021-07-09 22:42:42', '08fd5d34-a500-4d16-bbd2-2a4cf0c2494c'),
(108, 106, 1, 1, 2, NULL, '2021-07-09 22:42:42', '2021-07-09 22:42:42', '5d710e8c-cdea-4ffc-9026-5dd7413971dd');

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocktypes`
--

CREATE TABLE `matrixblocktypes` (
  `id` int NOT NULL,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `matrixblocktypes`
--

INSERT INTO `matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 5, 'block', 'block', 1, '2021-06-28 21:14:01', '2021-06-28 21:14:01', '3983b886-d522-4401-9459-daa1e6d61cdf'),
(2, 5, 6, 'Richtext', 'richtext', 1, '2021-06-29 14:47:21', '2021-06-29 14:47:21', '692eb48c-e6ca-4a84-805e-1ef02e4d88f2'),
(3, 5, 7, 'Highlighted Article', 'highlightedArticle', 2, '2021-06-29 14:47:21', '2021-06-29 14:47:21', '7346608a-fffe-49fd-bbe6-efa57785bdf0'),
(4, 5, 8, 'Video Embed', 'videoEmbed', 3, '2021-06-29 14:47:21', '2021-06-29 14:47:21', 'dfdd5d42-ea50-4a2a-ba15-b24a3f773356');

-- --------------------------------------------------------

--
-- Table structure for table `matrixcontent_contentbuilder`
--

CREATE TABLE `matrixcontent_contentbuilder` (
  `id` int NOT NULL,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_richtext_text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `field_videoEmbed_embed` text CHARACTER SET utf8 COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `matrixcontent_contentbuilder`
--

INSERT INTO `matrixcontent_contentbuilder` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_richtext_text`, `field_videoEmbed_embed`) VALUES
(1, 23, 1, '2021-06-29 14:54:13', '2021-07-09 19:04:56', '4e1a5221-f648-4498-ae61-6dfd42d99d80', '<p>This is an example richtext box.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut sem viverra aliquet eget sit amet tellus cras. At ultrices mi tempus imperdiet nulla malesuada. Eget nullam non nisi est sit amet facilisis.</p>', NULL),
(2, 24, 1, '2021-06-29 14:54:13', '2021-07-09 19:04:56', '0568612a-3a8a-4ce6-8135-34190d1e30ea', NULL, '<div style=\"padding:56.25% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/362717333?title=0&byline=0&portrait=0\" style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>'),
(3, 25, 1, '2021-06-29 14:54:13', '2021-07-09 19:04:56', 'd908650e-6b6d-451b-93d4-1c9e0f52ed7b', NULL, NULL),
(4, 27, 1, '2021-06-29 14:54:13', '2021-06-29 14:54:13', 'c5d679b5-b956-47b6-910e-2d49061ff967', '<p>This is an example richtext box.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut sem viverra aliquet eget sit amet tellus cras. At ultrices mi tempus imperdiet nulla malesuada. Eget nullam non nisi est sit amet facilisis.</p>', NULL),
(5, 28, 1, '2021-06-29 14:54:13', '2021-06-29 14:54:13', 'd37e2653-81fe-48e6-87f7-f7b414bb0073', NULL, '<div style=\"padding:56.25% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/362717333?title=0&byline=0&portrait=0\" style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>'),
(6, 29, 1, '2021-06-29 14:54:13', '2021-06-29 14:54:13', '3022c8e7-5427-4064-bdb7-e0ba9505b1eb', NULL, NULL),
(7, 31, 1, '2021-06-29 14:59:33', '2021-06-29 14:59:33', 'b83a7ca7-bd30-488d-8450-01f158eb769d', '<p>This is an example richtext box.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut sem viverra aliquet eget sit amet tellus cras. At ultrices mi tempus imperdiet nulla malesuada. Eget nullam non nisi est sit amet facilisis.</p>', NULL),
(8, 32, 1, '2021-06-29 14:59:33', '2021-06-29 14:59:33', '6ae1b655-0918-4716-b9ee-befb574f466b', NULL, '<div style=\"padding:56.25% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/362717333?title=0&byline=0&portrait=0\" style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>'),
(9, 33, 1, '2021-06-29 14:59:33', '2021-06-29 14:59:33', '33d1b4f4-dfe0-4fd3-97e2-7c656b99dc36', NULL, NULL),
(10, 78, 1, '2021-07-09 18:57:19', '2021-07-09 18:57:19', 'a5466acd-3940-49f5-b161-276975a18a55', NULL, NULL),
(11, 80, 1, '2021-07-09 18:57:19', '2021-07-09 18:57:19', 'a65c9d7a-7284-4c5e-a7dc-38d81531428f', '<p>This is an example richtext box.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut sem viverra aliquet eget sit amet tellus cras. At ultrices mi tempus imperdiet nulla malesuada. Eget nullam non nisi est sit amet facilisis.</p>', NULL),
(12, 81, 1, '2021-07-09 18:57:19', '2021-07-09 18:57:19', '9eb08bf7-839b-4c6f-a6cf-0f357258d248', NULL, '<div style=\"padding:56.25% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/362717333?title=0&byline=0&portrait=0\" style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>'),
(13, 82, 1, '2021-07-09 18:57:19', '2021-07-09 18:57:19', '71a6177d-6ab0-4d8d-8e77-504efe72bea1', NULL, NULL),
(14, 83, 1, '2021-07-09 18:57:19', '2021-07-09 18:57:19', '4f263abf-7f73-49f4-bbd0-e85726869f70', NULL, NULL),
(15, 85, 1, '2021-07-09 19:04:56', '2021-07-09 19:04:56', 'ce7408d2-2443-42aa-8d6c-e3d87e10c88e', '<p>This is an example richtext box.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut sem viverra aliquet eget sit amet tellus cras. At ultrices mi tempus imperdiet nulla malesuada. Eget nullam non nisi est sit amet facilisis.</p>', NULL),
(16, 86, 1, '2021-07-09 19:04:56', '2021-07-09 19:04:56', '6e4cdc64-bfe3-40da-8972-d4a74c990f64', NULL, '<div style=\"padding:56.25% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/362717333?title=0&byline=0&portrait=0\" style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>'),
(17, 87, 1, '2021-07-09 19:04:56', '2021-07-09 19:04:56', '361f4d99-6812-4000-b00a-1a613a14782f', NULL, NULL),
(18, 89, 1, '2021-07-09 19:05:55', '2021-07-09 19:05:55', '553f3a1a-1590-4f0f-85c5-1636205e8161', '<p>This is an example richtext box.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut sem viverra aliquet eget sit amet tellus cras. At ultrices mi tempus imperdiet nulla malesuada. Eget nullam non nisi est sit amet facilisis.</p>', NULL),
(19, 90, 1, '2021-07-09 19:05:55', '2021-07-09 19:05:55', 'de014a6c-3510-4754-a4b6-ff943390ac34', NULL, '<div style=\"padding:56.25% 0 0 0;position:relative;\"><iframe src=\"https://player.vimeo.com/video/362717333?title=0&byline=0&portrait=0\" style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture\" allowfullscreen></iframe></div><script src=\"https://player.vimeo.com/api/player.js\"></script>'),
(20, 91, 1, '2021-07-09 19:05:55', '2021-07-09 19:05:55', 'ed8f1188-2435-4ef0-8642-a64b2bf0fff2', NULL, NULL),
(21, 92, 1, '2021-07-09 19:10:56', '2021-07-09 19:10:56', '52d2a109-ee3e-4d1e-820a-6777b7baadca', NULL, NULL),
(22, 94, 1, '2021-07-09 19:10:56', '2021-07-09 19:10:56', 'c7c76dd6-7f34-4c90-9e9d-96bcd66222de', NULL, NULL),
(23, 98, 1, '2021-07-09 19:23:47', '2021-07-09 19:23:47', '0faa75c5-985e-417e-b88e-f76447fdbf80', NULL, NULL),
(24, 102, 1, '2021-07-09 19:23:47', '2021-07-09 19:23:47', 'a6fb1b07-1278-4e5d-8feb-de0d06ea6ef5', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `matrixcontent_imagewithtext`
--

CREATE TABLE `matrixcontent_imagewithtext` (
  `id` int NOT NULL,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_block_text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `field_block_headline` text CHARACTER SET utf8 COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `matrixcontent_imagewithtext`
--

INSERT INTO `matrixcontent_imagewithtext` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_block_text`, `field_block_headline`) VALUES
(1, 7, 1, '2021-06-28 21:15:22', '2021-07-09 18:20:24', '6ac23289-e603-4d9b-a6fb-4be00c7df7c3', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.<br /></p>\n', 'First Block'),
(2, 9, 1, '2021-06-28 21:15:22', '2021-06-28 21:15:22', '5b3244aa-6ff8-4bec-a6b9-67e928689c93', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.<br /></p>\n', 'First Block'),
(3, 11, 1, '2021-06-28 21:19:44', '2021-06-28 21:19:44', '36376fa1-607b-46ef-8f36-1131795a2759', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.<br /></p>\n', 'First Block'),
(4, 13, 1, '2021-06-28 21:24:46', '2021-07-09 18:20:24', '89c88020-9bd8-40fd-9805-ebafcf378cbb', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.</p>', NULL),
(5, 15, 1, '2021-06-28 21:24:46', '2021-06-28 21:24:46', 'cae52276-1649-4465-913c-4d71752d284a', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.<br /></p>\n', 'First Block'),
(6, 16, 1, '2021-06-28 21:24:46', '2021-06-28 21:24:46', 'b72ab45d-d83c-4485-96ff-f1cbca372419', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.</p>', NULL),
(7, 18, 1, '2021-06-28 21:26:59', '2021-06-28 21:26:59', 'b1e22b3e-9a02-4fe6-984c-dabb009fd7e1', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.<br /></p>\n', 'First Block'),
(8, 19, 1, '2021-06-28 21:26:59', '2021-06-28 21:26:59', '7131e412-f093-454f-890f-eaed4c886b85', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.</p>', NULL),
(9, 34, 1, '2021-07-09 17:41:07', '2021-07-09 17:41:38', '15509428-17e3-44ce-81e0-922465a6fc72', '<p>ssss</p>', 'Employees'),
(10, 36, 1, '2021-07-09 17:41:08', '2021-07-09 17:41:08', '7a00fc55-ec3e-4456-8b9b-f9d5eb1497c3', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.<br /></p>\n', 'First Block'),
(11, 37, 1, '2021-07-09 17:41:08', '2021-07-09 17:41:08', 'f623fea0-ba82-4431-a7c9-0115d31e491f', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.</p>', NULL),
(12, 38, 1, '2021-07-09 17:41:08', '2021-07-09 17:41:08', 'c5b602c1-3881-491b-a250-2713dac8254f', '<p>ssss</p>', 'Employees'),
(13, 40, 1, '2021-07-09 17:41:38', '2021-07-09 17:41:38', 'f1271c58-bb0a-4915-b72c-60a18756f2bf', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.<br /></p>\n', 'First Block'),
(14, 41, 1, '2021-07-09 17:41:38', '2021-07-09 17:41:38', 'ee212df8-697b-4f9e-adbc-86ad05338463', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.</p>', NULL),
(15, 42, 1, '2021-07-09 17:41:38', '2021-07-09 17:41:38', 'ddd5c71f-ecc6-4b64-b735-74ec1c0572a9', '<p>ssss</p>', 'Employees'),
(16, 73, 1, '2021-07-09 18:20:24', '2021-07-09 18:20:24', '1752f826-464b-4f2c-a137-e556a667f6cd', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.<br /></p>\n', 'First Block'),
(17, 74, 1, '2021-07-09 18:20:24', '2021-07-09 18:20:24', '74165ffb-1e64-4bac-a1e2-13635666f9a6', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.</p>', NULL),
(18, 96, 1, '2021-07-09 19:23:17', '2021-07-09 19:23:17', '38c6df8f-91e9-4699-9a3a-f90d322030ca', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.<br /></p>\n', 'First Block'),
(19, 97, 1, '2021-07-09 19:23:17', '2021-07-09 19:23:17', '961d6a47-b5bd-4906-97e4-fdad9e034421', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.</p>', NULL),
(20, 100, 1, '2021-07-09 19:23:47', '2021-07-09 19:23:47', 'e21ce06b-b393-4ebb-a3f3-359f24c76bb9', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.<br /></p>\n', 'First Block'),
(21, 101, 1, '2021-07-09 19:23:47', '2021-07-09 19:23:47', 'd093c892-2071-4183-82d3-9af4d4bf7d6f', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.</p>', NULL),
(22, 104, 1, '2021-07-09 22:42:07', '2021-07-09 22:42:07', '2bfdb7a9-2072-46f8-84e7-02297b7ba851', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.<br /></p>\n', 'First Block'),
(23, 105, 1, '2021-07-09 22:42:07', '2021-07-09 22:42:07', '183b7a5b-57e7-43ee-a79d-5240ecbac918', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.</p>', NULL),
(24, 107, 1, '2021-07-09 22:42:42', '2021-07-09 22:42:42', 'ef0489b1-9906-48e8-a36b-e9a2735a8cdd', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.<br /></p>\n', 'First Block'),
(25, 108, 1, '2021-07-09 22:42:42', '2021-07-09 22:42:42', 'c5a21a80-951c-4d88-be2c-eac1f7585131', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tincidunt id aliquet risus feugiat in ante metus. Congue eu consequat ac felis donec et odio. Ornare arcu dui vivamus arcu felis bibendum ut.</p>', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int NOT NULL,
  `track` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(156, 'plugin:redactor', 'm180430_204710_remove_old_plugins', '2021-06-28 19:28:47', '2021-06-28 19:28:47', '2021-06-28 19:28:47', '5a5b09be-3ed0-4715-abfb-291010cfa61f'),
(157, 'plugin:redactor', 'Install', '2021-06-28 19:28:47', '2021-06-28 19:28:47', '2021-06-28 19:28:47', 'b3de342b-9922-4fce-ab2f-19f2c4ba8d2f'),
(158, 'plugin:redactor', 'm190225_003922_split_cleanup_html_settings', '2021-06-28 19:28:47', '2021-06-28 19:28:47', '2021-06-28 19:28:47', 'bd5cce38-bf30-4fb7-9704-7ae202dab634'),
(183, 'craft', 'Install', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '66cdaec0-6869-4da9-806b-eea137b6bc80'),
(184, 'craft', 'm150403_183908_migrations_table_changes', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '41359588-1de3-46fd-bbb2-e6216526551a'),
(185, 'craft', 'm150403_184247_plugins_table_changes', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '40e39e63-2715-4e17-a05b-dcfbb7151bf7'),
(186, 'craft', 'm150403_184533_field_version', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '794969e4-2f5e-4dd9-8c96-607fa5e5024b'),
(187, 'craft', 'm150403_184729_type_columns', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'c3b067de-da32-47e7-97c0-26b2920764ef'),
(188, 'craft', 'm150403_185142_volumes', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'c318e864-bb79-43d6-aebe-b4a2fe8ce39c'),
(189, 'craft', 'm150428_231346_userpreferences', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '41917665-5662-4937-a543-25a752470ba6'),
(190, 'craft', 'm150519_150900_fieldversion_conversion', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '4a76bfce-d0ad-4db9-8c98-920c38fdf340'),
(191, 'craft', 'm150617_213829_update_email_settings', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '98e5b765-2e7e-4aba-936e-56c682239711'),
(192, 'craft', 'm150721_124739_templatecachequeries', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '1bc0c950-b062-476c-be5b-a488d2c3a795'),
(193, 'craft', 'm150724_140822_adjust_quality_settings', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'd548d00a-9feb-4bab-be3c-2ecf0d53a84b'),
(194, 'craft', 'm150815_133521_last_login_attempt_ip', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'abfddac3-3d55-4090-9f7b-a79e5afd1f05'),
(195, 'craft', 'm151002_095935_volume_cache_settings', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '68abb281-8fca-4032-b3f5-135be497f3db'),
(196, 'craft', 'm151005_142750_volume_s3_storage_settings', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '73e16477-5242-4714-9c3c-a9613860672a'),
(197, 'craft', 'm151016_133600_delete_asset_thumbnails', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '11400b9a-dea4-44a4-9dc4-8549820179d1'),
(198, 'craft', 'm151209_000000_move_logo', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'c80cc2d6-336e-4d73-a42f-d38a78a41756'),
(199, 'craft', 'm151211_000000_rename_fileId_to_assetId', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'c6693ba7-17b3-4576-b4cd-a8067d6de07c'),
(200, 'craft', 'm151215_000000_rename_asset_permissions', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '9f892295-cd4c-4736-afef-38f9c9eb26e5'),
(201, 'craft', 'm160707_000001_rename_richtext_assetsource_setting', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2f55294f-1a1e-4b22-af9a-112fe56ef6d2'),
(202, 'craft', 'm160708_185142_volume_hasUrls_setting', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'cb4759d4-779c-4dc8-9758-65d0eda9b204'),
(203, 'craft', 'm160714_000000_increase_max_asset_filesize', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'bf089a6f-2028-4911-ac02-6f5c9816537d'),
(204, 'craft', 'm160727_194637_column_cleanup', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '6cba0a61-e5e8-40c4-8a2c-106a1b09cf9a'),
(205, 'craft', 'm160804_110002_userphotos_to_assets', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'a2831e0a-3561-4cc4-85f1-145eb9b945db'),
(206, 'craft', 'm160807_144858_sites', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '30c75118-84ba-4afd-877c-6b0600dab9f2'),
(207, 'craft', 'm160829_000000_pending_user_content_cleanup', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '0cebdc89-0ca9-41f5-9e7a-c553b829b46a'),
(208, 'craft', 'm160830_000000_asset_index_uri_increase', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2444eb4d-3c2b-4173-8dd9-bb5f09c1422d'),
(209, 'craft', 'm160912_230520_require_entry_type_id', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'f8645ed3-37c6-43b6-a789-2a5420c6ad9e'),
(210, 'craft', 'm160913_134730_require_matrix_block_type_id', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'e542f2e0-0996-4fec-8c2b-378be5c1ff30'),
(211, 'craft', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '4773ff6b-cb86-4f63-bcfd-3faa8f829eef'),
(212, 'craft', 'm160920_231045_usergroup_handle_title_unique', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'ec61e9f1-251a-43a0-a311-ac72942d3a49'),
(213, 'craft', 'm160925_113941_route_uri_parts', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '12db5b54-3dbe-4c3e-9f76-fd6f23e49943'),
(214, 'craft', 'm161006_205918_schemaVersion_not_null', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'e9b88836-a970-42c8-9806-fda142e45013'),
(215, 'craft', 'm161007_130653_update_email_settings', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '0bb8e1be-fafd-48eb-b87a-a306dd0aa29a'),
(216, 'craft', 'm161013_175052_newParentId', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '77194773-53d8-4c11-9450-05e3eb6f48b7'),
(217, 'craft', 'm161021_102916_fix_recent_entries_widgets', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'b7624f28-6d8f-4124-b0df-d319ce67ba29'),
(218, 'craft', 'm161021_182140_rename_get_help_widget', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '02a0d7b9-3092-4903-88e7-541e16358439'),
(219, 'craft', 'm161025_000000_fix_char_columns', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'efacd00a-d926-49b2-b101-ec8026e0ab5b'),
(220, 'craft', 'm161029_124145_email_message_languages', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '42ae93f6-ca0a-43f8-a2ca-5848f667a5f2'),
(221, 'craft', 'm161108_000000_new_version_format', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'a358040a-03af-44c0-92fc-e090a2e7f1eb'),
(222, 'craft', 'm161109_000000_index_shuffle', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '711cd344-fd5c-4bc5-b7f2-96bbb5294f62'),
(223, 'craft', 'm161122_185500_no_craft_app', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'add6f618-55b1-4ec5-8084-603aefbdec0b'),
(224, 'craft', 'm161125_150752_clear_urlmanager_cache', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '4fe0cf6f-c1a1-4f26-80da-2b52105320ab'),
(225, 'craft', 'm161220_000000_volumes_hasurl_notnull', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'aaad39e1-1ef9-410b-9e4d-22c810166f55'),
(226, 'craft', 'm170114_161144_udates_permission', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'c4b8c87b-45cc-45c3-ade2-b89cfa566b00'),
(227, 'craft', 'm170120_000000_schema_cleanup', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '40e9923d-8f2c-4f70-bd3f-67b47182af46'),
(228, 'craft', 'm170126_000000_assets_focal_point', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '65035147-1f87-4647-9a94-076306c0d291'),
(229, 'craft', 'm170206_142126_system_name', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '074e5a16-de45-4e98-85eb-76972cc0be6f'),
(230, 'craft', 'm170217_044740_category_branch_limits', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '376860ee-e72f-4032-94f0-4ee598a9df66'),
(231, 'craft', 'm170217_120224_asset_indexing_columns', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'd211115f-1345-4c03-8fe6-10ff4f50a76b'),
(232, 'craft', 'm170223_224012_plain_text_settings', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'd9591730-388d-4b31-bd6b-8b6cce81b624'),
(233, 'craft', 'm170227_120814_focal_point_percentage', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '8502a4a5-5403-4371-b3a0-205e0af67a58'),
(234, 'craft', 'm170228_171113_system_messages', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'aead0e8e-5b16-473c-9a73-67861b03c7b1'),
(235, 'craft', 'm170303_140500_asset_field_source_settings', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '1ce4408b-8e35-4793-a354-5840a3e75fa4'),
(236, 'craft', 'm170306_150500_asset_temporary_uploads', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '7b79a1bb-d624-4ff1-bdfb-a8d4d3f061d6'),
(237, 'craft', 'm170523_190652_element_field_layout_ids', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'f38250fa-1b09-4452-b13b-dc99c6c75ce7'),
(238, 'craft', 'm170621_195237_format_plugin_handles', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '1d2b732c-ffee-46db-a1ac-dab4ff418052'),
(239, 'craft', 'm170630_161027_deprecation_line_nullable', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '289b24d5-4f5c-4761-92a0-0b585abf7f67'),
(240, 'craft', 'm170630_161028_deprecation_changes', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'b41d3945-77fd-4c42-8836-43b990eb3960'),
(241, 'craft', 'm170703_181539_plugins_table_tweaks', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '459e8026-52a5-4f6a-ab39-385ff1b40114'),
(242, 'craft', 'm170704_134916_sites_tables', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'f4931a6f-4f8d-4323-ba01-a09762c935bc'),
(243, 'craft', 'm170706_183216_rename_sequences', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'b21a40bc-1f4b-445e-abb3-c0edf66b3d3b'),
(244, 'craft', 'm170707_094758_delete_compiled_traits', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '1d6f8e7e-3a28-4da6-bdaa-110ee7b5bee4'),
(245, 'craft', 'm170731_190138_drop_asset_packagist', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '7f09ecd9-cc51-42ef-b4de-9d9a446fe230'),
(246, 'craft', 'm170810_201318_create_queue_table', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '3b3a5a76-cc57-4bc1-9b4e-9248fe1db2ee'),
(247, 'craft', 'm170903_192801_longblob_for_queue_jobs', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'f447944f-5450-4056-be8f-3d007528caed'),
(248, 'craft', 'm170914_204621_asset_cache_shuffle', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '1c665868-b8d3-49ab-a38e-6f3d9265e649'),
(249, 'craft', 'm171011_214115_site_groups', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'ca551406-7817-43be-a95f-9eaec24507ca'),
(250, 'craft', 'm171012_151440_primary_site', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'b1dd3b40-b0f5-44ac-992f-81da5e47e24f'),
(251, 'craft', 'm171013_142500_transform_interlace', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'b4bcba01-c19c-4726-95a6-e481aa99ef26'),
(252, 'craft', 'm171016_092553_drop_position_select', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'eba87c19-7556-4ac9-976f-3ca2d54661c5'),
(253, 'craft', 'm171016_221244_less_strict_translation_method', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '29ece444-2746-4f61-a24e-4e7f9c942caf'),
(254, 'craft', 'm171107_000000_assign_group_permissions', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '1fdcdf75-9786-4414-9341-07323fb5c95f'),
(255, 'craft', 'm171117_000001_templatecache_index_tune', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'fd0a5d7a-0b54-4876-b36f-1dc0414d9982'),
(256, 'craft', 'm171126_105927_disabled_plugins', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '6a98fdc8-bdb0-4e23-8fa2-d24982b259cc'),
(257, 'craft', 'm171130_214407_craftidtokens_table', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '07d6530a-2e91-4cc2-ac31-58ec710345ec'),
(258, 'craft', 'm171202_004225_update_email_settings', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '9d553d0c-376a-4087-b92f-a3516dddfe3d'),
(259, 'craft', 'm171204_000001_templatecache_index_tune_deux', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'c71888f3-2fee-45f5-b4e0-64af2d2978cf'),
(260, 'craft', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'ef3b8de8-d633-4ad0-a2eb-da43aebf196d'),
(261, 'craft', 'm171218_143135_longtext_query_column', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '91734973-57b0-4c7f-bdf5-1e9a90058d45'),
(262, 'craft', 'm171231_055546_environment_variables_to_aliases', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '8706d0bc-6fcb-4b2c-accb-bd7d66de173a'),
(263, 'craft', 'm180113_153740_drop_users_archived_column', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '5227afdd-45a3-4dc7-b091-7556fd136aba'),
(264, 'craft', 'm180122_213433_propagate_entries_setting', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '1bb865a6-d17f-44e1-83d2-515b2dd274f4'),
(265, 'craft', 'm180124_230459_fix_propagate_entries_values', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '5838351f-88ec-4b95-9d19-b7b2d9ced571'),
(266, 'craft', 'm180128_235202_set_tag_slugs', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '4fffcac2-f2b0-4794-8d28-304a78367e57'),
(267, 'craft', 'm180202_185551_fix_focal_points', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '31c661d2-6ea9-4515-ac06-6648cb9c8927'),
(268, 'craft', 'm180217_172123_tiny_ints', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2abe4434-6979-4923-becb-ebe44904c0e2'),
(269, 'craft', 'm180321_233505_small_ints', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'b432819f-d497-4162-84d0-e042b17fc813'),
(270, 'craft', 'm180404_182320_edition_changes', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'd94d2d79-b2ad-4565-9849-197fcb090563'),
(271, 'craft', 'm180411_102218_fix_db_routes', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '9d9aae53-ab5c-4605-b6ce-a156f6717839'),
(272, 'craft', 'm180416_205628_resourcepaths_table', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '4f1e4ce5-86f8-4144-8324-46799138658d'),
(273, 'craft', 'm180418_205713_widget_cleanup', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'e9788486-fe34-4c30-87a3-9b2409136cfc'),
(274, 'craft', 'm180425_203349_searchable_fields', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'a8751236-fa5f-486b-b01f-23f63cd03535'),
(275, 'craft', 'm180516_153000_uids_in_field_settings', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '171cb723-c02f-4201-addf-91930f049c78'),
(276, 'craft', 'm180517_173000_user_photo_volume_to_uid', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '4da1c643-691b-4473-bcf3-b6b4fa1ad457'),
(277, 'craft', 'm180518_173000_permissions_to_uid', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '7262916b-d9d1-44f2-896a-80a42ed5f833'),
(278, 'craft', 'm180520_173000_matrix_context_to_uids', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'f3da65fa-8d5c-4cb3-b1c1-4fa7a7f7602c'),
(279, 'craft', 'm180521_172900_project_config_table', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '958064f3-00d7-4a48-9a20-9a7a69c35203'),
(280, 'craft', 'm180521_173000_initial_yml_and_snapshot', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'f4279573-f5bd-40f0-9be1-d82539341545'),
(281, 'craft', 'm180731_162030_soft_delete_sites', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '3fe8bfa2-9388-4010-9b1c-0a8ead40b29b'),
(282, 'craft', 'm180810_214427_soft_delete_field_layouts', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '23d11192-ca41-443a-b738-941218574080'),
(283, 'craft', 'm180810_214439_soft_delete_elements', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'c00dbd5a-d11f-4041-8522-1e728ac5ef59'),
(284, 'craft', 'm180824_193422_case_sensitivity_fixes', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '25333820-d87b-45d6-93b4-57461bc2e9c7'),
(285, 'craft', 'm180901_151639_fix_matrixcontent_tables', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '047b98ce-d51c-4e68-9e18-6c94b9b24600'),
(286, 'craft', 'm180904_112109_permission_changes', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'bf7024ee-4134-4939-826c-4c86c06633de'),
(287, 'craft', 'm180910_142030_soft_delete_sitegroups', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'f48a9b9d-23ee-4b93-ba74-0e9e532fce92'),
(288, 'craft', 'm181011_160000_soft_delete_asset_support', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '3500f762-7a9a-407c-9670-bdf4a92726ab'),
(289, 'craft', 'm181016_183648_set_default_user_settings', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '3b2b664b-c88c-45ef-b723-8b8a2ec84d6d'),
(290, 'craft', 'm181017_225222_system_config_settings', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2328207c-bf62-4d7f-96fb-30cfba1f2663'),
(291, 'craft', 'm181018_222343_drop_userpermissions_from_config', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '9c505932-b1eb-4b95-b213-9a3f3cbbe8d7'),
(292, 'craft', 'm181029_130000_add_transforms_routes_to_config', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'b4f0e5b3-478b-4f20-b4f9-3e92dc099c6e'),
(293, 'craft', 'm181112_203955_sequences_table', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'ad109bee-1e48-4560-941a-d0855ed02032'),
(294, 'craft', 'm181121_001712_cleanup_field_configs', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '152e29d3-d776-4eab-a20d-320da72c115e'),
(295, 'craft', 'm181128_193942_fix_project_config', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'f3c0d3d4-29cd-4639-a43f-3e36c0fa9de7'),
(296, 'craft', 'm181130_143040_fix_schema_version', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'caee7735-5a1a-486b-951a-fd0f6334d3c4'),
(297, 'craft', 'm181211_143040_fix_entry_type_uids', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '89731af5-da0f-4fa5-a92c-9bc8cab7e86c'),
(298, 'craft', 'm181217_153000_fix_structure_uids', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2e20a7d7-918e-45d6-86fd-1c8797393b89'),
(299, 'craft', 'm190104_152725_store_licensed_plugin_editions', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '30929f76-444e-4fd0-9de7-e4ba819432c6'),
(300, 'craft', 'm190108_110000_cleanup_project_config', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '60be0373-f651-4742-885a-0b417b8f0ba2'),
(301, 'craft', 'm190108_113000_asset_field_setting_change', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '13f95210-bc4e-412b-bd66-42c02a12f70b'),
(302, 'craft', 'm190109_172845_fix_colspan', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '785d78ff-d847-47ac-98bd-7d54b2d2f8e0'),
(303, 'craft', 'm190110_150000_prune_nonexisting_sites', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'ba68ad87-79ef-496b-978b-a617921ce300'),
(304, 'craft', 'm190110_214819_soft_delete_volumes', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'f21848e3-9b0f-437a-831d-4f6f0f5fac1d'),
(305, 'craft', 'm190112_124737_fix_user_settings', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'efb17bad-8f3c-470c-b086-37639e648da5'),
(306, 'craft', 'm190112_131225_fix_field_layouts', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'f65335bc-ecab-4190-8b9e-a5ae3f17e0a2'),
(307, 'craft', 'm190112_201010_more_soft_deletes', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '8a790bdd-e2a2-45ea-b6b3-0a3ec3b7d693'),
(308, 'craft', 'm190114_143000_more_asset_field_setting_changes', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'd02e8f86-0c3d-434c-a024-1528042727fd'),
(309, 'craft', 'm190121_120000_rich_text_config_setting', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'c7e28410-529d-4292-83ec-7d6c149212b9'),
(310, 'craft', 'm190125_191628_fix_email_transport_password', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '248ee574-b630-480b-a363-642284c67662'),
(311, 'craft', 'm190128_181422_cleanup_volume_folders', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '75677427-ca99-4a18-bcab-d4a08a0a9fbf'),
(312, 'craft', 'm190205_140000_fix_asset_soft_delete_index', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '6921457b-f47d-4e51-921e-8771bb06b447'),
(313, 'craft', 'm190218_143000_element_index_settings_uid', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '8d77c874-0c6b-434b-b5c5-416b2186a6a4'),
(314, 'craft', 'm190312_152740_element_revisions', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '803a26d0-e3cb-4176-a650-fe3709592e6c'),
(315, 'craft', 'm190327_235137_propagation_method', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2451d522-4883-49a3-8aee-f6e5a723a286'),
(316, 'craft', 'm190401_223843_drop_old_indexes', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'a6d349a6-eb11-415a-b9ef-f90dd4e8d6b5'),
(317, 'craft', 'm190416_014525_drop_unique_global_indexes', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '78f31420-c973-4671-88c2-7adae3df6f8a'),
(318, 'craft', 'm190417_085010_add_image_editor_permissions', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'fe614ea7-5c55-46a8-8cc2-461af9f6540e'),
(319, 'craft', 'm190502_122019_store_default_user_group_uid', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'b7bd8a0b-202c-4493-90bf-9f4d2f35f98b'),
(320, 'craft', 'm190504_150349_preview_targets', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '09dbdb5a-b8b0-4664-b5bb-13c6beecf071'),
(321, 'craft', 'm190516_184711_job_progress_label', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'fc54fa70-719a-4598-8ed8-133625715c6a'),
(322, 'craft', 'm190523_190303_optional_revision_creators', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '3727ac44-24d1-4d59-b2b7-abe3e82705f5'),
(323, 'craft', 'm190529_204501_fix_duplicate_uids', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'c14aeea8-4e29-4db3-a2fb-1de21d615d23'),
(324, 'craft', 'm190605_223807_unsaved_drafts', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '09b8dffa-3ed0-48dc-a36a-abdbfa21dd0d'),
(325, 'craft', 'm190607_230042_entry_revision_error_tables', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'a5fd6e2d-81b6-456d-bbab-f741e18ec6ab'),
(326, 'craft', 'm190608_033429_drop_elements_uid_idx', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '02331953-745a-4276-92d8-aa9cf388cc2e'),
(327, 'craft', 'm190617_164400_add_gqlschemas_table', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'e79ae9bc-1239-4e65-ae64-3520bcd8fe1b'),
(328, 'craft', 'm190624_234204_matrix_propagation_method', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '935cadb3-7c90-4b17-9546-f10a80b8af4d'),
(329, 'craft', 'm190711_153020_drop_snapshots', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '1cc05d55-8492-42e5-8afc-99200cc3b7ad'),
(330, 'craft', 'm190712_195914_no_draft_revisions', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '6201aa95-ee56-48da-8a4e-6ea3905e6b64'),
(331, 'craft', 'm190723_140314_fix_preview_targets_column', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'f0ec2d52-b919-4e6c-8006-2d4afb97a7de'),
(332, 'craft', 'm190820_003519_flush_compiled_templates', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2acabdab-d115-457b-9b10-2ad4885a420f'),
(333, 'craft', 'm190823_020339_optional_draft_creators', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '4ca50060-389a-446d-b88b-a829b66ea792'),
(334, 'craft', 'm190913_152146_update_preview_targets', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'ec09f9a1-99b9-498a-88a5-9340c88a696a'),
(335, 'craft', 'm191107_122000_add_gql_project_config_support', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '75f1b443-bb3b-4131-8b27-54a92b292e8e'),
(336, 'craft', 'm191204_085100_pack_savable_component_settings', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'a2b42098-6602-42a1-bcbb-bb193cf594d8'),
(337, 'craft', 'm191206_001148_change_tracking', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'ecea0be0-148c-4702-bf2b-377ce98c9aa0'),
(338, 'craft', 'm191216_191635_asset_upload_tracking', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '102b4ad7-5a6f-4985-8a20-7e400537ff53'),
(339, 'craft', 'm191222_002848_peer_asset_permissions', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '6c9d1441-1ab5-4087-b63e-21a9f4c74b2a'),
(340, 'craft', 'm200127_172522_queue_channels', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '1cea7e00-c057-468f-b5cc-69cc44b6e7dc'),
(341, 'craft', 'm200211_175048_truncate_element_query_cache', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '69bc34da-42aa-4df9-a76c-4c424d70cfff'),
(342, 'craft', 'm200213_172522_new_elements_index', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '5a51bf0f-01e6-4d43-952e-14594d3ae8fa'),
(343, 'craft', 'm200228_195211_long_deprecation_messages', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '0e3f9f23-1bbd-4ba1-9533-fc44f37a248f'),
(344, 'craft', 'm200306_054652_disabled_sites', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'afb30f58-dacf-4e2a-853e-6e004ea57e37'),
(345, 'craft', 'm200522_191453_clear_template_caches', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '09f43327-3efa-4128-93e3-6866e299d1a7'),
(346, 'craft', 'm200606_231117_migration_tracks', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '399f0c3e-37f7-4ba9-8669-e3242b61b2f5'),
(347, 'craft', 'm200619_215137_title_translation_method', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'b7470264-f96b-43dd-afa9-54a0464253e9'),
(348, 'craft', 'm200620_005028_user_group_descriptions', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '798e80b1-9922-43b9-9d2b-603cbc8644bb'),
(349, 'craft', 'm200620_230205_field_layout_changes', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'c5efc1c5-63bc-4f82-a69f-524f0050ed6b'),
(350, 'craft', 'm200625_131100_move_entrytypes_to_top_project_config', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'ef2f3c09-c9fb-4416-b4e1-b889fa11f28c'),
(351, 'craft', 'm200629_112700_remove_project_config_legacy_files', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'ecce3c3a-e241-41bf-9f1c-a026ff695653'),
(352, 'craft', 'm200630_183000_drop_configmap', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'f04da42f-4572-4919-9363-0af0c1f27b97'),
(353, 'craft', 'm200715_113400_transform_index_error_flag', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '352ab7c3-3111-4ad6-8c57-2e8a4c545407'),
(354, 'craft', 'm200716_110900_replace_file_asset_permissions', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '69ad84d2-acee-4b39-a689-639484cc5222'),
(355, 'craft', 'm200716_153800_public_token_settings_in_project_config', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'b305d532-0f61-4ddd-b2e6-1c87105e1195'),
(356, 'craft', 'm200720_175543_drop_unique_constraints', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'fe4ae63f-2997-41de-8fed-ab2607c4acbb'),
(357, 'craft', 'm200825_051217_project_config_version', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'a51258d0-2965-407e-a4e5-c4737bb8df3f'),
(358, 'craft', 'm201116_190500_asset_title_translation_method', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'a4086d7e-e97d-4691-b15f-a81a4c70498a'),
(359, 'craft', 'm201124_003555_plugin_trials', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '0ad8cece-a7da-49ff-8003-38c752278d5d'),
(360, 'craft', 'm210209_135503_soft_delete_field_groups', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '3d3ddb57-6e6e-4f05-a5cd-39309bba2ba9'),
(361, 'craft', 'm210212_223539_delete_invalid_drafts', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'ea229880-4600-44cb-aed9-b8f975feffe3'),
(362, 'craft', 'm210214_202731_track_saved_drafts', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '9f6c0fa7-c610-4363-bc29-9c8c770d2f41'),
(363, 'craft', 'm210223_150900_add_new_element_gql_schema_components', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '6f7f62e4-d698-48ac-bca6-33f1edb1117d'),
(364, 'craft', 'm210224_162000_add_projectconfignames_table', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'ab92ea90-3e3c-4936-9b6c-3041028efc43'),
(365, 'craft', 'm210326_132000_invalidate_projectconfig_cache', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', 'b037e7b2-cc66-43c2-9b1a-3511082c0c75'),
(366, 'craft', 'm210331_220322_null_author', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '2021-06-28 19:28:48', '768fd457-55c2-4c22-b16a-499474bbe9f9');

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE `plugins` (
  `id` int NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `plugins`
--

INSERT INTO `plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKeyStatus`, `licensedEdition`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(5, 'logs', '3.0.3', '3.0.0', 'unknown', NULL, '2021-06-28 19:28:46', '2021-06-28 19:28:46', '2021-07-10 17:18:35', '1c5de291-719e-4032-a60f-067b054be430'),
(6, 'mix', '1.5.2', '1.0.0', 'unknown', NULL, '2021-06-28 19:28:46', '2021-06-28 19:28:46', '2021-07-10 17:18:35', 'c199ffa9-17bb-4c21-9ebb-f4f77c12887f'),
(9, 'redactor', '2.8.7', '2.3.0', 'unknown', NULL, '2021-06-28 19:28:47', '2021-06-28 19:28:47', '2021-07-10 17:18:35', '6d02765d-5e3f-4ad5-bf76-5dd3a1a939d1'),
(14, 'expanded-singles', '1.1.4', '1.0.0', 'unknown', NULL, '2021-07-09 17:27:17', '2021-07-09 17:27:17', '2021-07-10 17:18:35', '5f13d368-b23c-42ed-9aaa-6d1d7877a7e6');

-- --------------------------------------------------------

--
-- Table structure for table `projectconfig`
--

CREATE TABLE `projectconfig` (
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `projectconfig`
--

INSERT INTO `projectconfig` (`path`, `value`) VALUES
('dateModified', '1625937866'),
('email.fromEmail', '\"alex@dodgyco.de\"'),
('email.fromName', '\"Craft Code Test\"'),
('email.replyToEmail', 'null'),
('email.template', '\"\"'),
('email.transportSettings.command', '\"\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.class', 'null'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.disabled', 'false'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.id', 'null'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.instructions', 'null'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.label', 'null'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.max', 'null'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.min', 'null'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.name', 'null'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.orientation', 'null'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.readonly', 'false'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.requirable', 'false'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.size', 'null'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.step', 'null'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.tip', 'null'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.title', 'null'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.warning', 'null'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.0.width', '100'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.1.fieldUid', '\"f0b26b60-9cd6-415f-928f-c63614f6e7b8\"'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.1.instructions', 'null'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.1.label', 'null'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.1.required', 'false'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.1.tip', 'null'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.1.warning', 'null'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.elements.1.width', '100'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.name', '\"Content\"'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.fieldLayouts.d73e14fe-045f-46c1-8bfb-df9f05627015.tabs.0.sortOrder', '1'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.handle', '\"example\"'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.hasTitleField', 'true'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.name', '\"Example\"'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.section', '\"7121f7fe-e16c-4776-bf07-811a25cd8b1e\"'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.sortOrder', '1'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.titleTranslationKeyFormat', 'null'),
('entryTypes.03c99c5f-1d80-4e41-a0b5-07c33e763e93.titleTranslationMethod', '\"site\"'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.0.template', 'null'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\Template\"'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.0.width', '100'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.1.autocapitalize', 'true'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.1.autocomplete', 'false'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.1.autocorrect', 'true'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.1.class', 'null'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.1.disabled', 'false'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.1.id', 'null'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.1.instructions', 'null'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.1.label', 'null'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.1.max', 'null'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.1.min', 'null'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.1.name', 'null'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.1.orientation', 'null'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.1.placeholder', 'null'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.1.readonly', 'false'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.1.requirable', 'false'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.1.size', 'null'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.1.step', 'null'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.1.tip', 'null'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.1.title', 'null'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.1.warning', 'null'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.1.width', '100'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.2.heading', 'null'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\Heading\"'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.3.fieldUid', '\"1bbbd3b6-8526-433d-b7a1-74b5bd094c7c\"'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.3.instructions', 'null'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.3.label', 'null'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.3.required', 'false'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.3.tip', 'null'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.3.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.3.warning', 'null'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.3.width', '100'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.4.type', '\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.5.fieldUid', '\"5e38f338-d0a4-4fa3-bfd5-9b494d31a442\"'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.5.instructions', 'null'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.5.label', 'null'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.5.required', 'false'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.5.tip', 'null'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.5.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.5.warning', 'null'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.5.width', '100'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.6.type', '\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.7.fieldUid', '\"0c93d9fd-ac15-4c59-988d-36af9f3f6527\"'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.7.instructions', 'null'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.7.label', 'null'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.7.required', 'false'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.7.tip', 'null'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.7.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.7.warning', 'null'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.elements.7.width', '100'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.name', '\"Content\"'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.fieldLayouts.376d30a5-e009-4035-8887-2fdce04cd82d.tabs.0.sortOrder', '1'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.handle', '\"new_employees\"'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.hasTitleField', 'false'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.name', '\"NewEmployees\"'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.section', '\"cc7b6c50-7a1c-4169-a014-ed8976aa0170\"'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.sortOrder', '2'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.titleFormat', '\"{firstName}\"'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.titleTranslationKeyFormat', 'null'),
('entryTypes.ae5bd065-3d9c-4e8e-9ac4-35a80decc537.titleTranslationMethod', '\"site\"'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.class', 'null'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.disabled', 'false'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.id', 'null'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.instructions', 'null'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.label', 'null'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.max', 'null'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.min', 'null'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.name', 'null'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.orientation', 'null'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.readonly', 'false'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.requirable', 'false'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.size', 'null'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.step', 'null'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.tip', 'null'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.title', 'null'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.warning', 'null'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.elements.0.width', '100'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.name', '\"Info\"'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.0.sortOrder', '1'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.1.elements.0.fieldUid', '\"4e579fce-80fb-40df-a0ab-5ade3e8ecb88\"'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.1.elements.0.instructions', 'null'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.1.elements.0.label', 'null'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.1.elements.0.required', 'false'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.1.elements.0.tip', 'null'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.1.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.1.elements.0.warning', 'null'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.1.elements.0.width', '100'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.1.name', '\"Content\"'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.fieldLayouts.6f0a658f-6a92-45f6-9233-a09f5a3e2780.tabs.1.sortOrder', '2'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.handle', '\"homepage\"'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.hasTitleField', 'true'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.name', '\"Homepage\"'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.section', '\"a887e226-ad5b-4ffc-b54e-6bd80d70fd34\"'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.sortOrder', '1'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.titleTranslationKeyFormat', 'null'),
('entryTypes.bbb54962-2280-467a-a9f8-15522dd5e7b2.titleTranslationMethod', '\"site\"'),
('fieldGroups.acc7548f-3022-405c-b653-2c8760879e60.name', '\"Common\"'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.contentColumnType', '\"string\"'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.fieldGroup', '\"acc7548f-3022-405c-b653-2c8760879e60\"'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.handle', '\"profileImage\"'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.instructions', '\"\"'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.name', '\"Profile Image\"'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.searchable', 'false'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.settings.allowedKinds', 'null'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.settings.allowSelfRelations', 'false'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.settings.allowUploads', 'true'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.settings.defaultUploadLocationSource', '\"volume:c9040c8c-87a7-43ef-9eaf-595dc38c1eed\"'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.settings.defaultUploadLocationSubpath', '\"\"'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.settings.limit', '\"\"'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.settings.localizeRelations', 'false'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.settings.previewMode', '\"thumbs\"'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.settings.restrictFiles', '\"\"'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.settings.selectionLabel', '\"\"'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.settings.showSiteMenu', 'true'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.settings.showUnpermittedFiles', 'false'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.settings.showUnpermittedVolumes', 'false'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.settings.singleUploadLocationSource', '\"volume:c9040c8c-87a7-43ef-9eaf-595dc38c1eed\"'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.settings.singleUploadLocationSubpath', '\"\"'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.settings.source', 'null'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.settings.sources.0', '\"volume:c9040c8c-87a7-43ef-9eaf-595dc38c1eed\"'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.settings.targetSiteId', 'null'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.settings.useSingleFolder', 'false'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.settings.validateRelatedElements', 'false'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.settings.viewMode', '\"list\"'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.translationKeyFormat', 'null'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.translationMethod', '\"site\"'),
('fields.0c93d9fd-ac15-4c59-988d-36af9f3f6527.type', '\"craft\\\\fields\\\\Assets\"'),
('fields.1bbbd3b6-8526-433d-b7a1-74b5bd094c7c.contentColumnType', '\"text\"'),
('fields.1bbbd3b6-8526-433d-b7a1-74b5bd094c7c.fieldGroup', '\"acc7548f-3022-405c-b653-2c8760879e60\"'),
('fields.1bbbd3b6-8526-433d-b7a1-74b5bd094c7c.handle', '\"firstName\"'),
('fields.1bbbd3b6-8526-433d-b7a1-74b5bd094c7c.instructions', '\"\"'),
('fields.1bbbd3b6-8526-433d-b7a1-74b5bd094c7c.name', '\"First Name\"'),
('fields.1bbbd3b6-8526-433d-b7a1-74b5bd094c7c.searchable', 'false'),
('fields.1bbbd3b6-8526-433d-b7a1-74b5bd094c7c.settings.byteLimit', 'null'),
('fields.1bbbd3b6-8526-433d-b7a1-74b5bd094c7c.settings.charLimit', 'null'),
('fields.1bbbd3b6-8526-433d-b7a1-74b5bd094c7c.settings.code', '\"\"'),
('fields.1bbbd3b6-8526-433d-b7a1-74b5bd094c7c.settings.columnType', 'null'),
('fields.1bbbd3b6-8526-433d-b7a1-74b5bd094c7c.settings.initialRows', '\"4\"'),
('fields.1bbbd3b6-8526-433d-b7a1-74b5bd094c7c.settings.multiline', '\"\"'),
('fields.1bbbd3b6-8526-433d-b7a1-74b5bd094c7c.settings.placeholder', 'null'),
('fields.1bbbd3b6-8526-433d-b7a1-74b5bd094c7c.settings.uiMode', '\"normal\"'),
('fields.1bbbd3b6-8526-433d-b7a1-74b5bd094c7c.translationKeyFormat', 'null'),
('fields.1bbbd3b6-8526-433d-b7a1-74b5bd094c7c.translationMethod', '\"none\"'),
('fields.1bbbd3b6-8526-433d-b7a1-74b5bd094c7c.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.4e579fce-80fb-40df-a0ab-5ade3e8ecb88.contentColumnType', '\"string\"'),
('fields.4e579fce-80fb-40df-a0ab-5ade3e8ecb88.fieldGroup', '\"acc7548f-3022-405c-b653-2c8760879e60\"'),
('fields.4e579fce-80fb-40df-a0ab-5ade3e8ecb88.handle', '\"imageWithText\"'),
('fields.4e579fce-80fb-40df-a0ab-5ade3e8ecb88.instructions', '\"\"'),
('fields.4e579fce-80fb-40df-a0ab-5ade3e8ecb88.name', '\"Image with Text\"'),
('fields.4e579fce-80fb-40df-a0ab-5ade3e8ecb88.searchable', 'false'),
('fields.4e579fce-80fb-40df-a0ab-5ade3e8ecb88.settings.contentTable', '\"{{%matrixcontent_imagewithtext}}\"'),
('fields.4e579fce-80fb-40df-a0ab-5ade3e8ecb88.settings.maxBlocks', '\"\"'),
('fields.4e579fce-80fb-40df-a0ab-5ade3e8ecb88.settings.minBlocks', '\"\"'),
('fields.4e579fce-80fb-40df-a0ab-5ade3e8ecb88.settings.propagationMethod', '\"all\"'),
('fields.4e579fce-80fb-40df-a0ab-5ade3e8ecb88.translationKeyFormat', 'null'),
('fields.4e579fce-80fb-40df-a0ab-5ade3e8ecb88.translationMethod', '\"site\"'),
('fields.4e579fce-80fb-40df-a0ab-5ade3e8ecb88.type', '\"craft\\\\fields\\\\Matrix\"'),
('fields.5e38f338-d0a4-4fa3-bfd5-9b494d31a442.contentColumnType', '\"text\"'),
('fields.5e38f338-d0a4-4fa3-bfd5-9b494d31a442.fieldGroup', '\"acc7548f-3022-405c-b653-2c8760879e60\"'),
('fields.5e38f338-d0a4-4fa3-bfd5-9b494d31a442.handle', '\"lastName\"'),
('fields.5e38f338-d0a4-4fa3-bfd5-9b494d31a442.instructions', '\"\"'),
('fields.5e38f338-d0a4-4fa3-bfd5-9b494d31a442.name', '\"Last Name\"'),
('fields.5e38f338-d0a4-4fa3-bfd5-9b494d31a442.searchable', 'false'),
('fields.5e38f338-d0a4-4fa3-bfd5-9b494d31a442.settings.byteLimit', 'null'),
('fields.5e38f338-d0a4-4fa3-bfd5-9b494d31a442.settings.charLimit', 'null'),
('fields.5e38f338-d0a4-4fa3-bfd5-9b494d31a442.settings.code', '\"\"'),
('fields.5e38f338-d0a4-4fa3-bfd5-9b494d31a442.settings.columnType', 'null'),
('fields.5e38f338-d0a4-4fa3-bfd5-9b494d31a442.settings.initialRows', '\"4\"'),
('fields.5e38f338-d0a4-4fa3-bfd5-9b494d31a442.settings.multiline', '\"\"'),
('fields.5e38f338-d0a4-4fa3-bfd5-9b494d31a442.settings.placeholder', 'null'),
('fields.5e38f338-d0a4-4fa3-bfd5-9b494d31a442.settings.uiMode', '\"normal\"'),
('fields.5e38f338-d0a4-4fa3-bfd5-9b494d31a442.translationKeyFormat', 'null'),
('fields.5e38f338-d0a4-4fa3-bfd5-9b494d31a442.translationMethod', '\"none\"'),
('fields.5e38f338-d0a4-4fa3-bfd5-9b494d31a442.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.f0b26b60-9cd6-415f-928f-c63614f6e7b8.contentColumnType', '\"string\"'),
('fields.f0b26b60-9cd6-415f-928f-c63614f6e7b8.fieldGroup', '\"acc7548f-3022-405c-b653-2c8760879e60\"'),
('fields.f0b26b60-9cd6-415f-928f-c63614f6e7b8.handle', '\"contentBuilder\"'),
('fields.f0b26b60-9cd6-415f-928f-c63614f6e7b8.instructions', '\"\"'),
('fields.f0b26b60-9cd6-415f-928f-c63614f6e7b8.name', '\"Content Builder\"'),
('fields.f0b26b60-9cd6-415f-928f-c63614f6e7b8.searchable', 'false'),
('fields.f0b26b60-9cd6-415f-928f-c63614f6e7b8.settings.contentTable', '\"{{%matrixcontent_contentbuilder}}\"'),
('fields.f0b26b60-9cd6-415f-928f-c63614f6e7b8.settings.maxBlocks', '\"\"'),
('fields.f0b26b60-9cd6-415f-928f-c63614f6e7b8.settings.minBlocks', '\"\"'),
('fields.f0b26b60-9cd6-415f-928f-c63614f6e7b8.settings.propagationMethod', '\"all\"'),
('fields.f0b26b60-9cd6-415f-928f-c63614f6e7b8.translationKeyFormat', 'null'),
('fields.f0b26b60-9cd6-415f-928f-c63614f6e7b8.translationMethod', '\"site\"'),
('fields.f0b26b60-9cd6-415f-928f-c63614f6e7b8.type', '\"craft\\\\fields\\\\Matrix\"'),
('graphql.publicToken.enabled', 'true'),
('graphql.publicToken.expiryDate', 'null'),
('graphql.schemas.7b77a83a-8dfb-4601-90b1-30c99c1c9505.isPublic', 'true'),
('graphql.schemas.7b77a83a-8dfb-4601-90b1-30c99c1c9505.name', '\"Public Schema\"'),
('imageTransforms.8212eef9-36c8-47b5-ab4e-9892531926ac.format', 'null'),
('imageTransforms.8212eef9-36c8-47b5-ab4e-9892531926ac.handle', '\"profilePhoto\"'),
('imageTransforms.8212eef9-36c8-47b5-ab4e-9892531926ac.height', '250'),
('imageTransforms.8212eef9-36c8-47b5-ab4e-9892531926ac.interlace', '\"none\"'),
('imageTransforms.8212eef9-36c8-47b5-ab4e-9892531926ac.mode', '\"crop\"'),
('imageTransforms.8212eef9-36c8-47b5-ab4e-9892531926ac.name', '\"Profile Photo\"'),
('imageTransforms.8212eef9-36c8-47b5-ab4e-9892531926ac.position', '\"center-center\"'),
('imageTransforms.8212eef9-36c8-47b5-ab4e-9892531926ac.quality', '30'),
('imageTransforms.8212eef9-36c8-47b5-ab4e-9892531926ac.width', '250'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.field', '\"4e579fce-80fb-40df-a0ab-5ade3e8ecb88\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.0.fieldUid', '\"e5179a24-865e-4325-8f64-38c941595a2f\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.0.required', 'false'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.1.fieldUid', '\"9585679e-2fe1-4b57-b619-d1beeefdb9ad\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.1.instructions', 'null'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.1.label', 'null'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.1.required', 'true'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.1.tip', 'null'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.1.warning', 'null'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.1.width', '100'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.2.fieldUid', '\"e9ec26d4-6d05-4acf-90d3-9fa165204624\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.2.instructions', 'null'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.2.label', 'null'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.2.required', 'false'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.2.tip', 'null'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.2.warning', 'null'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.elements.2.width', '100'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fieldLayouts.851107bf-8bb1-4128-afca-978e7d879427.tabs.0.sortOrder', '1'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.contentColumnType', '\"text\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.fieldGroup', 'null'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.handle', '\"text\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.instructions', '\"\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.name', '\"Text\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.searchable', 'false'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.availableTransforms', '\"*\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.availableVolumes', '\"*\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.cleanupHtml', 'true'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.columnType', '\"text\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.configSelectionMode', '\"choose\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.defaultTransform', '\"\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.manualConfig', '\"\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.purifierConfig', '\"\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.purifyHtml', '\"1\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.redactorConfig', '\"\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.removeEmptyTags', '\"1\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.removeInlineStyles', '\"1\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.removeNbsp', '\"1\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.showHtmlButtonForNonAdmins', '\"\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.showUnpermittedFiles', 'false'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.showUnpermittedVolumes', 'false'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.translationKeyFormat', 'null'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.translationMethod', '\"none\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.9585679e-2fe1-4b57-b619-d1beeefdb9ad.type', '\"craft\\\\redactor\\\\Field\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.contentColumnType', '\"text\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.fieldGroup', 'null'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.handle', '\"headline\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.instructions', '\"\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.name', '\"Headline\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.searchable', 'false'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.settings.byteLimit', 'null'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.settings.charLimit', 'null'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.settings.code', '\"\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.settings.columnType', 'null'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.settings.initialRows', '\"4\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.settings.multiline', '\"\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.settings.placeholder', 'null'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.translationKeyFormat', 'null'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.translationMethod', '\"none\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e5179a24-865e-4325-8f64-38c941595a2f.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.contentColumnType', '\"string\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.fieldGroup', 'null'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.handle', '\"image\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.instructions', '\"\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.name', '\"Image\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.searchable', 'false'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.allowedKinds.0', '\"image\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.allowSelfRelations', 'false'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.allowUploads', 'true'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.defaultUploadLocationSource', '\"volume:c9040c8c-87a7-43ef-9eaf-595dc38c1eed\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.defaultUploadLocationSubpath', '\"\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.limit', '\"1\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.localizeRelations', 'false'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.previewMode', '\"full\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.restrictFiles', '\"1\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.selectionLabel', '\"Add an image\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.showSiteMenu', 'false'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.showUnpermittedFiles', 'false'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.showUnpermittedVolumes', 'false'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.singleUploadLocationSource', '\"volume:c9040c8c-87a7-43ef-9eaf-595dc38c1eed\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.singleUploadLocationSubpath', '\"\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.source', 'null'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.sources', '\"*\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.targetSiteId', 'null'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.useSingleFolder', 'false'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.validateRelatedElements', 'false'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.settings.viewMode', '\"large\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.translationKeyFormat', 'null'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.translationMethod', '\"site\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.fields.e9ec26d4-6d05-4acf-90d3-9fa165204624.type', '\"craft\\\\fields\\\\Assets\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.handle', '\"block\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.name', '\"block\"'),
('matrixBlockTypes.3983b886-d522-4401-9459-daa1e6d61cdf.sortOrder', '1'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.field', '\"f0b26b60-9cd6-415f-928f-c63614f6e7b8\"'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fieldLayouts.afd7c9ae-6b20-443f-a1f6-c6fd326a7053.tabs.0.elements.0.fieldUid', '\"7f794890-d66c-494d-84fc-e51a0683885c\"'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fieldLayouts.afd7c9ae-6b20-443f-a1f6-c6fd326a7053.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fieldLayouts.afd7c9ae-6b20-443f-a1f6-c6fd326a7053.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fieldLayouts.afd7c9ae-6b20-443f-a1f6-c6fd326a7053.tabs.0.elements.0.required', 'true'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fieldLayouts.afd7c9ae-6b20-443f-a1f6-c6fd326a7053.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fieldLayouts.afd7c9ae-6b20-443f-a1f6-c6fd326a7053.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fieldLayouts.afd7c9ae-6b20-443f-a1f6-c6fd326a7053.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fieldLayouts.afd7c9ae-6b20-443f-a1f6-c6fd326a7053.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fieldLayouts.afd7c9ae-6b20-443f-a1f6-c6fd326a7053.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fieldLayouts.afd7c9ae-6b20-443f-a1f6-c6fd326a7053.tabs.0.sortOrder', '1'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.contentColumnType', '\"text\"'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.fieldGroup', 'null'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.handle', '\"text\"'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.instructions', '\"\"'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.name', '\"Text\"'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.searchable', 'false'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.availableTransforms', '\"*\"'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.availableVolumes', '\"*\"'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.cleanupHtml', 'true'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.columnType', '\"text\"'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.configSelectionMode', '\"choose\"'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.defaultTransform', '\"\"'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.manualConfig', '\"\"'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.purifierConfig', '\"\"'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.purifyHtml', '\"1\"'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.redactorConfig', '\"\"'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.removeEmptyTags', '\"1\"'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.removeInlineStyles', '\"1\"'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.removeNbsp', '\"1\"'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.showHtmlButtonForNonAdmins', '\"\"'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.showUnpermittedFiles', 'false'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.showUnpermittedVolumes', 'false'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.translationKeyFormat', 'null'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.translationMethod', '\"none\"'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.fields.7f794890-d66c-494d-84fc-e51a0683885c.type', '\"craft\\\\redactor\\\\Field\"'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.handle', '\"richtext\"'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.name', '\"Richtext\"'),
('matrixBlockTypes.692eb48c-e6ca-4a84-805e-1ef02e4d88f2.sortOrder', '1'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.field', '\"f0b26b60-9cd6-415f-928f-c63614f6e7b8\"'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fieldLayouts.07d75d4d-e229-457b-870d-914abaa59bc6.tabs.0.elements.0.fieldUid', '\"709d71e0-6fd6-41c8-b407-527b866465d0\"'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fieldLayouts.07d75d4d-e229-457b-870d-914abaa59bc6.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fieldLayouts.07d75d4d-e229-457b-870d-914abaa59bc6.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fieldLayouts.07d75d4d-e229-457b-870d-914abaa59bc6.tabs.0.elements.0.required', 'true'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fieldLayouts.07d75d4d-e229-457b-870d-914abaa59bc6.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fieldLayouts.07d75d4d-e229-457b-870d-914abaa59bc6.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fieldLayouts.07d75d4d-e229-457b-870d-914abaa59bc6.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fieldLayouts.07d75d4d-e229-457b-870d-914abaa59bc6.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fieldLayouts.07d75d4d-e229-457b-870d-914abaa59bc6.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fieldLayouts.07d75d4d-e229-457b-870d-914abaa59bc6.tabs.0.sortOrder', '1'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.contentColumnType', '\"string\"'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.fieldGroup', 'null'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.handle', '\"article\"'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.instructions', '\"\"'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.name', '\"Article\"'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.searchable', 'false'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.settings.allowSelfRelations', 'false'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.settings.limit', '\"1\"'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.settings.localizeRelations', 'false'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.settings.selectionLabel', '\"\"'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.settings.showSiteMenu', 'true'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.settings.source', 'null'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.settings.sources', '\"*\"'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.settings.targetSiteId', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.settings.validateRelatedElements', 'false'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.settings.viewMode', 'null'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.translationKeyFormat', 'null'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.translationMethod', '\"site\"'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.fields.709d71e0-6fd6-41c8-b407-527b866465d0.type', '\"craft\\\\fields\\\\Entries\"'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.handle', '\"highlightedArticle\"'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.name', '\"Highlighted Article\"'),
('matrixBlockTypes.7346608a-fffe-49fd-bbe6-efa57785bdf0.sortOrder', '2'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.field', '\"f0b26b60-9cd6-415f-928f-c63614f6e7b8\"'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fieldLayouts.ba2c1099-179f-4309-b345-f6f3776a2388.tabs.0.elements.0.fieldUid', '\"a2aab963-b865-46cb-989b-eb68564777e1\"'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fieldLayouts.ba2c1099-179f-4309-b345-f6f3776a2388.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fieldLayouts.ba2c1099-179f-4309-b345-f6f3776a2388.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fieldLayouts.ba2c1099-179f-4309-b345-f6f3776a2388.tabs.0.elements.0.required', 'true'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fieldLayouts.ba2c1099-179f-4309-b345-f6f3776a2388.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fieldLayouts.ba2c1099-179f-4309-b345-f6f3776a2388.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fieldLayouts.ba2c1099-179f-4309-b345-f6f3776a2388.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fieldLayouts.ba2c1099-179f-4309-b345-f6f3776a2388.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fieldLayouts.ba2c1099-179f-4309-b345-f6f3776a2388.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fieldLayouts.ba2c1099-179f-4309-b345-f6f3776a2388.tabs.0.sortOrder', '1'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.contentColumnType', '\"text\"'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.fieldGroup', 'null'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.handle', '\"embed\"'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.instructions', '\"\"'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.name', '\"Embed\"'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.searchable', 'false'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.settings.byteLimit', 'null'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.settings.charLimit', 'null'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.settings.code', '\"\"'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.settings.columnType', 'null'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.settings.initialRows', '\"4\"'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.settings.multiline', '\"1\"'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.settings.placeholder', 'null'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.translationKeyFormat', 'null'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.translationMethod', '\"none\"'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.fields.a2aab963-b865-46cb-989b-eb68564777e1.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.handle', '\"videoEmbed\"'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.name', '\"Video Embed\"'),
('matrixBlockTypes.dfdd5d42-ea50-4a2a-ba15-b24a3f773356.sortOrder', '3'),
('plugins.expanded-singles.edition', '\"standard\"'),
('plugins.expanded-singles.enabled', 'true'),
('plugins.expanded-singles.schemaVersion', '\"1.0.0\"'),
('plugins.expanded-singles.settings.expandSingles', '\"1\"'),
('plugins.expanded-singles.settings.redirectToEntry', '\"1\"'),
('plugins.logs.edition', '\"standard\"'),
('plugins.logs.enabled', 'true'),
('plugins.logs.schemaVersion', '\"3.0.0\"'),
('plugins.mix.edition', '\"standard\"'),
('plugins.mix.enabled', 'true'),
('plugins.mix.schemaVersion', '\"1.0.0\"'),
('plugins.redactor.edition', '\"standard\"'),
('plugins.redactor.enabled', 'true'),
('plugins.redactor.schemaVersion', '\"2.3.0\"'),
('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.enableVersioning', 'true'),
('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.handle', '\"example\"'),
('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.name', '\"Example\"'),
('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.previewTargets.0.__assoc__.0.0', '\"label\"'),
('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.previewTargets.0.__assoc__.0.1', '\"Primary entry page\"'),
('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.previewTargets.0.__assoc__.1.0', '\"urlFormat\"'),
('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.previewTargets.0.__assoc__.1.1', '\"{url}\"'),
('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.previewTargets.0.__assoc__.2.0', '\"refresh\"'),
('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.previewTargets.0.__assoc__.2.1', '\"1\"'),
('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.propagationMethod', '\"all\"'),
('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.siteSettings.9eb17f17-fb0c-4688-aaff-a09782aeacea.enabledByDefault', 'true'),
('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.siteSettings.9eb17f17-fb0c-4688-aaff-a09782aeacea.hasUrls', 'true'),
('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.siteSettings.9eb17f17-fb0c-4688-aaff-a09782aeacea.template', '\"example\"'),
('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.siteSettings.9eb17f17-fb0c-4688-aaff-a09782aeacea.uriFormat', '\"example\"'),
('sections.7121f7fe-e16c-4776-bf07-811a25cd8b1e.type', '\"single\"'),
('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.enableVersioning', 'true'),
('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.handle', '\"homepage\"'),
('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.name', '\"Homepage\"'),
('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.previewTargets.0.__assoc__.0.0', '\"label\"'),
('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.previewTargets.0.__assoc__.0.1', '\"Primary entry page\"'),
('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.previewTargets.0.__assoc__.1.0', '\"urlFormat\"'),
('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.previewTargets.0.__assoc__.1.1', '\"{url}\"'),
('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.previewTargets.0.__assoc__.2.0', '\"refresh\"'),
('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.previewTargets.0.__assoc__.2.1', '\"1\"'),
('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.propagationMethod', '\"all\"'),
('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.siteSettings.9eb17f17-fb0c-4688-aaff-a09782aeacea.enabledByDefault', 'true'),
('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.siteSettings.9eb17f17-fb0c-4688-aaff-a09782aeacea.hasUrls', 'true'),
('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.siteSettings.9eb17f17-fb0c-4688-aaff-a09782aeacea.template', '\"index\"'),
('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.siteSettings.9eb17f17-fb0c-4688-aaff-a09782aeacea.uriFormat', '\"__home__\"'),
('sections.a887e226-ad5b-4ffc-b54e-6bd80d70fd34.type', '\"single\"'),
('sections.cc7b6c50-7a1c-4169-a014-ed8976aa0170.enableVersioning', 'true'),
('sections.cc7b6c50-7a1c-4169-a014-ed8976aa0170.handle', '\"employees\"'),
('sections.cc7b6c50-7a1c-4169-a014-ed8976aa0170.name', '\"Employees\"'),
('sections.cc7b6c50-7a1c-4169-a014-ed8976aa0170.previewTargets.0.__assoc__.0.0', '\"label\"'),
('sections.cc7b6c50-7a1c-4169-a014-ed8976aa0170.previewTargets.0.__assoc__.0.1', '\"Primary entry page\"'),
('sections.cc7b6c50-7a1c-4169-a014-ed8976aa0170.previewTargets.0.__assoc__.1.0', '\"urlFormat\"'),
('sections.cc7b6c50-7a1c-4169-a014-ed8976aa0170.previewTargets.0.__assoc__.1.1', '\"{url}\"'),
('sections.cc7b6c50-7a1c-4169-a014-ed8976aa0170.previewTargets.0.__assoc__.2.0', '\"refresh\"'),
('sections.cc7b6c50-7a1c-4169-a014-ed8976aa0170.previewTargets.0.__assoc__.2.1', '\"1\"'),
('sections.cc7b6c50-7a1c-4169-a014-ed8976aa0170.propagationMethod', '\"all\"'),
('sections.cc7b6c50-7a1c-4169-a014-ed8976aa0170.siteSettings.9eb17f17-fb0c-4688-aaff-a09782aeacea.enabledByDefault', 'true'),
('sections.cc7b6c50-7a1c-4169-a014-ed8976aa0170.siteSettings.9eb17f17-fb0c-4688-aaff-a09782aeacea.hasUrls', 'true'),
('sections.cc7b6c50-7a1c-4169-a014-ed8976aa0170.siteSettings.9eb17f17-fb0c-4688-aaff-a09782aeacea.template', '\"employees/_entry\"'),
('sections.cc7b6c50-7a1c-4169-a014-ed8976aa0170.siteSettings.9eb17f17-fb0c-4688-aaff-a09782aeacea.uriFormat', '\"employees/{slug}\"'),
('sections.cc7b6c50-7a1c-4169-a014-ed8976aa0170.structure.maxLevels', '1'),
('sections.cc7b6c50-7a1c-4169-a014-ed8976aa0170.structure.uid', '\"a0039619-751d-467b-8074-2a4685f84b86\"'),
('sections.cc7b6c50-7a1c-4169-a014-ed8976aa0170.type', '\"structure\"'),
('siteGroups.8a59f26c-cff0-43ce-8f8c-389421035f87.name', '\"Craft Code Test\"'),
('sites.9eb17f17-fb0c-4688-aaff-a09782aeacea.baseUrl', '\"$PRIMARY_SITE_URL\"'),
('sites.9eb17f17-fb0c-4688-aaff-a09782aeacea.enabled', 'true'),
('sites.9eb17f17-fb0c-4688-aaff-a09782aeacea.handle', '\"default\"'),
('sites.9eb17f17-fb0c-4688-aaff-a09782aeacea.hasUrls', 'true'),
('sites.9eb17f17-fb0c-4688-aaff-a09782aeacea.language', '\"en-US\"'),
('sites.9eb17f17-fb0c-4688-aaff-a09782aeacea.name', '\"Craft Code Test\"'),
('sites.9eb17f17-fb0c-4688-aaff-a09782aeacea.primary', 'true'),
('sites.9eb17f17-fb0c-4688-aaff-a09782aeacea.siteGroup', '\"8a59f26c-cff0-43ce-8f8c-389421035f87\"'),
('sites.9eb17f17-fb0c-4688-aaff-a09782aeacea.sortOrder', '1'),
('system.edition', '\"pro\"'),
('system.live', 'true'),
('system.name', '\"Craft Code Test\"'),
('system.retryDuration', 'null'),
('system.schemaVersion', '\"3.6.8\"'),
('system.timeZone', '\"America/Los_Angeles\"'),
('users.allowPublicRegistration', 'false'),
('users.defaultGroup', 'null'),
('users.photoSubpath', 'null'),
('users.photoVolumeUid', 'null'),
('users.requireEmailVerification', 'true'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.autocapitalize', 'true'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.autocomplete', 'false'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.autocorrect', 'true'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.class', 'null'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.disabled', 'false'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.id', 'null'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.instructions', 'null'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.label', 'null'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.max', 'null'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.min', 'null'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.name', 'null'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.orientation', 'null'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.placeholder', 'null'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.readonly', 'false'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.requirable', 'false'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.size', 'null'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.step', 'null'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.tip', 'null'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.title', 'null'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\AssetTitleField\"'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.warning', 'null'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.elements.0.width', '100'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.name', '\"Content\"'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.fieldLayouts.61b9cee1-55ca-414f-b770-10bb39eedb6a.tabs.0.sortOrder', '1'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.handle', '\"images\"'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.hasUrls', 'true'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.name', '\"Images\"'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.settings.path', '\"@webroot/writable/images\"'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.sortOrder', '1'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.titleTranslationKeyFormat', 'null'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.titleTranslationMethod', 'null'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.type', '\"craft\\\\volumes\\\\Local\"'),
('volumes.c9040c8c-87a7-43ef-9eaf-595dc38c1eed.url', '\"@web/writable/images\"');

-- --------------------------------------------------------

--
-- Table structure for table `projectconfignames`
--

CREATE TABLE `projectconfignames` (
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `projectconfignames`
--

INSERT INTO `projectconfignames` (`uid`, `name`) VALUES
('03c99c5f-1d80-4e41-a0b5-07c33e763e93', 'Example'),
('0c93d9fd-ac15-4c59-988d-36af9f3f6527', 'Profile Image'),
('1bbbd3b6-8526-433d-b7a1-74b5bd094c7c', 'First Name'),
('3983b886-d522-4401-9459-daa1e6d61cdf', 'block'),
('4e579fce-80fb-40df-a0ab-5ade3e8ecb88', 'Image with Text'),
('5e38f338-d0a4-4fa3-bfd5-9b494d31a442', 'Last Name'),
('692eb48c-e6ca-4a84-805e-1ef02e4d88f2', 'Richtext'),
('709d71e0-6fd6-41c8-b407-527b866465d0', 'Article'),
('7121f7fe-e16c-4776-bf07-811a25cd8b1e', 'Example'),
('7346608a-fffe-49fd-bbe6-efa57785bdf0', 'Highlighted Article'),
('7b77a83a-8dfb-4601-90b1-30c99c1c9505', 'Public Schema'),
('7f794890-d66c-494d-84fc-e51a0683885c', 'Text'),
('8212eef9-36c8-47b5-ab4e-9892531926ac', 'Profile Photo'),
('8a59f26c-cff0-43ce-8f8c-389421035f87', 'Craft Code Test'),
('9585679e-2fe1-4b57-b619-d1beeefdb9ad', 'Text'),
('9eb17f17-fb0c-4688-aaff-a09782aeacea', 'Craft Code Test'),
('a2aab963-b865-46cb-989b-eb68564777e1', 'Embed'),
('a887e226-ad5b-4ffc-b54e-6bd80d70fd34', 'Homepage'),
('acc7548f-3022-405c-b653-2c8760879e60', 'Common'),
('ae5bd065-3d9c-4e8e-9ac4-35a80decc537', 'NewEmployees'),
('bbb54962-2280-467a-a9f8-15522dd5e7b2', 'Homepage'),
('c9040c8c-87a7-43ef-9eaf-595dc38c1eed', 'Images'),
('cc7b6c50-7a1c-4169-a014-ed8976aa0170', 'Employees'),
('dfdd5d42-ea50-4a2a-ba15-b24a3f773356', 'Video Embed'),
('e5179a24-865e-4325-8f64-38c941595a2f', 'Headline'),
('e9ec26d4-6d05-4acf-90d3-9fa165204624', 'Image'),
('f0b26b60-9cd6-415f-928f-c63614f6e7b8', 'Content Builder');

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `id` int NOT NULL,
  `channel` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int UNSIGNED NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text CHARACTER SET utf8 COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `relations`
--

CREATE TABLE `relations` (
  `id` int NOT NULL,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `relations`
--

INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 3, 7, NULL, 6, 1, '2021-06-28 21:15:22', '2021-06-28 21:15:22', 'a0e37cb3-4891-4d62-b42a-607d1d9ffa2b'),
(2, 3, 9, NULL, 6, 1, '2021-06-28 21:15:22', '2021-06-28 21:15:22', 'c05c01e4-7dae-483b-9077-fa7337e47850'),
(3, 3, 11, NULL, 6, 1, '2021-06-28 21:19:44', '2021-06-28 21:19:44', '7a9d05ac-8df6-4036-8685-0c478c9f61e0'),
(4, 3, 13, NULL, 12, 1, '2021-06-28 21:24:46', '2021-06-28 21:24:46', '96aa8440-8c41-4dd5-80c6-8d9a95e59dd4'),
(5, 3, 15, NULL, 6, 1, '2021-06-28 21:24:46', '2021-06-28 21:24:46', '5f04ec22-700f-460f-b818-f709f754e013'),
(6, 3, 16, NULL, 12, 1, '2021-06-28 21:24:46', '2021-06-28 21:24:46', '0e03c5bd-1ea7-4c8f-8d2b-11aed881409a'),
(7, 3, 18, NULL, 6, 1, '2021-06-28 21:26:59', '2021-06-28 21:26:59', '94ed475a-c0c7-42ce-bb78-900ba9f2e7c6'),
(8, 3, 19, NULL, 12, 1, '2021-06-28 21:26:59', '2021-06-28 21:26:59', 'efd116a7-a6e4-482e-a1d7-e131c697b71c'),
(9, 7, 25, NULL, 3, 1, '2021-06-29 14:54:13', '2021-06-29 14:54:13', '45cd9eac-1807-4600-b35e-56854d3c09f6'),
(10, 7, 29, NULL, 3, 1, '2021-06-29 14:54:13', '2021-06-29 14:54:13', '272c9089-acd3-4244-bf78-79f15c1e3e62'),
(11, 7, 33, NULL, 3, 1, '2021-06-29 14:59:33', '2021-06-29 14:59:33', 'ab2059fc-18db-4130-a913-5cd74df527c5'),
(12, 3, 36, NULL, 6, 1, '2021-07-09 17:41:08', '2021-07-09 17:41:08', '2680a994-5c18-4679-94b4-79e4892b6160'),
(13, 3, 37, NULL, 12, 1, '2021-07-09 17:41:08', '2021-07-09 17:41:08', 'd7ed01e4-5516-4e48-9d73-1ba5af6a8ef5'),
(14, 3, 40, NULL, 6, 1, '2021-07-09 17:41:38', '2021-07-09 17:41:38', '31b31a96-e575-482e-a9a6-26c6f9dac8c9'),
(15, 3, 41, NULL, 12, 1, '2021-07-09 17:41:38', '2021-07-09 17:41:38', '4c00378b-9b5e-4cce-b134-e6c975f60ed3'),
(16, 11, 43, NULL, 6, 1, '2021-07-09 18:01:26', '2021-07-09 18:01:26', '43037b3a-a284-4691-85ed-331fc352415a'),
(17, 11, 46, NULL, 6, 1, '2021-07-09 18:01:26', '2021-07-09 18:01:26', '1f97d892-e3e0-4c17-9aeb-d7cd091d8461'),
(18, 11, 47, NULL, 6, 1, '2021-07-09 18:05:53', '2021-07-09 18:05:53', 'ee334c46-e30f-424f-afa2-8a6f39b19e48'),
(19, 11, 49, NULL, 6, 1, '2021-07-09 18:07:05', '2021-07-09 18:07:05', '3be7ec7a-f06c-4e27-9a55-6471bb4c185a'),
(21, 11, 51, NULL, 6, 1, '2021-07-09 18:07:52', '2021-07-09 18:07:52', '9df0a07c-c067-4afb-b5ac-acee58dffb2d'),
(22, 11, 52, NULL, 6, 1, '2021-07-09 18:07:52', '2021-07-09 18:07:52', 'acff6b68-328a-41cd-8340-7ca59eb2984e'),
(23, 11, 53, NULL, 6, 1, '2021-07-09 18:07:59', '2021-07-09 18:07:59', 'b87bbf4a-b770-4460-8a39-8ebca045d412'),
(25, 11, 55, NULL, 12, 1, '2021-07-09 18:09:50', '2021-07-09 18:09:50', '7d04edab-933b-4760-9699-17e3f395cf5a'),
(26, 11, 56, NULL, 12, 1, '2021-07-09 18:09:50', '2021-07-09 18:09:50', '1fa7c51c-71a6-4333-adb4-273136e54efa'),
(27, 11, 57, NULL, 12, 1, '2021-07-09 18:09:55', '2021-07-09 18:09:55', '96e1361e-c96b-4558-ba8d-fc5c7e81b0a5'),
(29, 11, 59, NULL, 6, 1, '2021-07-09 18:17:16', '2021-07-09 18:17:16', '8bd4521a-3ad3-49b3-b39b-4cd791d1d70f'),
(30, 11, 60, NULL, 6, 1, '2021-07-09 18:17:16', '2021-07-09 18:17:16', 'a8840f73-4177-446b-ada8-1e30bcf50909'),
(31, 11, 61, NULL, 6, 1, '2021-07-09 18:17:20', '2021-07-09 18:17:20', '94aa0c01-d1fe-4218-acd9-1696ced97856'),
(33, 11, 63, NULL, 6, 1, '2021-07-09 18:18:01', '2021-07-09 18:18:01', '5cad5e00-7e52-4fcf-af3d-a324012bd0ae'),
(34, 11, 64, NULL, 6, 1, '2021-07-09 18:18:01', '2021-07-09 18:18:01', 'bd07547f-2ca4-401c-b89f-2ceebc8abbf8'),
(35, 11, 65, NULL, 6, 1, '2021-07-09 18:18:04', '2021-07-09 18:18:04', '14123087-2bbe-4b24-8e4a-220fbdc8a088'),
(37, 11, 67, NULL, 6, 1, '2021-07-09 18:18:23', '2021-07-09 18:18:23', '7aff6448-1022-4776-8d8f-6fe0043d131a'),
(38, 11, 68, NULL, 6, 1, '2021-07-09 18:18:23', '2021-07-09 18:18:23', '338ec3e1-0678-443e-aa22-9a89e52cf9ce'),
(39, 11, 69, NULL, 6, 1, '2021-07-09 18:18:28', '2021-07-09 18:18:28', '86de6c53-f0c9-41af-a534-3c3227f8a099'),
(40, 11, 70, NULL, 6, 1, '2021-07-09 18:18:59', '2021-07-09 18:18:59', 'a9ab27ca-1604-4a86-92db-a8d88c4fb7d2'),
(41, 11, 71, NULL, 6, 1, '2021-07-09 18:19:29', '2021-07-09 18:19:29', '0c3f4ef8-e4ac-47b5-b21b-46731a6fb1da'),
(42, 3, 73, NULL, 6, 1, '2021-07-09 18:20:24', '2021-07-09 18:20:24', '21fd1f30-8ab8-455b-b859-e6205c2f053b'),
(43, 3, 74, NULL, 12, 1, '2021-07-09 18:20:24', '2021-07-09 18:20:24', 'd3979b61-e6db-4b3b-8617-762175e02619'),
(44, 11, 75, NULL, 6, 1, '2021-07-09 18:47:27', '2021-07-09 18:47:27', 'a0d3349c-094e-4abe-ad47-d916e1030baf'),
(45, 11, 76, NULL, 6, 1, '2021-07-09 18:48:02', '2021-07-09 18:48:02', '13955a62-713e-484e-bdc6-c21d95d1e77e'),
(46, 11, 77, NULL, 6, 1, '2021-07-09 18:48:12', '2021-07-09 18:48:12', 'fc7cffa1-b377-442b-ae90-234df30cf342'),
(47, 7, 78, NULL, 67, 1, '2021-07-09 18:57:19', '2021-07-09 18:57:19', 'f561b6d2-46c9-4b53-962f-b0e1e9b07063'),
(48, 7, 82, NULL, 3, 1, '2021-07-09 18:57:19', '2021-07-09 18:57:19', '41684dc3-6d82-4a6c-a29a-433497fc14b1'),
(49, 7, 83, NULL, 67, 1, '2021-07-09 18:57:19', '2021-07-09 18:57:19', '797d0c4e-2070-4952-bca9-7a3ef315d5ce'),
(50, 7, 87, NULL, 3, 1, '2021-07-09 19:04:56', '2021-07-09 19:04:56', '6144f0ac-7dd7-4f32-95fb-23cbd6fe3d77'),
(51, 7, 91, NULL, 3, 1, '2021-07-09 19:05:55', '2021-07-09 19:05:55', 'c6e78c5b-ec22-44e8-b627-ee7e1633fea7'),
(52, 7, 92, NULL, 3, 1, '2021-07-09 19:10:56', '2021-07-09 19:10:56', '002fe64a-7760-4670-9f69-d2d75e3c4346'),
(53, 11, 93, NULL, 6, 1, '2021-07-09 19:10:56', '2021-07-09 19:10:56', '5d71fd72-7314-4f10-8b11-3370b0017ce3'),
(54, 7, 94, NULL, 3, 1, '2021-07-09 19:10:56', '2021-07-09 19:10:56', '9aedef80-123d-4d82-8a20-edf697df888e'),
(55, 3, 96, NULL, 6, 1, '2021-07-09 19:23:17', '2021-07-09 19:23:17', '393291b1-009b-4545-9bdd-961781c94a88'),
(56, 3, 97, NULL, 12, 1, '2021-07-09 19:23:17', '2021-07-09 19:23:17', '1607a9cb-f516-4b1d-9ba9-f979c51ded97'),
(57, 7, 98, NULL, 20, 1, '2021-07-09 19:23:47', '2021-07-09 19:23:47', '2ea91cb0-a771-4b98-9d1e-a4e56b8f8849'),
(58, 3, 100, NULL, 6, 1, '2021-07-09 19:23:47', '2021-07-09 19:23:47', 'b42fac08-7051-4cc9-a406-c3f657aec017'),
(59, 3, 101, NULL, 12, 1, '2021-07-09 19:23:47', '2021-07-09 19:23:47', '15acaccc-de71-47e8-9e79-4348923f3c74'),
(60, 7, 102, NULL, 20, 1, '2021-07-09 19:23:47', '2021-07-09 19:23:47', 'f88e6a20-1d2a-474b-9640-c9be487924b5'),
(61, 3, 104, NULL, 6, 1, '2021-07-09 22:42:07', '2021-07-09 22:42:07', 'afba7539-96c3-4de6-9c3f-1004633707c0'),
(62, 3, 105, NULL, 12, 1, '2021-07-09 22:42:07', '2021-07-09 22:42:07', 'cc5437d6-ed83-454f-8fe8-0353362f8998'),
(63, 3, 107, NULL, 6, 1, '2021-07-09 22:42:42', '2021-07-09 22:42:42', 'b6ecc6dd-7e0e-4dc4-bc3e-728ec7b7833d'),
(64, 3, 108, NULL, 12, 1, '2021-07-09 22:42:42', '2021-07-09 22:42:42', '39866c6a-2cb6-454c-9b05-8095a95adaf2');

-- --------------------------------------------------------

--
-- Table structure for table `resourcepaths`
--

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `resourcepaths`
--

INSERT INTO `resourcepaths` (`hash`, `path`) VALUES
('120c1352', '@lib/element-resize-detector'),
('13cc5358', '@app/web/assets/login/dist'),
('17f24626', '@app/web/assets/cp/dist'),
('18e3b8fa', '@craft/web/assets/dashboard/dist'),
('1ca07665', '@craft/redactor/assets/redactor-plugins/dist/fullscreen'),
('20a14fd4', '@app/web/assets/generalsettings/dist'),
('220767ab', '@app/web/assets/installer/dist'),
('242811b6', '@craft/redactor/assets/field/dist'),
('2688a050', '@lib/axios'),
('2c134fda', '@lib/velocity'),
('2c375fa7', '@app/web/assets/findreplace/dist'),
('2c5fe019', '@lib/jquery-ui'),
('3034e032', '@lib/jquery.payment'),
('340523c5', '@app/web/assets/updateswidget/dist'),
('3946009c', '@app/web/assets/fieldsettings/dist'),
('3a978f04', '@app/web/assets/craftsupport/dist'),
('3b6c30d1', '@app/web/assets/utilities/dist'),
('3d9cb8a7', '@bower/jquery/dist'),
('3e378f65', '@app/web/assets/systemmessages/dist'),
('415cb458', '@app/web/assets/routes/dist'),
('422f3f6b', '@app/web/assets/pluginstore/dist'),
('445a55cd', '@app/web/assets/recententries/dist'),
('45863743', '@lib/vue'),
('52438be', '@app/web/assets/assetindexes/dist'),
('54f62b2c', '@lib/iframe-resizer-cw'),
('5741c00', '@nystudio107/seomatic/assetbundles/seomatic/dist'),
('59177240', '@app/web/assets/cp/dist'),
('59593f9b', '@commerceLib'),
('5aee2323', '@verbb/expandedsingles/resources/dist'),
('5ce92734', '@lib/element-resize-detector'),
('5eb5a375', '@craft/web/assets/craftsupport/dist'),
('5f2359f7', '@app/web/assets/matrixsettings/dist'),
('5f5b3b8', '@commerceLib/deepmerge'),
('61a09e31', '@craft/web/assets/feed/dist'),
('62bad47f', '@lib/jquery-ui'),
('62f67bbc', '@lib/velocity'),
('686d9436', '@lib/axios'),
('6ab5459c', '@app/web/assets/updater/dist'),
('6b6d2c9e', '@app/web/assets/userpermissions/dist'),
('6ee90d98', '@app/web/assets/feed/dist'),
('73798cc1', '@bower/jquery/dist'),
('7472bb62', '@app/web/assets/craftsupport/dist'),
('758904b7', '@app/web/assets/utilities/dist'),
('7c0465ce', '@craft/web/assets/plugins/dist'),
('7ed1d454', '@lib/jquery.payment'),
('835834fb', '@craft/commerce/web/assets/statwidgets/dist'),
('85e7f37d', '@app/web/assets/updates/dist'),
('876fe9d4', '@app/web/assets/clearcaches/dist'),
('8a3acc3a', '@app/web/assets/admintable/dist'),
('8c2eb3f7', '@lib/garnishjs'),
('908356f1', '@craft/web/assets/admintable/dist'),
('96344579', '@app/web/assets/plugins/dist'),
('9924a1a8', '@verbb/base/resources/dist'),
('996867c9', '@lib/fabric'),
('9a1a3c0c', '@app/web/assets/dashboard/dist'),
('9c0b8e41', '@app/web/assets/editsection/dist'),
('9e3e813d', '@lib/timepicker'),
('a1c1d948', '@lib/xregexp'),
('a57dbac9', '@lib/iframe-resizer'),
('a9de85de', '@lib/fileupload'),
('abad9dc2', '@lib/selectize'),
('abf61ab', '@app/web/assets/recententries/dist'),
('acb30b33', '@app/web/assets/edittransform/dist'),
('b1243a2f', '@craft/redactor/assets/redactor/dist'),
('b1368420', '@lib/picturefill'),
('b20e3ade', '@lib/datepicker-i18n'),
('b371298c', '@craft/redactor/assets/redactor-plugins/dist/video'),
('b630325', '@lib/vue'),
('b692b8e2', '@lib/jquery-touch-events'),
('bc71b8b9', '@app/web/assets/edituser/dist'),
('bf93a471', '@lib/d3'),
('c2cb8791', '@lib/garnishjs'),
('c4dff85c', '@app/web/assets/admintable/dist'),
('c7a31712', '@craft/web/assets/recententries/dist'),
('cb02c71b', '@app/web/assets/updates/dist'),
('cca0b0d', '@app/web/assets/pluginstore/dist'),
('d3982624', '@app/web/assets/fields/dist'),
('d4ff086a', '@app/web/assets/dashboard/dist'),
('d5631a6f', '@app/web/assets/deprecationerrors/dist'),
('d78d53af', '@lib/fabric'),
('d8d1711f', '@app/web/assets/plugins/dist'),
('da546276', '@app/web/assets/queuemanager/dist'),
('db2fbeac', '@craft/commerce/web/assets/orderswidget/dist'),
('e23261e4', '@app/web/assets/sites/dist'),
('e3678ced', '@craft/web/assets/cp/dist'),
('e548a9a4', '@lib/selectize'),
('e73bb1b8', '@lib/fileupload'),
('ea1cbc90', '@craft/web/assets/pluginstore/dist'),
('eb988eaf', '@lib/iframe-resizer'),
('ebb78749', '@app/web/assets/dbbackup/dist'),
('ef24ed2e', '@lib/xregexp'),
('f0360127', '@craft/web/assets/generalsettings/dist'),
('f1769017', '@lib/d3'),
('f459ca6a', '@app/web/assets/editentry/dist'),
('f8778c84', '@lib/jquery-touch-events'),
('f919557c', '@craft/web/assets/updateswidget/dist'),
('faf1860d', '@lib/prismjs'),
('fb7be85e', '@app/web/assets/matrix/dist'),
('ffd3b046', '@lib/picturefill');

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` int NOT NULL,
  `sourceId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `revisions`
--

INSERT INTO `revisions` (`id`, `sourceId`, `creatorId`, `num`, `notes`) VALUES
(1, 3, 2, 1, NULL),
(2, 3, 2, 2, NULL),
(3, 3, 2, 3, ''),
(4, 3, 2, 4, NULL),
(5, 3, 2, 5, ''),
(6, 3, 2, 6, NULL),
(7, 20, 2, 1, NULL),
(8, 20, 2, 2, NULL),
(9, 20, 2, 3, ''),
(10, 20, 2, 4, ''),
(11, 3, 2, 7, ''),
(12, 3, 2, 8, ''),
(13, 43, 2, 1, NULL),
(14, 43, 2, 2, NULL),
(15, 43, 2, 3, ''),
(16, 43, 2, 4, ''),
(17, 43, 2, 5, ''),
(18, 51, 2, 1, ''),
(19, 51, 2, 2, ''),
(20, 55, 2, 1, ''),
(21, 55, 2, 2, ''),
(22, 59, 2, 1, ''),
(23, 59, 2, 2, ''),
(24, 63, 2, 1, ''),
(25, 63, 2, 2, ''),
(26, 67, 2, 1, ''),
(27, 67, 2, 2, ''),
(28, 67, 2, 3, ''),
(29, 63, 2, 3, ''),
(30, 3, 2, 9, ''),
(31, 59, 2, 3, ''),
(32, 63, 2, 4, ''),
(33, 67, 2, 4, ''),
(34, 20, 2, 5, ''),
(35, 20, 2, 6, ''),
(36, 20, 2, 7, NULL),
(37, 59, 2, 4, ''),
(38, 3, 2, 10, NULL),
(39, 3, 2, 11, ''),
(40, 3, 2, 12, NULL),
(41, 3, 2, 13, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `searchindex`
--

CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `searchindex`
--

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'slug', 0, 1, ''),
(2, 'lastname', 0, 1, ''),
(2, 'username', 0, 1, ' admin '),
(3, 'slug', 0, 1, ' homepage '),
(6, 'filename', 0, 1, ' test png '),
(6, 'extension', 0, 1, ' png '),
(6, 'kind', 0, 1, ' image '),
(6, 'slug', 0, 1, ''),
(6, 'title', 0, 1, ' test '),
(7, 'slug', 0, 1, ''),
(9, 'slug', 0, 1, ''),
(2, 'fullname', 0, 1, ''),
(2, 'firstname', 0, 1, ''),
(11, 'slug', 0, 1, ''),
(12, 'filename', 0, 1, ' headphones jpg '),
(12, 'extension', 0, 1, ' jpg '),
(12, 'kind', 0, 1, ' image '),
(12, 'slug', 0, 1, ''),
(12, 'title', 0, 1, ' headphones '),
(13, 'slug', 0, 1, ''),
(15, 'slug', 0, 1, ''),
(16, 'slug', 0, 1, ''),
(18, 'slug', 0, 1, ''),
(19, 'slug', 0, 1, ''),
(20, 'title', 0, 1, ' example '),
(31, 'slug', 0, 1, ''),
(20, 'slug', 0, 1, ' example '),
(23, 'slug', 0, 1, ''),
(24, 'slug', 0, 1, ''),
(25, 'slug', 0, 1, ''),
(27, 'slug', 0, 1, ''),
(28, 'slug', 0, 1, ''),
(29, 'slug', 0, 1, ''),
(32, 'slug', 0, 1, ''),
(33, 'slug', 0, 1, ''),
(2, 'email', 0, 1, ' admin codetest test '),
(2, 'slug', 0, 1, ''),
(34, 'slug', 0, 1, ''),
(36, 'slug', 0, 1, ''),
(37, 'slug', 0, 1, ''),
(38, 'slug', 0, 1, ''),
(3, 'title', 0, 1, ' homepage '),
(40, 'slug', 0, 1, ''),
(41, 'slug', 0, 1, ''),
(42, 'slug', 0, 1, ''),
(43, 'title', 0, 1, ' employees '),
(43, 'slug', 0, 1, ' employees '),
(48, 'slug', 0, 1, ' temp khrfjugbjxzohoqprghojrayufwyctfgxvxn '),
(48, 'title', 0, 1, ' employees '),
(51, 'title', 0, 1, ' title 2 '),
(51, 'slug', 0, 1, ' title 2 '),
(55, 'title', 0, 1, ' employee2 '),
(59, 'slug', 0, 1, ' jhon '),
(55, 'slug', 0, 1, ' employee2 '),
(59, 'title', 0, 1, ' jhon '),
(63, 'title', 0, 1, ' jane '),
(63, 'slug', 0, 1, ' jane '),
(78, 'slug', 0, 1, ''),
(67, 'slug', 0, 1, ' frank '),
(67, 'title', 0, 1, ' frank '),
(73, 'slug', 0, 1, ''),
(74, 'slug', 0, 1, ''),
(80, 'slug', 0, 1, ''),
(81, 'slug', 0, 1, ''),
(82, 'slug', 0, 1, ''),
(83, 'slug', 0, 1, ''),
(85, 'slug', 0, 1, ''),
(86, 'slug', 0, 1, ''),
(87, 'slug', 0, 1, ''),
(89, 'slug', 0, 1, ''),
(90, 'slug', 0, 1, ''),
(91, 'slug', 0, 1, ''),
(92, 'slug', 0, 1, ''),
(94, 'slug', 0, 1, ''),
(96, 'slug', 0, 1, ''),
(97, 'slug', 0, 1, ''),
(98, 'slug', 0, 1, ''),
(100, 'slug', 0, 1, ''),
(101, 'slug', 0, 1, ''),
(102, 'slug', 0, 1, ''),
(104, 'slug', 0, 1, ''),
(105, 'slug', 0, 1, ''),
(107, 'slug', 0, 1, ''),
(108, 'slug', 0, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int NOT NULL,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `previewTargets` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagationMethod`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, 'Homepage', 'homepage', 'single', 1, 'all', '[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]', '2021-06-28 19:36:56', '2021-06-28 19:36:56', NULL, 'a887e226-ad5b-4ffc-b54e-6bd80d70fd34'),
(2, NULL, 'Employees', 'employees', 'channel', 1, 'all', '[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]', '2021-06-28 19:51:28', '2021-06-28 19:51:39', '2021-06-28 19:51:53', '534d7b90-54ea-4eec-ba48-cb7e05f42916'),
(3, NULL, 'Example', 'example', 'single', 1, 'all', '[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]', '2021-06-29 14:52:41', '2021-06-29 14:52:41', NULL, '7121f7fe-e16c-4776-bf07-811a25cd8b1e'),
(4, 1, 'Employees', 'employees', 'structure', 1, 'all', '[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]', '2021-07-09 17:48:51', '2021-07-09 17:58:59', '2021-07-09 18:12:56', '435129ad-9395-41c8-9fea-c395eaeab4ec'),
(5, 2, 'Employees', 'employees', 'structure', 1, 'all', '[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]', '2021-07-09 18:13:33', '2021-07-09 18:13:33', NULL, 'cc7b6c50-7a1c-4169-a014-ed8976aa0170');

-- --------------------------------------------------------

--
-- Table structure for table `sections_sites`
--

CREATE TABLE `sections_sites` (
  `id` int NOT NULL,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `template` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sections_sites`
--

INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, '__home__', 'index', 1, '2021-06-28 19:36:56', '2021-06-28 21:19:44', '97ea547c-cc2a-4539-bdff-503f678e6967'),
(2, 2, 1, 1, 'employees/{slug}', 'employees/_entry', 1, '2021-06-28 19:51:28', '2021-06-28 19:51:28', '34d87f63-dc48-4587-a5e1-e6bb2ce48842'),
(3, 3, 1, 1, 'example', 'example', 1, '2021-06-29 14:52:41', '2021-06-29 14:52:41', '7c32e7b3-3fd3-4a8b-999c-d2f2f3896915'),
(4, 4, 1, 1, 'employees', 'employees/_entry', 1, '2021-07-09 17:48:51', '2021-07-09 17:48:51', '8d669a87-beec-48b2-9839-25d5718e6937'),
(5, 5, 1, 1, 'employees/{slug}', 'employees/_entry', 1, '2021-07-09 18:13:33', '2021-07-09 18:13:33', '0ce3b6c0-eace-4b33-a85f-5e8bffaebf70');

-- --------------------------------------------------------

--
-- Table structure for table `sequences`
--

CREATE TABLE `sequences` (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `next` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `token` char(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(3, 2, 'NZXQSWYuT7SIFnidV4NsZTPmcKj-GRCAwB582eapna-5mKOTotB10PgzPAZOyPpfqoPIU5xPSP3ogEbFERcp735iqAb7rrohn2VK', '2021-07-09 17:24:49', '2021-07-10 16:56:27', '40ec3df5-8f33-43ce-8cb6-5bb0026797f2'),
(4, 2, 'j26sYHoZoyQ9ASrYFUbvsq3lDonniTA5xpqlyuY2d8J26aDENQTghDys9cgicHDY17GGImjS_BeaBKT8q4wTnqgt17xNEtcd9eLN', '2021-07-09 21:53:48', '2021-07-09 22:53:17', '0fcc13a4-d25f-4975-9590-d10555aea122'),
(5, 2, '6RXMp45Wz_TEXANiaftR70plEehxyJRzhoCzDVFuZBJrkRHBbAwS-E2bKg29fJUnFDmpQ5OjlDad4t-t6Ff8ybg1YeuY1gnEFyCm', '2021-07-10 16:56:27', '2021-07-10 18:14:08', '4d5a4b2d-4b65-4757-a265-16689738109b');

-- --------------------------------------------------------

--
-- Table structure for table `shunnedmessages`
--

CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sitegroups`
--

CREATE TABLE `sitegroups` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sitegroups`
--

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Craft Code Test', '2021-06-28 19:28:37', '2021-06-28 19:34:59', NULL, '8a59f26c-cff0-43ce-8f8c-389421035f87');

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 1, 'Craft Code Test', 'default', 'en-US', 1, '$PRIMARY_SITE_URL', 1, '2021-06-28 19:28:37', '2021-06-28 19:28:48', NULL, '9eb17f17-fb0c-4688-aaff-a09782aeacea');

-- --------------------------------------------------------

--
-- Table structure for table `structureelements`
--

CREATE TABLE `structureelements` (
  `id` int NOT NULL,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int UNSIGNED DEFAULT NULL,
  `lft` int UNSIGNED NOT NULL,
  `rgt` int UNSIGNED NOT NULL,
  `level` smallint UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `structureelements`
--

INSERT INTO `structureelements` (`id`, `structureId`, `elementId`, `root`, `lft`, `rgt`, `level`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, NULL, 1, 1, 16, 0, '2021-07-09 17:58:59', '2021-07-09 18:12:56', '94f7d891-d85c-4658-8ce5-698a72d2444a'),
(3, 1, 46, 1, 6, 7, 1, '2021-07-09 18:01:26', '2021-07-09 18:12:37', 'ff316c1a-d457-460b-9209-2b5dfd0c0bb3'),
(4, 1, 47, 1, 4, 5, 1, '2021-07-09 18:05:53', '2021-07-09 18:12:37', '2032f8f3-7f7f-4fcc-8a5e-0b60ea676c82'),
(6, 1, 49, 1, 2, 3, 1, '2021-07-09 18:07:05', '2021-07-09 18:12:37', 'e2148df5-720a-4120-a514-850964f1d202'),
(9, 1, 52, 1, 10, 11, 1, '2021-07-09 18:07:52', '2021-07-09 18:12:56', 'e94a044f-9fa1-4a40-a225-d25b37b0c629'),
(10, 1, 53, 1, 8, 9, 1, '2021-07-09 18:07:59', '2021-07-09 18:12:56', '6c4ce146-900e-4525-8da9-0b940b1c536f'),
(13, 1, 56, 1, 14, 15, 1, '2021-07-09 18:09:50', '2021-07-09 18:12:56', '768bf2fe-e5ef-4865-9b60-def2d38a53d9'),
(14, 1, 57, 1, 12, 13, 1, '2021-07-09 18:09:55', '2021-07-09 18:12:56', '034b1fdd-d867-45b9-b565-1fda82efcfa8'),
(15, 2, NULL, 15, 1, 32, 0, '2021-07-09 18:16:16', '2021-07-10 17:27:32', '6e69703a-42f1-48b3-900b-87f0ea79bbf1'),
(17, 2, 59, 15, 2, 3, 1, '2021-07-09 18:17:16', '2021-07-09 18:17:16', '738dfa9f-67b4-4b2e-8e80-6b6513e4709c'),
(18, 2, 60, 15, 10, 11, 1, '2021-07-09 18:17:16', '2021-07-09 19:10:56', '1b307c9a-621e-4084-96e9-9a61cafc4f64'),
(19, 2, 61, 15, 8, 9, 1, '2021-07-09 18:17:20', '2021-07-09 19:10:56', '3c2afecb-ffa1-4929-b1f8-45e9f4adfb66'),
(21, 2, 63, 15, 12, 13, 1, '2021-07-09 18:18:01', '2021-07-09 19:10:56', 'b131eb94-f2ba-4593-b12c-336553242d82'),
(22, 2, 64, 15, 20, 21, 1, '2021-07-09 18:18:01', '2021-07-09 19:10:56', 'd3c81a33-4d92-4a0e-bcb1-ffafc7e93c96'),
(23, 2, 65, 15, 18, 19, 1, '2021-07-09 18:18:04', '2021-07-09 19:10:56', '90faaf66-2af8-49e7-9bfa-e8a7853cbf3d'),
(25, 2, 67, 15, 22, 23, 1, '2021-07-09 18:18:23', '2021-07-09 19:10:56', '1ba7005f-cca2-41e8-8979-d1c0b1c09fbd'),
(26, 2, 68, 15, 30, 31, 1, '2021-07-09 18:18:23', '2021-07-09 19:10:56', 'd329de43-bd92-4351-b613-8ec48ada6d70'),
(27, 2, 69, 15, 28, 29, 1, '2021-07-09 18:18:28', '2021-07-09 19:10:56', '2cfd4599-3be3-4670-a5a3-1ea38499397b'),
(28, 2, 70, 15, 26, 27, 1, '2021-07-09 18:18:59', '2021-07-09 19:10:56', 'ecc35dcf-44cd-4700-bfd6-41e7c7730e9f'),
(29, 2, 71, 15, 16, 17, 1, '2021-07-09 18:19:29', '2021-07-09 19:10:56', 'fef4b8ee-4535-48fa-8923-3d683a5eae1f'),
(30, 2, 75, 15, 6, 7, 1, '2021-07-09 18:47:27', '2021-07-09 19:10:56', '5c5a0933-d897-4295-a4f2-734280c6ce35'),
(31, 2, 76, 15, 14, 15, 1, '2021-07-09 18:48:02', '2021-07-09 19:10:56', '89fffe2f-0bfe-4aae-889d-f55fc24c1c14'),
(32, 2, 77, 15, 24, 25, 1, '2021-07-09 18:48:12', '2021-07-09 19:10:56', 'e61842d0-b1cb-4782-bc2a-42787b7e3b42'),
(33, 2, 93, 15, 4, 5, 1, '2021-07-09 19:10:56', '2021-07-09 19:10:56', '589f1e75-2150-4cf3-992d-47c2a3d05e1c');

-- --------------------------------------------------------

--
-- Table structure for table `structures`
--

CREATE TABLE `structures` (
  `id` int NOT NULL,
  `maxLevels` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `structures`
--

INSERT INTO `structures` (`id`, `maxLevels`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, '2021-07-09 17:58:59', '2021-07-09 17:58:59', '2021-07-09 18:12:56', '32477110-aa89-4148-8634-d6736c19f7b7'),
(2, 1, '2021-07-09 18:13:33', '2021-07-09 18:13:33', NULL, 'a0039619-751d-467b-8074-2a4685f84b86');

-- --------------------------------------------------------

--
-- Table structure for table `supertableblocks`
--

CREATE TABLE `supertableblocks` (
  `id` int NOT NULL,
  `ownerId` int NOT NULL,
  `fieldId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supertableblocktypes`
--

CREATE TABLE `supertableblocktypes` (
  `id` int NOT NULL,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `systemmessages`
--

CREATE TABLE `systemmessages` (
  `id` int NOT NULL,
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `subject` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taggroups`
--

CREATE TABLE `taggroups` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templatecacheelements`
--

CREATE TABLE `templatecacheelements` (
  `id` int NOT NULL,
  `cacheId` int NOT NULL,
  `elementId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templatecachequeries`
--

CREATE TABLE `templatecachequeries` (
  `id` int NOT NULL,
  `cacheId` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templatecaches`
--

CREATE TABLE `templatecaches` (
  `id` int NOT NULL,
  `siteId` int NOT NULL,
  `cacheKey` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int NOT NULL,
  `token` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `route` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `usageLimit` tinyint UNSIGNED DEFAULT NULL,
  `usageCount` tinyint UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usergroups`
--

CREATE TABLE `usergroups` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usergroups_users`
--

CREATE TABLE `usergroups_users` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions`
--

CREATE TABLE `userpermissions` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_usergroups`
--

CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_users`
--

CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpreferences`
--

CREATE TABLE `userpreferences` (
  `userId` int NOT NULL,
  `preferences` text CHARACTER SET utf8 COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `userpreferences`
--

INSERT INTO `userpreferences` (`userId`, `preferences`) VALUES
(2, '{\"language\":\"en-US\",\"locale\":null,\"weekStartDay\":\"1\",\"useShapes\":false,\"underlineLinks\":false,\"showFieldHandles\":true,\"enableDebugToolbarForSite\":false,\"enableDebugToolbarForCp\":false,\"showExceptionView\":false,\"profileTemplates\":false}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `photoId` int DEFAULT NULL,
  `firstName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 'admin', NULL, '', '', 'admin@codetest.test', '$2y$13$ypfYEFHXwUEcd4ep2d2HvO9RofZIAIQB4a50VOeIwLxPSMs.751li', 1, 0, 0, 0, '2021-07-10 16:56:27', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2021-06-29 17:03:42', '2021-06-28 19:28:48', '2021-07-10 16:56:28', 'f77d58c7-c071-4d52-b6e6-6416bbd1b4ad');

-- --------------------------------------------------------

--
-- Table structure for table `volumefolders`
--

CREATE TABLE `volumefolders` (
  `id` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `volumefolders`
--

INSERT INTO `volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 1, 'Images', '', '2021-06-28 19:49:22', '2021-06-28 19:49:22', '14fdc821-c942-4786-9072-120974d833a8'),
(2, NULL, NULL, 'Temporary source', NULL, '2021-06-28 21:14:38', '2021-06-28 21:14:38', '62dad683-0da4-4f4f-8e34-2d14b9ae5a30'),
(3, 2, NULL, 'user_2', 'user_2/', '2021-06-28 21:14:38', '2021-06-28 21:14:38', 'a9199ee6-c8a9-4e72-a1a1-a5d2651968e5');

-- --------------------------------------------------------

--
-- Table structure for table `volumes`
--

CREATE TABLE `volumes` (
  `id` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `settings` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `volumes`
--

INSERT INTO `volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `type`, `hasUrls`, `url`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `settings`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 3, 'Images', 'images', 'craft\\volumes\\Local', 1, '@web/writable/images', 'site', NULL, '{\"path\":\"@webroot/writable/images\"}', 1, '2021-06-28 19:49:22', '2021-06-28 21:20:51', NULL, 'c9040c8c-87a7-43ef-9eaf-595dc38c1eed');

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 2, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"siteId\":1,\"section\":\"*\",\"limit\":10}', 1, '2021-06-28 19:28:50', '2021-06-28 19:28:50', 'de5e429f-ccf9-45c5-8954-487c0210f137'),
(2, 2, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2021-06-28 19:28:50', '2021-06-28 19:28:50', 'af5cd48d-7308-405b-8739-d951bacf1951'),
(3, 2, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2021-06-28 19:28:50', '2021-06-28 19:28:50', 'fc23350a-8f31-46fc-a0ff-1002efe3a778'),
(4, 2, 'craft\\widgets\\Feed', 4, NULL, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2021-06-28 19:28:50', '2021-06-28 19:28:50', 'cca52830-62b9-40db-b5f1-9a0b81dfc7f4');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_vpllywraxlxtpptnrlxadkqszgmfserngktl` (`sessionId`,`volumeId`),
  ADD KEY `idx_nlvkvglveztjugcvuqpatyaupaptjitvfxni` (`volumeId`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_vufrvjhsxbvofvzmiowobuequddyspxhremh` (`filename`,`folderId`),
  ADD KEY `idx_anhxdxqrlykeljltzeknalxmphljugzeabbn` (`folderId`),
  ADD KEY `idx_ycnmujydauyeajmwfsibxpzyfpwzmspowbii` (`volumeId`),
  ADD KEY `fk_mowqupzqksuykbwkhvpocdrkqlvnvpikvqfl` (`uploaderId`);

--
-- Indexes for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ifcotnnrqfvedrrojevpxjcbfvfxilyxrsjz` (`volumeId`,`assetId`,`location`);

--
-- Indexes for table `assettransforms`
--
ALTER TABLE `assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ppycrtufjbwzglykqlvcewgacdjnegkcvfoo` (`name`),
  ADD KEY `idx_unttesxomquvrdqhgwlbrqoprwbvkbikvzda` (`handle`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_kcynmisywdvmmiuuofxnbbehidjrpmouxdrg` (`groupId`),
  ADD KEY `fk_jcvprpcyxukmgzoqighlthwzzznzvmzgyfcd` (`parentId`);

--
-- Indexes for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_zqzdplrtlztxhjgbgnhxhuvtnnblwekpmoib` (`name`),
  ADD KEY `idx_kumspivhavhrzedulapjqguuycvjuihqjegt` (`handle`),
  ADD KEY `idx_lalgilokdobxswpwuhfdlokpjayyidddwqbm` (`structureId`),
  ADD KEY `idx_zormzteuazafjcwozbjosqkznprmaieuqcnf` (`fieldLayoutId`),
  ADD KEY `idx_shrowbchrjghrizjyjtsxhmewttjvctpjxup` (`dateDeleted`);

--
-- Indexes for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_sdhzpzomfygfupdezzfrmkyptrtoklglbmrv` (`groupId`,`siteId`),
  ADD KEY `idx_rsjxaoymspwztyjmievhvhxbdiutmtjgpikn` (`siteId`);

--
-- Indexes for table `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  ADD KEY `idx_jnfbfzygtzviwpcrihjlnsuyovjfiyqglgfi` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `fk_jjzywoxwmljyonqlgdtqcydgozkxtmvwhqhj` (`siteId`),
  ADD KEY `fk_gcuyynldsakobungnvvxevbhprkihszvouav` (`userId`);

--
-- Indexes for table `changedfields`
--
ALTER TABLE `changedfields`
  ADD PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  ADD KEY `idx_lypxieknxnxrkflmxpnwewlymrrirbqpcyed` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `fk_dllhpborxsvgufqsykotixbzldvexgtsvebu` (`siteId`),
  ADD KEY `fk_keeguadewniwtxebqpnrgqmmxvlsyqsimtnq` (`fieldId`),
  ADD KEY `fk_hqeeurlbvxmowkgmtabgzsjwkuzvizujcrss` (`userId`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_igwhdouomujfsjkrfxgrjyxcqowkoilvxvhh` (`elementId`,`siteId`),
  ADD KEY `idx_ywrqhdqqxxhaudyqnencwhilrbjhfahkoslt` (`siteId`),
  ADD KEY `idx_wdgurqvgarhzhdvhwtphtquolhorycndfmtq` (`title`);

--
-- Indexes for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ythfbhmafkfqcacikcfpdwudsasjqzoujnyq` (`userId`);

--
-- Indexes for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_czmmqhipvhnvmaxgnbjioynfszsypouydtba` (`key`,`fingerprint`);

--
-- Indexes for table `drafts`
--
ALTER TABLE `drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ixyztiolzzdyhkzflizipavqudkzadstmbsx` (`saved`),
  ADD KEY `fk_nwojsxxfrjqvsmzvkfifeujgzqzuakqocpvh` (`creatorId`),
  ADD KEY `fk_xgthygrcdawmfchxprcwigqvfuacbgpqjtpw` (`sourceId`);

--
-- Indexes for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_olzggkujipzllmalhdcacskenlludltorywh` (`type`);

--
-- Indexes for table `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_azejqzbowzlumtgmqpdypdisekaurlnbdxvd` (`dateDeleted`),
  ADD KEY `idx_qvcqfmsrdtljotlrcpaiwlvdvpgiazctjnio` (`fieldLayoutId`),
  ADD KEY `idx_ftpuegrsngynzbhqjwobaujozxgijcgnpdwq` (`type`),
  ADD KEY `idx_qmebllbxnilyxyvkdwossfbyuufxtxvroylm` (`enabled`),
  ADD KEY `idx_mlwngwucqfhyjutkmilkmlquoidnvxvtizmw` (`archived`,`dateCreated`),
  ADD KEY `idx_iibetuhzzpusvnyphlzcjavsdwfvokjloziv` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  ADD KEY `fk_yqhzvgrufndlrynfrbshudxfqjfrspxsxmgz` (`draftId`),
  ADD KEY `fk_vwynrsccobsgvbwbqbunvmgxklxssbcinqix` (`revisionId`);

--
-- Indexes for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_ouexrjymluthgdjpdgfjxydawlkrqfctublx` (`elementId`,`siteId`),
  ADD KEY `idx_kucpefvrvbaswbfbloiyqikcsjdctgdvsxht` (`siteId`),
  ADD KEY `idx_rarllntyitikuqaqpgnfxdzmeqrgujmwfuxg` (`slug`,`siteId`),
  ADD KEY `idx_mcxigjvuslrbmrvbwlquikfltztuukzooxmb` (`enabled`),
  ADD KEY `idx_iyglnfncczimvhxlivgwhybkisdtibpatcse` (`uri`,`siteId`);

--
-- Indexes for table `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_dznlwddoqvoluxtdydibyrgshtcevxnqinjc` (`postDate`),
  ADD KEY `idx_jvhcrrsmwmysgmpzyrcrfqhwenqnvhtwwfxf` (`expiryDate`),
  ADD KEY `idx_zhqbxfhhfiwckhfgtczzldnzvmhnpwpetzhq` (`authorId`),
  ADD KEY `idx_kfnkffkxfhrhqvykrhgatdtlrhvxfgynobto` (`sectionId`),
  ADD KEY `idx_fwqnahkrjqmejsviinvtltsebjtwfjmpyiyu` (`typeId`),
  ADD KEY `fk_awsoybixwvithkchkfmjcmekfmojxwfcsktx` (`parentId`);

--
-- Indexes for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_xzbzqamnpivyikinpiugledohstcgpzbmsid` (`name`,`sectionId`),
  ADD KEY `idx_wuaegwilycqcnpquvmpqeqrxvepbsywhykmm` (`handle`,`sectionId`),
  ADD KEY `idx_xfwldzkykufpapaiaoimzdrtlvuhvwobnkpf` (`sectionId`),
  ADD KEY `idx_cppytfrhanxmsbrnqxsezxznbugrhjfjoonl` (`fieldLayoutId`),
  ADD KEY `idx_ukzdbvfnptabgzqgedibealwkzortlpbygvm` (`dateDeleted`);

--
-- Indexes for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_otchgzntdpitdqawdofoullwztiwezgmtgov` (`name`),
  ADD KEY `idx_eidvrakwyzsitmkbtuknzegalbekydwviljs` (`dateDeleted`,`name`);

--
-- Indexes for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_kbtyiuscvtgxqxcdxqgzqgdovfyescbolrgl` (`layoutId`,`fieldId`),
  ADD KEY `idx_gjhsjdpsyyllderlmxzwnhmifhnnxqetxvlu` (`sortOrder`),
  ADD KEY `idx_yljvnfjqkfrdybpapazdomukaonyypfygcll` (`tabId`),
  ADD KEY `idx_htuzqtabjmutbudwlyqwajsffvipwxokfloo` (`fieldId`);

--
-- Indexes for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_qaertrvmkqlhopcuqhmifmjeizihgryifgoc` (`dateDeleted`),
  ADD KEY `idx_oupcdnsorlazuusqxrglgtrsbwbtjfbxvqnd` (`type`);

--
-- Indexes for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wriwzjaopwjadrkmjlsdsxxfphysccvydtzd` (`sortOrder`),
  ADD KEY `idx_rcagrjtkisyybjdllgrbhrwybpgjyqgaaqkb` (`layoutId`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wfuolxxcwuzafyvbyofhzknrhmaovkfoyfhv` (`handle`,`context`),
  ADD KEY `idx_dyoohsokotnzuxqrwieshfukwfvxiqeisrak` (`groupId`),
  ADD KEY `idx_ivhprxslledtmqmgknvcehoyekgikupchjjx` (`context`);

--
-- Indexes for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cpdnycgdnikboeindojvbcigtqckkdihsfgl` (`name`),
  ADD KEY `idx_muavrzdimiltgksozfppjqbdjidycxfvtuyy` (`handle`),
  ADD KEY `idx_rgnkoqvxeduoqcqfegmntghioddmnaowchnk` (`fieldLayoutId`);

--
-- Indexes for table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_mbwkhjkeqswaecupvxteuphnxogvktqikrpc` (`accessToken`),
  ADD UNIQUE KEY `idx_ceskpkycznhwgwnxzuhlianprqsvdfdcurmn` (`name`),
  ADD KEY `fk_zesblqtqbmvhgpbohtaflvfyajgjctzoqsxo` (`schemaId`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_kynvdmdiuturjikedqnaybidnfqktixvqpne` (`ownerId`),
  ADD KEY `idx_kkvdfygbccrqmyfriupslyqexgyivppwgwyz` (`fieldId`),
  ADD KEY `idx_icsuukpxdzjqppcszutlszbtzjodgtbqixhi` (`typeId`),
  ADD KEY `idx_kpejfdcniydicwcjcxvmkrgyuoyairbygbaf` (`sortOrder`);

--
-- Indexes for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ubvjxicqfzvrzkckkwqgivbpmozxyiqkroeg` (`name`,`fieldId`),
  ADD KEY `idx_imknpdoyjqhtskxqqwqzhmtpenklcaehzkwf` (`handle`,`fieldId`),
  ADD KEY `idx_novveieiugjowfljtibltinqbzxnanyzdcov` (`fieldId`),
  ADD KEY `idx_qfjlzxnpbnbyrkwbdnorcuftkdslalgikfgh` (`fieldLayoutId`);

--
-- Indexes for table `matrixcontent_contentbuilder`
--
ALTER TABLE `matrixcontent_contentbuilder`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_mruojieqslvadgctlpmfdestfzhqntzmypga` (`elementId`,`siteId`),
  ADD KEY `fk_ljsuujmakxpbkyxzqyuqdyphssbsoqsdmqvs` (`siteId`);

--
-- Indexes for table `matrixcontent_imagewithtext`
--
ALTER TABLE `matrixcontent_imagewithtext`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_fvhmdgtqjvrxsyutazovvvsbtrelnjvoquwn` (`elementId`,`siteId`),
  ADD KEY `fk_jztjtimhdkmectyugmaxhjtdpigfxisbwnlz` (`siteId`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_mpsswllzyzivmzdsyrupnoglietaenyijflr` (`track`,`name`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_wbvlaoabrjbzjlotyjvrfwcczocypliznrjd` (`handle`);

--
-- Indexes for table `projectconfig`
--
ALTER TABLE `projectconfig`
  ADD PRIMARY KEY (`path`);

--
-- Indexes for table `projectconfignames`
--
ALTER TABLE `projectconfignames`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ghtordfoaaxsvypqrvbexflecdfusyezaryx` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `idx_dkhxlwuxiyvjdirysnznokxuhdtifqblzpdn` (`channel`,`fail`,`timeUpdated`,`delay`);

--
-- Indexes for table `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_awigbxkvemkyipfvtiytqrxgkcmweiuoommq` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `idx_xvmgdfbvohjbejrhhtaideuvvpwppxncyfwd` (`sourceId`),
  ADD KEY `idx_wuhfontsjyenfbtfdmsrttslpwzuwgpsucjm` (`targetId`),
  ADD KEY `idx_fxnkfvfhprqtosrifethzjsqphzwndosetqt` (`sourceSiteId`);

--
-- Indexes for table `resourcepaths`
--
ALTER TABLE `resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_vumydypchritvcjhgsyfygsszagiftkbikly` (`sourceId`,`num`),
  ADD KEY `fk_hjvrbqfwlxpmyzgpqrlrjdidhxqiqnmfmolb` (`creatorId`);

--
-- Indexes for table `searchindex`
--
ALTER TABLE `searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `searchindex` ADD FULLTEXT KEY `idx_ksiqoqnikxrbpukdwucitawwbimzpwaxxnep` (`keywords`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uyqknlwyycfnghbxogcvmreabxivewtmbwly` (`handle`),
  ADD KEY `idx_xwcaltixffzxauulzoithgkdtkpdiloahgjl` (`name`),
  ADD KEY `idx_mtskskefoxpxlrcquubngwlgstmyhwjgxbqk` (`structureId`),
  ADD KEY `idx_gywrgcihpsjzblssoiobjuzmxlblcbzbsjlj` (`dateDeleted`);

--
-- Indexes for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_xxjfmekhulpvnbssaiwwjjunrknloqtzrxxg` (`sectionId`,`siteId`),
  ADD KEY `idx_httupfvowhlakwedtcntkkuavmisaizpiqmm` (`siteId`);

--
-- Indexes for table `sequences`
--
ALTER TABLE `sequences`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rolowdsujyqmyncmaqrawvkkjaasexkhpkvr` (`uid`),
  ADD KEY `idx_rtgdgvfuircgialoykkvmuutczktyamfydan` (`token`),
  ADD KEY `idx_uyjjzdkhhugfhyisqzvqvyueutoayprbrgfw` (`dateUpdated`),
  ADD KEY `idx_wmbfziomqgacmeptkqtlapyepxwxhqswivkt` (`userId`);

--
-- Indexes for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_biiwjkxdvqecgjjfjhcuexzskidlifdhkwpl` (`userId`,`message`);

--
-- Indexes for table `sitegroups`
--
ALTER TABLE `sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_hyrzephhczysbnfadusoxuohxghgvtseobtf` (`name`);

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lkzydckpktcmvtbdfotomogsxwvlysjcrvth` (`dateDeleted`),
  ADD KEY `idx_mwnidqfkdjmwhrozvorayfrhipztmjhrasss` (`handle`),
  ADD KEY `idx_bktufjaovzjarvilkhbvucjhdsbgrotpeapa` (`sortOrder`),
  ADD KEY `fk_uncyhjnxqdopirddlxlsbzznfpowyvibfikn` (`groupId`);

--
-- Indexes for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_hpchacudmaoxmmycrnoyjmaelozztadqjzar` (`structureId`,`elementId`),
  ADD KEY `idx_oziwlvbjchsmapualogimeaozyfarhkoulpa` (`root`),
  ADD KEY `idx_ecktcjydqjoupparincxklrpdwzbzzmurvlm` (`lft`),
  ADD KEY `idx_tiygoblwtkdkeizvliydsgvmudbxzjwozldh` (`rgt`),
  ADD KEY `idx_uflyutzomgfknpoosjrvthrayykkdtnroslb` (`level`),
  ADD KEY `idx_shxsaforybkuepybbcfbcakhriajdilnldqm` (`elementId`);

--
-- Indexes for table `structures`
--
ALTER TABLE `structures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_limqvvnnvyaocvliimibcftrjmfdxzbuhies` (`dateDeleted`);

--
-- Indexes for table `supertableblocks`
--
ALTER TABLE `supertableblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ncvrelbnndfwvovhdckqyjuqsvjtwwoeblaj` (`ownerId`),
  ADD KEY `idx_dijknxlpryzfgxdollhxczppnrcdxenhinlx` (`fieldId`),
  ADD KEY `idx_zsjkvordettcxfzscefhheartitznigbqwdk` (`typeId`),
  ADD KEY `idx_ctzzeiqpdbdgifijvzpjtsdtrkeigufuhwrj` (`sortOrder`);

--
-- Indexes for table `supertableblocktypes`
--
ALTER TABLE `supertableblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_qzmoakmclzojpitbjkwlosvvmohxynakityt` (`fieldId`),
  ADD KEY `idx_nahwfmpgviltavfrgmmwbmdhhsjbkusgmsfk` (`fieldLayoutId`);

--
-- Indexes for table `systemmessages`
--
ALTER TABLE `systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_tmpkgnatrebwbkpjzoshxpnhgrmxmaunjlro` (`key`,`language`),
  ADD KEY `idx_fxhbljgrjmssagolepqflshzrkxpznvaxtvl` (`language`);

--
-- Indexes for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_kpflmevutnwqiorrqyopucgmsxhiqfwfadnq` (`name`),
  ADD KEY `idx_mvpdfaidovfujpudufhdffsdjzqdnxrgkyks` (`handle`),
  ADD KEY `idx_bhqbnhqqtogciexdwtojxlcgwsnsbgdmpfzj` (`dateDeleted`),
  ADD KEY `fk_mtetgdzzdodsahgoyisphwadlzjbgkhnndng` (`fieldLayoutId`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lstnukfiltnwhpmbsxnuudhxaqpcdeynwzhw` (`groupId`);

--
-- Indexes for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_mqdznclgggbvegzcqmfrkbveuratgcpcpfgo` (`cacheId`),
  ADD KEY `idx_ruedrjkvfykibrontdglebfxajbunihrekyq` (`elementId`);

--
-- Indexes for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ntwzqytnfyetjstlpviwegjwenenlgqnnhhe` (`cacheId`),
  ADD KEY `idx_hlrnzhbndravqwverytfkipvxiegufxtimnj` (`type`);

--
-- Indexes for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_grpkfhwzxrhpqpobxvkbgwzttyjdhhylyzby` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  ADD KEY `idx_xmblggmmyaoydpcmkdglfwxpfmahgrhouseo` (`cacheKey`,`siteId`,`expiryDate`),
  ADD KEY `idx_gunnjhfymdphhazazmfpvywqmbkwnakzrbmo` (`siteId`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_dbaqmyjgtbbuleqkrtsafwedgrumffmysvcu` (`token`),
  ADD KEY `idx_pvbclbzwgavygaxszxyrllvzmkkzmhnnqwdg` (`expiryDate`);

--
-- Indexes for table `usergroups`
--
ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_whdykhjsjgcbwwpyjyrnhufhzkonfyuijjbi` (`handle`),
  ADD KEY `idx_zzwruvbtpfiosaesmkuieucuscxzpjnewshn` (`name`);

--
-- Indexes for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_tbmbgyxgmxhfszpifhdocqfyrekxezbeadru` (`groupId`,`userId`),
  ADD KEY `idx_rkwnoezpyhgmwjldovbrbbzqwdmphkqsvtix` (`userId`);

--
-- Indexes for table `userpermissions`
--
ALTER TABLE `userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_gqbfihvbuoqengqplymxdlqwfwldbcxdwjeq` (`name`);

--
-- Indexes for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_nkaqidzhyhwbqnqpmeidkfxworcuvtlqjqmz` (`permissionId`,`groupId`),
  ADD KEY `idx_elomieaqpitghzlxaeqxxfchpkpdpwxhxkob` (`groupId`);

--
-- Indexes for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_dlkwdjznpzxnikrhtcbvuwerzgeoyysydfeb` (`permissionId`,`userId`),
  ADD KEY `idx_vxlpjepzhlyadmebnhrjppukejdaplwfgdkw` (`userId`);

--
-- Indexes for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sekfqlezrbpzbtembcdzonkjbtfyjrhwvxak` (`uid`),
  ADD KEY `idx_almkzkyipjqlotcujvqvmyxkvymqzylqwykw` (`verificationCode`),
  ADD KEY `idx_nofovdygmoadzaktirivgcjeibqjatuavmml` (`email`),
  ADD KEY `idx_rgxemgmurryqdyiwbqvewkvqdrdlvkpcdhja` (`username`),
  ADD KEY `fk_ikxafjxuzjqcxwgjtzsifptjoalvvjctptcy` (`photoId`);

--
-- Indexes for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_wzmotbjizcuendbgxnuicalgmgvaethltfde` (`name`,`parentId`,`volumeId`),
  ADD KEY `idx_kfkavqyiirhzsecangbjjxysrtneembhyyvs` (`parentId`),
  ADD KEY `idx_kbccyllhcepknpojgrhsgnsbyfacesximftb` (`volumeId`);

--
-- Indexes for table `volumes`
--
ALTER TABLE `volumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jyvfupwkwoqovwpvrdhdsucmfxtaakhasvun` (`name`),
  ADD KEY `idx_qmdkrcaqtvwrmkmmifjzzkoyhngvtupvffsy` (`handle`),
  ADD KEY `idx_vtfuolrilasrqtaxdzxjmhturtvyrbsqwruu` (`fieldLayoutId`),
  ADD KEY `idx_nrgqithkdwhtfifmygasxxdpqompglreggmi` (`dateDeleted`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aguivgsllcgffqvpygwmtorvilgoarwoptuv` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assettransforms`
--
ALTER TABLE `assettransforms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categorygroups`
--
ALTER TABLE `categorygroups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drafts`
--
ALTER TABLE `drafts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `elements_sites`
--
ALTER TABLE `elements_sites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `entrytypes`
--
ALTER TABLE `entrytypes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `globalsets`
--
ALTER TABLE `globalsets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gqltokens`
--
ALTER TABLE `gqltokens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `matrixcontent_contentbuilder`
--
ALTER TABLE `matrixcontent_contentbuilder`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `matrixcontent_imagewithtext`
--
ALTER TABLE `matrixcontent_imagewithtext`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=367;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=238;

--
-- AUTO_INCREMENT for table `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sections_sites`
--
ALTER TABLE `sections_sites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitegroups`
--
ALTER TABLE `sitegroups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `structureelements`
--
ALTER TABLE `structureelements`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `structures`
--
ALTER TABLE `structures`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `supertableblocktypes`
--
ALTER TABLE `supertableblocktypes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `systemmessages`
--
ALTER TABLE `systemmessages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taggroups`
--
ALTER TABLE `taggroups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecaches`
--
ALTER TABLE `templatecaches`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usergroups`
--
ALTER TABLE `usergroups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions`
--
ALTER TABLE `userpermissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpreferences`
--
ALTER TABLE `userpreferences`
  MODIFY `userId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `volumefolders`
--
ALTER TABLE `volumefolders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `volumes`
--
ALTER TABLE `volumes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD CONSTRAINT `fk_bbyiuoiujpebujvazraojmgqtnuvammmokig` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `fk_fadzeednizqiswnxpacplthunuarnllmbffv` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_mowqupzqksuykbwkhvpocdrkqlvnvpikvqfl` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_priemhhaebcqklbwiryepcuzandznzttdryb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_qaxaldoifwrgnsffyyshillvuilgsnafwpvj` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_bqkqvvkfqltgalthbjvvwfkktkioiucbwymq` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_gpgsixzekcjmpdihdxfpuzliatticvkpdzea` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_jcvprpcyxukmgzoqighlthwzzznzvmzgyfcd` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD CONSTRAINT `fk_kbwsrfmrrssvnioavortwylzpqmmlijnffdu` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_occqnfkgcazipqucxmlmtyniqpqiqboxbyhf` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD CONSTRAINT `fk_siuzxomdkhnmlxvsorgqebyrcmljamnxenul` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tpgunvopcbghdxmqqapfelsscjfthqwgjjid` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD CONSTRAINT `fk_davwvxkqrbfaeccqyhgffexodrqukaujzmho` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_gcuyynldsakobungnvvxevbhprkihszvouav` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_jjzywoxwmljyonqlgdtqcydgozkxtmvwhqhj` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `changedfields`
--
ALTER TABLE `changedfields`
  ADD CONSTRAINT `fk_dllhpborxsvgufqsykotixbzldvexgtsvebu` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_hqeeurlbvxmowkgmtabgzsjwkuzvizujcrss` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_keeguadewniwtxebqpnrgqmmxvlsyqsimtnq` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nllulohoolsjvqrivylfvgabnxowwrnlvtts` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `fk_lbcwdpcterhrwqiuqinylmtpmohfclgbyvwv` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pzxpaydngxuwzybvzpmapxzvevjsfztvmgth` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD CONSTRAINT `fk_ythfbhmafkfqcacikcfpdwudsasjqzoujnyq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drafts`
--
ALTER TABLE `drafts`
  ADD CONSTRAINT `fk_nwojsxxfrjqvsmzvkfifeujgzqzuakqocpvh` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_xgthygrcdawmfchxprcwigqvfuacbgpqjtpw` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements`
--
ALTER TABLE `elements`
  ADD CONSTRAINT `fk_vwynrsccobsgvbwbqbunvmgxklxssbcinqix` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_whczynaqrzskvrlpsihpudwurmotywqdvkqq` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_yqhzvgrufndlrynfrbshudxfqjfrspxsxmgz` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD CONSTRAINT `fk_dadzrlcdpmckpgeclymroqzriflbxlkpjapu` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ptfvkmhnysdehzswbvkireetakpkmsfovcnl` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `fk_avftsxlajsllvbyndjcenvmouzkrngmmitsh` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_awsoybixwvithkchkfmjcmekfmojxwfcsktx` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_opgcvyhkhsskyhzvjqblemecdkodfsdcelht` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sevxgefzkrmexowdziymcnxdiuaqvcibofgd` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xjljcupiunjvzpyqlwpgutdpdzwhbcyihtsz` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD CONSTRAINT `fk_lttsxatucwoafuwwitpjnsgeqzuinfjwjefm` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_rjrwviiviqxwnfxxoegauvpmqwfxsznzmiww` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD CONSTRAINT `fk_azzjeocdevbiuleysdjydsrjvmkjxmspikzc` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ftcnsjgfgxddlkpnyrnuilultmhvkhvvmaiy` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_mkihggfsyrgsupgccwryzehksyhxypxdmbms` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD CONSTRAINT `fk_zkrxdtxnttcxeuqvxnfrkmnfjkbsvqtjaecw` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fields`
--
ALTER TABLE `fields`
  ADD CONSTRAINT `fk_mhhbffjlocxeoxsiuzsrasbxqrfihyybxqmq` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD CONSTRAINT `fk_dhwukqvrfasungrijqrifvhaabtgrgdjyyjt` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_fgzwmvxasshmnjynlylvphapglxjkptmuwpe` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD CONSTRAINT `fk_zesblqtqbmvhgpbohtaflvfyajgjctzoqsxo` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD CONSTRAINT `fk_gsirwpdffrebjeyriuvhdtyligiurjoubdip` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_lmeyunasqnkbnhdyjbhsrboqgujjptoofzof` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ugvjdcbkjlpmxqxuwvkibdqqnosdskvvrvwu` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_yevuuybmieuzavyjwisbvbfdwakiczbotoru` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD CONSTRAINT `fk_ckksvmckclkmjzfnpqjievnmwtqtjmpsmfox` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_iqghprmcejdhvpvkcwamuxtneqgfbpeiggti` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `matrixcontent_contentbuilder`
--
ALTER TABLE `matrixcontent_contentbuilder`
  ADD CONSTRAINT `fk_dfpzqnmewcfzazbmhdlhbqmeoyeowzigkmhe` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ljsuujmakxpbkyxzqyuqdyphssbsoqsdmqvs` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `matrixcontent_imagewithtext`
--
ALTER TABLE `matrixcontent_imagewithtext`
  ADD CONSTRAINT `fk_czunxnzzcmrdtxvitvikzgpaykipyqbsubfv` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_jztjtimhdkmectyugmaxhjtdpigfxisbwnlz` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `fk_cgsrgxcllesuyrlwwhunriylycwtdoolhooy` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ckdmwyfwfhsyhcrcviqjpmadvoeujjybjutf` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ixjovauimpvserynbajhvomqtkwmbgzxrsyh` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_srironzolziqolozptiquiwlrxdonoemktep` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `revisions`
--
ALTER TABLE `revisions`
  ADD CONSTRAINT `fk_hjvrbqfwlxpmyzgpqrlrjdidhxqiqnmfmolb` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_xzkjwnqorelzskpumlvhxwafzdsucdhrfpdz` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `fk_vdiskfcrirykhmpusfxiuxhepikpkwjayyde` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD CONSTRAINT `fk_grjuqoiimdztwiwkrtrcskyqauoguzqkemvl` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_wyfvxkkdrftmqsrzdyhpcwdxacvttafmfumy` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `fk_mcbiswekmxduehshykfygpcfhbaibsgvvmed` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD CONSTRAINT `fk_cdkocxqveyyririrdnghytjszdeaucdnwftf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `fk_uncyhjnxqdopirddlxlsbzznfpowyvibfikn` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD CONSTRAINT `fk_arcurydorjawhqozjiezdpztiiwyybdwaenw` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xvrvlfpqacxztuepyrncohwfqdijrlijlwad` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `supertableblocks`
--
ALTER TABLE `supertableblocks`
  ADD CONSTRAINT `fk_hcnhznxpseqdhtvrxfjdmztdrzdouxvogbxz` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_uzywqzbrapvyuflnmlayfsmgbslwuyllkvij` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xzmigxruhgftpwxchqktrvwbesmefcycydxd` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ywxnzrizktfuysyvmsttxbfxpmpvlnewpiha` FOREIGN KEY (`typeId`) REFERENCES `supertableblocktypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `supertableblocktypes`
--
ALTER TABLE `supertableblocktypes`
  ADD CONSTRAINT `fk_ffgwcmwuipfgesnzkpaxhuerjhhxzqrxggml` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tvdmyvxbtonpqmrbqszfjctxttnorjcfjbbf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD CONSTRAINT `fk_mtetgdzzdodsahgoyisphwadlzjbgkhnndng` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `fk_ilizooptwoxgrarqdvucsenxpegxcpitffte` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_qklqdhdevtroqmkcwhufdsohhgbkshexmese` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD CONSTRAINT `fk_fxlmuflreycixqjtdoxwspqolwedlqrutgmo` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_rslvzejpmehzoamgjppxnoxjfsthyagzijce` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD CONSTRAINT `fk_trllhnvlxfztxnwyclcywjkxovitjdkzbprc` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD CONSTRAINT `fk_vvpzgnqttmuypveuxweynduzlwtnilqwcbcg` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD CONSTRAINT `fk_mwjaxsixxfjgbapaojgxvbjhcrjdkdjgucqo` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_qthvlmdjqlubbnfrblltlnhjfbddicwhkfrt` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD CONSTRAINT `fk_hqkkshswranquoqwzorfgkgecplmlpszgxnt` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ivgildsxqbnblpagfcrqguoyahhojnqegdth` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD CONSTRAINT `fk_ahzqyincsxcaaxdxzlpjsdejqowidtumqpdg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_borvwsjzmgnwxpxsdqsogojsgodeejunohvv` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD CONSTRAINT `fk_dpfqxmcowenoevepmazkdjlgdudgosjdlwjg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_gxhocdewnmssaitcwhtricggfaqeyfyrmbfz` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ikxafjxuzjqcxwgjtzsifptjoalvvjctptcy` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD CONSTRAINT `fk_annzbemlzdzeocngwiyqtquehyiilzpplyii` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_jikslfqmfphoydcjzydtnewissuovgggunyz` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `volumes`
--
ALTER TABLE `volumes`
  ADD CONSTRAINT `fk_evppbjhbgexlcsfsoltqimauvxekimlmxnbl` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `fk_mskklmzcutilvsalohxjwshrnkskvyqwhrvh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
