-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 21, 2023 lúc 08:43 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qlda`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `congviec`
--

CREATE TABLE `congviec` (
  `MADA` int(11) NOT NULL,
  `STT` int(11) NOT NULL,
  `TEN_CONG_VIEC` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `congviec`
--

INSERT INTO `congviec` (`MADA`, `STT`, `TEN_CONG_VIEC`) VALUES
(1, 1, 'Thiet ke san pham X'),
(1, 2, 'Thu nghiem san pham X'),
(2, 1, 'San xuat san pham Y'),
(2, 2, 'Quang cao san pham Y'),
(3, 1, 'Khuyen mai san pham Z'),
(10, 1, 'Tin hoc hoa nhan su tien luong'),
(10, 2, 'Tin hoc hoa phong Kinh doanh'),
(20, 1, 'Lap dat cap quang'),
(30, 1, 'Dao tao nhan vien Marketing'),
(30, 2, 'Dao tao chuyen vien thiet ke');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dean`
--

CREATE TABLE `dean` (
  `TENDA` varchar(15) NOT NULL,
  `MADA` int(11) NOT NULL,
  `DDIEM_DA` varchar(15) NOT NULL,
  `PHONG` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `dean`
--

INSERT INTO `dean` (`TENDA`, `MADA`, `DDIEM_DA`, `PHONG`) VALUES
('San pham X', 1, 'Vũng Tàu', 5),
('San pham Y', 2, 'Nha Trang', 5),
('San pham Z', 3, 'TP HCM', 5),
('Tin hoc hoa', 10, 'Hà Nội', 4),
('Cap quang', 20, 'TP HCM', 1),
('Dao tao', 30, 'Hà Nội', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `diadiem_phg`
--

CREATE TABLE `diadiem_phg` (
  `MAPHG` int(11) NOT NULL,
  `DIADIEM` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `diadiem_phg`
--

INSERT INTO `diadiem_phg` (`MAPHG`, `DIADIEM`) VALUES
(1, 'TP HCM'),
(4, 'Hà Nội'),
(5, 'NHA TRANG'),
(5, 'TAU'),
(5, 'TP HCM');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `HONV` varchar(15) NOT NULL,
  `TENLOT` varchar(15) NOT NULL,
  `TENNV` varchar(15) NOT NULL,
  `MANV` varchar(9) NOT NULL,
  `NGSINH` date NOT NULL,
  `DCHI` varchar(30) NOT NULL,
  `PHAI` varchar(3) NOT NULL,
  `LUONG` decimal(10,0) NOT NULL,
  `MA_NQL` varchar(9) NOT NULL,
  `PHG` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`HONV`, `TENLOT`, `TENNV`, `MANV`, `NGSINH`, `DCHI`, `PHAI`, `LUONG`, `MA_NQL`, `PHG`) VALUES
('Lê', 'Quỳnh', 'Như', '001', '1967-02-01', '291 Hồ Văn Huế, Tp HCM', 'Nữ', '43000', '006', 4),
('Trần', 'Thanh', 'Tâm', '003', '1957-05-04', '34 Mai Thị Lự, Tp HCM', 'Nam', '25000', '005', 5),
('Nguyễn', 'Mạnh', 'Hùng', '004', '1967-03-04', '95 Bà Rịa, Vũng Tàu', 'Nam', '38000', '005', 5),
('Nguyễn', 'Thanh', 'Tùng', '005', '1962-08-20', '222 Nguyễn Văn Cừ, Tp HCM', 'Nam', '40000', '006', 5),
('Phạm', 'Văn', 'Vinh', '006', '1965-01-01', '45 Trưng Vương, Hà Nội', 'Nữ', '55000', '', 1),
('Bùi', 'Ngọc', 'Hằng', '007', '1954-03-11', '332 Nguyễn Thái Học, Tp HCM', 'Nam', '25000', '001', 4),
('Trần', 'Hồng', 'Quang', '008', '1967-09-01', '80 Lê Hồng Phong, Tp HCM', 'Nam', '25000', '001', 4),
('Đinh', 'Bá', 'Tiên', '009', '1960-02-11', '119 Cống Quỳnh, Tp HCM', 'Nam', '30000', '005', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phancong`
--

CREATE TABLE `phancong` (
  `MA_NVIEN` varchar(9) NOT NULL,
  `MADA` int(11) NOT NULL,
  `STT` int(11) NOT NULL,
  `THOIGIAN` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phancong`
--

INSERT INTO `phancong` (`MA_NVIEN`, `MADA`, `STT`, `THOIGIAN`) VALUES
('001', 20, 1, '15'),
('001', 30, 1, '20'),
('003', 1, 2, '20'),
('003', 2, 1, '20'),
('004', 3, 1, '40'),
('005', 3, 1, '10'),
('005', 10, 2, '10'),
('005', 20, 1, '10'),
('006', 20, 1, '30'),
('007', 10, 2, '10'),
('007', 30, 2, '30'),
('008', 10, 1, '35'),
('008', 30, 2, '5'),
('009', 1, 1, '32'),
('009', 2, 2, '8');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phongban`
--

CREATE TABLE `phongban` (
  `TENPHG` varchar(15) NOT NULL,
  `MAPHG` int(11) NOT NULL,
  `TRPHG` varchar(9) NOT NULL,
  `NG_NHANCHUC` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phongban`
--

INSERT INTO `phongban` (`TENPHG`, `MAPHG`, `TRPHG`, `NG_NHANCHUC`) VALUES
('Quản lý', 1, '006', '1971-06-19'),
('Điều hành', 4, '008', '1985-01-01'),
('Nghiên cứu', 5, '005', '1978-05-22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thannhan`
--

CREATE TABLE `thannhan` (
  `MA_NVIEN` varchar(9) NOT NULL,
  `TENTN` varchar(15) NOT NULL,
  `PHAI` varchar(3) NOT NULL,
  `NGSINH` date NOT NULL,
  `QUANHE` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `thannhan`
--

INSERT INTO `thannhan` (`MA_NVIEN`, `TENTN`, `PHAI`, `NGSINH`, `QUANHE`) VALUES
('001', 'Minh', 'Nam', '1932-02-29', 'Vợ chồng'),
('005', 'Khang', 'Nam', '1973-10-25', 'Con trai'),
('005', 'Phương', 'Nữ', '1948-05-03', 'Vợ chồng'),
('005', 'Trinh', 'Nữ', '1976-04-05', 'Con gái'),
('009', 'Châu', 'Nữ', '1978-12-30', 'Con gái'),
('009', 'Phương', 'Nữ', '1957-05-05', 'Vợ chồng'),
('009', 'Tiến', 'Nam', '1978-01-01', 'Con trai');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `congviec`
--
ALTER TABLE `congviec`
  ADD PRIMARY KEY (`MADA`,`STT`);

--
-- Chỉ mục cho bảng `dean`
--
ALTER TABLE `dean`
  ADD PRIMARY KEY (`MADA`),
  ADD KEY `PHONG` (`PHONG`);

--
-- Chỉ mục cho bảng `diadiem_phg`
--
ALTER TABLE `diadiem_phg`
  ADD PRIMARY KEY (`MAPHG`,`DIADIEM`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`MANV`),
  ADD KEY `PHG` (`PHG`);

--
-- Chỉ mục cho bảng `phancong`
--
ALTER TABLE `phancong`
  ADD PRIMARY KEY (`MA_NVIEN`,`MADA`,`STT`),
  ADD KEY `MADA` (`MADA`,`STT`);

--
-- Chỉ mục cho bảng `phongban`
--
ALTER TABLE `phongban`
  ADD PRIMARY KEY (`MAPHG`),
  ADD KEY `TRPNG` (`TRPHG`);

--
-- Chỉ mục cho bảng `thannhan`
--
ALTER TABLE `thannhan`
  ADD PRIMARY KEY (`MA_NVIEN`,`TENTN`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `congviec`
--
ALTER TABLE `congviec`
  ADD CONSTRAINT `congviec_ibfk_1` FOREIGN KEY (`MADA`) REFERENCES `dean` (`MADA`);

--
-- Các ràng buộc cho bảng `dean`
--
ALTER TABLE `dean`
  ADD CONSTRAINT `dean_ibfk_1` FOREIGN KEY (`PHONG`) REFERENCES `phongban` (`MAPHG`);

--
-- Các ràng buộc cho bảng `diadiem_phg`
--
ALTER TABLE `diadiem_phg`
  ADD CONSTRAINT `diadiem_phg_ibfk_1` FOREIGN KEY (`MAPHG`) REFERENCES `phongban` (`MAPHG`);

--
-- Các ràng buộc cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`PHG`) REFERENCES `phongban` (`MAPHG`);

--
-- Các ràng buộc cho bảng `phancong`
--
ALTER TABLE `phancong`
  ADD CONSTRAINT `phancong_ibfk_1` FOREIGN KEY (`MADA`,`STT`) REFERENCES `congviec` (`MADA`, `STT`),
  ADD CONSTRAINT `phancong_ibfk_2` FOREIGN KEY (`MA_NVIEN`) REFERENCES `nhanvien` (`MANV`);

--
-- Các ràng buộc cho bảng `phongban`
--
ALTER TABLE `phongban`
  ADD CONSTRAINT `phongban_ibfk_1` FOREIGN KEY (`TRPHG`) REFERENCES `nhanvien` (`MANV`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
