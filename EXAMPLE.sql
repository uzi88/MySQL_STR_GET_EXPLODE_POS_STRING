-- 
-- Projectname:   MySQL FUNCTION STR_GET_EXPLODE_POS_STRING
-- Version:       1.0
-- Author:        Radovan Janjic <rade@it-radionica.com>
-- Last modified: 27 09 2013
-- Copyright (C): 2013 IT-radionica.com, All Rights Reserved
--
-- ------------------------------------------------------------------------------------
-- 
-- USAGE EXAMPLE
-- 

SELECT STR_GET_EXPLODE_POS_STRING('this-is-some-image.jpg',  '.', -1);
-- Returns: jpg


-- Sample data
CREATE TABLE IF NOT EXISTS `explode` ( `test` varchar(500) NOT NULL ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `explode` (`test`) VALUES
('a-bb-ccc-dddd-eeeee'),
('bb-ccc-dddd-eeeee'),
('ccc-dddd-eeeee'),
('dddd-eeeee'),
('eeeee'),
('');

SELECT * FROM `explode`;
-- +---------------------+
-- | test                |
-- +---------------------+
-- | a-bb-ccc-dddd-eeeee |
-- | bb-ccc-dddd-eeeee   |
-- | ccc-dddd-eeeee      |
-- | dddd-eeeee          |
-- | eeeee               |
-- |                     |
-- +---------------------+
-- 6 rows in set (0.00 sec)

SELECT STR_GET_EXPLODE_POS_STRING( `test`, '-', 1 ) FROM `explode`;
-- +------------------------------------------+
-- | STR_GET_EXPLODE_POS_STRING(test, '-', 1) |
-- +------------------------------------------+
-- | a                                        |
-- | bb                                       |
-- | ccc                                      |
-- | dddd                                     |
-- | eeeee                                    |
-- |                                          |
-- +------------------------------------------+
-- 6 rows in set (0.00 sec)


SELECT STR_GET_EXPLODE_POS_STRING( `test`, '-', 2 ) FROM `explode`;
-- +----------------------------------------------+
-- | STR_GET_EXPLODE_POS_STRING( `test`,  '-', 2) |
-- +----------------------------------------------+
-- | bb                                           |
-- | ccc                                          |
-- | dddd                                         |
-- | eeeee                                        |
-- |                                              |
-- |                                              |
-- +----------------------------------------------+
-- 6 rows in set (0.00 sec)

--
-- etc.
-- 

SELECT STR_GET_EXPLODE_POS_STRING( `test`, '-', -1 ) FROM `explode`;
-- +-----------------------------------------------+
-- | STR_GET_EXPLODE_POS_STRING( `test`,  '-', -1) |
-- +-----------------------------------------------+
-- | eeeee                                         |
-- | eeeee                                         |
-- | eeeee                                         |
-- | eeeee                                         |
-- | eeeee                                         |
-- |                                               |
-- +-----------------------------------------------+
-- 6 rows in set (0.00 sec)


SELECT STR_GET_EXPLODE_POS_STRING( `test`, '-', -2 ) FROM `explode`;
-- +-----------------------------------------------+
-- | STR_GET_EXPLODE_POS_STRING( `test`,  '-', -2) |
-- +-----------------------------------------------+
-- | dddd                                          |
-- | dddd                                          |
-- | dddd                                          |
-- | dddd                                          |
-- |                                               |
-- |                                               |
-- +-----------------------------------------------+
-- 6 rows in set (0.00 sec)

--
-- etc.
-- 
