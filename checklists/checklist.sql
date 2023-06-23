-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 23, 2023 at 09:02 AM
-- Server version: 5.6.51
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `checklist`
--

-- --------------------------------------------------------

--
-- Table structure for table `checklists`
--

CREATE TABLE `checklists` (
  `checklist_id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `checklists`
--

INSERT INTO `checklists` (`checklist_id`, `title`, `description`) VALUES
(1, 'ЧЕКЛИСТ ТЕХНИЧЕСКОГО АУДИТА САЙТА', 'описание');

-- --------------------------------------------------------

--
-- Table structure for table `checklists_items`
--

CREATE TABLE `checklists_items` (
  `item_id` int(11) NOT NULL,
  `checklist_id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `checklists_items`
--

INSERT INTO `checklists_items` (`item_id`, `checklist_id`, `title`, `description`) VALUES
(1, 1, 'Robots.txt', 'Robots.txt - это...'),
(2, 1, 'Sitemap.xml', 'Sitemap.xml - это...'),
(3, 1, '301 редирект', '301 редирект - это...'),
(4, 1, '404 страница', '404 страница - это...'),
(5, 1, 'Ошибки 5**', 'Ошибки 5** - это...'),
(6, 1, 'HTTP/HTTPS', 'HTTP/HTTPS - это...'),
(7, 1, 'Человеко Понятный Урл (ЧПУ)', 'Человеко Понятный Урл (ЧПУ) - это...');

-- --------------------------------------------------------

--
-- Table structure for table `checklists_sub_items`
--

CREATE TABLE `checklists_sub_items` (
  `sub_item_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `checklists_sub_items`
--

INSERT INTO `checklists_sub_items` (`sub_item_id`, `item_id`, `title`) VALUES
(1, 1, 'Закрыты служебные и ненужные разделы.'),
(2, 1, 'Закрыты разные User-Agent для Яндекса и других роботов.'),
(3, 1, 'Задано главное зеркало для Яндекса.'),
(4, 1, 'Закрыты страницы с динамическими параметрами.'),
(5, 1, 'Указана ссылка на карту сайта для роботов.'),
(6, 2, 'Чекбокс 1'),
(7, 2, 'Чекбокс 2');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `login` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `login`, `password`) VALUES
(1, 'user', '123'),
(2, 'user 2', '123'),
(3, 'user 3', '123'),
(4, 'user 4', '123');

-- --------------------------------------------------------

--
-- Table structure for table `users_items`
--

CREATE TABLE `users_items` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_items`
--

INSERT INTO `users_items` (`id`, `user_id`, `item_id`, `status`) VALUES
(29, 1, 1, 1),
(30, 1, 2, 0),
(31, 1, 3, 1),
(32, 1, 4, 1),
(33, 1, 5, 0),
(34, 1, 6, 0),
(35, 1, 7, 1),
(57, 2, 1, 1),
(58, 2, 2, 1),
(59, 2, 3, 0),
(60, 2, 4, 0),
(61, 2, 5, 0),
(62, 2, 6, 1),
(63, 2, 7, 1),
(64, 3, 1, 0),
(65, 3, 2, 1),
(66, 3, 3, 1),
(67, 3, 4, 1),
(68, 3, 5, 1),
(69, 3, 6, 0),
(70, 3, 7, 0),
(71, 4, 1, 0),
(72, 4, 2, 1),
(73, 4, 3, 0),
(74, 4, 4, 0),
(75, 4, 5, 1),
(76, 4, 6, 0),
(77, 4, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_sub_items`
--

CREATE TABLE `users_sub_items` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sub_item_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_sub_items`
--

INSERT INTO `users_sub_items` (`id`, `user_id`, `sub_item_id`, `status`) VALUES
(1, 2, 1, 1),
(2, 2, 2, 1),
(3, 2, 3, 1),
(4, 2, 4, 1),
(5, 2, 5, 1),
(6, 1, 1, 1),
(7, 1, 2, 1),
(8, 1, 3, 1),
(9, 1, 4, 0),
(10, 1, 5, 0),
(11, 3, 1, 0),
(12, 3, 2, 0),
(13, 3, 3, 0),
(14, 3, 4, 1),
(15, 3, 5, 1),
(16, 1, 6, 0),
(17, 1, 7, 1),
(18, 4, 1, 0),
(19, 4, 2, 0),
(20, 4, 3, 0),
(21, 4, 4, 0),
(22, 4, 5, 1),
(23, 4, 6, 1),
(24, 4, 7, 0),
(25, 3, 6, 1),
(26, 3, 7, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `checklists`
--
ALTER TABLE `checklists`
  ADD PRIMARY KEY (`checklist_id`);

--
-- Indexes for table `checklists_items`
--
ALTER TABLE `checklists_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `checklist_id` (`checklist_id`);

--
-- Indexes for table `checklists_sub_items`
--
ALTER TABLE `checklists_sub_items`
  ADD PRIMARY KEY (`sub_item_id`),
  ADD KEY `checklist_item_id` (`item_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `users_items`
--
ALTER TABLE `users_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `users_sub_items`
--
ALTER TABLE `users_sub_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`sub_item_id`),
  ADD KEY `sub_item_id` (`sub_item_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `checklists`
--
ALTER TABLE `checklists`
  MODIFY `checklist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `checklists_items`
--
ALTER TABLE `checklists_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `checklists_sub_items`
--
ALTER TABLE `checklists_sub_items`
  MODIFY `sub_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users_items`
--
ALTER TABLE `users_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `users_sub_items`
--
ALTER TABLE `users_sub_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `checklists_items`
--
ALTER TABLE `checklists_items`
  ADD CONSTRAINT `checklists_items_ibfk_1` FOREIGN KEY (`checklist_id`) REFERENCES `checklists` (`checklist_id`);

--
-- Constraints for table `checklists_sub_items`
--
ALTER TABLE `checklists_sub_items`
  ADD CONSTRAINT `checklists_sub_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `checklists_items` (`item_id`);

--
-- Constraints for table `users_items`
--
ALTER TABLE `users_items`
  ADD CONSTRAINT `users_items_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `users_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `checklists_items` (`item_id`);

--
-- Constraints for table `users_sub_items`
--
ALTER TABLE `users_sub_items`
  ADD CONSTRAINT `users_sub_items_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `users_sub_items_ibfk_2` FOREIGN KEY (`sub_item_id`) REFERENCES `checklists_sub_items` (`sub_item_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
