-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 22-09-19 07:45
-- 서버 버전: 10.4.24-MariaDB
-- PHP 버전: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `restaurant`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `register1`
--

CREATE TABLE `register1` (
  `id` int(100) NOT NULL,
  `date` int(11) NOT NULL,
  `hour` varchar(225) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` int(100) NOT NULL,
  `howManyPerson` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 테이블의 덤프 데이터 `register1`
--

INSERT INTO `register1` (`id`, `date`, `hour`, `name`, `phone`, `howManyPerson`, `email`) VALUES
(1, 2022, '09: 00 PM - 11: 00 PM', 'shdgdfaf', 2147483647, 4, 'polsgwnb@naver.com'),
(2, 2022, '05: 00 PM - 07: 00 PM', 'Gitae Bae', 413730534, 5, 'polsgwnb@naver.com'),
(3, 2022, '05: 00 PM - 07: 00 PM', 'shdgdfaf', 2147483647, 3, 'polsgwnb@naver.com');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `register1`
--
ALTER TABLE `register1`
  ADD PRIMARY KEY (`id`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `register1`
--
ALTER TABLE `register1`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
