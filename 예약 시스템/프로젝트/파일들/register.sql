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
-- 테이블 구조 `register`
--

CREATE TABLE `register` (
  `id` int(100) NOT NULL,
  `date` date NOT NULL,
  `hour` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` int(100) NOT NULL,
  `howManyPerson` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 테이블의 덤프 데이터 `register`
--

INSERT INTO `register` (`id`, `date`, `hour`, `name`, `phone`, `howManyPerson`, `email`) VALUES
(27, '2022-09-22', '07: 00 PM - 09: 00 PM', 'Gitae Bae', 413730534, 33, 'polsgwnb@naver.com'),
(28, '2022-09-22', '05: 00 PM - 07: 00 PM', 'Gitae Bae', 413730534, 4, 'polsgwnb@gmail.com'),
(29, '2022-09-21', '09: 00 PM - 11: 00 PM', 'Mingu Kang', 482394293, 5, 'Mgkang@gamil.com'),
(30, '2022-10-01', '05: 00 PM - 07: 00 PM', 'Elijah', 424939432, 8, 'Elijah30@gmail.com');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`id`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `register`
--
ALTER TABLE `register`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
