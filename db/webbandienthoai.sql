-- --------------------------------------------------------
-- Máy chủ:                      127.0.0.1
-- Phiên bản máy chủ:            10.4.32-MariaDB - mariadb.org binary distribution
-- HĐH máy chủ:                  Win64
-- HeidiSQL Phiên bản:           12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for webbandienthoai
CREATE DATABASE IF NOT EXISTS `webbandienthoai` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `webbandienthoai`;

-- Dumping structure for bảng webbandienthoai.app_accessory
CREATE TABLE IF NOT EXISTS `app_accessory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `price` decimal(12,0) NOT NULL,
  `image` varchar(200) NOT NULL,
  `specs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`specs`)),
  `category_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `app_accessory_category_id_e2456581_fk_app_accessorycategory_id` (`category_id`),
  CONSTRAINT `app_accessory_category_id_e2456581_fk_app_accessorycategory_id` FOREIGN KEY (`category_id`) REFERENCES `app_accessorycategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Đang đổ dữ liệu cho bảng webbandienthoai.app_accessory: ~27 rows (xấp xỉ)
INSERT INTO `app_accessory` (`id`, `name`, `slug`, `brand`, `price`, `image`, `specs`, `category_id`) VALUES
	(1, 'Ốp lưng iPhone 15 Pro MagSafe', 'op-lung-iphone-15-pro-magsafe', 'Apple', 1290000, 'https://picsum.photos/seed/op-lung-iphone-15-pro-magsafe/800/600', '{"material":"silicone","magsafe":true,"compatibility":["iPhone 15 Pro"]}', 1),
	(2, 'Ốp lưng trong suốt Galaxy S24 Ultra', 'op-lung-trong-suot-s24u', 'Samsung', 249000, 'https://picsum.photos/seed/op-lung-trong-suot-s24u/800/600', '{"material":"TPU trong","compatibility":["Galaxy S24 Ultra"]}', 1),
	(3, 'Ốp lưng chống sốc Pixel 8 Pro', 'op-lung-chong-soc-pixel-8-pro', 'Spigen', 390000, 'https://picsum.photos/seed/op-lung-chong-soc-pixel-8-pro/800/600', '{"material":"PC+TPU","milstd810g":true,"compatibility":["Pixel 8 Pro"]}', 1),
	(4, 'Củ sạc nhanh 20W USB-C', 'cu-sac-20w-usbc', 'Apple', 490000, 'https://picsum.photos/seed/cu-sac-20w-usbc/800/600', '{"power":"20W","port":"USB-C"}', 2),
	(5, 'Củ sạc nhanh 25W USB-C PD', 'cu-sac-25w-usbc-pd', 'Samsung', 390000, 'https://picsum.photos/seed/cu-sac-25w-usbc-pd/800/600', '{"power":"25W","standard":"USB-PD PPS"}', 2),
	(6, 'Củ sạc đôi 45W (20W+25W)', 'cu-sac-doi-45w', 'Baseus', 590000, 'https://picsum.photos/seed/cu-sac-doi-45w/800/600', '{"power_total":"45W","ports":[{"type":"USB-C","w":25},{"type":"USB-A","w":20}]}', 2),
	(7, 'Cáp USB-C to USB-C 1m', 'cap-usbc-1m', 'Anker', 190000, 'https://picsum.photos/seed/cap-usbc-1m/800/600', '{"length":"1m","standard":"USB-C 2.0","current":"3A"}', 3),
	(8, 'Cáp USB-C to Lightning 1m MFi', 'cap-usbc-lightning-1m', 'Ugreen', 240000, 'https://picsum.photos/seed/cap-usbc-lightning-1m/800/600', '{"length":"1m","mfi":true,"fastcharge":"20W"}', 3),
	(9, 'Cáp USB-A to USB-C 2m', 'cap-usba-usbc-2m', 'Belkin', 160000, 'https://picsum.photos/seed/cap-usba-usbc-2m/800/600', '{"length":"2m","current":"2.4A"}', 3),
	(10, 'Tai nghe TWS ANC', 'tai-nghe-tws-anc', 'Soundcore', 1790000, 'https://picsum.photos/seed/tai-nghe-tws-anc/800/600', '{"type":"TWS","anc":true,"codec":["AAC","SBC"]}', 4),
	(11, 'Tai nghe có dây 3.5mm', 'tai-nghe-co-day-3-5', 'Sony', 390000, 'https://picsum.photos/seed/tai-nghe-co-day-3-5/800/600', '{"type":"wired","jack":"3.5mm"}', 4),
	(12, 'Tai nghe Bluetooth neckband', 'tai-nghe-neckband', 'Xiaomi', 590000, 'https://picsum.photos/seed/tai-nghe-neckband/800/600', '{"type":"bluetooth","battery":"20h"}', 4),
	(13, 'Pin dự phòng 10000mAh 22.5W', 'pin10000-22w', 'Baseus', 490000, 'https://picsum.photos/seed/pin10000-22w/800/600', '{"capacity":"10000mAh","max_output":"22.5W","ports":["USB-C","USB-A"]}', 5),
	(14, 'Pin dự phòng 20000mAh 65W', 'pin20000-65w', 'Anker', 1590000, 'https://picsum.photos/seed/pin20000-65w/800/600', '{"capacity":"20000mAh","max_output":"65W","pd":true}', 5),
	(15, 'Dán màn hình iPhone 15 Pro (2 miếng)', 'dan-man-iphone-15-pro', 'Nillkin', 190000, 'https://picsum.photos/seed/dan-man-iphone-15-pro/800/600', '{"hardness":"9H","layers":2,"compatibility":["iPhone 15 Pro"]}', 6),
	(16, 'Dán màn hình Galaxy S24 Ultra cong', 'dan-man-s24u', 'Whitestone', 390000, 'https://picsum.photos/seed/dan-man-s24u/800/600', '{"hardness":"9H","edge":"3D","compatibility":["Galaxy S24 Ultra"]}', 6),
	(17, 'Đế sạc không dây 15W', 'de-sac-khong-day-15w', 'Samsung', 690000, 'https://picsum.photos/seed/de-sac-khong-day-15w/800/600', '{"wireless":"Qi","power":"15W"}', 7),
	(18, 'Đế sạc MagSafe 3-in-1', 'de-sac-magsafe-3in1', 'Belkin', 2590000, 'https://picsum.photos/seed/de-sac-magsafe-3in1/800/600', '{"wireless":"MagSafe","devices":["iPhone","Watch","AirPods"]}', 7),
	(19, 'Dock sạc bàn 6 cổng', 'dock-sac-6-cong', 'Ugreen', 890000, 'https://picsum.photos/seed/dock-sac-6-cong/800/600', '{"ports":["2xUSB-C","4xUSB-A"],"total_power":"100W"}', 8),
	(20, 'Giá đỡ điện thoại để bàn', 'gia-do-ban', 'Lamicall', 220000, 'https://picsum.photos/seed/gia-do-ban/800/600', '{"material":"aluminum","angle_adjust":"0-70°"}', 9),
	(21, 'Giá kẹp điện thoại cho ô tô', 'gia-kep-o-to', 'Baseus', 290000, 'https://picsum.photos/seed/gia-kep-o-to/800/600', '{"mount":"air-vent","rotation":"360°"}', 9),
	(22, 'Thẻ nhớ microSD 128GB U3', 'the-nho-microsd-128-u3', 'SanDisk', 390000, 'https://picsum.photos/seed/the-nho-microsd-128-u3/800/600', '{"capacity":"128GB","speed":"U3 V30"}', 10),
	(23, 'Thẻ nhớ microSD 256GB A2', 'the-nho-microsd-256-a2', 'Kingston', 690000, 'https://picsum.photos/seed/the-nho-microsd-256-a2/800/600', '{"capacity":"256GB","app_performance":"A2"}', 10),
	(24, 'Bút cảm ứng capacitive', 'but-cam-ung-capacitive', 'Baseus', 240000, 'https://picsum.photos/seed/but-cam-ung-capacitive/800/600', '{"tip":"capacitive","compatibility":["iOS","Android"]}', 11),
	(25, 'Bút cảm ứng Active Stylus', 'but-cam-ung-active', 'Zagg', 1290000, 'https://picsum.photos/seed/but-cam-ung-active/800/600', '{"tip":"active","palm_reject":true,"charging":"USB-C"}', 11),
	(26, 'Lens góc rộng kẹp điện thoại', 'lens-goc-rong-clip', 'Apexel', 490000, 'https://picsum.photos/seed/lens-goc-rong-clip/800/600', '{"type":"wide","mount":"clip"}', 12),
	(27, 'Gimbal chống rung 3 trục', 'gimbal-3-truc', 'Hohem', 1990000, 'https://picsum.photos/seed/gimbal-3-truc/800/600', '{"axes":3,"max_payload":"300g","battery":"10h"}', 13);

-- Dumping structure for bảng webbandienthoai.app_accessorycategory
CREATE TABLE IF NOT EXISTS `app_accessorycategory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Đang đổ dữ liệu cho bảng webbandienthoai.app_accessorycategory: ~13 rows (xấp xỉ)
INSERT INTO `app_accessorycategory` (`id`, `name`, `slug`) VALUES
	(1, 'Ốp lưng', 'op-lung'),
	(2, 'Sạc', 'sac'),
	(3, 'Cáp', 'cap'),
	(4, 'Tai nghe', 'tai-nghe'),
	(5, 'Pin dự phòng', 'pin-du-phong'),
	(6, 'Dán màn hình', 'dan-man-hinh'),
	(7, 'Sạc không dây', 'sac-khong-day'),
	(8, 'Dock/Đế sạc', 'dock-sac'),
	(9, 'Giá đỡ điện thoại', 'gia-do'),
	(10, 'Thẻ nhớ', 'the-nho'),
	(11, 'Bút cảm ứng', 'but-cam-ung'),
	(12, 'Ống kính rời', 'ong-kinh'),
	(13, 'Gimbal/Chống rung', 'gimbal');

-- Dumping structure for bảng webbandienthoai.app_accessorycolor
CREATE TABLE IF NOT EXISTS `app_accessorycolor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price` decimal(12,0) DEFAULT NULL,
  `accessory_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_accessorycolor_accessory_id_5e21d338_fk_app_accessory_id` (`accessory_id`),
  CONSTRAINT `app_accessorycolor_accessory_id_5e21d338_fk_app_accessory_id` FOREIGN KEY (`accessory_id`) REFERENCES `app_accessory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Đang đổ dữ liệu cho bảng webbandienthoai.app_accessorycolor: ~7 rows (xấp xỉ)
INSERT INTO `app_accessorycolor` (`id`, `name`, `price`, `accessory_id`) VALUES
	(1, 'Đen', NULL, 1),
	(2, 'Xanh', NULL, 1),
	(3, 'Trong suốt', 1390000, 1),
	(4, 'Đen', NULL, 10),
	(5, 'Trắng', NULL, 10),
	(6, 'Đen', NULL, 14),
	(7, 'Xanh đen', NULL, 14);

-- Dumping structure for bảng webbandienthoai.app_accessorycompatibleproduct
CREATE TABLE IF NOT EXISTS `app_accessorycompatibleproduct` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accessory_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_accessorycompatiblep_accessory_id_product_id_25524ff7_uniq` (`accessory_id`,`product_id`),
  KEY `app_accessorycompati_product_id_4d5dcd6c_fk_app_produ` (`product_id`),
  CONSTRAINT `app_accessorycompati_accessory_id_ed956265_fk_app_acces` FOREIGN KEY (`accessory_id`) REFERENCES `app_accessory` (`id`),
  CONSTRAINT `app_accessorycompati_product_id_4d5dcd6c_fk_app_produ` FOREIGN KEY (`product_id`) REFERENCES `app_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Đang đổ dữ liệu cho bảng webbandienthoai.app_accessorycompatibleproduct: ~0 rows (xấp xỉ)

-- Dumping structure for bảng webbandienthoai.app_accessoryvariant
CREATE TABLE IF NOT EXISTS `app_accessoryvariant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `price` decimal(12,0) NOT NULL,
  `accessory_id` bigint(20) NOT NULL,
  `color_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_accessoryvariant_accessory_id_588863fb_fk_app_accessory_id` (`accessory_id`),
  KEY `app_accessoryvariant_color_id_46403bb0_fk_app_accessorycolor_id` (`color_id`),
  CONSTRAINT `app_accessoryvariant_accessory_id_588863fb_fk_app_accessory_id` FOREIGN KEY (`accessory_id`) REFERENCES `app_accessory` (`id`),
  CONSTRAINT `app_accessoryvariant_color_id_46403bb0_fk_app_accessorycolor_id` FOREIGN KEY (`color_id`) REFERENCES `app_accessorycolor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Đang đổ dữ liệu cho bảng webbandienthoai.app_accessoryvariant: ~7 rows (xấp xỉ)
INSERT INTO `app_accessoryvariant` (`id`, `price`, `accessory_id`, `color_id`) VALUES
	(1, 1290000, 1, 1),
	(2, 1290000, 1, 2),
	(3, 1390000, 1, 3),
	(4, 1790000, 10, 4),
	(5, 1790000, 10, 5),
	(7, 1590000, 14, 6),
	(8, 1590000, 14, 7);

-- Dumping structure for bảng webbandienthoai.app_accessory_compatible_products
CREATE TABLE IF NOT EXISTS `app_accessory_compatible_products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accessory_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_accessory_product` (`accessory_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `aacp_accessory_fk` FOREIGN KEY (`accessory_id`) REFERENCES `app_accessory` (`id`) ON DELETE CASCADE,
  CONSTRAINT `aacp_product_fk` FOREIGN KEY (`product_id`) REFERENCES `app_product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Đang đổ dữ liệu cho bảng webbandienthoai.app_accessory_compatible_products: ~5 rows (xấp xỉ)
INSERT INTO `app_accessory_compatible_products` (`id`, `accessory_id`, `product_id`) VALUES
	(1, 1, 1),
	(3, 2, 3),
	(5, 3, 9),
	(2, 15, 1),
	(4, 16, 3);

-- Dumping structure for bảng webbandienthoai.app_capacity
CREATE TABLE IF NOT EXISTS `app_capacity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `app_capacity_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `app_product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Đang đổ dữ liệu cho bảng webbandienthoai.app_capacity: ~90 rows (xấp xỉ)
INSERT INTO `app_capacity` (`id`, `product_id`, `name`) VALUES
	(1, 1, '128GB'),
	(2, 1, '256GB'),
	(3, 1, '512GB'),
	(4, 2, '128GB'),
	(5, 2, '256GB'),
	(6, 2, '512GB'),
	(7, 3, '128GB'),
	(8, 3, '256GB'),
	(9, 3, '512GB'),
	(10, 4, '128GB'),
	(11, 4, '256GB'),
	(12, 4, '512GB'),
	(13, 5, '128GB'),
	(14, 5, '256GB'),
	(15, 5, '512GB'),
	(16, 6, '128GB'),
	(17, 6, '256GB'),
	(18, 6, '512GB'),
	(19, 7, '128GB'),
	(20, 7, '256GB'),
	(21, 7, '512GB'),
	(22, 8, '128GB'),
	(23, 8, '256GB'),
	(24, 8, '512GB'),
	(25, 9, '128GB'),
	(26, 9, '256GB'),
	(27, 9, '512GB'),
	(28, 10, '128GB'),
	(29, 10, '256GB'),
	(30, 10, '512GB'),
	(31, 11, '128GB'),
	(32, 11, '256GB'),
	(33, 11, '512GB'),
	(34, 12, '128GB'),
	(35, 12, '256GB'),
	(36, 12, '512GB'),
	(37, 13, '128GB'),
	(38, 13, '256GB'),
	(39, 13, '512GB'),
	(40, 14, '128GB'),
	(41, 14, '256GB'),
	(42, 14, '512GB'),
	(43, 15, '128GB'),
	(44, 15, '256GB'),
	(45, 15, '512GB'),
	(46, 16, '128GB'),
	(47, 16, '256GB'),
	(48, 16, '512GB'),
	(49, 17, '128GB'),
	(50, 17, '256GB'),
	(51, 17, '512GB'),
	(52, 18, '128GB'),
	(53, 18, '256GB'),
	(54, 18, '512GB'),
	(55, 19, '128GB'),
	(56, 19, '256GB'),
	(57, 19, '512GB'),
	(58, 20, '128GB'),
	(59, 20, '256GB'),
	(60, 20, '512GB'),
	(61, 21, '128GB'),
	(62, 21, '256GB'),
	(63, 21, '512GB'),
	(64, 22, '128GB'),
	(65, 22, '256GB'),
	(66, 22, '512GB'),
	(67, 23, '128GB'),
	(68, 23, '256GB'),
	(69, 23, '512GB'),
	(70, 24, '128GB'),
	(71, 24, '256GB'),
	(72, 24, '512GB'),
	(73, 25, '128GB'),
	(74, 25, '256GB'),
	(75, 25, '512GB'),
	(76, 26, '128GB'),
	(77, 26, '256GB'),
	(78, 26, '512GB'),
	(79, 27, '128GB'),
	(80, 27, '256GB'),
	(81, 27, '512GB'),
	(82, 28, '128GB'),
	(83, 28, '256GB'),
	(84, 28, '512GB'),
	(85, 29, '128GB'),
	(86, 29, '256GB'),
	(87, 29, '512GB'),
	(88, 30, '128GB'),
	(89, 30, '256GB'),
	(90, 30, '512GB');

-- Dumping structure for bảng webbandienthoai.app_category
CREATE TABLE IF NOT EXISTS `app_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Đang đổ dữ liệu cho bảng webbandienthoai.app_category: ~8 rows (xấp xỉ)
INSERT INTO `app_category` (`id`, `name`, `slug`) VALUES
	(1, 'Apple', 'apple'),
	(2, 'Samsung', 'samsung'),
	(3, 'Xiaomi', 'xiaomi'),
	(4, 'Oppo', 'Oppo'),
	(5, 'Google', 'google'),
	(6, 'Vivo', 'vivo'),
	(7, 'Realme', 'realme'),
	(8, 'OnePlus', 'oneplus');

-- Dumping structure for bảng webbandienthoai.app_color
CREATE TABLE IF NOT EXISTS `app_color` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `price` decimal(12,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `app_color_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `app_product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Đang đổ dữ liệu cho bảng webbandienthoai.app_color: ~90 rows (xấp xỉ)
INSERT INTO `app_color` (`id`, `product_id`, `name`, `price`) VALUES
	(1, 1, 'Đen', 27990000),
	(2, 1, 'Trắng', 27990000),
	(3, 1, 'Xanh', 27990000),
	(4, 2, 'Đen', 32990000),
	(5, 2, 'Trắng', 32990000),
	(6, 2, 'Xanh', 32990000),
	(7, 3, 'Đen', 27990000),
	(8, 3, 'Trắng', 27990000),
	(9, 3, 'Xanh', 27990000),
	(10, 4, 'Đen', 49990000),
	(11, 4, 'Trắng', 49990000),
	(12, 4, 'Xanh', 49990000),
	(13, 5, 'Đen', 16990000),
	(14, 5, 'Trắng', 16990000),
	(15, 5, 'Xanh', 16990000),
	(16, 6, 'Đen', 19990000),
	(17, 6, 'Trắng', 19990000),
	(18, 6, 'Xanh', 19990000),
	(19, 7, 'Đen', 15990000),
	(20, 7, 'Trắng', 15990000),
	(21, 7, 'Xanh', 15990000),
	(22, 8, 'Đen', 20990000),
	(23, 8, 'Trắng', 20990000),
	(24, 8, 'Xanh', 20990000),
	(25, 9, 'Đen', 22990000),
	(26, 9, 'Trắng', 22990000),
	(27, 9, 'Xanh', 22990000),
	(28, 10, 'Đen', 9990000),
	(29, 10, 'Trắng', 9990000),
	(30, 10, 'Xanh', 9990000),
	(31, 11, 'Đen', 22990000),
	(32, 11, 'Trắng', 22990000),
	(33, 11, 'Xanh', 22990000),
	(34, 12, 'Đen', 16990000),
	(35, 12, 'Trắng', 16990000),
	(36, 12, 'Xanh', 16990000),
	(37, 13, 'Đen', 10990000),
	(38, 13, 'Trắng', 10990000),
	(39, 13, 'Xanh', 10990000),
	(40, 14, 'Đen', 25990000),
	(41, 14, 'Trắng', 25990000),
	(42, 14, 'Xanh', 25990000),
	(43, 15, 'Đen', 22990000),
	(44, 15, 'Trắng', 22990000),
	(45, 15, 'Xanh', 22990000),
	(46, 16, 'Đen', 7490000),
	(47, 16, 'Trắng', 7490000),
	(48, 16, 'Xanh', 7490000),
	(49, 17, 'Đen', 10990000),
	(50, 17, 'Trắng', 10990000),
	(51, 17, 'Xanh', 10990000),
	(52, 18, 'Đen', 11990000),
	(53, 18, 'Trắng', 11990000),
	(54, 18, 'Xanh', 11990000),
	(55, 19, 'Đen', 13990000),
	(56, 19, 'Trắng', 13990000),
	(57, 19, 'Xanh', 13990000),
	(58, 20, 'Đen', 11990000),
	(59, 20, 'Trắng', 11990000),
	(60, 20, 'Xanh', 11990000),
	(61, 21, 'Đen', 5990000),
	(62, 21, 'Trắng', 5990000),
	(63, 21, 'Xanh', 5990000),
	(64, 22, 'Đen', 19990000),
	(65, 22, 'Trắng', 19990000),
	(66, 22, 'Xanh', 19990000),
	(67, 23, 'Đen', 18990000),
	(68, 23, 'Trắng', 18990000),
	(69, 23, 'Xanh', 18990000),
	(70, 24, 'Đen', 8990000),
	(71, 24, 'Trắng', 8990000),
	(72, 24, 'Xanh', 8990000),
	(73, 25, 'Đen', 10990000),
	(74, 25, 'Trắng', 10990000),
	(75, 25, 'Xanh', 10990000),
	(76, 26, 'Đen', 9990000),
	(77, 26, 'Trắng', 9990000),
	(78, 26, 'Xanh', 9990000),
	(79, 27, 'Đen', 16990000),
	(80, 27, 'Trắng', 16990000),
	(81, 27, 'Xanh', 16990000),
	(82, 28, 'Đen', 10990000),
	(83, 28, 'Trắng', 10990000),
	(84, 28, 'Xanh', 10990000),
	(85, 29, 'Đen', 7990000),
	(86, 29, 'Trắng', 7990000),
	(87, 29, 'Xanh', 7990000),
	(88, 30, 'Đen', 5990000),
	(89, 30, 'Trắng', 5990000),
	(90, 30, 'Xanh', 5990000);

-- Dumping structure for bảng webbandienthoai.app_customuser
CREATE TABLE IF NOT EXISTS `app_customuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Đang đổ dữ liệu cho bảng webbandienthoai.app_customuser: ~0 rows (xấp xỉ)
INSERT INTO `app_customuser` (`id`, `password`, `last_login`, `is_superuser`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `email`) VALUES
	(1, 'pbkdf2_sha256$600000$LKxA9UZVY5O1VZc0KNVV0T$G2LT3cbIQzmR4gnRDdaQmQBNV4TnrRoscMw72q/n0Ew=', '2025-09-17 09:31:17.451833', 1, '', '', 1, 1, '2025-09-16 06:01:09.244419', 'viet@gmail.com');

-- Dumping structure for bảng webbandienthoai.app_customuser_groups
CREATE TABLE IF NOT EXISTS `app_customuser_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_customuser_groups_customuser_id_group_id_a5a0ca22_uniq` (`customuser_id`,`group_id`),
  KEY `app_customuser_groups_group_id_47e49ebd_fk_auth_group_id` (`group_id`),
  CONSTRAINT `app_customuser_group_customuser_id_164d073f_fk_app_custo` FOREIGN KEY (`customuser_id`) REFERENCES `app_customuser` (`id`),
  CONSTRAINT `app_customuser_groups_group_id_47e49ebd_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Đang đổ dữ liệu cho bảng webbandienthoai.app_customuser_groups: ~0 rows (xấp xỉ)

-- Dumping structure for bảng webbandienthoai.app_customuser_user_permissions
CREATE TABLE IF NOT EXISTS `app_customuser_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_customuser_user_perm_customuser_id_permission_22e31019_uniq` (`customuser_id`,`permission_id`),
  KEY `app_customuser_user__permission_id_c5920c75_fk_auth_perm` (`permission_id`),
  CONSTRAINT `app_customuser_user__customuser_id_4bcbaafb_fk_app_custo` FOREIGN KEY (`customuser_id`) REFERENCES `app_customuser` (`id`),
  CONSTRAINT `app_customuser_user__permission_id_c5920c75_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Đang đổ dữ liệu cho bảng webbandienthoai.app_customuser_user_permissions: ~0 rows (xấp xỉ)

-- Dumping structure for bảng webbandienthoai.app_product
CREATE TABLE IF NOT EXISTS `app_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `price` decimal(12,0) NOT NULL,
  `image` varchar(200) NOT NULL,
  `specs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`specs`)),
  `category_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `app_product_category_id_023742a5_fk_app_category_id` (`category_id`),
  CONSTRAINT `app_product_category_id_023742a5_fk_app_category_id` FOREIGN KEY (`category_id`) REFERENCES `app_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Đang đổ dữ liệu cho bảng webbandienthoai.app_product: ~30 rows (xấp xỉ)
INSERT INTO `app_product` (`id`, `name`, `slug`, `brand`, `price`, `image`, `specs`, `category_id`) VALUES
	(1, 'iPhone 15 Pro 128GB', 'iphone-15-pro-128gb', 'Apple', 27990000, 'http://127.0.0.1:8000/static/img/iphone15pro.jpg', '{"display":"6.1 OLED 120Hz","chip":"A17 Pro","ram":"8GB","storage":"128GB","battery":"3274 mAh"}', 1),
	(2, 'iPhone 15 Pro Max 256GB', 'iphone-15-pro-max-256gb', 'Apple', 32990000, 'http://127.0.0.1:8000/static/img/iphone15promax.jpg', '{"display":"6.7 OLED 120Hz","chip":"A17 Pro","ram":"8GB","storage":"256GB","battery":"4422 mAh"}', 1),
	(3, 'Samsung Galaxy S24 Ultra 256GB', 'samsung-galaxy-s24-ultra-256gb', 'Samsung', 27990000, 'http://127.0.0.1:8000/static/img/samsungs24ultra.jpg', '{"display":"6.8 AMOLED 120Hz","chip":"Snapdragon 8 Gen 3","ram":"12GB","storage":"256GB","battery":"5000 mAh"}', 2),
	(4, 'Samsung Galaxy Z Fold 5 512GB', 'samsung-galaxy-z-fold-5-512gb', 'Samsung', 40990000, 'http://127.0.0.1:8000/static/img/samsunggalaxyZfold5.jpg', '{"display":"7.6 AMOLED Fold","chip":"Snapdragon 8 Gen 2","ram":"12GB","storage":"512GB","battery":"4400 mAh"}', 2),
	(5, 'Xiaomi 14 256GB', 'xiaomi-14-256gb', 'Xiaomi', 16990000, 'http://127.0.0.1:8000/static/img/Xiaomi14.jpg', '{"display":"6.36 AMOLED 120Hz","chip":"Snapdragon 8 Gen 3","ram":"12GB","storage":"256GB","battery":"4610 mAh"}', 3),
	(6, 'Xiaomi 14 Pro 512GB', 'xiaomi-14-pro-512gb', 'Xiaomi', 19990000, 'http://127.0.0.1:8000/static/img/xiaomi14pro.jpg', '{"display":"6.7 AMOLED LTPO","chip":"Snapdragon 8 Gen 3","ram":"16GB","storage":"512GB","battery":"4880 mAh"}', 3),
	(7, 'Oppo Find X7 256GB', 'oppo-find-x7-256gb', 'Oppo', 15990000, 'http://127.0.0.1:8000/static/img/oppofindx7.jpg', '{"display":"6.7 AMOLED 120Hz","chip":"Dimensity 9200","ram":"12GB","storage":"256GB","battery":"4800 mAh"}', 4),
	(8, 'Oppo Reno10 Pro+ 5G 256GB', 'oppo-reno10-proplus-256gb', 'Oppo', 13990000, 'http://127.0.0.1:8000/static/img/opporeno10pro.webp', '{"display":"6.74 AMOLED 120Hz","chip":"Snapdragon 8+ Gen 1","ram":"12GB","storage":"256GB","battery":"4700 mAh"}', 4),
	(9, 'Google Pixel 8 Pro 128GB', 'google-pixel-8-pro-128gb', 'Google', 22990000, 'http://127.0.0.1:8000/static/img/googlepixel8pro.jpg', '{"display":"6.7 OLED 120Hz","chip":"Google Tensor G3","ram":"12GB","storage":"128GB","battery":"5050 mAh"}', 5),
	(10, 'Google Pixel 7a 128GB', 'google-pixel-7a-128gb', 'Google', 9990000, 'http://127.0.0.1:8000/static/img/GooglePixel7a.jpg', '{"display":"6.1 OLED 90Hz","chip":"Google Tensor G2","ram":"8GB","storage":"128GB","battery":"4385 mAh"}', 5),
	(11, 'iPhone 14 Plus 128GB', 'iphone-14-plus-128gb', 'Apple', 22990000, 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-14-plus.jpg', '{"display": "6.7 OLED", "chip": "A15 Bionic", "memory": "6GB/128GB", "battery": "4323 mAh"}', 1),
	(12, 'iPhone 13 128GB', 'iphone-13-128gb', 'Apple', 16990000, 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-13.jpg', '{"display": "6.1 OLED", "chip": "A15 Bionic", "memory": "4GB/128GB", "battery": "3240 mAh"}', 1),
	(13, 'iPhone SE 2022 64GB', 'iphone-se-2022-64gb', 'Apple', 10990000, 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-se-2022.jpg', '{"display": "4.7 Retina IPS LCD", "chip": "A15 Bionic", "memory": "4GB/64GB", "battery": "2018 mAh"}', 1),
	(14, 'Samsung Galaxy S23 Ultra 256GB', 'samsung-galaxy-s23-ultra-256gb', 'Samsung', 25990000, 'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-s23-ultra-5g.jpg', '{"display": "6.8 AMOLED 120Hz", "chip": "Snapdragon 8 Gen 2", "memory": "12GB/256GB", "battery": "5000 mAh"}', 2),
	(15, 'Samsung Galaxy Z Flip 5 256GB', 'samsung-galaxy-z-flip-5-256gb', 'Samsung', 22990000, 'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-z-flip5.jpg', '{"display": "6.7 AMOLED gập", "chip": "Snapdragon 8 Gen 2", "memory": "8GB/256GB", "battery": "3700 mAh"}', 2),
	(16, 'Samsung Galaxy A34 5G', 'samsung-galaxy-a34-5g', 'Samsung', 7490000, 'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-a34-5g.jpg', '{"display": "6.6 AMOLED 120Hz", "chip": "Dimensity 1080", "memory": "6GB/128GB", "battery": "5000 mAh"}', 2),
	(17, 'Xiaomi Redmi Note 12 Pro 5G', 'xiaomi-redmi-note-12-pro-5g', 'Xiaomi', 7990000, 'https://fdn2.gsmarena.com/vv/bigpic/xiaomi-redmi-note12-pro-5g.jpg', '{"display": "6.67 AMOLED 120Hz", "chip": "Dimensity 1080", "memory": "6GB/128GB", "battery": "5000 mAh"}', 3),
	(18, 'Xiaomi Poco F5 Pro', 'xiaomi-poco-f5-pro', 'Xiaomi', 11990000, 'https://fdn2.gsmarena.com/vv/bigpic/xiaomi-poco-f5-pro.jpg', '{"display": "6.67 AMOLED 120Hz", "chip": "Snapdragon 8+ Gen 1", "memory": "12GB/256GB", "battery": "5160 mAh"}', 3),
	(19, 'Xiaomi 12T Pro', 'xiaomi-12t-pro', 'Xiaomi', 13990000, 'https://fdn2.gsmarena.com/vv/bigpic/xiaomi-12t-pro.jpg', '{"display": "6.67 AMOLED 120Hz", "chip": "Snapdragon 8+ Gen 1", "memory": "8GB/256GB", "battery": "5000 mAh"}', 3),
	(20, 'OPPO Reno8 Pro 5G', 'oppo-reno8-pro-5g', 'Oppo', 11990000, 'https://fdn2.gsmarena.com/vv/bigpic/oppo-reno8-pro.jpg', '{"display": "6.7 AMOLED 120Hz", "chip": "Dimensity 8100-Max", "memory": "8GB/256GB", "battery": "4500 mAh"}', 4),
	(21, 'OPPO A78 5G', 'oppo-a78-5g', 'Oppo', 5990000, 'https://fdn2.gsmarena.com/vv/bigpic/oppo-a78-5g.jpg', '{"display": "6.56 IPS LCD 90Hz", "chip": "Dimensity 700", "memory": "8GB/128GB", "battery": "5000 mAh"}', 4),
	(22, 'OPPO Find N2 Flip 256GB', 'oppo-find-n2-flip-256gb', 'Oppo', 19990000, 'https://fdn2.gsmarena.com/vv/bigpic/oppo-find-n2-flip.jpg', '{"display": "6.8 AMOLED gập", "chip": "Dimensity 9000+", "memory": "12GB/256GB", "battery": "4300 mAh"}', 4),
	(23, 'Vivo X90 Pro', 'vivo-x90-pro', 'Vivo', 18990000, 'https://fdn2.gsmarena.com/vv/bigpic/vivo-x90-pro.jpg', '{"display": "6.78 AMOLED 120Hz", "chip": "Dimensity 9200", "memory": "12GB/256GB", "battery": "4870 mAh"}', 6),
	(24, 'Vivo V27 5G', 'vivo-v27-5g', 'Vivo', 8990000, 'https://fdn2.gsmarena.com/vv/bigpic/vivo-v27.jpg', '{"display": "6.78 AMOLED 120Hz", "chip": "Dimensity 7200", "memory": "8GB/128GB", "battery": "4600 mAh"}', 6),
	(25, 'Realme GT Neo 5', 'realme-gt-neo-5', 'Realme', 10990000, 'https://fdn2.gsmarena.com/vv/bigpic/realme-gt-neo5.jpg', '{"display": "6.74 AMOLED 144Hz", "chip": "Snapdragon 8+ Gen 1", "memory": "16GB/256GB", "battery": "5000 mAh"}', 7),
	(26, 'Realme 11 Pro+', 'realme-11-pro-plus', 'Realme', 9990000, 'https://fdn2.gsmarena.com/vv/bigpic/realme-11-proplus.jpg', '{"display": "6.7 AMOLED 120Hz", "chip": "Dimensity 7050", "memory": "12GB/256GB", "battery": "5000 mAh"}', 7),
	(27, 'OnePlus 11 5G', 'oneplus-11-5g', 'OnePlus', 16990000, 'https://fdn2.gsmarena.com/vv/bigpic/oneplus-11.jpg', '{"display": "6.7 AMOLED 120Hz", "chip": "Snapdragon 8 Gen 2", "memory": "16GB/256GB", "battery": "5000 mAh"}', 8),
	(28, 'OnePlus Nord 3', 'oneplus-nord-3', 'OnePlus', 10990000, 'https://fdn2.gsmarena.com/vv/bigpic/oneplus-nord-3.jpg', '{"display": "6.74 AMOLED 120Hz", "chip": "Dimensity 9000", "memory": "12GB/256GB", "battery": "5000 mAh"}', 8),
	(29, 'Google Pixel 6a', 'google-pixel-6a', 'Google', 7990000, 'https://fdn2.gsmarena.com/vv/bigpic/google-pixel-6a.jpg', '{"display": "6.1 OLED 60Hz", "chip": "Google Tensor", "memory": "6GB/128GB", "battery": "4410 mAh"}', 5),
	(30, 'Google Pixel 5', 'google-pixel-5', 'Google', 5990000, 'https://fdn2.gsmarena.com/vv/bigpic/google-pixel-5.jpg', '{"display": "6.0 OLED 90Hz", "chip": "Snapdragon 765G", "memory": "8GB/128GB", "battery": "4080 mAh"}', 5);

-- Dumping structure for bảng webbandienthoai.app_productvariant
CREATE TABLE IF NOT EXISTS `app_productvariant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `capacity_id` bigint(20) NOT NULL,
  `color_id` bigint(20) NOT NULL,
  `price` decimal(12,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `capacity_id` (`capacity_id`),
  KEY `color_id` (`color_id`),
  CONSTRAINT `app_productvariant_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `app_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `app_productvariant_ibfk_2` FOREIGN KEY (`capacity_id`) REFERENCES `app_capacity` (`id`) ON DELETE CASCADE,
  CONSTRAINT `app_productvariant_ibfk_3` FOREIGN KEY (`color_id`) REFERENCES `app_color` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Đang đổ dữ liệu cho bảng webbandienthoai.app_productvariant: ~270 rows (xấp xỉ)
INSERT INTO `app_productvariant` (`id`, `product_id`, `capacity_id`, `color_id`, `price`) VALUES
	(1, 1, 1, 1, 29990000),
	(2, 1, 2, 1, 31990000),
	(3, 1, 3, 1, 27990000),
	(4, 1, 1, 2, 29990000),
	(5, 1, 2, 2, 31990000),
	(6, 1, 3, 2, 27990000),
	(7, 1, 1, 3, 29990000),
	(8, 1, 2, 3, 31990000),
	(9, 1, 3, 3, 27990000),
	(10, 2, 4, 4, 34990000),
	(11, 2, 5, 4, 36990000),
	(12, 2, 6, 4, 32990000),
	(13, 2, 4, 5, 34990000),
	(14, 2, 5, 5, 36990000),
	(15, 2, 6, 5, 32990000),
	(16, 2, 4, 6, 34990000),
	(17, 2, 5, 6, 36990000),
	(18, 2, 6, 6, 32990000),
	(19, 3, 7, 7, 29990000),
	(20, 3, 8, 7, 31990000),
	(21, 3, 9, 7, 27990000),
	(22, 3, 7, 8, 29990000),
	(23, 3, 8, 8, 31990000),
	(24, 3, 9, 8, 27990000),
	(25, 3, 7, 9, 29990000),
	(26, 3, 8, 9, 31990000),
	(27, 3, 9, 9, 27990000),
	(28, 4, 10, 10, 51990000),
	(29, 4, 11, 10, 53990000),
	(30, 4, 12, 10, 49990000),
	(31, 4, 10, 11, 51990000),
	(32, 4, 11, 11, 53990000),
	(33, 4, 12, 11, 49990000),
	(34, 4, 10, 12, 51990000),
	(35, 4, 11, 12, 53990000),
	(36, 4, 12, 12, 49990000),
	(37, 5, 13, 13, 18990000),
	(38, 5, 14, 13, 20990000),
	(39, 5, 15, 13, 16990000),
	(40, 5, 13, 14, 18990000),
	(41, 5, 14, 14, 20990000),
	(42, 5, 15, 14, 16990000),
	(43, 5, 13, 15, 18990000),
	(44, 5, 14, 15, 20990000),
	(45, 5, 15, 15, 16990000),
	(46, 6, 16, 16, 21990000),
	(47, 6, 17, 16, 23990000),
	(48, 6, 18, 16, 19990000),
	(49, 6, 16, 17, 21990000),
	(50, 6, 17, 17, 23990000),
	(51, 6, 18, 17, 19990000),
	(52, 6, 16, 18, 21990000),
	(53, 6, 17, 18, 23990000),
	(54, 6, 18, 18, 19990000),
	(55, 7, 19, 19, 17990000),
	(56, 7, 20, 19, 19990000),
	(57, 7, 21, 19, 15990000),
	(58, 7, 19, 20, 17990000),
	(59, 7, 20, 20, 19990000),
	(60, 7, 21, 20, 15990000),
	(61, 7, 19, 21, 17990000),
	(62, 7, 20, 21, 19990000),
	(63, 7, 21, 21, 15990000),
	(64, 8, 22, 22, 22990000),
	(65, 8, 23, 22, 24990000),
	(66, 8, 24, 22, 20990000),
	(67, 8, 22, 23, 22990000),
	(68, 8, 23, 23, 24990000),
	(69, 8, 24, 23, 20990000),
	(70, 8, 22, 24, 22990000),
	(71, 8, 23, 24, 24990000),
	(72, 8, 24, 24, 20990000),
	(73, 9, 25, 25, 24990000),
	(74, 9, 26, 25, 26990000),
	(75, 9, 27, 25, 22990000),
	(76, 9, 25, 26, 24990000),
	(77, 9, 26, 26, 26990000),
	(78, 9, 27, 26, 22990000),
	(79, 9, 25, 27, 24990000),
	(80, 9, 26, 27, 26990000),
	(81, 9, 27, 27, 22990000),
	(82, 10, 28, 28, 11990000),
	(83, 10, 29, 28, 13990000),
	(84, 10, 30, 28, 9990000),
	(85, 10, 28, 29, 11990000),
	(86, 10, 29, 29, 13990000),
	(87, 10, 30, 29, 9990000),
	(88, 10, 28, 30, 11990000),
	(89, 10, 29, 30, 13990000),
	(90, 10, 30, 30, 9990000),
	(91, 11, 31, 31, 24990000),
	(92, 11, 32, 31, 26990000),
	(93, 11, 33, 31, 22990000),
	(94, 11, 31, 32, 24990000),
	(95, 11, 32, 32, 26990000),
	(96, 11, 33, 32, 22990000),
	(97, 11, 31, 33, 24990000),
	(98, 11, 32, 33, 26990000),
	(99, 11, 33, 33, 22990000),
	(100, 12, 34, 34, 18990000),
	(101, 12, 35, 34, 20990000),
	(102, 12, 36, 34, 16990000),
	(103, 12, 34, 35, 18990000),
	(104, 12, 35, 35, 20990000),
	(105, 12, 36, 35, 16990000),
	(106, 12, 34, 36, 18990000),
	(107, 12, 35, 36, 20990000),
	(108, 12, 36, 36, 16990000),
	(109, 13, 37, 37, 12990000),
	(110, 13, 38, 37, 14990000),
	(111, 13, 39, 37, 10990000),
	(112, 13, 37, 38, 12990000),
	(113, 13, 38, 38, 14990000),
	(114, 13, 39, 38, 10990000),
	(115, 13, 37, 39, 12990000),
	(116, 13, 38, 39, 14990000),
	(117, 13, 39, 39, 10990000),
	(118, 14, 40, 40, 27990000),
	(119, 14, 41, 40, 29990000),
	(120, 14, 42, 40, 25990000),
	(121, 14, 40, 41, 27990000),
	(122, 14, 41, 41, 29990000),
	(123, 14, 42, 41, 25990000),
	(124, 14, 40, 42, 27990000),
	(125, 14, 41, 42, 29990000),
	(126, 14, 42, 42, 25990000),
	(127, 15, 43, 43, 24990000),
	(128, 15, 44, 43, 26990000),
	(129, 15, 45, 43, 22990000),
	(130, 15, 43, 44, 24990000),
	(131, 15, 44, 44, 26990000),
	(132, 15, 45, 44, 22990000),
	(133, 15, 43, 45, 24990000),
	(134, 15, 44, 45, 26990000),
	(135, 15, 45, 45, 22990000),
	(136, 16, 46, 46, 9490000),
	(137, 16, 47, 46, 11490000),
	(138, 16, 48, 46, 7490000),
	(139, 16, 46, 47, 9490000),
	(140, 16, 47, 47, 11490000),
	(141, 16, 48, 47, 7490000),
	(142, 16, 46, 48, 9490000),
	(143, 16, 47, 48, 11490000),
	(144, 16, 48, 48, 7490000),
	(145, 17, 49, 49, 12990000),
	(146, 17, 50, 49, 14990000),
	(147, 17, 51, 49, 10990000),
	(148, 17, 49, 50, 12990000),
	(149, 17, 50, 50, 14990000),
	(150, 17, 51, 50, 10990000),
	(151, 17, 49, 51, 12990000),
	(152, 17, 50, 51, 14990000),
	(153, 17, 51, 51, 10990000),
	(154, 18, 52, 52, 13990000),
	(155, 18, 53, 52, 15990000),
	(156, 18, 54, 52, 11990000),
	(157, 18, 52, 53, 13990000),
	(158, 18, 53, 53, 15990000),
	(159, 18, 54, 53, 11990000),
	(160, 18, 52, 54, 13990000),
	(161, 18, 53, 54, 15990000),
	(162, 18, 54, 54, 11990000),
	(163, 19, 55, 55, 15990000),
	(164, 19, 56, 55, 17990000),
	(165, 19, 57, 55, 13990000),
	(166, 19, 55, 56, 15990000),
	(167, 19, 56, 56, 17990000),
	(168, 19, 57, 56, 13990000),
	(169, 19, 55, 57, 15990000),
	(170, 19, 56, 57, 17990000),
	(171, 19, 57, 57, 13990000),
	(172, 20, 58, 58, 13990000),
	(173, 20, 59, 58, 15990000),
	(174, 20, 60, 58, 11990000),
	(175, 20, 58, 59, 13990000),
	(176, 20, 59, 59, 15990000),
	(177, 20, 60, 59, 11990000),
	(178, 20, 58, 60, 13990000),
	(179, 20, 59, 60, 15990000),
	(180, 20, 60, 60, 11990000),
	(181, 21, 61, 61, 7990000),
	(182, 21, 62, 61, 9990000),
	(183, 21, 63, 61, 5990000),
	(184, 21, 61, 62, 7990000),
	(185, 21, 62, 62, 9990000),
	(186, 21, 63, 62, 5990000),
	(187, 21, 61, 63, 7990000),
	(188, 21, 62, 63, 9990000),
	(189, 21, 63, 63, 5990000),
	(190, 22, 64, 64, 21990000),
	(191, 22, 65, 64, 23990000),
	(192, 22, 66, 64, 19990000),
	(193, 22, 64, 65, 21990000),
	(194, 22, 65, 65, 23990000),
	(195, 22, 66, 65, 19990000),
	(196, 22, 64, 66, 21990000),
	(197, 22, 65, 66, 23990000),
	(198, 22, 66, 66, 19990000),
	(199, 23, 67, 67, 20990000),
	(200, 23, 68, 67, 22990000),
	(201, 23, 69, 67, 18990000),
	(202, 23, 67, 68, 20990000),
	(203, 23, 68, 68, 22990000),
	(204, 23, 69, 68, 18990000),
	(205, 23, 67, 69, 20990000),
	(206, 23, 68, 69, 22990000),
	(207, 23, 69, 69, 18990000),
	(208, 24, 70, 70, 10990000),
	(209, 24, 71, 70, 12990000),
	(210, 24, 72, 70, 8990000),
	(211, 24, 70, 71, 10990000),
	(212, 24, 71, 71, 12990000),
	(213, 24, 72, 71, 8990000),
	(214, 24, 70, 72, 10990000),
	(215, 24, 71, 72, 12990000),
	(216, 24, 72, 72, 8990000),
	(217, 25, 73, 73, 12990000),
	(218, 25, 74, 73, 14990000),
	(219, 25, 75, 73, 10990000),
	(220, 25, 73, 74, 12990000),
	(221, 25, 74, 74, 14990000),
	(222, 25, 75, 74, 10990000),
	(223, 25, 73, 75, 12990000),
	(224, 25, 74, 75, 14990000),
	(225, 25, 75, 75, 10990000),
	(226, 26, 76, 76, 11990000),
	(227, 26, 77, 76, 13990000),
	(228, 26, 78, 76, 9990000),
	(229, 26, 76, 77, 11990000),
	(230, 26, 77, 77, 13990000),
	(231, 26, 78, 77, 9990000),
	(232, 26, 76, 78, 11990000),
	(233, 26, 77, 78, 13990000),
	(234, 26, 78, 78, 9990000),
	(235, 27, 79, 79, 18990000),
	(236, 27, 80, 79, 20990000),
	(237, 27, 81, 79, 16990000),
	(238, 27, 79, 80, 18990000),
	(239, 27, 80, 80, 20990000),
	(240, 27, 81, 80, 16990000),
	(241, 27, 79, 81, 18990000),
	(242, 27, 80, 81, 20990000),
	(243, 27, 81, 81, 16990000),
	(244, 28, 82, 82, 12990000),
	(245, 28, 83, 82, 14990000),
	(246, 28, 84, 82, 10990000),
	(247, 28, 82, 83, 12990000),
	(248, 28, 83, 83, 14990000),
	(249, 28, 84, 83, 10990000),
	(250, 28, 82, 84, 12990000),
	(251, 28, 83, 84, 14990000),
	(252, 28, 84, 84, 10990000),
	(253, 29, 85, 85, 9990000),
	(254, 29, 86, 85, 11990000),
	(255, 29, 87, 85, 7990000),
	(256, 29, 85, 86, 9990000),
	(257, 29, 86, 86, 11990000),
	(258, 29, 87, 86, 7990000),
	(259, 29, 85, 87, 9990000),
	(260, 29, 86, 87, 11990000),
	(261, 29, 87, 87, 7990000),
	(262, 30, 88, 88, 7990000),
	(263, 30, 89, 88, 9990000),
	(264, 30, 90, 88, 5990000),
	(265, 30, 88, 89, 7990000),
	(266, 30, 89, 89, 9990000),
	(267, 30, 90, 89, 5990000),
	(268, 30, 88, 90, 7990000),
	(269, 30, 89, 90, 9990000),
	(270, 30, 90, 90, 5990000);

-- Dumping structure for bảng webbandienthoai.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Đang đổ dữ liệu cho bảng webbandienthoai.auth_group: ~0 rows (xấp xỉ)

-- Dumping structure for bảng webbandienthoai.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Đang đổ dữ liệu cho bảng webbandienthoai.auth_group_permissions: ~0 rows (xấp xỉ)

-- Dumping structure for bảng webbandienthoai.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Đang đổ dữ liệu cho bảng webbandienthoai.auth_permission: ~64 rows (xấp xỉ)
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add content type', 4, 'add_contenttype'),
	(14, 'Can change content type', 4, 'change_contenttype'),
	(15, 'Can delete content type', 4, 'delete_contenttype'),
	(16, 'Can view content type', 4, 'view_contenttype'),
	(17, 'Can add session', 5, 'add_session'),
	(18, 'Can change session', 5, 'change_session'),
	(19, 'Can delete session', 5, 'delete_session'),
	(20, 'Can view session', 5, 'view_session'),
	(21, 'Can add category', 6, 'add_category'),
	(22, 'Can change category', 6, 'change_category'),
	(23, 'Can delete category', 6, 'delete_category'),
	(24, 'Can view category', 6, 'view_category'),
	(25, 'Can add product', 7, 'add_product'),
	(26, 'Can change product', 7, 'change_product'),
	(27, 'Can delete product', 7, 'delete_product'),
	(28, 'Can view product', 7, 'view_product'),
	(29, 'Can add user', 8, 'add_customuser'),
	(30, 'Can change user', 8, 'change_customuser'),
	(31, 'Can delete user', 8, 'delete_customuser'),
	(32, 'Can view user', 8, 'view_customuser'),
	(33, 'Can add capacity', 9, 'add_capacity'),
	(34, 'Can change capacity', 9, 'change_capacity'),
	(35, 'Can delete capacity', 9, 'delete_capacity'),
	(36, 'Can view capacity', 9, 'view_capacity'),
	(37, 'Can add color', 10, 'add_color'),
	(38, 'Can change color', 10, 'change_color'),
	(39, 'Can delete color', 10, 'delete_color'),
	(40, 'Can view color', 10, 'view_color'),
	(41, 'Can add product variant', 11, 'add_productvariant'),
	(42, 'Can change product variant', 11, 'change_productvariant'),
	(43, 'Can delete product variant', 11, 'delete_productvariant'),
	(44, 'Can view product variant', 11, 'view_productvariant'),
	(45, 'Can add accessory', 12, 'add_accessory'),
	(46, 'Can change accessory', 12, 'change_accessory'),
	(47, 'Can delete accessory', 12, 'delete_accessory'),
	(48, 'Can view accessory', 12, 'view_accessory'),
	(49, 'Can add accessory category', 13, 'add_accessorycategory'),
	(50, 'Can change accessory category', 13, 'change_accessorycategory'),
	(51, 'Can delete accessory category', 13, 'delete_accessorycategory'),
	(52, 'Can view accessory category', 13, 'view_accessorycategory'),
	(53, 'Can add accessory compatible product', 14, 'add_accessorycompatibleproduct'),
	(54, 'Can change accessory compatible product', 14, 'change_accessorycompatibleproduct'),
	(55, 'Can delete accessory compatible product', 14, 'delete_accessorycompatibleproduct'),
	(56, 'Can view accessory compatible product', 14, 'view_accessorycompatibleproduct'),
	(57, 'Can add accessory color', 15, 'add_accessorycolor'),
	(58, 'Can change accessory color', 15, 'change_accessorycolor'),
	(59, 'Can delete accessory color', 15, 'delete_accessorycolor'),
	(60, 'Can view accessory color', 15, 'view_accessorycolor'),
	(61, 'Can add accessory variant', 16, 'add_accessoryvariant'),
	(62, 'Can change accessory variant', 16, 'change_accessoryvariant'),
	(63, 'Can delete accessory variant', 16, 'delete_accessoryvariant'),
	(64, 'Can view accessory variant', 16, 'view_accessoryvariant');

-- Dumping structure for bảng webbandienthoai.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_app_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_app_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `app_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Đang đổ dữ liệu cho bảng webbandienthoai.django_admin_log: ~5 rows (xấp xỉ)
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2025-09-16 06:17:50.620904', '1', 'Apple', 1, '[{"added": {}}]', 6, 1),
	(2, '2025-09-16 06:18:05.207985', '2', 'Samsung', 1, '[{"added": {}}]', 6, 1),
	(3, '2025-09-16 06:18:12.378485', '3', 'Xiaomi', 1, '[{"added": {}}]', 6, 1),
	(4, '2025-09-16 06:18:26.538742', '4', 'Oppo', 1, '[{"added": {}}]', 6, 1),
	(5, '2025-09-16 06:18:35.898526', '5', 'Google', 1, '[{"added": {}}]', 6, 1);

-- Dumping structure for bảng webbandienthoai.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Đang đổ dữ liệu cho bảng webbandienthoai.django_content_type: ~16 rows (xấp xỉ)
INSERT INTO `django_content_type` (`id`, `app_label`, `model`, `name`) VALUES
	(1, 'admin', 'logentry', ''),
	(2, 'auth', 'permission', ''),
	(3, 'auth', 'group', ''),
	(4, 'contenttypes', 'contenttype', ''),
	(5, 'sessions', 'session', ''),
	(6, 'app', 'category', ''),
	(7, 'app', 'product', ''),
	(8, 'app', 'customuser', ''),
	(9, 'app', 'capacity', ''),
	(10, 'app', 'color', ''),
	(11, 'app', 'productvariant', ''),
	(12, 'app', 'accessory', ''),
	(13, 'app', 'accessorycategory', ''),
	(14, 'app', 'accessorycompatibleproduct', ''),
	(15, 'app', 'accessorycolor', ''),
	(16, 'app', 'accessoryvariant', '');

-- Dumping structure for bảng webbandienthoai.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Đang đổ dữ liệu cho bảng webbandienthoai.django_migrations: ~19 rows (xấp xỉ)
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2025-09-17 11:41:36.677611'),
	(3, 'contenttypes', '0002_remove_content_type_name', '2025-09-17 12:09:58.348147'),
	(4, 'auth', '0001_initial', '2025-09-17 12:11:32.353308'),
	(5, 'auth', '0002_alter_permission_name_max_length', '2025-09-17 12:11:32.369783'),
	(6, 'auth', '0003_alter_user_email_max_length', '2025-09-17 12:11:32.379391'),
	(7, 'auth', '0004_alter_user_username_opts', '2025-09-17 12:11:32.392213'),
	(8, 'auth', '0005_alter_user_last_login_null', '2025-09-17 12:11:32.400122'),
	(9, 'auth', '0006_require_contenttypes_0002', '2025-09-17 12:11:32.407132'),
	(10, 'auth', '0007_alter_validators_add_error_messages', '2025-09-17 12:11:32.413720'),
	(11, 'auth', '0008_alter_user_username_max_length', '2025-09-17 12:11:32.424271'),
	(12, 'auth', '0009_alter_user_last_name_max_length', '2025-09-17 12:11:32.428418'),
	(13, 'auth', '0010_alter_group_name_max_length', '2025-09-17 12:11:32.433583'),
	(14, 'auth', '0011_update_proxy_permissions', '2025-09-17 12:11:32.437914'),
	(15, 'auth', '0012_alter_user_first_name_max_length', '2025-09-17 12:11:32.441235'),
	(16, 'app', '0001_initial', '2025-09-17 12:11:32.468909'),
	(17, 'admin', '0001_initial', '2025-09-17 12:11:32.474224'),
	(18, 'admin', '0002_logentry_remove_auto_add', '2025-09-17 12:11:32.478556'),
	(19, 'admin', '0003_logentry_add_action_flag_choices', '2025-09-17 12:11:32.482924'),
	(20, 'sessions', '0001_initial', '2025-09-17 12:11:32.485959'),
	(21, 'app', '0002_remove_product_price_new', '2025-09-17 12:40:01.374870'),
	(22, 'app', '0003_accessory_accessorycategory_accessorycolor_and_more', '2025-09-19 10:31:02.102200');

-- Dumping structure for bảng webbandienthoai.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Đang đổ dữ liệu cho bảng webbandienthoai.django_session: ~3 rows (xấp xỉ)
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('3bq9tqkmc7nkr4oh4kp6et846n7b79tu', '.eJxVjDkOwjAQRe_iGllexhslPWewZrzgAHKkOKkQd4dIKaD9773_YhG3tcVtlCVOmZ2ZZKffjTA9St9BvmO_zTzNfV0m4rvCDzr4dc7leTncv4OGo31rLUI1JJMTArXSSWUviiWlPDlvZLXOGBBWkIKM2QI4F6AmTWSNhqDZ-wO6wjaq:1uyOqi:EeQtdQOHuLutig5wqPSgLnt4Muoyeq0-4pPcB-ShWto', '2025-09-30 06:07:32.603183'),
	('ad6jntora9xiy73d6np3w39dpfwxhsw7', 'eyJjYXJ0Ijp7fX0:1uyvyV:h4mSKkVmLOvCwwn-jmmdfMV8r9mpZ6NgEf4ahs9POEk', '2025-10-01 17:29:47.970310'),
	('trq5yggkjr74rq3hgr10d4w2w0w3h9ci', 'eyJjYXJ0Ijp7fX0:1uz6yg:s8mT5S3Xza_FGHJEfjPvlk8lJxOpj5eFxcVmZKrKL1E', '2025-10-02 05:14:42.128044');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
