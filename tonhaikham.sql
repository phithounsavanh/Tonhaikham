-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2016 at 05:59 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tonhaikham`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill_setting`
--

CREATE TABLE `bill_setting` (
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `tell` varchar(225) NOT NULL,
  `footer` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bill_setting`
--

INSERT INTO `bill_setting` (`name`, `address`, `tell`, `footer`) VALUES
('CMS', 'DongDok village, Xaythany district, Vientiane', '020 77494988, 020 77424244', 'thank you for invite der!');

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `discount_id` int(11) NOT NULL,
  `discount` varchar(255) NOT NULL,
  `discount_rate` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `mem_id` int(11) NOT NULL,
  `mem_code` varchar(50) NOT NULL,
  `mem_dateissue` date NOT NULL,
  `mem_expried` date NOT NULL,
  `discount_id` int(11) NOT NULL,
  `mem_name` varchar(50) NOT NULL,
  `mem_surname` varchar(50) NOT NULL,
  `mem_add` text NOT NULL,
  `mem_tel` varchar(11) NOT NULL,
  `mem_note` varchar(225) NOT NULL,
  `mem_status` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `menu_cate_id` int(11) NOT NULL,
  `menu_name` varchar(300) NOT NULL,
  `menu_price` varchar(10) NOT NULL,
  `menu_img` varchar(50) NOT NULL,
  `menu_status` varchar(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_id`, `menu_cate_id`, `menu_name`, `menu_price`, `menu_img`, `menu_status`) VALUES
(49, 42, 'Chicken wing', '5', 'small_bcba6622a14d0c2591b42c0c4ab19db9.jpg', '2'),
(50, 42, 'fish', '8', 'small_65ca400aa92b2101d92f657872230634.jpg', '2'),
(51, 42, 'whole fish', '8', 'small_745719b94c8d13a7c60950edc8bb2c61.jpg', '2'),
(52, 40, 'egg', '5', 'small_bf7170eac30c4735b0654c1683e6e0cb.jpg', '2'),
(53, 41, 'Pizza', '5', 'small_2f8ed835487afca14898894840bf2241.jpg', '2'),
(54, 41, 'Bugur', '5', 'small_cea627a45ee0fc4223c176ad957481e7.jpg', '2'),
(55, 40, 'Vegie', '5', 'small_59c1d4e71beee44eb63f28b9827f22f7.jpg', '2'),
(56, 43, 'bluelight', '5', 'small_dc456314970740bb7a9b8ac513e2bfee.jpg', '2'),
(57, 43, 'hnk', '2', 'small_ff352c4841e159d3e98c77713cf4a9cc.jpg', '2'),
(58, 43, 'beerlao', '3', 'small_0e58c850892c5ab3aa383671880198fe.jpg', '2'),
(59, 43, 'soda', '2', 'small_ae2019018691c19cd060004dce0721c2.jpg', '2'),
(60, 43, 'smothie', '3', 'small_bdc4e2232158b59725983bcdf5728787.jpg', '2');

-- --------------------------------------------------------

--
-- Table structure for table `menu_category`
--

CREATE TABLE `menu_category` (
  `menu_cate_id` int(11) NOT NULL,
  `menu_cate_name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_category`
--

INSERT INTO `menu_category` (`menu_cate_id`, `menu_cate_name`) VALUES
(40, 'Soup'),
(41, 'Grill'),
(42, 'Fire'),
(43, 'Beverage');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `table_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `mem_id` int(255) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `discount_rate_due_order` int(11) NOT NULL,
  `order_status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `table_id`, `order_date`, `mem_id`, `user_id`, `discount_rate_due_order`, `order_status`) VALUES
(311, 20, '2016-03-16 08:05:16', 0, 42, 0, 1),
(312, 20, '2016-03-16 08:07:58', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `order_detail_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `menu_price` float NOT NULL,
  `order_quantity` int(11) NOT NULL,
  `order_detail_date` datetime NOT NULL,
  `order_detail_status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`order_detail_id`, `menu_id`, `order_id`, `user_id`, `menu_price`, `order_quantity`, `order_detail_date`, `order_detail_status`) VALUES
(1800, 53, 311, 42, 5, 1, '2016-03-16 08:03:21', 3),
(1801, 54, 311, 42, 5, 1, '2016-03-16 08:03:23', 3),
(1802, 57, 311, 42, 2, 1, '2016-03-16 08:04:58', 3),
(1803, 49, 312, 42, 5, 1, '2016-03-16 08:07:58', 3),
(1804, 49, 312, 42, 5, 1, '2016-03-16 08:07:59', 3),
(1805, 54, 312, 42, 5, 1, '2016-03-16 09:43:32', 1),
(1806, 53, 312, 42, 5, 1, '2016-03-16 09:43:33', 1),
(1807, 53, 312, 42, 5, 1, '2016-03-16 09:43:36', 1);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reserve_id` int(11) NOT NULL,
  `table_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reserve_name` varchar(100) NOT NULL,
  `reserve_tel` varchar(50) NOT NULL,
  `reserve_date_add` datetime NOT NULL,
  `reserve_on_date` datetime NOT NULL,
  `reserve_status` tinyint(2) NOT NULL,
  `reserve_note` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `table_detail`
--

CREATE TABLE `table_detail` (
  `table_id` int(50) NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `tb_status_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table_detail`
--

INSERT INTO `table_detail` (`table_id`, `table_name`, `tb_status_id`) VALUES
(20, 'A1', 2);

-- --------------------------------------------------------

--
-- Table structure for table `table_status`
--

CREATE TABLE `table_status` (
  `tb_status_id` int(11) NOT NULL,
  `tb_status` varchar(25) NOT NULL,
  `tb_color` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table_status`
--

INSERT INTO `table_status` (`tb_status_id`, `tb_status`, `tb_color`) VALUES
(1, 'Free', 'green'),
(2, 'Busy', 'red'),
(3, 'Reservation', 'yellow');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_surname` varchar(50) NOT NULL,
  `user_add` varchar(300) NOT NULL,
  `user_tel` varchar(50) NOT NULL,
  `user_role` int(10) NOT NULL,
  `user_more_info` text NOT NULL,
  `user_status` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user`, `user_password`, `user_name`, `user_surname`, `user_add`, `user_tel`, `user_role`, `user_more_info`, `user_status`) VALUES
(42, 'admin', '123456', 'admin', 'adminstrator', 'admin', '', 1, 'This user allow to manage everything in the system.', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`discount_id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`mem_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `menu_category`
--
ALTER TABLE `menu_category`
  ADD PRIMARY KEY (`menu_cate_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`order_detail_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reserve_id`);

--
-- Indexes for table `table_detail`
--
ALTER TABLE `table_detail`
  ADD PRIMARY KEY (`table_id`);

--
-- Indexes for table `table_status`
--
ALTER TABLE `table_status`
  ADD PRIMARY KEY (`tb_status_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `discount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `mem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `menu_category`
--
ALTER TABLE `menu_category`
  MODIFY `menu_cate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=313;
--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1808;
--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reserve_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;
--
-- AUTO_INCREMENT for table `table_detail`
--
ALTER TABLE `table_detail`
  MODIFY `table_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `table_status`
--
ALTER TABLE `table_status`
  MODIFY `tb_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
