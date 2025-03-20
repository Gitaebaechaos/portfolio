-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 22-09-19 07:55
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

-- --------------------------------------------------------

--
-- 테이블 구조 `register2`
--

CREATE TABLE `register2` (
  `id` int(100) NOT NULL,
  `date` date NOT NULL,
  `hour` varchar(225) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` int(100) NOT NULL,
  `howManyPerson` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 테이블의 덤프 데이터 `register2`
--

INSERT INTO `register2` (`id`, `date`, `hour`, `name`, `phone`, `howManyPerson`, `email`) VALUES
(1, '2022-09-23', '07: 00 PM - 09: 00 PM', 'Gitae Bae', 413730534, 5, 'polsgwnb@naver.com');

-- --------------------------------------------------------

--
-- 테이블 구조 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 테이블의 덤프 데이터 `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`) VALUES
(1, 'Gitae Bae', 'polsgwnb@naver.com', 'a5933e2b28190e2e7b81bf9ead54ffd8');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `register1`
--
ALTER TABLE `register1`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `register2`
--
ALTER TABLE `register2`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `register`
--
ALTER TABLE `register`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- 테이블의 AUTO_INCREMENT `register1`
--
ALTER TABLE `register1`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 테이블의 AUTO_INCREMENT `register2`
--
ALTER TABLE `register2`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 테이블의 AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
