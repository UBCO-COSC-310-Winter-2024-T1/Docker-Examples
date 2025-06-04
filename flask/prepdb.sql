SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE DATABASE IF NOT EXISTS demo_db;
USE demo_db;

--
-- Create webuser account for accessing database from apache/php with limited permissions
-- Note: this is different that the websites 'user' account
--
CREATE USER IF NOT EXISTS 'webuser'@'localhost' IDENTIFIED BY 'P@ssw0rd';
CREATE USER IF NOT EXISTS 'webuser'@'%' IDENTIFIED BY 'P@ssw0rd';
GRANT  INSERT, UPDATE, DELETE, SELECT ON lab9.* TO 'webuser'@'localhost';
GRANT  INSERT, UPDATE, DELETE, SELECT ON lab9.* TO 'webuser'@'%';

FLUSH PRIVILEGES;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

FLUSH TABLES;

INSERT IGNORE INTO `users` (`username`, `firstName`, `lastName`, `email`, `password`) VALUES
('dvader', 'darth', 'vader', 'vader@dark.force', '0f359740bd1cda994f8b55330c86d845');

INSERT IGNORE INTO `users` (`username`, `firstName`, `lastName`, `email`, `password`) VALUES
('lskywalker', 'luke', 'skywalker-vader', 'luke@light.force', 'p@ssw0rd');


--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `email` (`email`);
  
ALTER TABLE `users` ADD `userID` INT NOT NULL AUTO_INCREMENT , ADD UNIQUE (`userID`);

FLUSH TABLES;