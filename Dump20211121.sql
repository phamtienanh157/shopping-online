-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: shopping
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ma_the_loai` int DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `pages` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `publisher` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category` (`ma_the_loai`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,1,'Mắt biếc','mb.jpg','300','Tiếng Việt','Nguyễn Nhật Ánh','NXB Trẻ','Mắt biếc là một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn Nguyễn Nhật Ánh. Tác phẩm này cũng đã được dịch giả Kato Sakae dịch sang tiếng Nhật để giới thiệu với độc giả Nhật Bản. \n“Tôi gửi tình yêu cho mùa hè, nhưng mùa hè không giữ nổi. Mùa hè chỉ biết ra hoa, phượng đỏ sân trường và tiếng ve nỉ non trong lá. Mùa hè ngây ngô, giống như tôi vậy. Nó chẳng làm được những điều tôi ký thác. Nó để Hà Lan đốt tôi, đốt rụi. Trái tim tôi cháy thành tro, rơi vãi trên đường về.”'),(2,1,'Hai số phận','hsp.jpg','768','Tiếng Việt','Jeffrey Archer','NXB Văn Học','“Hai số phận” (Kane & Abel) là câu chuyện về hai người đàn ông đi tìm vinh quang. William Kane là con một triệu phú nổi tiếng trên đất Mỹ, lớn lên trong nhung lụa của thế giới thượng lưu. Wladek Koskiewicz là đứa trẻ không rõ xuất thân, được gia đình người bẫy thú nhặt về nuôi. Một người được ấn định để trở thành chủ ngân hàng khi lớn lên, người kia nhập cư vào Mỹ cùng đoàn người nghèo khổ. \nTrải qua hơn sáu mươi năm với biết bao biến động, hai con người giàu hoài bão miệt mài xây dựng vận mệnh của mình . “Hai số phận” nói về nỗi khát khao cháy bỏng, những nghĩa cử, những mối thâm thù, từng bước đường phiêu lưu, hiện thực thế giới và những góc khuất... mê hoặc người đọc bằng ngôn từ cô đọng, hai mạch truyện song song được xây dựng tinh tế từ những chi tiết nhỏ nhất.) '),(3,1,'Đắc nhân tâm','dac_nhan_tam.jpg','532','Tiếng Việt','Dale Carnegie','NXB Trẻ','Đắc nhân tâm của Dale Carnegie là quyển sách duy nhất về thể loại self-help liên tục đứng đầu danh mục sách bán chạy nhất (best-selling Books) do báo The New York Times bình chọn suốt 10 năm liền. Được xuất bản năm 1936, với số lượng bán ra hơn 15 triệu bản, tính đến nay, sách đã được dịch ra ở hầu hết các ngôn ngữ, trong đó có cả Việt Nam, và đã nhận được sự đón tiếp nhiệt tình của đọc giả ở hầu hết các quốc gia.'),(4,1,'Thông điệp','thong_diep.jpg','356','Tiếng Việt','Kỷ Vũ','NXB Thanh niên','Những phương pháp phân tích vi biểu cảm trong cuốn sách này có thể sẽ giúp bạn tránh được những thất bại trong cuộc đời, nâng cao kinh nghiệm cuộc sống cho bản thân, mở ra những cơ hội thành công và hạnh phúc'),(5,1,'Đánh Thức Con Người Phi Thường Trong Bạn','danh_thuc_con_nguoi.jpg','654','Tiếng Việt','Anthony Robbins','NXB Tổng hợp','Đánh thức con người phi thường trong bạn” là cuốn sách giúp người đọc khám phá giá trị tiềm ẩn của bản thân để tạo nên những kết quả chính mình không ngờ đến. Cuốn sách được viết bởi Athony Robbins – một nhân chứng sống, một ngưỡi đã tìm được sự phi thường trong chính con người mình.');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookitem`
--

DROP TABLE IF EXISTS `bookitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookitem` (
  `bookId` int NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`bookId`),
  CONSTRAINT `bookitem_ibfk_1` FOREIGN KEY (`bookId`) REFERENCES `book` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookitem`
--

LOCK TABLES `bookitem` WRITE;
/*!40000 ALTER TABLE `bookitem` DISABLE KEYS */;
INSERT INTO `bookitem` VALUES (1,100000),(2,120000),(3,89000),(4,121000),(5,150000);
/*!40000 ALTER TABLE `bookitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL,
  `ngay_tao` date DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartitem`
--

DROP TABLE IF EXISTS `cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartitem` (
  `id` int NOT NULL,
  `cart_id` int NOT NULL,
  `bookitem_bookId` int NOT NULL,
  `electronicsitem_electronicsId` int NOT NULL,
  `shoesitem_id` int NOT NULL,
  `clothesitem_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cartitem_cart1_idx` (`cart_id`),
  KEY `fk_cartitem_bookitem1_idx` (`bookitem_bookId`),
  KEY `fk_cartitem_electronicsitem1_idx` (`electronicsitem_electronicsId`),
  KEY `fk_cartitem_shoesitem1_idx` (`shoesitem_id`),
  KEY `fk_cartitem_clothesitem1_idx` (`clothesitem_id`),
  CONSTRAINT `fk_cartitem_bookitem1` FOREIGN KEY (`bookitem_bookId`) REFERENCES `bookitem` (`bookId`),
  CONSTRAINT `fk_cartitem_cart1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  CONSTRAINT `fk_cartitem_clothesitem1` FOREIGN KEY (`clothesitem_id`) REFERENCES `clothesitem` (`id`),
  CONSTRAINT `fk_cartitem_electronicsitem1` FOREIGN KEY (`electronicsitem_electronicsId`) REFERENCES `electronicsitem` (`electronicsId`),
  CONSTRAINT `fk_cartitem_shoesitem1` FOREIGN KEY (`shoesitem_id`) REFERENCES `shoesitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartitem`
--

LOCK TABLES `cartitem` WRITE;
/*!40000 ALTER TABLE `cartitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `ma_the_loai` int NOT NULL AUTO_INCREMENT,
  `ten_the_loai` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `mo_ta` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ma_the_loai`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Book','Sách'),(2,'Electronics','Đồ điện tử'),(3,'Clothes','Quần áo'),(4,'Shoes','Giày');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clothes`
--

DROP TABLE IF EXISTS `clothes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clothes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ma_the_loai` int DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `img` varchar(45) DEFAULT NULL,
  `brand` varchar(45) DEFAULT NULL,
  `size` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `sumary` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_clothes_category` (`ma_the_loai`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothes`
--

LOCK TABLES `clothes` WRITE;
/*!40000 ALTER TABLE `clothes` DISABLE KEYS */;
INSERT INTO `clothes` VALUES (1,3,'Quần baggy','quan_baggy.jpg','JBAGY','L','Đen','Chất liệu: Cot Hàn, Form dáng: Baggy ống rộng, suông, Thiết kế: 1 Cúc cài'),(2,3,'Áo khoác blazer nam','ao_khoac.jpg','Men Clothes','L','Đen','Blazer hiểu đơn giản nhất là những chiếc áo khoác với form chung của vest, nhưng đường cắt và màu sắc lại hoàn toàn phá cách. Blazer cũng không cần lúc nào cũng phải đi kèm theo cả một bộ đồ như khi bạn diện suit, thực ra, chẳng ai đóng thùng trong sơ mi hồ cứng cổ với blazer đâu.'),(3,3,'Quần Thể Thao Nỉ','quan_the_thao.jpg','Pants/Suits','XL','Sọc Đen','Quần dài 3 sọc ống suông, ống bo có thể nói đó là chiếc quần \"truyền thống\" dành cho cả nam và nữ,  phong cách trẻ trung, năng động cho người mặc.'),(4,3,'Quần đùi nam','quan_dui.jpg','GUZADO ','L','Đen, Xám','Bảo hành 12 tháng ( 1 đổi 1)  với đường may, túi khóa và độ bền của vải'),(5,3,'Áo Nỉ Nam Thời Trang','ao_ni.jpg','ZERO','L, XL','Đen, Xanh, Tím','Áo nỉ là gợi ý tuyệt vời cho nam giới trong những ngày thời tiết se lạnh. Thiết kế phối bo tay áo và bo gấu đơn giản, tinh tế mang đến phong cách trẻ trung và thanh lịch.Chất liệu nỉ cao cấp dày dặn, mềm mịn, không xù, co giãn nhẹ.');
/*!40000 ALTER TABLE `clothes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clothesitem`
--

DROP TABLE IF EXISTS `clothesitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clothesitem` (
  `id` int NOT NULL,
  `price` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `clothesitem_ibfk_1` FOREIGN KEY (`id`) REFERENCES `clothes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothesitem`
--

LOCK TABLES `clothesitem` WRITE;
/*!40000 ALTER TABLE `clothesitem` DISABLE KEYS */;
INSERT INTO `clothesitem` VALUES (1,'150000'),(2,'169000'),(3,'250000'),(4,'310000'),(5,'210000');
/*!40000 ALTER TABLE `clothesitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `electronics`
--

DROP TABLE IF EXISTS `electronics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `electronics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ma_the_loai` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `model` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category` (`ma_the_loai`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electronics`
--

LOCK TABLES `electronics` WRITE;
/*!40000 ALTER TABLE `electronics` DISABLE KEYS */;
INSERT INTO `electronics` VALUES (1,2,'Iphone 13 Pro Max','ip.jpg','Apple','Pro Max','Screen size: 6.7\", Capacity: 256GB\r, Ram: 6GB\r, CPU: Apple A15 Bionic'),(2,2,'Laptop Acer Nitro 5 Gaming AN515 57 727J','acer.jpg','Acer','AN515 57 727J','Screen size: 15.6\",\r Capacity: 512 GB, SSD NVMe PCIe\r, Ram: 8GB\r, CPU: i7 11800H2.30 GHz,\r Card: RTX 3050Ti 4GB'),(3,2,'Air Pod 2 Pro','air_pod.jpg','Apple','Pro','Kết nối blutooth 5.0, Pin sử dụng đạt 3,5 giờ, Chống ồn chủ động, Điều khiển cảm ứng'),(4,2,'Vivo Y20 (2021)','vivo.jpg','Vivo','Y20','Màn hình: 6.51 inch, Độ phân giải: 1600*720 (HD+), Chất liệu màn hình: IPS LCD, Màn hình cảm ứng: Cảm ứng điện dung đa điểm'),(5,2,'Đồng Hồ Thông Minh','dong_ho.jpg','AW','Seri 6,7','Sạc real, box real, LOGO TÁO, Chơi game trực tuyến trên đồng hồ 5 game, Nâng tay sáng màn hình. ');
/*!40000 ALTER TABLE `electronics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `electronicsitem`
--

DROP TABLE IF EXISTS `electronicsitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `electronicsitem` (
  `electronicsId` int NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`electronicsId`),
  CONSTRAINT `electronicsitem_ibfk_1` FOREIGN KEY (`electronicsId`) REFERENCES `electronics` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electronicsitem`
--

LOCK TABLES `electronicsitem` WRITE;
/*!40000 ALTER TABLE `electronicsitem` DISABLE KEYS */;
INSERT INTO `electronicsitem` VALUES (1,33990000),(2,29690000),(3,845000),(4,680000),(5,1200000);
/*!40000 ALTER TABLE `electronicsitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id_history` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `ma_san_pham` int DEFAULT NULL,
  `ma_the_loai` int DEFAULT NULL,
  `ngay_mua` timestamp NULL DEFAULT NULL,
  `so_luong` int DEFAULT NULL,
  `thanh_tien` double DEFAULT NULL,
  PRIMARY KEY (`id_history`),
  KEY `fk_history_product` (`ma_san_pham`) USING BTREE,
  KEY `fk_history_user` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,1,'2021-11-21 10:37:12',2,200000),(2,1,4,3,'2021-11-21 10:37:12',1,310000);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` int NOT NULL,
  `payment_method` varchar(45) DEFAULT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id_idx` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment`
--

DROP TABLE IF EXISTS `shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shipment_method` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `user_id` int NOT NULL,
  `ngay_mua` timestamp NULL DEFAULT NULL,
  `ma_san_pham` int NOT NULL,
  `ma_the_loai` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment`
--

LOCK TABLES `shipment` WRITE;
/*!40000 ALTER TABLE `shipment` DISABLE KEYS */;
INSERT INTO `shipment` VALUES (1,'Giao hang tiet kiem','Tran Anh Tu','0123456789','Hanoi',1,'2021-11-21 10:37:12',1,1),(2,'Giao hang tiet kiem','Tran Anh Tu','0123456789','Hanoi',1,'2021-11-21 10:37:12',4,3);
/*!40000 ALTER TABLE `shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoes`
--

DROP TABLE IF EXISTS `shoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ma_the_loai` int DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `img` varchar(45) DEFAULT NULL,
  `size` int DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `material` varchar(45) DEFAULT NULL,
  `sumary` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoes`
--

LOCK TABLES `shoes` WRITE;
/*!40000 ALTER TABLE `shoes` DISABLE KEYS */;
INSERT INTO `shoes` VALUES (1,4,'Giày thể thao NY cao cổ','giay_ny.jpg',38,'Đen, Trắng','Da','Nhận hàng các bạn được kiểm tra hàng trước khi thanh toán . Vì quy định của shopee không cho xem trước nên 1 số bưu tá không cho xem . Nên các bạn bảo bưu tá điện thoại cho mình mình xác nhận cho xem là các bạn sẽ được kiểm hàng nên yên tâm'),(2,4,'Giày Nike Trắng','giay_nike.jpg',37,'Trắng','Da','GIÀY THỂ THAO NAM NỮ  TRẮNG AIR FORCE 1 , ĐỦ SIZE 36 - 43 , FREESHIP TOÀN QUỐC'),(3,4,'Giày Sneaker Trẻ Em','giay_tre_em.jpg',25,'Đen, Trắng','Da','Giày Sneaker Trẻ Em Cho Bé Trai Bé Gái Size 21-30'),(4,4,'GIÀY ROSÉ BLACKPINK','giay_rose.jpg',35,'Trắng','Da','Bên mình hàng đẹp loại 1, dưới đế có răng cưa nhỏ giống của Rosé ạ. Các bạn tăng lên 1 size đi cho thoải mái nhé'),(5,4,'Giày Jordan paris xám xanh cổ thấp','giay_jordan.jpg',36,'Trắng, Xám','Da',' Mẫu giày JD1 đang cực kì hot và năng động với mẫu cổ cao cổ thấp các màu, sản phẩm dễ phối đồ và đeo cực kì êm chân.. mọi người không cần bỏ ra số tiền quá lớn mà vẫn sở hữu được sản phẩm ưng í khi đến với shop mình. ');
/*!40000 ALTER TABLE `shoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoesitem`
--

DROP TABLE IF EXISTS `shoesitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoesitem` (
  `id` int NOT NULL,
  `price` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `shoesitem_ibfk_1` FOREIGN KEY (`id`) REFERENCES `shoes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoesitem`
--

LOCK TABLES `shoesitem` WRITE;
/*!40000 ALTER TABLE `shoesitem` DISABLE KEYS */;
INSERT INTO `shoesitem` VALUES (1,'250000'),(2,'350000'),(3,'360000'),(4,'270000'),(5,'540000');
/*!40000 ALTER TABLE `shoesitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ngaysinh` date DEFAULT NULL,
  `gioitinh` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdt` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `diachi` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'tu','1','2000-08-09','Male','tu@gmail.com','0123456789','hà nội','2');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-21 17:40:51
