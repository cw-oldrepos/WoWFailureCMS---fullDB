-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 09, 2012 at 02:52 PM
-- Server version: 5.5.24-log
-- PHP Version: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `website`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `username` varchar(32) NOT NULL DEFAULT '',
  `sha_pass_hash` varchar(40) NOT NULL DEFAULT '',
  `sessionkey` varchar(80) NOT NULL DEFAULT '',
  `v` varchar(64) NOT NULL DEFAULT '',
  `s` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(254) NOT NULL DEFAULT '',
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int(10) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `online` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `mutetime` bigint(20) NOT NULL DEFAULT '0',
  `locale` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `os` varchar(3) NOT NULL DEFAULT '',
  `recruiter` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Account System' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `account_access`
--

CREATE TABLE IF NOT EXISTS `account_access` (
  `id` int(10) unsigned NOT NULL,
  `gmlevel` tinyint(3) unsigned NOT NULL,
  `RealmID` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`,`RealmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `account_banned`
--

CREATE TABLE IF NOT EXISTS `account_banned` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` int(10) unsigned NOT NULL DEFAULT '0',
  `unbandate` int(10) unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ban List';

-- --------------------------------------------------------

--
-- Table structure for table `account_data`
--

CREATE TABLE IF NOT EXISTS `account_data` (
  `accountId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Account Identifier',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`accountId`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `account_instance_times`
--

CREATE TABLE IF NOT EXISTS `account_instance_times` (
  `accountId` int(10) unsigned NOT NULL,
  `instanceId` int(10) unsigned NOT NULL DEFAULT '0',
  `releaseTime` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`accountId`,`instanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `account_tutorial`
--

CREATE TABLE IF NOT EXISTS `account_tutorial` (
  `accountId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Account Identifier',
  `tut0` int(10) unsigned NOT NULL DEFAULT '0',
  `tut1` int(10) unsigned NOT NULL DEFAULT '0',
  `tut2` int(10) unsigned NOT NULL DEFAULT '0',
  `tut3` int(10) unsigned NOT NULL DEFAULT '0',
  `tut4` int(10) unsigned NOT NULL DEFAULT '0',
  `tut5` int(10) unsigned NOT NULL DEFAULT '0',
  `tut6` int(10) unsigned NOT NULL DEFAULT '0',
  `tut7` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`accountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE IF NOT EXISTS `addons` (
  `name` varchar(120) NOT NULL DEFAULT '',
  `crc` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Addons';

-- --------------------------------------------------------

--
-- Table structure for table `arena_team`
--

CREATE TABLE IF NOT EXISTS `arena_team` (
  `arenaTeamId` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(24) NOT NULL,
  `captainGuid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rating` smallint(5) unsigned NOT NULL DEFAULT '0',
  `seasonGames` smallint(5) unsigned NOT NULL DEFAULT '0',
  `seasonWins` smallint(5) unsigned NOT NULL DEFAULT '0',
  `weekGames` smallint(5) unsigned NOT NULL DEFAULT '0',
  `weekWins` smallint(5) unsigned NOT NULL DEFAULT '0',
  `rank` int(10) unsigned NOT NULL DEFAULT '0',
  `backgroundColor` int(10) unsigned NOT NULL DEFAULT '0',
  `emblemStyle` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `emblemColor` int(10) unsigned NOT NULL DEFAULT '0',
  `borderStyle` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `borderColor` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arenaTeamId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `arena_team_member`
--

CREATE TABLE IF NOT EXISTS `arena_team_member` (
  `arenaTeamId` int(10) unsigned NOT NULL DEFAULT '0',
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `weekGames` smallint(5) unsigned NOT NULL DEFAULT '0',
  `weekWins` smallint(5) unsigned NOT NULL DEFAULT '0',
  `seasonGames` smallint(5) unsigned NOT NULL DEFAULT '0',
  `seasonWins` smallint(5) unsigned NOT NULL DEFAULT '0',
  `personalRating` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arenaTeamId`,`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auctionhouse`
--

CREATE TABLE IF NOT EXISTS `auctionhouse` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `auctioneerguid` int(10) unsigned NOT NULL DEFAULT '0',
  `itemguid` int(10) unsigned NOT NULL DEFAULT '0',
  `itemowner` int(10) unsigned NOT NULL DEFAULT '0',
  `buyoutprice` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `buyguid` int(10) unsigned NOT NULL DEFAULT '0',
  `lastbid` int(10) unsigned NOT NULL DEFAULT '0',
  `startbid` int(10) unsigned NOT NULL DEFAULT '0',
  `deposit` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_guid` (`itemguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bugreport`
--

CREATE TABLE IF NOT EXISTS `bugreport` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `type` longtext NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Debug System' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `channels`
--

CREATE TABLE IF NOT EXISTS `channels` (
  `name` varchar(128) NOT NULL,
  `team` int(10) unsigned NOT NULL,
  `announce` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `ownership` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `password` varchar(32) DEFAULT NULL,
  `bannedList` text,
  `lastUsed` int(10) unsigned NOT NULL,
  PRIMARY KEY (`name`,`team`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Channel System';

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE IF NOT EXISTS `characters` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `account` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Account Identifier',
  `name` varchar(12) NOT NULL DEFAULT '',
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `gender` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `xp` int(10) unsigned NOT NULL DEFAULT '0',
  `money` int(10) unsigned NOT NULL DEFAULT '0',
  `playerBytes` int(10) unsigned NOT NULL DEFAULT '0',
  `playerBytes2` int(10) unsigned NOT NULL DEFAULT '0',
  `playerFlags` int(10) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `instance_id` int(10) unsigned NOT NULL DEFAULT '0',
  `instance_mode_mask` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `taximask` text NOT NULL,
  `online` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `cinematic` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `totaltime` int(10) unsigned NOT NULL DEFAULT '0',
  `leveltime` int(10) unsigned NOT NULL DEFAULT '0',
  `logout_time` int(10) unsigned NOT NULL DEFAULT '0',
  `is_logout_resting` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rest_bonus` float NOT NULL DEFAULT '0',
  `resettalents_cost` int(10) unsigned NOT NULL DEFAULT '0',
  `resettalents_time` int(10) unsigned NOT NULL DEFAULT '0',
  `trans_x` float NOT NULL DEFAULT '0',
  `trans_y` float NOT NULL DEFAULT '0',
  `trans_z` float NOT NULL DEFAULT '0',
  `trans_o` float NOT NULL DEFAULT '0',
  `transguid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `extra_flags` smallint(5) unsigned NOT NULL DEFAULT '0',
  `stable_slots` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `at_login` smallint(5) unsigned NOT NULL DEFAULT '0',
  `zone` smallint(5) unsigned NOT NULL DEFAULT '0',
  `death_expire_time` int(10) unsigned NOT NULL DEFAULT '0',
  `taxi_path` text,
  `arenaPoints` int(10) unsigned NOT NULL DEFAULT '0',
  `totalHonorPoints` int(10) unsigned NOT NULL DEFAULT '0',
  `todayHonorPoints` int(10) unsigned NOT NULL DEFAULT '0',
  `yesterdayHonorPoints` int(10) unsigned NOT NULL DEFAULT '0',
  `totalKills` int(10) unsigned NOT NULL DEFAULT '0',
  `todayKills` smallint(5) unsigned NOT NULL DEFAULT '0',
  `yesterdayKills` smallint(5) unsigned NOT NULL DEFAULT '0',
  `chosenTitle` int(10) unsigned NOT NULL DEFAULT '0',
  `knownCurrencies` bigint(20) unsigned NOT NULL DEFAULT '0',
  `watchedFaction` int(10) unsigned NOT NULL DEFAULT '0',
  `drunk` smallint(5) unsigned NOT NULL DEFAULT '0',
  `health` int(10) unsigned NOT NULL DEFAULT '0',
  `power1` int(10) unsigned NOT NULL DEFAULT '0',
  `power2` int(10) unsigned NOT NULL DEFAULT '0',
  `power3` int(10) unsigned NOT NULL DEFAULT '0',
  `power4` int(10) unsigned NOT NULL DEFAULT '0',
  `power5` int(10) unsigned NOT NULL DEFAULT '0',
  `power6` int(10) unsigned NOT NULL DEFAULT '0',
  `power7` int(10) unsigned NOT NULL DEFAULT '0',
  `latency` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `speccount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `activespec` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `exploredZones` longtext,
  `equipmentCache` longtext,
  `ammoId` int(10) unsigned NOT NULL DEFAULT '0',
  `knownTitles` longtext,
  `actionBars` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `grantableLevels` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `deleteInfos_Account` int(10) unsigned DEFAULT NULL,
  `deleteInfos_Name` varchar(12) DEFAULT NULL,
  `deleteDate` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`guid`),
  KEY `idx_account` (`account`),
  KEY `idx_online` (`online`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `character_account_data`
--

CREATE TABLE IF NOT EXISTS `character_account_data` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`guid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_achievement`
--

CREATE TABLE IF NOT EXISTS `character_achievement` (
  `guid` int(10) unsigned NOT NULL,
  `achievement` smallint(5) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`achievement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_achievement_progress`
--

CREATE TABLE IF NOT EXISTS `character_achievement_progress` (
  `guid` int(10) unsigned NOT NULL,
  `criteria` smallint(5) unsigned NOT NULL,
  `counter` int(10) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`criteria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_action`
--

CREATE TABLE IF NOT EXISTS `character_action` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `spec` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `button` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `action` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spec`,`button`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_arena_stats`
--

CREATE TABLE IF NOT EXISTS `character_arena_stats` (
  `guid` int(10) NOT NULL,
  `slot` tinyint(3) NOT NULL,
  `matchMakerRating` smallint(5) NOT NULL,
  PRIMARY KEY (`guid`,`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_aura`
--

CREATE TABLE IF NOT EXISTS `character_aura` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `caster_guid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Full Global Unique Identifier',
  `item_guid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `effect_mask` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `recalculate_mask` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stackcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `amount0` int(11) NOT NULL DEFAULT '0',
  `amount1` int(11) NOT NULL DEFAULT '0',
  `amount2` int(11) NOT NULL DEFAULT '0',
  `base_amount0` int(11) NOT NULL DEFAULT '0',
  `base_amount1` int(11) NOT NULL DEFAULT '0',
  `base_amount2` int(11) NOT NULL DEFAULT '0',
  `maxduration` int(11) NOT NULL DEFAULT '0',
  `remaintime` int(11) NOT NULL DEFAULT '0',
  `remaincharges` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`caster_guid`,`item_guid`,`spell`,`effect_mask`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `character_banned`
--

CREATE TABLE IF NOT EXISTS `character_banned` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `bandate` int(10) unsigned NOT NULL DEFAULT '0',
  `unbandate` int(10) unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`guid`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ban List';

-- --------------------------------------------------------

--
-- Table structure for table `character_battleground_data`
--

CREATE TABLE IF NOT EXISTS `character_battleground_data` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `instanceId` int(10) unsigned NOT NULL COMMENT 'Instance Identifier',
  `team` smallint(5) unsigned NOT NULL,
  `joinX` float NOT NULL DEFAULT '0',
  `joinY` float NOT NULL DEFAULT '0',
  `joinZ` float NOT NULL DEFAULT '0',
  `joinO` float NOT NULL DEFAULT '0',
  `joinMapId` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `taxiStart` int(10) unsigned NOT NULL DEFAULT '0',
  `taxiEnd` int(10) unsigned NOT NULL DEFAULT '0',
  `mountSpell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `character_battleground_random`
--

CREATE TABLE IF NOT EXISTS `character_battleground_random` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_declinedname`
--

CREATE TABLE IF NOT EXISTS `character_declinedname` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `genitive` varchar(15) NOT NULL DEFAULT '',
  `dative` varchar(15) NOT NULL DEFAULT '',
  `accusative` varchar(15) NOT NULL DEFAULT '',
  `instrumental` varchar(15) NOT NULL DEFAULT '',
  `prepositional` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_equipmentsets`
--

CREATE TABLE IF NOT EXISTS `character_equipmentsets` (
  `guid` int(10) NOT NULL DEFAULT '0',
  `setguid` bigint(20) NOT NULL AUTO_INCREMENT,
  `setindex` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(31) NOT NULL,
  `iconname` varchar(100) NOT NULL,
  `item0` int(10) unsigned NOT NULL DEFAULT '0',
  `item1` int(10) unsigned NOT NULL DEFAULT '0',
  `item2` int(10) unsigned NOT NULL DEFAULT '0',
  `item3` int(10) unsigned NOT NULL DEFAULT '0',
  `item4` int(10) unsigned NOT NULL DEFAULT '0',
  `item5` int(10) unsigned NOT NULL DEFAULT '0',
  `item6` int(10) unsigned NOT NULL DEFAULT '0',
  `item7` int(10) unsigned NOT NULL DEFAULT '0',
  `item8` int(10) unsigned NOT NULL DEFAULT '0',
  `item9` int(10) unsigned NOT NULL DEFAULT '0',
  `item10` int(10) unsigned NOT NULL DEFAULT '0',
  `item11` int(10) unsigned NOT NULL DEFAULT '0',
  `item12` int(10) unsigned NOT NULL DEFAULT '0',
  `item13` int(10) unsigned NOT NULL DEFAULT '0',
  `item14` int(10) unsigned NOT NULL DEFAULT '0',
  `item15` int(10) unsigned NOT NULL DEFAULT '0',
  `item16` int(10) unsigned NOT NULL DEFAULT '0',
  `item17` int(10) unsigned NOT NULL DEFAULT '0',
  `item18` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`setguid`),
  UNIQUE KEY `idx_set` (`guid`,`setguid`,`setindex`),
  KEY `Idx_setindex` (`setindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `character_gifts`
--

CREATE TABLE IF NOT EXISTS `character_gifts` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `item_guid` int(10) unsigned NOT NULL DEFAULT '0',
  `entry` int(10) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_guid`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_glyphs`
--

CREATE TABLE IF NOT EXISTS `character_glyphs` (
  `guid` int(10) unsigned NOT NULL,
  `spec` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `glyph1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `glyph2` smallint(5) unsigned DEFAULT '0',
  `glyph3` smallint(5) unsigned DEFAULT '0',
  `glyph4` smallint(5) unsigned DEFAULT '0',
  `glyph5` smallint(5) unsigned DEFAULT '0',
  `glyph6` smallint(5) unsigned DEFAULT '0',
  PRIMARY KEY (`guid`,`spec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_homebind`
--

CREATE TABLE IF NOT EXISTS `character_homebind` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `mapId` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `zoneId` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Zone Identifier',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `character_instance`
--

CREATE TABLE IF NOT EXISTS `character_instance` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `instance` int(10) unsigned NOT NULL DEFAULT '0',
  `permanent` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_inventory`
--

CREATE TABLE IF NOT EXISTS `character_inventory` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `bag` int(10) unsigned NOT NULL DEFAULT '0',
  `slot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `item` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Item Global Unique Identifier',
  PRIMARY KEY (`item`),
  UNIQUE KEY `guid` (`guid`,`bag`,`slot`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `character_pet`
--

CREATE TABLE IF NOT EXISTS `character_pet` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `entry` int(10) unsigned NOT NULL DEFAULT '0',
  `owner` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` int(10) unsigned DEFAULT '0',
  `CreatedBySpell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `PetType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `level` smallint(5) unsigned NOT NULL DEFAULT '1',
  `exp` int(10) unsigned NOT NULL DEFAULT '0',
  `Reactstate` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(21) NOT NULL DEFAULT 'Pet',
  `renamed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `slot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `curhealth` int(10) unsigned NOT NULL DEFAULT '1',
  `curmana` int(10) unsigned NOT NULL DEFAULT '0',
  `curhappiness` int(10) unsigned NOT NULL DEFAULT '0',
  `savetime` int(10) unsigned NOT NULL DEFAULT '0',
  `abdata` text,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `idx_slot` (`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Pet System';

-- --------------------------------------------------------

--
-- Table structure for table `character_pet_declinedname`
--

CREATE TABLE IF NOT EXISTS `character_pet_declinedname` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `owner` int(10) unsigned NOT NULL DEFAULT '0',
  `genitive` varchar(12) NOT NULL DEFAULT '',
  `dative` varchar(12) NOT NULL DEFAULT '',
  `accusative` varchar(12) NOT NULL DEFAULT '',
  `instrumental` varchar(12) NOT NULL DEFAULT '',
  `prepositional` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `owner_key` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_queststatus`
--

CREATE TABLE IF NOT EXISTS `character_queststatus` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `explored` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `timer` int(10) unsigned NOT NULL DEFAULT '0',
  `mobcount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `mobcount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `mobcount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `mobcount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `itemcount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `itemcount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `itemcount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `itemcount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `playercount` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `character_queststatus_daily`
--

CREATE TABLE IF NOT EXISTS `character_queststatus_daily` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`quest`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `character_queststatus_rewarded`
--

CREATE TABLE IF NOT EXISTS `character_queststatus_rewarded` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`guid`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `character_queststatus_seasonal`
--

CREATE TABLE IF NOT EXISTS `character_queststatus_seasonal` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `event` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Event Identifier',
  PRIMARY KEY (`guid`,`quest`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `character_queststatus_weekly`
--

CREATE TABLE IF NOT EXISTS `character_queststatus_weekly` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`guid`,`quest`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `character_reputation`
--

CREATE TABLE IF NOT EXISTS `character_reputation` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `faction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `standing` int(11) NOT NULL DEFAULT '0',
  `flags` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`faction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `character_skills`
--

CREATE TABLE IF NOT EXISTS `character_skills` (
  `guid` int(10) unsigned NOT NULL COMMENT 'Global Unique Identifier',
  `skill` smallint(5) unsigned NOT NULL,
  `value` smallint(5) unsigned NOT NULL,
  `max` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`guid`,`skill`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `character_social`
--

CREATE TABLE IF NOT EXISTS `character_social` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `friend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Friend Global Unique Identifier',
  `flags` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Friend Flags',
  `note` varchar(48) NOT NULL DEFAULT '' COMMENT 'Friend Note',
  PRIMARY KEY (`guid`,`friend`,`flags`),
  KEY `friend` (`friend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `character_spell`
--

CREATE TABLE IF NOT EXISTS `character_spell` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `spell` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `disabled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';

-- --------------------------------------------------------

--
-- Table structure for table `character_spell_cooldown`
--

CREATE TABLE IF NOT EXISTS `character_spell_cooldown` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `spell` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `item` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Item Identifier',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_stats`
--

CREATE TABLE IF NOT EXISTS `character_stats` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `maxhealth` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower1` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower2` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower3` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower4` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower5` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower6` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower7` int(10) unsigned NOT NULL DEFAULT '0',
  `strength` int(10) unsigned NOT NULL DEFAULT '0',
  `agility` int(10) unsigned NOT NULL DEFAULT '0',
  `stamina` int(10) unsigned NOT NULL DEFAULT '0',
  `intellect` int(10) unsigned NOT NULL DEFAULT '0',
  `spirit` int(10) unsigned NOT NULL DEFAULT '0',
  `armor` int(10) unsigned NOT NULL DEFAULT '0',
  `resHoly` int(10) unsigned NOT NULL DEFAULT '0',
  `resFire` int(10) unsigned NOT NULL DEFAULT '0',
  `resNature` int(10) unsigned NOT NULL DEFAULT '0',
  `resFrost` int(10) unsigned NOT NULL DEFAULT '0',
  `resShadow` int(10) unsigned NOT NULL DEFAULT '0',
  `resArcane` int(10) unsigned NOT NULL DEFAULT '0',
  `blockPct` float unsigned NOT NULL DEFAULT '0',
  `dodgePct` float unsigned NOT NULL DEFAULT '0',
  `parryPct` float unsigned NOT NULL DEFAULT '0',
  `critPct` float unsigned NOT NULL DEFAULT '0',
  `rangedCritPct` float unsigned NOT NULL DEFAULT '0',
  `spellCritPct` float unsigned NOT NULL DEFAULT '0',
  `attackPower` int(10) unsigned NOT NULL DEFAULT '0',
  `rangedAttackPower` int(10) unsigned NOT NULL DEFAULT '0',
  `spellPower` int(10) unsigned NOT NULL DEFAULT '0',
  `resilience` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `character_talent`
--

CREATE TABLE IF NOT EXISTS `character_talent` (
  `guid` int(10) unsigned NOT NULL,
  `spell` mediumint(8) unsigned NOT NULL,
  `spec` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`,`spec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `newsid` int(10) NOT NULL,
  `comment` text NOT NULL,
  `accountId` int(10) NOT NULL DEFAULT '1337',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reply` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=64 ;

-- --------------------------------------------------------

--
-- Table structure for table `community_slides`
--

CREATE TABLE IF NOT EXISTS `community_slides` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `desc` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '#',
  `date` date NOT NULL,
  `image` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `community_slides`
--

INSERT INTO `community_slides` (`id`, `desc`, `title`, `url`, `date`, `image`) VALUES
(1, 'Testing WoWFailureCMS at maximum capacity.', 'Testing WoWFailureCMS', '#', '2011-04-20', '4ZONJ2G8H02S1291403588642.jpg'),
(2, 'Find us on WoWFailureCore.org.', 'Where to find us?', '#', '2011-04-20', '3A016YGNDN971281040709386.jpg'),
(3, 'Check The Forum for the latest updates.', 'WoWFailureCMS Forum', '#', '2011-04-20', 'HXW8I6KL6MRK1290045863003.jpg'),
(4, 'test', 'test', '#', '2011-04-20', 'TE943VAV1IVZ1290560963083.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(11) unsigned DEFAULT NULL COMMENT 'Account ID',
  `country` varchar(50) DEFAULT NULL COMMENT 'The Country of Residence',
  `date` date DEFAULT NULL COMMENT 'Date of Birth',
  `year` year(4) DEFAULT NULL COMMENT 'Year of Birth',
  `security_question` char(4) DEFAULT NULL COMMENT 'Security Question from the Registration',
  `answer` varchar(50) DEFAULT NULL COMMENT 'Answer of the Security Question',
  `name` varchar(50) DEFAULT NULL COMMENT 'User''s Name',
  `lastname` varchar(50) DEFAULT NULL COMMENT 'User''s Last Name'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `corpse`
--

CREATE TABLE IF NOT EXISTS `corpse` (
  `corpseGuid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `mapId` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `phaseMask` smallint(5) unsigned NOT NULL DEFAULT '1',
  `displayId` int(10) unsigned NOT NULL DEFAULT '0',
  `itemCache` text NOT NULL,
  `bytes1` int(10) unsigned NOT NULL DEFAULT '0',
  `bytes2` int(10) unsigned NOT NULL DEFAULT '0',
  `guildId` int(10) unsigned NOT NULL DEFAULT '0',
  `flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dynFlags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `corpseType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `instanceId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Instance Identifier',
  PRIMARY KEY (`corpseGuid`),
  KEY `idx_type` (`corpseType`),
  KEY `idx_instance` (`instanceId`),
  KEY `idx_player` (`guid`),
  KEY `idx_time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Death System';

-- --------------------------------------------------------

--
-- Table structure for table `creature_respawn`
--

CREATE TABLE IF NOT EXISTS `creature_respawn` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `respawnTime` int(10) unsigned NOT NULL DEFAULT '0',
  `mapId` smallint(10) unsigned NOT NULL DEFAULT '0',
  `instanceId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Instance Identifier',
  PRIMARY KEY (`guid`,`instanceId`),
  KEY `idx_instance` (`instanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grid Loading System';

-- --------------------------------------------------------

--
-- Table structure for table `forum_blizzposts`
--

CREATE TABLE IF NOT EXISTS `forum_blizzposts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `postid` int(10) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `forum_categ`
--

CREATE TABLE IF NOT EXISTS `forum_categ` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `num` int(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `forum_categ`
--

INSERT INTO `forum_categ` (`id`, `num`, `name`) VALUES
(1, 1, 'WoWFailureCMS');

-- --------------------------------------------------------

--
-- Table structure for table `forum_forums`
--

CREATE TABLE IF NOT EXISTS `forum_forums` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `num` int(10) NOT NULL,
  `categ` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text,
  `locked` smallint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `forum_forums`
--

INSERT INTO `forum_forums` (`id`, `num`, `categ`, `name`, `image`, `description`, `locked`) VALUES
(1, 1, 1, 'Announcement', 'blizzard', 'All important messages/announcements/informations regarding WoWFailureCMS will be posted here.', 1),
(2, 2, 1, 'General Talk', 'general', 'You can talk anything you want here :)', 0),
(3, 3, 1, 'Bugs', 'bugs', 'Post here all bugs you find.', 0),
(4, 4, 1, 'Suggestions', 'suggestions', 'Post here your ideas regarding WoWFailureCMS.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `forum_posts`
--

CREATE TABLE IF NOT EXISTS `forum_posts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` int(2) NOT NULL DEFAULT '0',
  `postid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

-- --------------------------------------------------------

--
-- Table structure for table `forum_replies`
--

CREATE TABLE IF NOT EXISTS `forum_replies` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `threadid` int(10) NOT NULL,
  `content` text NOT NULL,
  `author` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `forumid` int(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `edited` int(1) NOT NULL DEFAULT '0',
  `editedby` int(10) NOT NULL DEFAULT '0',
  `last_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

-- --------------------------------------------------------

--
-- Table structure for table `forum_threads`
--

CREATE TABLE IF NOT EXISTS `forum_threads` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `forumid` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `author` int(10) NOT NULL,
  `replies` int(10) NOT NULL DEFAULT '0',
  `views` int(10) NOT NULL DEFAULT '0',
  `date` timestamp NULL DEFAULT NULL,
  `content` text NOT NULL,
  `locked` tinyint(1) DEFAULT '0',
  `has_blizz` tinyint(1) DEFAULT '0',
  `prefix` varchar(255) NOT NULL DEFAULT 'none',
  `last_date` datetime NOT NULL,
  `edited` int(1) NOT NULL DEFAULT '0',
  `editedby` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `gameobject_respawn`
--

CREATE TABLE IF NOT EXISTS `gameobject_respawn` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `respawnTime` int(10) unsigned NOT NULL DEFAULT '0',
  `mapId` smallint(10) unsigned NOT NULL DEFAULT '0',
  `instanceId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Instance Identifier',
  PRIMARY KEY (`guid`,`instanceId`),
  KEY `idx_instance` (`instanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grid Loading System';

-- --------------------------------------------------------

--
-- Table structure for table `game_event_condition_save`
--

CREATE TABLE IF NOT EXISTS `game_event_condition_save` (
  `eventEntry` tinyint(3) unsigned NOT NULL,
  `condition_id` int(10) unsigned NOT NULL DEFAULT '0',
  `done` float DEFAULT '0',
  PRIMARY KEY (`eventEntry`,`condition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `game_event_save`
--

CREATE TABLE IF NOT EXISTS `game_event_save` (
  `eventEntry` tinyint(3) unsigned NOT NULL,
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `next_start` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gm_subsurveys`
--

CREATE TABLE IF NOT EXISTS `gm_subsurveys` (
  `surveyId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subsurveyId` int(10) unsigned NOT NULL DEFAULT '0',
  `rank` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  PRIMARY KEY (`surveyId`,`subsurveyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gm_surveys`
--

CREATE TABLE IF NOT EXISTS `gm_surveys` (
  `surveyId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `mainSurvey` int(10) unsigned NOT NULL DEFAULT '0',
  `overallComment` longtext NOT NULL,
  `createTime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`surveyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gm_tickets`
--

CREATE TABLE IF NOT EXISTS `gm_tickets` (
  `ticketId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier of ticket creator',
  `name` varchar(12) NOT NULL COMMENT 'Name of ticket creator',
  `message` text NOT NULL,
  `createTime` int(10) unsigned NOT NULL DEFAULT '0',
  `mapId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  `lastModifiedTime` int(10) unsigned NOT NULL DEFAULT '0',
  `closedBy` int(10) NOT NULL DEFAULT '0',
  `assignedTo` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'GUID of admin to whom ticket is assigned',
  `comment` text NOT NULL,
  `completed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `escalated` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `viewed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ticketId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `guid` int(10) unsigned NOT NULL,
  `leaderGuid` int(10) unsigned NOT NULL,
  `lootMethod` tinyint(3) unsigned NOT NULL,
  `looterGuid` int(10) unsigned NOT NULL,
  `lootThreshold` tinyint(3) unsigned NOT NULL,
  `icon1` int(10) unsigned NOT NULL,
  `icon2` int(10) unsigned NOT NULL,
  `icon3` int(10) unsigned NOT NULL,
  `icon4` int(10) unsigned NOT NULL,
  `icon5` int(10) unsigned NOT NULL,
  `icon6` int(10) unsigned NOT NULL,
  `icon7` int(10) unsigned NOT NULL,
  `icon8` int(10) unsigned NOT NULL,
  `groupType` tinyint(3) unsigned NOT NULL,
  `difficulty` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `raiddifficulty` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`),
  KEY `leaderGuid` (`leaderGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Groups';

-- --------------------------------------------------------

--
-- Table structure for table `group_instance`
--

CREATE TABLE IF NOT EXISTS `group_instance` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `instance` int(10) unsigned NOT NULL DEFAULT '0',
  `permanent` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `group_member`
--

CREATE TABLE IF NOT EXISTS `group_member` (
  `guid` int(10) unsigned NOT NULL,
  `memberGuid` int(10) unsigned NOT NULL,
  `memberFlags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `subgroup` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `roles` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`memberGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Groups';

-- --------------------------------------------------------

--
-- Table structure for table `guild`
--

CREATE TABLE IF NOT EXISTS `guild` (
  `guildid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(24) NOT NULL DEFAULT '',
  `leaderguid` int(10) unsigned NOT NULL DEFAULT '0',
  `EmblemStyle` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EmblemColor` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `BorderStyle` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `BorderColor` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `BackgroundColor` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `info` text NOT NULL,
  `motd` varchar(128) NOT NULL DEFAULT '',
  `createdate` int(10) unsigned NOT NULL DEFAULT '0',
  `BankMoney` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guild System';

-- --------------------------------------------------------

--
-- Table structure for table `guild_bank_eventlog`
--

CREATE TABLE IF NOT EXISTS `guild_bank_eventlog` (
  `guildid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Guild Identificator',
  `LogGuid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Log record identificator - auxiliary column',
  `TabId` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Guild bank TabId',
  `EventType` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Event type',
  `PlayerGuid` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemOrMoney` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemStackCount` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DestTabId` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Destination Tab Id',
  `TimeStamp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Event UNIX time',
  PRIMARY KEY (`guildid`,`LogGuid`,`TabId`),
  KEY `guildid_key` (`guildid`),
  KEY `Idx_PlayerGuid` (`PlayerGuid`),
  KEY `Idx_LogGuid` (`LogGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `guild_bank_item`
--

CREATE TABLE IF NOT EXISTS `guild_bank_item` (
  `guildid` int(10) unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SlotId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `item_guid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`TabId`,`SlotId`),
  KEY `guildid_key` (`guildid`),
  KEY `Idx_item_guid` (`item_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `guild_bank_right`
--

CREATE TABLE IF NOT EXISTS `guild_bank_right` (
  `guildid` int(10) unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `gbright` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SlotPerDay` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`TabId`,`rid`),
  KEY `guildid_key` (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `guild_bank_tab`
--

CREATE TABLE IF NOT EXISTS `guild_bank_tab` (
  `guildid` int(10) unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `TabName` varchar(16) NOT NULL DEFAULT '',
  `TabIcon` varchar(100) NOT NULL DEFAULT '',
  `TabText` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`guildid`,`TabId`),
  KEY `guildid_key` (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `guild_eventlog`
--

CREATE TABLE IF NOT EXISTS `guild_eventlog` (
  `guildid` int(10) unsigned NOT NULL COMMENT 'Guild Identificator',
  `LogGuid` int(10) unsigned NOT NULL COMMENT 'Log record identificator - auxiliary column',
  `EventType` tinyint(3) unsigned NOT NULL COMMENT 'Event type',
  `PlayerGuid1` int(10) unsigned NOT NULL COMMENT 'Player 1',
  `PlayerGuid2` int(10) unsigned NOT NULL COMMENT 'Player 2',
  `NewRank` tinyint(3) unsigned NOT NULL COMMENT 'New rank(in case promotion/demotion)',
  `TimeStamp` int(10) unsigned NOT NULL COMMENT 'Event UNIX time',
  PRIMARY KEY (`guildid`,`LogGuid`),
  KEY `Idx_PlayerGuid1` (`PlayerGuid1`),
  KEY `Idx_PlayerGuid2` (`PlayerGuid2`),
  KEY `Idx_LogGuid` (`LogGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guild Eventlog';

-- --------------------------------------------------------

--
-- Table structure for table `guild_member`
--

CREATE TABLE IF NOT EXISTS `guild_member` (
  `guildid` int(10) unsigned NOT NULL COMMENT 'Guild Identificator',
  `guid` int(10) unsigned NOT NULL,
  `rank` tinyint(3) unsigned NOT NULL,
  `pnote` varchar(31) NOT NULL DEFAULT '',
  `offnote` varchar(31) NOT NULL DEFAULT '',
  `BankResetTimeMoney` int(10) unsigned NOT NULL DEFAULT '0',
  `BankRemMoney` int(10) unsigned NOT NULL DEFAULT '0',
  `BankResetTimeTab0` int(10) unsigned NOT NULL DEFAULT '0',
  `BankRemSlotsTab0` int(10) unsigned NOT NULL DEFAULT '0',
  `BankResetTimeTab1` int(10) unsigned NOT NULL DEFAULT '0',
  `BankRemSlotsTab1` int(10) unsigned NOT NULL DEFAULT '0',
  `BankResetTimeTab2` int(10) unsigned NOT NULL DEFAULT '0',
  `BankRemSlotsTab2` int(10) unsigned NOT NULL DEFAULT '0',
  `BankResetTimeTab3` int(10) unsigned NOT NULL DEFAULT '0',
  `BankRemSlotsTab3` int(10) unsigned NOT NULL DEFAULT '0',
  `BankResetTimeTab4` int(10) unsigned NOT NULL DEFAULT '0',
  `BankRemSlotsTab4` int(10) unsigned NOT NULL DEFAULT '0',
  `BankResetTimeTab5` int(10) unsigned NOT NULL DEFAULT '0',
  `BankRemSlotsTab5` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `guid_key` (`guid`),
  KEY `guildid_key` (`guildid`),
  KEY `guildid_rank_key` (`guildid`,`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guild System';

-- --------------------------------------------------------

--
-- Table structure for table `guild_rank`
--

CREATE TABLE IF NOT EXISTS `guild_rank` (
  `guildid` int(10) unsigned NOT NULL DEFAULT '0',
  `rid` tinyint(3) unsigned NOT NULL,
  `rname` varchar(20) NOT NULL DEFAULT '',
  `rights` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `BankMoneyPerDay` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`rid`),
  KEY `Idx_rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guild System';

-- --------------------------------------------------------

--
-- Table structure for table `instance`
--

CREATE TABLE IF NOT EXISTS `instance` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `resettime` int(10) unsigned NOT NULL DEFAULT '0',
  `difficulty` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `completedEncounters` int(10) unsigned NOT NULL DEFAULT '0',
  `data` tinytext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `map` (`map`),
  KEY `resettime` (`resettime`),
  KEY `difficulty` (`difficulty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `instance_reset`
--

CREATE TABLE IF NOT EXISTS `instance_reset` (
  `mapid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `difficulty` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `resettime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mapid`,`difficulty`),
  KEY `difficulty` (`difficulty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ip_banned`
--

CREATE TABLE IF NOT EXISTS `ip_banned` (
  `ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `bandate` int(10) unsigned NOT NULL,
  `unbandate` int(10) unsigned NOT NULL,
  `bannedby` varchar(50) NOT NULL DEFAULT '[Console]',
  `banreason` varchar(255) NOT NULL DEFAULT 'no reason',
  PRIMARY KEY (`ip`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Banned IPs';

-- --------------------------------------------------------

--
-- Table structure for table `item_instance`
--

CREATE TABLE IF NOT EXISTS `item_instance` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `itemEntry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `owner_guid` int(10) unsigned NOT NULL DEFAULT '0',
  `creatorGuid` int(10) unsigned NOT NULL DEFAULT '0',
  `giftCreatorGuid` int(10) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '1',
  `duration` int(10) NOT NULL DEFAULT '0',
  `charges` tinytext,
  `flags` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `enchantments` text NOT NULL,
  `randomPropertyId` smallint(5) NOT NULL DEFAULT '0',
  `durability` smallint(5) unsigned NOT NULL DEFAULT '0',
  `playedTime` int(10) unsigned NOT NULL DEFAULT '0',
  `text` text,
  PRIMARY KEY (`guid`),
  KEY `idx_owner_guid` (`owner_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Item System';

-- --------------------------------------------------------

--
-- Table structure for table `item_refund_instance`
--

CREATE TABLE IF NOT EXISTS `item_refund_instance` (
  `item_guid` int(10) unsigned NOT NULL COMMENT 'Item GUID',
  `player_guid` int(10) unsigned NOT NULL COMMENT 'Player GUID',
  `paidMoney` int(10) unsigned NOT NULL DEFAULT '0',
  `paidExtendedCost` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_guid`,`player_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Item Refund System';

-- --------------------------------------------------------

--
-- Table structure for table `item_soulbound_trade_data`
--

CREATE TABLE IF NOT EXISTS `item_soulbound_trade_data` (
  `itemGuid` int(10) unsigned NOT NULL COMMENT 'Item GUID',
  `allowedPlayers` text NOT NULL COMMENT 'Space separated GUID list of players who can receive this item in trade',
  PRIMARY KEY (`itemGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Item Refund System';

-- --------------------------------------------------------

--
-- Table structure for table `lag_reports`
--

CREATE TABLE IF NOT EXISTS `lag_reports` (
  `reportId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `lagType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mapId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  `latency` int(10) unsigned NOT NULL DEFAULT '0',
  `createTime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`reportId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `lfg_data`
--

CREATE TABLE IF NOT EXISTS `lfg_data` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `dungeon` int(10) unsigned NOT NULL DEFAULT '0',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='LFG Data';

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `txn_id` varchar(32) DEFAULT NULL,
  `payer_email` varchar(64) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `info` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mail`
--

CREATE TABLE IF NOT EXISTS `mail` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `messageType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stationery` tinyint(3) NOT NULL DEFAULT '41',
  `mailTemplateId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sender` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `receiver` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `subject` longtext,
  `body` longtext,
  `has_items` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0',
  `deliver_time` int(10) unsigned NOT NULL DEFAULT '0',
  `money` int(10) unsigned NOT NULL DEFAULT '0',
  `cod` int(10) unsigned NOT NULL DEFAULT '0',
  `checked` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_receiver` (`receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Mail System';

-- --------------------------------------------------------

--
-- Table structure for table `mail_items`
--

CREATE TABLE IF NOT EXISTS `mail_items` (
  `mail_id` int(10) unsigned NOT NULL DEFAULT '0',
  `item_guid` int(10) unsigned NOT NULL DEFAULT '0',
  `receiver` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  PRIMARY KEY (`item_guid`),
  KEY `idx_receiver` (`receiver`),
  KEY `idx_mail_id` (`mail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE IF NOT EXISTS `media` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `author` int(10) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_url` varchar(30) NOT NULL DEFAULT '0' COMMENT 'Just Youtube Videos',
  `title` text,
  `description` text,
  `comments` int(10) DEFAULT '0',
  `link` varchar(255) DEFAULT '#',
  `visible` int(2) NOT NULL DEFAULT '0',
  `type` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '0 video - 1 wallpapapers - 2 screenshots - 3 artwork - 4 comics',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `author`, `date`, `id_url`, `title`, `description`, `comments`, `link`, `visible`, `type`) VALUES
(16, 0, '2012-03-12 01:59:00', '-E5M3X-1KP0', 'CATACLYSM (Español - España) - World of Warcraft', 'Trailer of the third World of Warcraft Expansion.</br>This expansion supouse a big change for Azeroth, all the known world will change and the Deathwing`s rage will change the curse of the life.', 0, 'http://www.youtube.com/watch?v=-E5M3X-1KP0', 1, 0),
(17, 0, '2012-03-12 01:59:00', 'CARC72zF7UI', 'World of Warcraft - Cinemáticas', 'Normal Video', 0, 'http://www.youtube.com/watch?v=CARC72zF7UI', 1, 0),
(18, 0, '2012-03-12 01:59:00', 'dYK_Gqyf48Y', 'World of Warcraft - Cinematic Trailer', 'Some Trailers', 0, 'http://www.youtube.com/watch?v=dYK_Gqyf48Y', 1, 0),
(19, 0, '2012-03-12 01:59:00', 'IBHL_-biMrQ', 'World of Warcraft: The Burning Crusade', 'TBC Trailer', 0, 'http://www.youtube.com/watch?v=IBHL_-biMrQ', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `media_comments`
--

CREATE TABLE IF NOT EXISTS `media_comments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mediaid` int(10) NOT NULL,
  `comment` text NOT NULL,
  `accountId` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=64 ;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(255) NOT NULL DEFAULT 'FailZorD',
  `class` varchar(255) NOT NULL DEFAULT 'Administrator',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `author` int(10) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  `content` text,
  `contentlnk` text,
  `title` text,
  `comments` int(10) DEFAULT '0',
  `image` varchar(255) DEFAULT 'staff',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `author`, `date`, `content`, `contentlnk`, `title`, `comments`, `image`) VALUES
(23, 1, '2011-11-28 00:00:00', '<p>World of Warcraft Patch 4.2, Rage of the Firelands is here! With a new raid, a legendary questline, all-new raid tier and PvP armor sets, the most diverse daily questing experience to date, major story developments, PvP Season 10, user interface enhancements, and much more, patch 4.2 has brought Azeroth a little something for everyone.</p>\r\n<p>If you want to know what’s what before traversing the new content and features, we encourage you to wade through all of the patch 4.2 information we’ve released, watch the Rage of the Firelands patch trailer, and read the official patch notes. Be sure to check out the Customer &amp; Technical Support Information section as well if you’re seeking information on known patch issues, the latest fixes, or need technical troubleshooting assistance.</p>\r\n<p style="text-align: center;"><iframe allowfullscreen="" frameborder="0" height="349" src="http://www.youtube.com/embed/HsXglDs81FU" width="560"></iframe></p>\r\n<p>&#160;</p>\r\n<center>\r\n	<table border="0" cellpadding="0" cellspacing="0">\r\n		<tbody>\r\n			<tr>\r\n				<td colspan="3">\r\n				<div class="ctextheader">\r\n					<img src="http://eu.media5.battle.net/cms/gallery/C3TFJYGGOUOV1308923764027.jpg" style="width: 580px; height: 45px;" />\r\n					<h1>\r\n						Content &amp; Features</h1>\r\n				</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n				<div>\r\n					<a  target="_blank"><img src="http://eu.media5.battle.net/cms/gallery/3OM23DHSMCPW1308917532816.jpg" /></a>\r\n					<p class="ctextheader"><a  target="_blank">Patch Notes<br />\r\n					<span class="ctextteaser">Read the official Rage of the firelands patch 4.2 notes.</span></a></p>\r\n				</div>\r\n				</td>\r\n				<td style="width: 5px;">&#160;</td>\r\n				<td>\r\n				<div>\r\n					<a  target="_blank"><img src="http://eu.media3.battle.net/cms/gallery/HMCHL8KGA36J1308917283146.jpg" /></a>\r\n					<p class="ctextheader"><a  target="_blank">Dungeon Journal<br />\r\n					<span class="ctextteaser">Learn more about specific dungeons, the bosses within thoses dungeons, their abilities, and the rewards they offer.</span></a></p>\r\n				</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n				<div>\r\n					<a  target="_blank"><img src="http://eu.media2.battle.net/cms/gallery/DKA6DI1HD3D51308917309912.jpg" /></a>\r\n					<p class="ctextheader"><a  target="_blank">Elemental Bonds<br />\r\n					<span class="ctextteaser">…Is this the end of the Son of Durotan?</span></a></p>\r\n				</div>\r\n				</td>\r\n				<td>&#160;</td>\r\n				<td>\r\n				<div>\r\n					<a  target="_blank"><img src="http://eu.media1.battle.net/cms/gallery/NV66DHYBF3BF1309338393093.jpg" /> </a>\r\n					<p class="ctextheader"><a  target="_blank">Featured Items<br />\r\n					<span class="ctextteaser">Patch 4.2 boasts a wealth of cool items for collectors and completionists alike.</span></a></p>\r\n				</div>\r\n				<a href="http://eu.battle.net/wow/en/blog/2513298#blog" target="_blank"> </a></td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n				<div>\r\n					<a target="_blank"><img src="http://eu.media5.battle.net/cms/gallery/IYEV8YVGGZG01308917391114.jpg" /></a>\r\n					<p class="ctextheader"><a  target="_blank">Firelands Raid<br />\r\n					<span class="ctextteaser">Enjoy this scorching opportunity to delve into this Elemental Plane, where six unique bosses stand between you and the reinvigorated Ragnaros.</span></a></p>\r\n				</div>\r\n				</td>\r\n				<td>&#160;</td>\r\n				<td>\r\n				<div>\r\n					<a  target="_blank"><img src="http://eu.media1.battle.net/cms/gallery/61W632G1QEJZ1308917794161.jpg" /></a>\r\n					<p class="ctextheader"><a target="_blank">Firelands armor<br />\r\n					<span class="ctextteaser">Have a look at the latest raiding tier armor, including stats, set bonuses, and artwork.</span></a></p>\r\n				</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n				<div>\r\n					<a  target="_blank"><img src="http://eu.media4.battle.net/cms/gallery/HLMZWRFC7TF51308917365786.jpg" /></a>\r\n					<p class="ctextheader"><a target="_blank">Fire and Flames<br />\r\n					<span class="ctextteaser">Feast your eyes on the adventures that await as you’re transported through the fire and the flames and into the Firelands.</span></a></p>\r\n				</div>\r\n				</td>\r\n				<td>&#160;</td>\r\n				<td>\r\n				<div>\r\n					<a  target="_blank"><img src="http://eu.media4.battle.net/cms/gallery/EZRP4DWDAMCW1308917467926.jpg" /></a>\r\n					<p class="ctextheader"><a  target="_blank">New Legendary<br />\r\n					<span class="ctextteaser">Patch 4.2 introduces an epic quest that will challenge those daring enough to complete the legendary staff Dragonwrath, Tarecgosa’s Rest.</span></a></p>\r\n				</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n				<div>\r\n					<a  target="_blank"><img src="http://eu.media3.battle.net/cms/gallery/FNYSRYIXLLYF1308917264804.jpg" /></a>\r\n					<p class="ctextheader"><a  target="_blank">New Daily Quests<br />\r\n					<span class="ctextteaser">Stalwart adventurers will have the opportunity to test their mettle at two new daily quest areas located in the hillside of Hyjal and depths of the Firelands.</span></a></p>\r\n				</div>\r\n				</td>\r\n				<td>&#160;</td>\r\n				<td>\r\n				<div>\r\n					<a  target="_blank"><img src="http://eu.media1.battle.net/cms/gallery/IRAK7S7FNQLG1308917867793.jpg" /></a>\r\n					<p class="ctextheader"><a  target="_blank">VP Conversion<br />\r\n					<span class="ctextteaser">With the release of patch 4.2 all Valor Points will be converted down to Justice Points up to the 4000 point cap.</span></a></p>\r\n				</div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	<p>&#160;</p>\r\n	<table border="0" cellpadding="0" cellspacing="0">\r\n		<tbody>\r\n			<tr>\r\n				<td colspan="3">\r\n				<div class="ctextheader">\r\n					<img src="http://eu.media5.battle.net/cms/gallery/WFBGPFJU97W11308917944989.jpg" style="width: 580px; height: 45px;" />\r\n					<h1>\r\n						PvP Content &amp; Features</h1>\r\n				</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n				<div>\r\n					<a  target="_blank"><img src="http://eu.media5.battle.net/cms/gallery/OA5Y5L2X26NP1308917562538.jpg" /></a>\r\n					<p class="ctextheader"><a  target="_blank">New PvP Mounts<br />\r\n					<span class="ctextteaser">In order to best accommodate players under the play style of Rated Battlegrounds, we’ll be offering all-new PvP ground mounts in a unique way.</span></a></p>\r\n				</div>\r\n				</td>\r\n				<td style="width: 5px;">&#160;</td>\r\n				<td>\r\n				<div>\r\n					<a  target="_blank"><img src="http://eu.media1.battle.net/cms/gallery/M5JI20E3T7391308917693991.jpg" /></a>\r\n					<p class="ctextheader"><a  target="_blank">Season 10 Armor<br />\r\n					<span class="ctextteaser">Players on the battlefields of World of Warcraft have proven their mettle in glorious combat and are ready for new challenges and more powerful rewards.</span></a></p>\r\n				</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n				<div>\r\n					<a  target="_blank"><img src="http://eu.media1.battle.net/cms/gallery/ZTAR8KEEXRST1308917732519.jpg" /></a>\r\n					<p class="ctextheader"><a  target="_blank">Season Transition<br />\r\n					<span class="ctextteaser">Learn about the end of Season 9, the distribution of end-of-season rewards, and the conversion from Conquest Points to Honor Points.</span></a></p>\r\n				</div>\r\n				</td>\r\n				<td>&#160;</td>\r\n				<td>\r\n				<div>\r\n					<a target="_blank"><img src="http://eu.media4.battle.net/cms/gallery/CRMEFNR3VK1Q1308917835477.jpg" /></a>\r\n					<p class="ctextheader"><a  target="_blank">War Games<br />\r\n					<span class="ctextteaser">Patch 4.2 implements a new interface option within the PvP tab that makes it easier than ever to call our friend or foe for a face-off.</span></a></p>\r\n				</div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	<p>&#160;</p>\r\n	<p>&#160;</p>\r\n</center>\r\n<p>\r\n<style type="text/css">\r\n#blog .detail img {\r\n-moz-border-radius:4px;\r\n-webkit-border-radius:4px;\r\nborder-radius:4px;\r\n-moz-box-shadow:0 0 20px #000000;\r\n-webkit-box-shadow:0 0 20px #000000;\r\nbox-shadow:0 0 20px #000000;\r\nborder: 1px solid #372511;\r\nmax-width: 580px !important;\r\npadding: 1px;\r\n}\r\n#blog .detail td:hover > a img, #blog .detail a img:hover {\r\nborder: 1px solid #CD9000;\r\n}\r\n#blog .detail td div:hover > a img, #blog .detail a img:hover {\r\nborder: 1px solid #CD9000;\r\n}\r\n#blog .detail td a img, #blog .detail td div img {\r\nwidth: 285px;\r\nheight: 140px;\r\nmargin-top: 8px;\r\n}\r\n#blog .detail td a, #blog .detail td div, #blog .detail td div.ctextheader {\r\nposition: relative;\r\ndisplay: block;\r\ntext-decoration: none;\r\nline-height:1 !important;\r\nfont-family: Arial !important;\r\n}\r\n#blog .detail td a p, #blog .detail td div p {\r\nposition: absolute;\r\ntop: 18px;\r\nleft: 128px;\r\nright: 5px;\r\nmargin: 0;\r\npadding: 0;\r\n}\r\n#blog .detail td div.ctextheader h1 {\r\nposition: absolute;\r\ntop: 20px;\r\nleft: 30px;\r\ncolor: #ffb001 !important;\r\nfont-size: 23px !important;\r\n}\r\n#blog .detail td a p.ctextheader, #blog .detail td div p.ctextheader {\r\ncolor: #d19205 !important;\r\nfont-size: 17px !important;\r\nline-height:1 !important;\r\ntext-weight: bold !important;\r\n}\r\n#blog .detail td a p span.ctextteaser, #blog .detail td div p span.ctextteaser {\r\ncolor: #ad8460 !important;\r\nfont-size: 12px !important;\r\nline-height:1 !important;\r\nfont-family: Arial !important;\r\ntext-align: left !important;\r\n}</style>\r\n</p>\r\n', '', 'Patch 4.2: Rage of the Elements', 0, '4.2.0'),
(24, 1, '2011-11-28 00:00:00', '<p>In addition to the new iLevel 365 gear that players can purchase from unlockable vendors at the <a href="http://www.wowhead.com/zone=5733" target="_blank">Molten Front</a> and the <a href="http://eu.battle.net/wow/en/blog/2236786" target="_blank">epic armor sets</a> they can claim from Ragnaros and his minions in the <a href="http://www.wowhead.com/zone=5723" target="_blank">Firelands raid</a>, patch 4.2 also boasts a wealth of cool items for collectors and completionists alike.</p>\r\n	<p>From companion pets to mounts to trinkets with unique on-use effects, there''s a little something for everyone. To make sure you don''t miss out on any of these collectables, we''ve put together a list of all the new featured items introduced in 4.2 so you can check out what''s available and where!</p>\r\n	<p>&#160;</p>\r\n	<p>&#160;</p>\r\n	<center>\r\n		<style type="text/css">\r\n.top-list tr:hover td { color:inherit; }\r\n.top-list tr:nth-child(2) td { color:inherit; font-weight:normal }		</style>\r\n		<div class="top-list-container">\r\n			<table border="0" cellpadding="0" cellspacing="0" class="top-list" style="text-align: left;">\r\n				<tbody>\r\n					<tr>\r\n						<td colspan="3">\r\n						<div class="ctextheader">\r\n							<img src="http://eu.media4.battle.net/cms/gallery/1J1XZIDEGIRX1309441435785.jpg" style="width: 520px; height: 65px;" />\r\n							<h1>\r\n								Firelands Raid</h1>\r\n						</div>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<th style="text-align: center;">\r\n							Item Name</th>\r\n						<th style="text-align: center;">\r\n							Item Type</th>\r\n						<th style="text-align: center;">\r\n							Where You Can Get It</th>\r\n					</tr>\r\n					<tr>\r\n						<td><a class="bml-link-item color-q4" href="http://wowhead.com/item=71665" target="_blank">Flametalon of Alysrazor</a></td>\r\n						<td>Epic Ground Mount</td>\r\n						<td>Rare drop from <a href="http://eu.battle.net/wow/en/zone/firelands/alysrazor" target="_blank">Alysrazor</a>; available in both 10-player and 25-player versions of the raid, as well as in Normal and Heroic modes.</td>\r\n					</tr>\r\n					<tr>\r\n						<td><a class="bml-link-item color-q4" href="http://wowhead.com/item=69230" target="_blank">Corrupted Fire Hawk</a></td>\r\n						<td>Epic Flying Mount</td>\r\n						<td>Reward for completing <a href="http://www.wowhead.com/achievement=5828" target="_blank">“Glory of the Firelands Raider”</a> achievement. Learned from <a class="bml-link-item color-q4" href="http://wowhead.com/item=69230" target="_blank">Corrupted Egg of Millagazor</a>.</td>\r\n					</tr>\r\n					<tr>\r\n						<td><a class="bml-link-item color-q4" href="http://wowhead.com/item=69224" target="_blank">Pureblood Fire Hawk</a></td>\r\n						<td>Epic Flying Mount</td>\r\n						<td>Rare drop from <a href="http://eu.battle.net/wow/en/zone/firelands/ragnaros" target="_blank">Ragnaros</a>; available in both 10-player and 25-player version of the raid, as well as Normal and Heroic modes. Learned from <a class="bml-link-item color-q4" href="http://wowhead.com/item=69224" target="_blank">Smoldering Egg of Millagazor</a>.</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n		</div>\r\n		<p>&#160;</p>\r\n		<style type="text/css">\r\n.top-list tr:hover td { color:inherit; }\r\n.top-list tr:nth-child(2) td { color:inherit; font-weight:normal }		</style>\r\n		<div class="top-list-container">\r\n			<table border="0" cellpadding="0" cellspacing="0" class="top-list" style="text-align: left;">\r\n				<tbody>\r\n					<tr>\r\n						<td colspan="3">\r\n						<div class="ctextheader">\r\n							<img src="http://eu.media3.battle.net/cms/gallery/DZ3OOX3VPNTS1309441387524.jpg" style="width: 520px; height: 65px;" />\r\n							<h1>\r\n								Mount Hyjal Dailies</h1>\r\n						</div>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<th style="text-align: center;">\r\n							Item Name</th>\r\n						<th style="text-align: center;">\r\n							Item Type</th>\r\n						<th style="text-align: center;">\r\n							Where You Can Get It</th>\r\n					</tr>\r\n					<tr>\r\n						<td><a class="bml-link-item color-q1" href="http://wowhead.com/item=71259" target="_blank">Leyara''s Locket</a></td>\r\n						<td>Vanity item; transforms player into a Druid of the Flame</td>\r\n						<td>Reward from “The Rest is History,” the final quest in a new series that becomes available after unlocking all content at the Molten Front and completing <a href="http://www.wowhead.com/achievement=5859" target="_blank">&#34;Legacy of Leyara.&#34;</a></td>\r\n					</tr>\r\n					<tr>\r\n						<td><a class="bml-link-item color-q3" href="http://wowhead.com/item=70161" target="_blank">Mushroom Chair</a></td>\r\n						<td>\r\n						<p>Vanity item; sets down a mushroom chair upon which a beleaguered player may sit and rest</p>\r\n						</td>\r\n						<td>Ayla Shadowstorm (unlockable vendor)</td>\r\n					</tr>\r\n					<tr>\r\n						<td><a class="bml-link-item color-q3" href="http://wowhead.com/item=70159" target="_blank">Mylune''s Call</a></td>\r\n						<td>\r\n						<p>Vanity item; initiates Mylune’s Call, summoning an image of the regrowth of Hyjal</p>\r\n						</td>\r\n						<td>Varlan Highbough (unlockable vendor)</td>\r\n					</tr>\r\n					<tr>\r\n						<td><a class="bml-link-item color-q3" href="http://wowhead.com/item=70140" target="_blank">Hyjal Bear Cub</a></td>\r\n						<td>\r\n						<p>Non-combat pet</p>\r\n						</td>\r\n						<td>\r\n						<p>Varlan Highbough (unlockable vendor)</p>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td><a class="bml-link-item color-q3" href="http://wowhead.com/item=70160" target="_blank">Crimson Lasher</a></td>\r\n						<td>\r\n						<p>Non-combat pet</p>\r\n						</td>\r\n						<td>\r\n						<p>Ayla Shadowstorm (unlockable vendor)</p>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td><a class="bml-link-item color-q3" href="http://wowhead.com/item=34955" target="_blank">Searing Scorchling</a></td>\r\n						<td>\r\n						<p>Non-combat pet</p>\r\n						</td>\r\n						<td>\r\n						<p>Possible reward from <a class="bml-link-item color-q2" href="http://wowhead.com/item=71631">Zen''Vorka’s Cache</a>, which can be purchased from Zen''Vorka (unlockable vendor) for 30 Marks of the World Tree</p>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td><a class="bml-link-item color-q4" href="http://wowhead.com/item=69213" target="_blank">Flameward Hippogryph</a></td>\r\n						<td>\r\n						<p>Epic flying mount</p>\r\n						</td>\r\n						<td>Reward for completing <a href="http://www.wowhead.com/achievement=5866" target="_blank">&#34;The Molten Front Offensive&#34;</a></td>\r\n					</tr>\r\n					<tr>\r\n						<td><a class="bml-link-item color-q4" href="http://wowhead.com/item=70141" target="_blank">Dwyer''s Caber</a></td>\r\n						<td>\r\n						<p>Trinket with on-use cosmetic effect; the player tosses a tree</p>\r\n						</td>\r\n						<td>Varlan Highbough<br />\r\n						<p>(unlockable vendor)</p>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td><a class="bml-link-item color-q4" href="http://wowhead.com/item=70142" target="_blank">Moonwell Chalice</a></td>\r\n						<td>Trinket summons a small moonwell</td>\r\n						<td>Ayla Shadowstorm (unlockable vendor)</td>\r\n					</tr>\r\n					<tr>\r\n						<td><a class="bml-link-item color-q4" href="http://wowhead.com/item=70143" target="_blank">Moonwell Phial</a></td>\r\n						<td>\r\n						<p>Trinket summons a veil of splashing waters</p>\r\n						</td>\r\n						<td>Ayla Shadowstorm (unlockable vendor)</td>\r\n					</tr>\r\n					<tr>\r\n						<td><a class="bml-link-item color-q4" href="http://wowhead.com/item=70144" target="_blank">Ricket''s Magnetic Fireball</a></td>\r\n						<td>Trinket with cosmetic effect; your attacks may attract small celestial objects</td>\r\n						<td>Damek Bloombeard (unlockable vendor)</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n		</div>\r\n		<p>&#160;</p>\r\n		<style type="text/css">\r\n.top-list tr:hover td { color:inherit; }\r\n.top-list tr:nth-child(2) td { color:inherit; font-weight:normal }		</style>\r\n		<div class="top-list-container">\r\n			<table border="0" cellpadding="0" cellspacing="0" class="top-list" style="text-align: left;">\r\n				<tbody>\r\n					<tr>\r\n						<td colspan="3">\r\n						<div class="ctextheader">\r\n							<img src="http://eu.media5.battle.net/cms/gallery/USHGZJY2B39K1309441338262.jpg" style="width: 520px; height: 65px;" />\r\n							<h1>\r\n								Rated Battlegrounds and Arenas</h1>\r\n						</div>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<th style="text-align: center;">\r\n							Item Name</th>\r\n						<th style="text-align: center;">\r\n							Item Type</th>\r\n						<th style="text-align: center;">\r\n							Where You Can Get It</th>\r\n					</tr>\r\n					<tr>\r\n						<td><a class="bml-link-item color-q4" href="http://wowhead.com/item=70909" target="_blank">Vicious War Steed</a></td>\r\n						<td>Epic Ground Mount</td>\r\n						<td>\r\n						<p><a href="http://eu.battle.net/wow/en/blog/2483320" target="_blank">Reward</a> for completing <a href="http://www.wowhead.com/achievement=5328" target="_blank">&#34;Veteran of the Alliance&#34;</a>, <a href="http://www.wowhead.com/achievement=5823" target="_blank">&#34;Veteran of the Alliance II&#34;</a> and <a href="http://www.wowhead.com/achievement=5329" target="_blank">&#34;Warbound Veteran of the Alliance&#34;</a></p>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td><a class="bml-link-item color-q4" href="http://wowhead.com/item=70910" target="_blank">Vicious War Wolf</a></td>\r\n						<td>Epic Ground Mount</td>\r\n						<td>\r\n						<p><a href="http://eu.battle.net/wow/en/blog/2483320" target="_blank">Reward</a> for completing <a href="http://www.wowhead.com/achievement=5325" target="_blank">&#34;Veteran of the Horde&#34;</a>, <a href="http://www.wowhead.com/achievement=5824" target="_blank">&#34;Veteran of the Horde II&#34;</a> and <a href="http://www.wowhead.com/achievement=5326" target="_blank">&#34;Warbound Veteran of the Horde&#34;</a></p>\r\n						</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n		</div>\r\n		<p>&#160;</p>\r\n		<style type="text/css">\r\n.top-list tr:hover td { color:inherit; }\r\n.top-list tr:nth-child(2) td { color:inherit; font-weight:normal }		</style>\r\n		<div class="top-list-container">\r\n			<table border="0" cellpadding="0" cellspacing="0" class="top-list" style="text-align: left;">\r\n				<tbody>\r\n					<tr>\r\n						<td colspan="3">\r\n						<div class="ctextheader">\r\n							<img src="http://eu.media4.battle.net/cms/gallery/5GWD81S5IWYT1309441412557.jpg" style="width: 520px; height: 65px;" />\r\n							<h1>\r\n								Miscellaneous</h1>\r\n						</div>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<th style="text-align: center;">\r\n							Item Name</th>\r\n						<th style="text-align: center;">\r\n							Item Type</th>\r\n						<th style="text-align: center;">\r\n							Where You Can Get It</th>\r\n					</tr>\r\n					<tr>\r\n						<td><a class="bml-link-item color-q1" href="http://wowhead.com/item=69838" target="_blank">Chirping Box</a></td>\r\n						<td>Non-combat pet</td>\r\n						<td>Reward for completing <a href="http://www.wowhead.com/achievement=5860" target="_blank">&#34;The ''Unbeatable'' Pterodactyl: BEATEN&#34;</a> (complete the &#34;Vigilance on Wings&#34; daily quest in Mount Hyjal 10 times)</td>\r\n					</tr>\r\n					<tr>\r\n						<td>\r\n						<p><a class="bml-link-item color-q1" href="http://wowhead.com/item=72042" target="_blank">Alliance Balloon</a></p>\r\n						<a class="bml-link-item color-q1" href="http://wowhead.com/item=72045" target="_blank">Horde Balloon</a></td>\r\n						<td>Non-combat pet</td>\r\n						<td>Reward for completing &#34;Blown Away&#34;</td>\r\n					</tr>\r\n					<tr>\r\n						<td><a class="bml-link-item color-q3" href="http://wowhead.com/item=71140" target="_blank">Nuts</a></td>\r\n						<td>\r\n						<p>Non-combat pet</p>\r\n						</td>\r\n						<td>Reward for completing <a href="http://www.wowhead.com/achievement=5876" target="_blank">&#34;Petting Zoo&#34;</a> (collect 100 unique companion pets)</td>\r\n					</tr>\r\n					<tr>\r\n						<td><a class="bml-link-item color-q1" href="http://wowhead.com/item=71387" target="_blank">Brilliant Kaliri</a></td>\r\n						<td>Non-combat pet</td>\r\n						<td>Reward for completing <a href="http://www.wowhead.com/achievement=5877" target="_blank">&#34;Menagerie&#34;</a> (collect 125 unique companion pets)</td>\r\n					</tr>\r\n					<tr>\r\n						<td><a class="bml-link-item color-q3" href="http://wowhead.com/item=54810" target="_blank">Celestial Dragon</a></td>\r\n						<td>Non-combat pet</td>\r\n						<td>Reward for completing <a href="http://www.wowhead.com/achievement=5875" target="_blank">&#34;Littlest Pet Shop&#34;</a> (collect 150 unique companion pets)</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n		</div>\r\n		<p>&#160;</p>\r\n	</center>\r\n\r\n<style type="text/css">\r\n#blog .detail img {\r\n-moz-border-radius:4px;\r\n-webkit-border-radius:4px;\r\nborder-radius:4px;\r\n-moz-box-shadow:0 0 20px #000000;\r\n-webkit-box-shadow:0 0 20px #000000;\r\nbox-shadow:0 0 20px #000000;\r\nborder: 1px solid #372511;\r\nmax-width: 520px !important;\r\npadding: 1px;\r\n}\r\n#blog .detail td div.ctextheader {\r\nposition: relative;\r\ndisplay: block;\r\ntext-decoration: none;\r\n}\r\n#blog .detail td div.ctextheader h1 {\r\nposition: absolute;\r\ntop: 18px;\r\nleft: 30px;\r\ncolor: #ffb001;\r\nfont-size: 23px;\r\ntext-shadow: #000000 1px 2px 3px;\r\n}\r\n#blog .detail td a p.ctextheader, #blog .detail td div p.ctextheader {\r\ncolor: #d19205;\r\nfont: 18px/1 Arial,Verdana,sans-serif;\r\n}</style>', '', 'Patch 4.2: Featured Items', 0, 'featureditems'),
(20, 1, '0000-00-00 00:00:00', 'World of Warcraft Patch 4.3: Hour of Twilight nears, and with it, Deathwing’s reign of terror will finally come to an end. Featuring a new raid, unexplored dungeons, a legendary rogue quest line, the latest raid tier armor sets, major story developments, the Transmogrification and Void Storage features, and much more, Hour of Twilight has something for everyone..\r\n<div id="center"><br>\r\n	<div class="ctextheadline">\r\n		<img src="http://eu.media4.battle.net/cms/gallery/RC2CO4SNOMFT1320833523998.jpg" style="width: 580px; height: 45px;" />\r\n		<h1>\r\n			Content &amp; Features</h1>\r\n	</div>\r\n	<div class="cteaser">\r\n		<a class="cteaserimg"  target="_blank"><img src="http://eu.media5.battle.net/cms/blog_thumbnail/6UI3J2B2ZLHI1317321685765.jpg" /></a> <a class="cteasersummary"  target="_blank"><span class="headline">Raid Finder</span><br />\r\n		<span class="summarytext">Enjoy our brand-new grouping feature that works much like the Dungeon Finder.</span></a></div>\r\n	<div class="cteaser">\r\n		<a class="cteaserimg"  target="_blank"><img src="http://eu.media4.battle.net/cms/blog_thumbnail/SOHDLM4OWJF71313585059916.jpg" /></a> <a class="cteasersummary" target="_blank"><span class="headline">Transmogrification</span><br />\r\n		<span class="summarytext">Customize the appearance of your weapons and armor like never before.</span></a></div>\r\n	<div class="cteaser">\r\n		<a class="cteaserimg"  target="_blank"><img src="http://eu.media4.battle.net/cms/blog_thumbnail/6XAVNMWID70C1313660227876.jpg" /></a> <a class="cteasersummary"  target="_blank"><span class="headline">Void Storage</span><br />\r\n		<span class="summarytext">Characters of all levels will be able to take advantage of this brand-new technology, which will open up 80 slots of long-term storage space.</span></a></div>\r\n	<div class="cteaser">\r\n		<a class="cteaserimg"  target="_blank"><img src="http://eu.media5.battle.net/cms/blog_thumbnail/S8BLQAJZL9301317746259756.jpg" /></a> <a class="cteasersummary" target="_blank"><span class="headline">Valor Changes</span><br />\r\n		<span class="summarytext">With patch 4.3, we''ll be introducing some changes to the way Valor Points are obtained, as well as the items they can be exchanged for.</span></a></div>\r\n	<div class="cteaser">\r\n		<a class="cteaserimg" target="_blank"><img src="http://eu.media2.battle.net/cms/blog_thumbnail/TF5FWQJV66MF1317210321396.jpg" /></a> <a class="cteasersummary"  target="_blank"><span class="headline">Fangs of the Father</span><br />\r\n		<span class="summarytext">Attention rogues! Play a central role in the fate of Azeroth by doing what you do best: manipulating key events from the shadows.</span></a></div>\r\n	<div class="cteaser">\r\n		<a class="cteaserimg"  target="_blank"><img src="http://eu.media1.battle.net/cms/blog_thumbnail/P9VUT605DXAZ1314262079585.jpg" /></a> <a class="cteasersummary" target="_blank"><span class="headline">The All-New Darkmoon Faire</span><br />\r\n		<span class="summarytext">You’ll be dazzled. You’ll be amazed! You aren’t prepared for the Darkmoon Faire, ‘cause it’s like nothing you’ve seen before!</span></a></div>\r\n	<p style="clear: both;">&#160;</p>\r\n	<div class="ctextheadline">\r\n		<img src="http://eu.media5.battle.net/cms/gallery/OVXWRHAJZJ4P1320833656835.jpg" style="width: 580px; height: 45px;" />\r\n		<h1>\r\n			Tier 13 Sets and Visual Retrospective</h1>\r\n	</div>\r\n	<div class="cteaser">\r\n		<a class="cteaserimg"  target="_blank"><img src="http://eu.media3.battle.net/cms/blog_thumbnail/W1C83D9578F71315579410079.jpg" /></a> <a class="cteasersummary"  target="_blank"><span class="headline">Warlock Tier Set</span><br />\r\n		<span class="summarytext">The warlock set has the flavor of the Old Gods about it, full of dark and warped aesthetics. General Vezax from the Ulduar raid was used as a reference point.</span></a></div>\r\n	<div class="cteaser">\r\n		<a class="cteaserimg"  target="_blank"><img src="http://eu.media1.battle.net/cms/blog_thumbnail/XTSGMRFB7ZF41317987453789.jpg" /></a> <a class="cteasersummary"  target="_blank"><span class="headline">Hunter Tier Set</span><br />\r\n		<span class="summarytext">A dragon-head helm and chained leathery wings around the shoulders -- the set gives the impression of a skeletal dragon crouching over the hunter''s upper body.</span></a></div>\r\n	<div class="cteaser">\r\n		<a class="cteaserimg" target="_blank"><img src="http://eu.media4.battle.net/cms/blog_thumbnail/0AP817VT773C1316103167706.jpg" /></a> <a class="cteasersummary"  target="_blank"><span class="headline">Mage Tier Set</span><br />\r\n		<span class="summarytext">The combination of moving cogs, quilted fabric, and buckled straps give the set an intriguing &#34;techno-mage&#34; flavor.</span></a></div>\r\n	<div class="cteaser">\r\n		<a class="cteaserimg"  target="_blank"><img src="http://eu.media3.battle.net/cms/blog_thumbnail/95KFX579H9261315935561322.jpg" /></a> <a class="cteasersummary"  target="_blank"><span class="headline">Druid Tier Set</span><br />\r\n		<span class="summarytext">Twisting, organic shapes are often key elements of a druid set, and this tier is no exception, with writhing plant roots providing a frame for the glowing clusters of fungi.</span></a></div>\r\n	<div class="cteaser">\r\n		<a class="cteaserimg"  target="_blank"><img src="http://eu.media1.battle.net/cms/blog_thumbnail/7J7DWPT5WW2M1316014013476.jpg" /></a> <a class="cteasersummary" target="_blank"><span class="headline">Shaman Tier Set</span><br />\r\n		<span class="summarytext">The shaman set combines huge wolf-skull shoulder pads, bone fetishes, and fur with glowing shards of amber crystal: a mix of the animal and the elemental.</span></a></div>\r\n	<div class="cteaser">\r\n		<a class="cteaserimg"  target="_blank"><img src="http://eu.media5.battle.net/cms/blog_thumbnail/WZBWZUQSA6UG1315511140272.jpg" /></a> <a class="cteasersummary"  target="_blank"><span class="headline">Warrior Tier Set</span><br />\r\n		<span class="summarytext">Gnarled dragon horn and angular elementium plating with burning fire behind it were the key ingredients.</span></a></div>\r\n	<div class="cteaser">\r\n		<a class="cteaserimg"  target="_blank"><img src="http://eu.media2.battle.net/cms/blog_thumbnail/MZLJSYVI6GKI1316629978030.jpg" /></a> <a class="cteasersummary" target="_blank"><span class="headline">Paladin Tier Set</span><br />\r\n		<span class="summarytext">The ‘feathered’ plate mail, rendered in silver and gold, creates an aggressive, yet sweeping and powerful silhouette for the paladin.</span></a></div>\r\n	<div class="cteaser">\r\n		<a class="cteaserimg"  target="_blank"><img src="http://eu.media1.battle.net/cms/blog_thumbnail/MKP8J0HP9B1V1316527703712.jpg" /></a> <a class="cteasersummary"  target="_blank"><span class="headline">Rogue Tier Set</span><br />\r\n		<span class="summarytext">A close-fitting mask, collar, and cowl helps reinforce the rogue''s sneaky silhouette, despite the sharp, bladed details.</span></a></div>\r\n	<div class="cteaser">\r\n		<a class="cteaserimg"  target="_blank"><img src="http://eu.media1.battle.net/cms/blog_thumbnail/FV1PBVSBVI8S1317203740617.jpg" /></a> <a class="cteasersummary"  target="_blank"><span class="headline">Priest Tier Set</span><br />\r\n		<span class="summarytext">Creepy, soulless black eyes and a spiked, setting sun motif create the bold two-tone priest set.</span></a></div>\r\n	<div class="cteaser">\r\n		<a class="cteaserimg" target="_blank"><img src="http://eu.media1.battle.net/cms/blog_thumbnail/VO7DROA9BVXD1319724579692.jpg" /></a> <a class="cteasersummary"  target="_blank"><span class="headline">Death Knight Tier Set</span><br />\r\n		<span class="summarytext">The Necrotic Boneplate set features bones stretched and twisted into unnatural shapes by sorcerous means.</span></a></div>\r\n	<div class="cteaser">\r\n		<a class="cteaserimg"  target="_blank"><img src="http://eu.media2.battle.net/cms/gallery/HG43KVD56T0C1320658241819.jpg" /></a> <a class="cteasersummary"  target="_blank"><span class="headline">Tier Set Bonuses</span><br />\r\n		<span class="summarytext">With all the visuals of the tier sets, let’s not forget the magic that lays imbued betwixt their stitches and plating!</span></a></div>\r\n	<p style="clear: both;">&#160;</p>\r\n	<div class="ctextheadline">\r\n		<img src="http://eu.media3.battle.net/cms/gallery/GT6C6FTS92F51320833637514.jpg" style="width: 580px; height: 45px;" />\r\n		<h1>\r\n			Raids &amp; Dungeons</h1>\r\n	</div>\r\n	<div class="cteaser">\r\n		<a class="cteaserimg"  target="_blank"><img src="http://eu.media1.battle.net/cms/blog_thumbnail/RFXF4JIWWNTT1288709394829.jpg" /></a> <a class="cteasersummary"  target="_blank"><span class="headline">Raid Preview: Dragon Soul</span><br />\r\n		<span class="summarytext">Assist Thrall and the Dragon Aspects as they seek to bring an end to the Black Dragonflight once and for all.</span></a></div>\r\n	<div class="cteaser">\r\n		<a class="cteaserimg" target="_blank"><img src="http://eu.media4.battle.net/cms/blog_thumbnail/4X5B4WE74Q001316422569592.jpg" /></a> <a class="cteasersummary" target="_blank"><span class="headline">Dungeons Preview: End Time</span><br />\r\n		<span class="summarytext">Deathwing roams the skies of Azeroth, wreaking havoc on the land and its people -- how can you stop him?</span></a></div>\r\n	<div class="cteaser">\r\n		<a class="cteaserimg" target="_blank"><img src="http://eu.media1.battle.net/cms/blog_thumbnail/V9OA0INVOZHK1316422710831.jpg" /></a> <a class="cteasersummary"  target="_blank"><span class="headline">Dungeons Preview: Well of Eternity</span><br />\r\n		<span class="summarytext">Witness one of the most catastrophic events in Azeroth’s history: the War of the Ancients!</span></a></div>\r\n	<div class="cteaser">\r\n		<a class="cteaserimg" target="_blank"><img src="http://eu.media2.battle.net/cms/blog_thumbnail/RASNKQG5BHE11316426431395.jpg" /></a> <a class="cteasersummary" target="_blank"><span class="headline">Dungeons Preview: Hour of Twilight</span><br />\r\n		<span class="summarytext">A most dangerous task awaits you: Escort Thrall and the Dragon Soul safely to Wyrmrest Temple, for the assault on Deathwing.</span></a></div>\r\n	<p style="clear: both;">&#160;</p>\r\n	\r\n	\r\n	\r\n	\r\n			\r\n				<tbody>\r\n<!-- repeat for every media coverage link you have -->					<tr>\r\n						\r\n<!-- repeat until here for every media coverage link you have -->				</tbody>\r\n			\r\n		\r\n	<p style="clear: both;">&#160;</p>\r\n</div>\r\n<style type="text/css">\r\n#blog .detail #center {\r\nwidth: 590px;\r\nmargin: 0px auto;\r\n}\r\n#blog .detail div.ctextheadline {\r\nposition: relative;\r\ndisplay: block;\r\ntext-decoration: none;\r\nline-height:1 !important;\r\nfont-family: Arial !important;\r\nmargin-left: 3px;\r\n}\r\n#blog .detail div.ctextheadline h1 {\r\nposition: absolute;\r\ntop: 13px;\r\nleft: 30px;\r\ncolor: #ffb001 !important;\r\nfont-size: 23px !important;\r\n}\r\n#blog .detail div.cteaser, #blog .detail img, #blog .detail div.cteaserg {\r\n-moz-border-radius:4px;\r\n-webkit-border-radius:4px;\r\nborder-radius:4px;\r\n-moz-box-shadow:0 0 20px #000000;\r\n-webkit-box-shadow:0 0 20px #000000;\r\nbox-shadow:0 0 20px #000000;\r\nborder: 1px solid #372511;\r\npadding: 1px;\r\n}\r\n#blog .detail div.cteaser, #blog .detail div.cteaserg {\r\nwidth: 285px;\r\nheight: 144px;\r\nmargin: 8px 3px 0px 3px;\r\npadding-top: 5px;\r\nbackground-color: #1D100A;\r\nfloat:left;\r\n}\r\n#blog .detail div.cteaser:hover {\r\nborder: 1px solid #CD9000;\r\nbackground-color: #40200d;\r\n}\r\n#blog .detail .cteaser a.cteaserimg, #blog .detail .cteaserg div.cteaserimg {\r\ndisplay: block;\r\nwidth: 125px;\r\nheight: 140px;\r\ntext-align: center;\r\nfloat: left;\r\n}\r\n#blog .detail .cteaser a.cteaserimg img, #blog .detail .cteaserg div.cteaserimg img {\r\n-moz-border-radius:10px;\r\n-webkit-border-radius:10px;\r\nborder-radius:10px;\r\n-moz-box-shadow:0 0 20px #000000;\r\n-webkit-box-shadow:0 0 20px #000000;\r\nbox-shadow:0 0 20px #000000;\r\nborder: 1px solid #1D100A;\r\nvertical-align: middle;\r\nwidth: 109px;\r\nheight: 109px;\r\nmargin-top: 10px;\r\npadding: 1px;\r\n}\r\n#blog .detail .cteaser a.cteasersummary, #blog .detail .cteaserg div.cteasersummary {\r\ndisplay: block;\r\npadding-right: 3px;\r\nline-height: 1.4 !important;\r\nwidth: 157px;\r\nheight: 140px;\r\nfloat: left;\r\n}\r\n#blog .detail .cteaser a.cteasersummary span.headline, #blog .detail .cteaserg div.cteasersummary span.headline {\r\ncolor: #d19205 !important;\r\nfont-size: 17px !important;\r\ntext-weight: bold !important;\r\n}\r\n#blog .detail .cteaser a.cteasersummary span.summarytext, #blog .detail .cteaserg div.cteasersummary span.summarytext {\r\ncolor: #ad8460 !important;\r\nfont-size: 12px !important;\r\n}\r\n.top-list tr:nth-child(2) td {\r\ncolor: #F0E29A;\r\nbackground-color: transparent;\r\n}\r\n.top-list-interior table tbody tr td {\r\nbackground-color: none !important;\r\ncolor: #EFC9A0 !important;\r\nfont-weight: normal !important;\r\nvertical-align: top;\r\n}\r\n.top-list-interior table tbody tr:hover td {\r\ncolor: #fff !important;\r\n}</style>\r\n\r\n\r\n					\r\nHope you enjoy, and we will let you know what is fixed and what is not.', NULL, 'Patch 4.3: Hour of Twilight', 0, '4.3.0');

-- --------------------------------------------------------

--
-- Table structure for table `petition`
--

CREATE TABLE IF NOT EXISTS `petition` (
  `ownerguid` int(10) unsigned NOT NULL,
  `petitionguid` int(10) unsigned DEFAULT '0',
  `name` varchar(24) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ownerguid`,`type`),
  UNIQUE KEY `index_ownerguid_petitionguid` (`ownerguid`,`petitionguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guild System';

-- --------------------------------------------------------

--
-- Table structure for table `petition_sign`
--

CREATE TABLE IF NOT EXISTS `petition_sign` (
  `ownerguid` int(10) unsigned NOT NULL,
  `petitionguid` int(10) unsigned NOT NULL DEFAULT '0',
  `playerguid` int(10) unsigned NOT NULL DEFAULT '0',
  `player_account` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`petitionguid`,`playerguid`),
  KEY `Idx_playerguid` (`playerguid`),
  KEY `Idx_ownerguid` (`ownerguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guild System';

-- --------------------------------------------------------

--
-- Table structure for table `pet_aura`
--

CREATE TABLE IF NOT EXISTS `pet_aura` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `caster_guid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Full Global Unique Identifier',
  `spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `effect_mask` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `recalculate_mask` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stackcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `amount0` mediumint(8) NOT NULL,
  `amount1` mediumint(8) NOT NULL,
  `amount2` mediumint(8) NOT NULL,
  `base_amount0` mediumint(8) NOT NULL,
  `base_amount1` mediumint(8) NOT NULL,
  `base_amount2` mediumint(8) NOT NULL,
  `maxduration` int(11) NOT NULL DEFAULT '0',
  `remaintime` int(11) NOT NULL DEFAULT '0',
  `remaincharges` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`,`effect_mask`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Pet System';

-- --------------------------------------------------------

--
-- Table structure for table `pet_spell`
--

CREATE TABLE IF NOT EXISTS `pet_spell` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `spell` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `active` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Pet System';

-- --------------------------------------------------------

--
-- Table structure for table `pet_spell_cooldown`
--

CREATE TABLE IF NOT EXISTS `pet_spell_cooldown` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `spell` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pool_quest_save`
--

CREATE TABLE IF NOT EXISTS `pool_quest_save` (
  `pool_id` int(10) unsigned NOT NULL DEFAULT '0',
  `quest_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pool_id`,`quest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

CREATE TABLE IF NOT EXISTS `prices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `service` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'vote',
  `vp` int(10) DEFAULT '0',
  `dp` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `prices`
--

INSERT INTO `prices` (`id`, `service`, `type`, `vp`, `dp`) VALUES
(2, 'race-change', 'vote', 500, 0),
(3, 'appear-change', 'vote', 400, 0),
(4, 'faction-change', 'vote', 600, 10);

-- --------------------------------------------------------

--
-- Table structure for table `realmcharacters`
--

CREATE TABLE IF NOT EXISTS `realmcharacters` (
  `realmid` int(10) unsigned NOT NULL DEFAULT '0',
  `acctid` int(10) unsigned NOT NULL,
  `numchars` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmid`,`acctid`),
  KEY `acctid` (`acctid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Realm Character Tracker';

-- --------------------------------------------------------

--
-- Table structure for table `realmlist`
--

CREATE TABLE IF NOT EXISTS `realmlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `port` smallint(5) unsigned NOT NULL DEFAULT '8085',
  `icon` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `timezone` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `allowedSecurityLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `population` float unsigned NOT NULL DEFAULT '0',
  `gamebuild` int(10) unsigned NOT NULL DEFAULT '12340',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Realm System' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `realmlist`
--

INSERT INTO `realmlist` (`id`, `name`, `address`, `port`, `icon`, `flag`, `timezone`, `allowedSecurityLevel`, `population`, `gamebuild`) VALUES
(1, 'Trinity', '127.0.0.1', 8085, 1, 0, 1, 0, 0, 12340);

-- --------------------------------------------------------

--
-- Table structure for table `realms`
--

CREATE TABLE IF NOT EXISTS `realms` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `realmid` int(10) DEFAULT NULL,
  `world_db` varchar(255) NOT NULL DEFAULT 'world',
  `char_db` varchar(255) NOT NULL DEFAULT 'characters',
  `version` varchar(15) NOT NULL DEFAULT '4.0.6a',
  `drop_rate` varchar(5) NOT NULL DEFAULT '1x',
  `exp_rate` varchar(5) NOT NULL DEFAULT '1x',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `realms`
--

INSERT INTO `realms` (`id`, `realmid`, `world_db`, `char_db`, `version`, `drop_rate`, `exp_rate`) VALUES
(1, 1, 'world', 'characters', '4.0.6a', '1x', '1x');

-- --------------------------------------------------------

--
-- Table structure for table `reserved_name`
--

CREATE TABLE IF NOT EXISTS `reserved_name` (
  `name` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player Reserved Names';

-- --------------------------------------------------------

--
-- Table structure for table `rewards`
--

CREATE TABLE IF NOT EXISTS `rewards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  `item1` int(10) unsigned NOT NULL,
  `item2` int(10) unsigned NOT NULL,
  `item3` int(10) unsigned NOT NULL,
  `item4` int(10) unsigned NOT NULL,
  `item5` int(10) unsigned NOT NULL,
  `item6` int(10) unsigned NOT NULL,
  `item7` int(10) unsigned NOT NULL,
  `item8` int(10) unsigned NOT NULL,
  `gold` int(10) unsigned NOT NULL,
  `price` float unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `servers`
--

CREATE TABLE IF NOT EXISTS `servers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `host` varchar(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `database` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `shouts`
--

CREATE TABLE IF NOT EXISTS `shouts` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `author` varchar(255) DEFAULT NULL,
  `body` longtext,
  `date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `slideshows`
--

CREATE TABLE IF NOT EXISTS `slideshows` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT '#',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `slideshows`
--

INSERT INTO `slideshows` (`id`, `title`, `description`, `image`, `link`) VALUES
(4, 'Title1', 'Description1', 'community01.png', '#'),
(5, 'Title2', 'Description2', 'draenei.jpg', '#');

-- --------------------------------------------------------

--
-- Table structure for table `uptime`
--

CREATE TABLE IF NOT EXISTS `uptime` (
  `realmid` int(10) unsigned NOT NULL,
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `uptime` int(10) unsigned NOT NULL DEFAULT '0',
  `maxplayers` smallint(5) unsigned NOT NULL DEFAULT '0',
  `revision` varchar(255) NOT NULL DEFAULT 'Trinitycore',
  PRIMARY KEY (`realmid`,`starttime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Uptime system';

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) NOT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT '0-0.jpg',
  `blizz` tinyint(1) DEFAULT '0',
  `class` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `character` int(10) NOT NULL DEFAULT '0',
  `vote_points` int(10) NOT NULL DEFAULT '0',
  `donation_points` int(10) NOT NULL DEFAULT '0',
  `char_realm` int(10) NOT NULL DEFAULT '1',
  `registerIp` varchar(30) NOT NULL DEFAULT '0-0-0-0',
  `country` varchar(20) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `quest1` int(2) NOT NULL DEFAULT '0',
  `ans1` varchar(50) NOT NULL DEFAULT 'undefined',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `version`
--

CREATE TABLE IF NOT EXISTS `version` (
  `Name` text,
  `Number` varchar(10) DEFAULT NULL,
  `Revision` varchar(10) DEFAULT NULL,
  `DB_Version` varchar(50) DEFAULT NULL,
  `Updates` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This here shows you what Version of WoWFailureCMS you have.';

--
-- Dumping data for table `version`
--

INSERT INTO `version` (`Name`, `Number`, `Revision`, `DB_Version`, `Updates`) VALUES
('AquaFlameCMS', 'v6', '192', 'v6', '0');

-- --------------------------------------------------------

--
-- Table structure for table `vote`
--

CREATE TABLE IF NOT EXISTS `vote` (
  `ID` int(10) DEFAULT NULL COMMENT 'ID has to be from 1 to 5',
  `Name` varchar(50) DEFAULT NULL COMMENT 'This is the Name of the Voting Site.',
  `Link` text COMMENT 'It must have http:// to work properly',
  `Description` text COMMENT 'Add the Description for the Voting'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This Table is all about the Infortmation for the Vote Panel.';

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE IF NOT EXISTS `votes` (
  `id` int(10) DEFAULT NULL,
  `userid` int(10) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `voteid` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `warden_action`
--

CREATE TABLE IF NOT EXISTS `warden_action` (
  `wardenId` smallint(5) unsigned NOT NULL,
  `action` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`wardenId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `worldstates`
--

CREATE TABLE IF NOT EXISTS `worldstates` (
  `entry` int(10) unsigned NOT NULL DEFAULT '0',
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` tinytext,
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variable Saves';

--
-- Dumping data for table `worldstates`
--

INSERT INTO `worldstates` (`entry`, `value`, `comment`) VALUES
(20001, 0, 'NextArenaPointDistributionTime'),
(20002, 0, 'NextWeeklyQuestResetTime'),
(20003, 0, 'NextBGRandomDailyResetTime'),
(20004, 0, 'cleaning_flags');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
