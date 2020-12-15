-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: thuvien
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `ghinhanmatsach`
--

DROP TABLE IF EXISTS `ghinhanmatsach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ghinhanmatsach` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ngayGhiNhan` date NOT NULL,
  `tienPhat` int NOT NULL,
  `tenSach` int NOT NULL,
  `tenDocGia` int NOT NULL,
  `nguoiGhiNhan` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tenSach` (`tenSach`),
  KEY `tenDocGia` (`tenDocGia`),
  KEY `nguoiGhiNhan` (`nguoiGhiNhan`),
  CONSTRAINT `ghinhanmatsach_ibfk_1` FOREIGN KEY (`tenSach`) REFERENCES `thongtinsach` (`id`),
  CONSTRAINT `ghinhanmatsach_ibfk_2` FOREIGN KEY (`tenDocGia`) REFERENCES `thedocgia` (`id`),
  CONSTRAINT `ghinhanmatsach_ibfk_3` FOREIGN KEY (`nguoiGhiNhan`) REFERENCES `nhanvien` (`taiKhoan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghinhanmatsach`
--

LOCK TABLES `ghinhanmatsach` WRITE;
/*!40000 ALTER TABLE `ghinhanmatsach` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghinhanmatsach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanvien` (
  `taiKhoan` varchar(50) NOT NULL,
  `matKhau` varchar(50) NOT NULL,
  `hoVaTen` varchar(50) NOT NULL,
  `sinhNhat` date DEFAULT NULL,
  `diaChi` varchar(100) DEFAULT NULL,
  `soDienThoai` varchar(50) NOT NULL,
  `bangCap` enum('TuTai','TrungCap','CaoDang','DaiHoc','ThacSi','TienSi') NOT NULL,
  `boPhan` enum('ThuThu','ThuKho','ThuQuy','BanGiamDoc') NOT NULL,
  `chucVu` enum('GiamDoc','PhoGiamDoc','TruongPhong','PhoPhong','NhanVien') NOT NULL,
  PRIMARY KEY (`taiKhoan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES ('admin','21232f297a57a5a743894a0e4a801fc3','Lin Hua Chung','1998-04-13','QUận 11','0849966277','DaiHoc','BanGiamDoc','GiamDoc');
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieumuonsach`
--

DROP TABLE IF EXISTS `phieumuonsach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieumuonsach` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ngayMuon` date NOT NULL,
  `docGia` int NOT NULL,
  `maSach` int NOT NULL,
  `nguoiTiepNhan` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `docGia` (`docGia`),
  KEY `maSach` (`maSach`),
  KEY `nguoiTiepNhan` (`nguoiTiepNhan`),
  CONSTRAINT `phieumuonsach_ibfk_1` FOREIGN KEY (`docGia`) REFERENCES `thedocgia` (`id`),
  CONSTRAINT `phieumuonsach_ibfk_2` FOREIGN KEY (`maSach`) REFERENCES `thongtinsach` (`id`),
  CONSTRAINT `phieumuonsach_ibfk_3` FOREIGN KEY (`nguoiTiepNhan`) REFERENCES `nhanvien` (`taiKhoan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieumuonsach`
--

LOCK TABLES `phieumuonsach` WRITE;
/*!40000 ALTER TABLE `phieumuonsach` DISABLE KEYS */;
/*!40000 ALTER TABLE `phieumuonsach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieuthutienphat`
--

DROP TABLE IF EXISTS `phieuthutienphat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieuthutienphat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `soTienNo` int NOT NULL,
  `soTienThu` int NOT NULL,
  `conLai` int NOT NULL,
  `nguoiThuTien` varchar(50) NOT NULL,
  `theDocGia` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nguoiThuTien` (`nguoiThuTien`),
  KEY `theDocGia` (`theDocGia`),
  CONSTRAINT `phieuthutienphat_ibfk_1` FOREIGN KEY (`nguoiThuTien`) REFERENCES `nhanvien` (`taiKhoan`),
  CONSTRAINT `phieuthutienphat_ibfk_2` FOREIGN KEY (`theDocGia`) REFERENCES `thedocgia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieuthutienphat`
--

LOCK TABLES `phieuthutienphat` WRITE;
/*!40000 ALTER TABLE `phieuthutienphat` DISABLE KEYS */;
/*!40000 ALTER TABLE `phieuthutienphat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieutrasach`
--

DROP TABLE IF EXISTS `phieutrasach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieutrasach` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ngayTra` date NOT NULL,
  `tienPhatKiNay` int NOT NULL,
  `tienNo` int NOT NULL,
  `tongNo` int NOT NULL,
  `phieuMuonSach` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `phieuMuonSach` (`phieuMuonSach`),
  CONSTRAINT `phieutrasach_ibfk_1` FOREIGN KEY (`phieuMuonSach`) REFERENCES `phieumuonsach` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieutrasach`
--

LOCK TABLES `phieutrasach` WRITE;
/*!40000 ALTER TABLE `phieutrasach` DISABLE KEYS */;
/*!40000 ALTER TABLE `phieutrasach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thanhlysach`
--

DROP TABLE IF EXISTS `thanhlysach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thanhlysach` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ngayThanhLy` date NOT NULL,
  `nguoiThanhLy` varchar(50) NOT NULL,
  `maSach` int NOT NULL,
  `tenSach` varchar(50) NOT NULL,
  `lyDoThanhLy` enum('Mat','HuHong','NguoiDungLamMat') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nguoiThanhLy` (`nguoiThanhLy`),
  CONSTRAINT `thanhlysach_ibfk_1` FOREIGN KEY (`nguoiThanhLy`) REFERENCES `nhanvien` (`taiKhoan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thanhlysach`
--

LOCK TABLES `thanhlysach` WRITE;
/*!40000 ALTER TABLE `thanhlysach` DISABLE KEYS */;
/*!40000 ALTER TABLE `thanhlysach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thedocgia`
--

DROP TABLE IF EXISTS `thedocgia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thedocgia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hoVaTen` varchar(50) NOT NULL,
  `loaiDocGia` enum('DocGiaX','DocGiaY') NOT NULL,
  `sinhNhat` date NOT NULL,
  `diaChi` varchar(100) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `soLuongSach` int NOT NULL,
  `tongNo` int NOT NULL,
  `ngayLapThe` date NOT NULL,
  `nguoiLap` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `nguoiLap` (`nguoiLap`),
  CONSTRAINT `thedocgia_ibfk_1` FOREIGN KEY (`nguoiLap`) REFERENCES `nhanvien` (`taiKhoan`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thedocgia`
--

LOCK TABLES `thedocgia` WRITE;
/*!40000 ALTER TABLE `thedocgia` DISABLE KEYS */;
INSERT INTO `thedocgia` VALUES (1,'sadfadsf','DocGiaX','1997-09-08','adsfasfd','huachung1304@gmail.com',0,0,'2020-09-18','admin');
/*!40000 ALTER TABLE `thedocgia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thongtinsach`
--

DROP TABLE IF EXISTS `thongtinsach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thongtinsach` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenSach` varchar(255) NOT NULL,
  `theLoai` enum('ChinhTri','KhoaHoc','VanHoa','VanHoc','GiaoTrinh','Truyen','TamLy','ThieuNhi','Khac') NOT NULL,
  `tacGia` varchar(50) NOT NULL,
  `namXuatBan` varchar(50) NOT NULL,
  `nhaXuatBan` varchar(255) NOT NULL,
  `ngayNhap` date NOT NULL,
  `triGia` int NOT NULL,
  `tinhTrangSach` enum('Tontai','KhongTonTai','DangDuocMuon','DaThanhLy') NOT NULL,
  `HinhAnh` varchar(255) NOT NULL,
  `theDocGia` int NOT NULL,
  `nguoiTiepNhan` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nguoiTiepNhan` (`nguoiTiepNhan`),
  CONSTRAINT `thongtinsach_ibfk_1` FOREIGN KEY (`nguoiTiepNhan`) REFERENCES `nhanvien` (`taiKhoan`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thongtinsach`
--

LOCK TABLES `thongtinsach` WRITE;
/*!40000 ALTER TABLE `thongtinsach` DISABLE KEYS */;
INSERT INTO `thongtinsach` VALUES (1,'Tôi Từng Nghĩ Mọi Thứ Sẽ Ổn Khi Trở Thành Người Lớn','ChinhTri','Unkown','2012','Nhà Xuất Bản Văn Học','2020-09-18',76800,'Tontai','https://salt.tikicdn.com/cache/w390/ts/product/0b/e4/9d/9819a2afb854e301ebaf93e8e4a8a9d3.jpg',0,'admin'),(2,'Nhà Giả Kim','VanHoc','Unkown','2013','Nhà Xuất Bản Văn Học','2020-09-18',51750,'Tontai','https://salt.tikicdn.com/cache/w390/ts/product/66/5f/5a/312bac222584d52fea5e9d644369b254.jpg',0,'admin'),(3,'Dám Bị Ghét','ChinhTri','Unkown','2012','Nhà Xuất Bản Văn Học','2020-09-18',62140,'Tontai','https://salt.tikicdn.com/cache/w390/ts/product/74/11/ff/6304c47fec56e6f0b2110be65af0c7c2.jpg',0,'admin'),(4,'Vui Vẻ Không Quạu Nha - Tản Văn','ChinhTri','Unkown','2020','Nhà Xuất Bản Văn Học','2020-09-18',44730,'Tontai','https://salt.tikicdn.com/cache/w390/ts/product/b2/56/d3/17262447faaef713be60d6b25ec0551d.jpg',0,'admin'),(5,'Dưới Trời Xanh Không Có Anh Vẫn Mỉm Cười','VanHoc','Unkown','2020','Nhà Xuất Bản Văn Học','2020-09-18',70550,'Tontai','https://salt.tikicdn.com/cache/w390/ts/product/bb/83/bc/446d98528a2f6b4452f917912bebdb19.jpg',0,'admin'),(6,'Phải Lòng Với Cô Đơn','VanHoc','Unkown','2020','Nhà Xuất Bản Văn Học','2020-09-18',64000,'Tontai','https://salt.tikicdn.com/cache/w390/ts/product/2a/55/87/bd4e395e1f28a86551614988c11305ba.jpg',0,'admin'),(7,'Mình Buồn Đủ Rồi, Mình Hạnh Phúc T','VanHoc','Unkown','2020','Nhà Xuất Bản Văn Học','2020-09-18',76500,'Tontai','https://salt.tikicdn.com/cache/w390/ts/product/52/8c/b6/262cd2a8e610f2ee075b51100fa00a2c.jpg',0,'admin'),(8,'Anh Ấy Đã Không Nắm Tay Tôi','VanHoc','Unkown','2020','Nhà Xuất Bản Văn Học','2020-09-18',70000,'Tontai','https://salt.tikicdn.com/cache/w390/ts/product/4f/c5/9f/78ca1793f4cda009cee218e9421434e0.jpg',0,'admin'),(9,'Đừng Sợ Mình Sai Đừng Tin Mình Đúng - Tản Văn','VanHoc','Unkown','2020','Nhà Xuất Bản Văn Học','2020-09-18',57739,'Tontai','https://salt.tikicdn.com/cache/w390/ts/product/60/19/8b/f9e48030d008de400d64d4f133773816.jpg',0,'admin'),(10,'Có Lẽ Những Vì Sao Cũng Cảm Thấy Cô Đơn - Tản Văn Tranh (Tặng Kèm 3 Postcard)','VanHoc','Unkown','2020','Nhà Xuất Bản Văn Học','2020-09-18',62400,'Tontai','https://salt.tikicdn.com/cache/w390/ts/product/6b/a8/c6/7f662461eb93ea3d34bb3ae0d3bb6267.jpg',0,'admin'),(11,'Mình Đừng Quên Nhau','VanHoc','Unkown','2020','Nhà Xuất Bản Văn Học','2020-09-18',64790,'Tontai','https://salt.tikicdn.com/cache/w390/ts/product/c2/1b/8c/800c99c1c0a4ecf1fdf4d831ce5fe341.jpg',0,'admin'),(12,'Thương Người Năm Ấy Rời Xa Năm Này-Tản Văn','VanHoc','Unkown','2020','Nhà Xuất Bản Văn Học','2020-09-18',62140,'Tontai','https://salt.tikicdn.com/cache/w390/ts/product/0e/16/c7/559ffa6b9b7454e0e378afd42116d85b.jpg',0,'admin');
/*!40000 ALTER TABLE `thongtinsach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'thuvien'
--

--
-- Dumping routines for database 'thuvien'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-19 14:45:56
