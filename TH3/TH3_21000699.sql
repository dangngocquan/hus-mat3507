-- Tạo cơ sở dữ liệu 
CREATE DATABASE `QUAN_LY_DE_AN`;
USE `QUAN_LY_DE_AN`;

-- Tạo các bảng

CREATE TABLE `NHANVIEN` 
(
    `HONV` VARCHAR(15) NOT NULL COMMENT 'Họ của nhân viên',
    `TENLOT` VARCHAR(15) NOT NULL COMMENT 'Tên lót của nhân viên',
    `TENNV` VARCHAR(15) NOT NULL COMMENT 'Tên của nhân viên',
    `MANV` VARCHAR(9) NOT NULL COMMENT 'Mã số nhân viên',
    `NGSINH` DATE NOT NULL COMMENT 'Ngày tháng năm sinh nhân viên',
    `DCHI` VARCHAR(30) NOT NULL COMMENT 'Địa chỉ cư ngụ của nhân viên',
    `PHAI` VARCHAR(3) NOT NULL COMMENT 'Giới tính',
    `LUONG` DECIMAL(10,0) NOT NULL COMMENT 'Lương nhân viên',
    `MA_NQL` VARCHAR(9) NOT NULL COMMENT 'Mã người quản lý',
    `PHG` INT(11) NOT NULL COMMENT 'Mã phòng'
);

CREATE TABLE `PHONGBAN`
(
    `TENPHG` VARCHAR(15) NOT NULL COMMENT 'Tên phòng ban',
    `MAPHG` INT(11) NOT NULL COMMENT 'Mã phòng ban',
    `TRPHG` VARCHAR(9) NOT NULL COMMENT 'Mã người trưởng phòng',
    `NG_NHANCHUC` DATE NOT NULL COMMENT 'Ngày nhận chức trưởng phòng'
);

CREATE TABLE `DIADIEM_PHG`
(
    `MAPHG` INT(11) NOT NULL COMMENT 'Mã phòng ban',
    `DIADIEM` VARCHAR(15) NOT NULL COMMENT 'Địa điểm phòng ban'
);

CREATE TABLE `DEAN`
(
    `TENDA` VARCHAR(15) NOT NULL COMMENT 'Tên đề án',
    `MADA` INT(11) NOT NULL COMMENT 'Mã số đề án',
    `DDIEM_DA` VARCHAR(15) NOT NULL COMMENT 'Địa điểm diễn ra đề án',
    `PHONG` INT(11) NOT NULL COMMENT 'Mã phòng ban'
);

CREATE TABLE `CONGVIEC`
(
    `MADA` INT(11) NOT NULL COMMENT 'Mã số đề án',
    `STT` INT(11) NOT NULL COMMENT 'Số thứ tự công việc trong một đề án',
    `TEN_CONG_VIEC` VARCHAR(50) NOT NULL COMMENT 'Tên công việc'
);

CREATE TABLE `PHANCONG`
(
    `MA_NVIEN` VARCHAR(9) NOT NULL COMMENT 'Mã số nhân viên',
    `MADA` INT(11) NOT NULL COMMENT 'Mã số đề án',
    `STT` INT(11) NOT NULL COMMENT 'Số thứ tự công việc trong môỵ đề án',
    `THOIGIAN` DECIMAL(5,1) NOT NULL COMMENT 'Thời gian làm việc 1 đề án của 1 nhân viên trong 1 tuần'
);

CREATE TABLE `THANNHAN`
(
    `MA_NVIEN` VARCHAR(9) NOT NULL COMMENT 'Mã số nhân viên',
    `TENTN` VARCHAR(15) NOT NULL COMMENT 'Tên thân nhân của nhân viên',
    `PHAI` VARCHAR(3) NOT NULL COMMENT 'Giới tính',
    `NGSINH` DATE NOT NULL COMMENT 'Ngày sinh',
    `QUANHE` VARCHAR(15) NOT NULL COMMENT 'Mối quan hệ với nhân viên'
);


-- Thêm dữ liệu vào các bảng
INSERT INTO `NHANVIEN` (`HONV`, `TENLOT`, `TENNV`, `MANV`, `NGSINH`, `DCHI`, `PHAI`, `LUONG`, `MA_NQL`, `PHG`) VALUES
('Đinh', 'Bá', 'Tiên', '009', '1960-02-11', '119 Cống Quỳnh, Tp HCM', 'Nam', '30000', '005', 5),
('Nguyễn', 'Thanh', 'Tùng', '005', '1962-08-20', '222 Nguyễn Văn Cừ, Tp HCM', 'Nam', '40000', '006', 5),
('Bùi', 'Ngọc', 'Hằng', '007', '1954-03-11', '332 Nguyễn Thái Học, Tp HCM', 'Nam', '25000', '001', 4),
('Lê', 'Quỳnh', 'Như', '001', '1967-02-01', '291 Hồ Văn Huế, Tp HCM', 'Nữ', '43000', '006', 4),
('Nguyễn', 'Mạnh', 'Hùng', '004', '1967-03-04', '95 Bà Rịa, Vũng Tàu', 'Nam', '38000', '005', 5),
('Trần', 'Thanh', 'Tâm', '003', '1957-05-04', '34 Mai Thị Lự, Tp HCM', 'Nam', '25000', '005', 5),
('Phạm', 'Văn', 'Vinh', '006', '1965-01-01', '45 Trưng Vương, Hà Nội', 'Nữ', '55000', '', 1),
('Trần', 'Hồng', 'Quang', '008', '1967-09-01', '80 Lê Hồng Phong, Tp HCM', 'Nam', '25000', '001', 4);

INSERT INTO `PHONGBAN` (`TENPHG`, `MAPHG`, `TRPHG`, `NG_NHANCHUC`) VALUES
('Quản lý', 1, '006', '1971-06-19'),
('Điều hành', 4, '008', '1985-01-01'),
('Nghiên cứu', 5, '005', '1978-05-22');

INSERT INTO `DEAN` (`TENDA`, `MADA`, `DDIEM_DA`, `PHONG`) VALUES
('San pham X', 1, 'Vũng Tàu', 5),
('San pham Y', 2, 'Nha Trang', 5),
('San pham Z', 3, 'TP HCM', 5),
('Tin hoc hoa', 10, 'Hà Nội', 4),
('Cap quang', 20, 'TP HCM', 1),
('Dao tao', 30, 'Hà Nội', 4);

INSERT INTO `DIADIEM_PHG` (`MAPHG`, `DIADIEM`) VALUES
(1, 'TP HCM'),
(4, 'Hà Nội'),
(5, 'NHA TRANG'),
(5, 'TAU'),
(5, 'TP HCM');

INSERT INTO `PHANCONG` (`MA_NVIEN`, `MADA`, `STT`, `THOIGIAN`) VALUES
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

INSERT INTO `CONGVIEC` (`MADA`, `STT`, `TEN_CONG_VIEC`) VALUES
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

INSERT INTO `THANNHAN` (`MA_NVIEN`, `TENTN`, `PHAI`, `NGSINH`, `QUANHE`) VALUES
('001', 'Minh', 'Nam', '1932-02-29', 'Vợ chồng'),
('005', 'Khang', 'Nam', '1973-10-25', 'Con trai'),
('005', 'Phương', 'Nữ', '1948-05-03', 'Vợ chồng'),
('005', 'Trinh', 'Nữ', '1976-04-05', 'Con gái'),
('009', 'Châu', 'Nữ', '1978-12-30', 'Con gái'),
('009', 'Phương', 'Nữ', '1957-05-05', 'Vợ chồng'),
('009', 'Tiến', 'Nam', '1978-01-01', 'Con trai');

-- Tạo khóa chính
ALTER TABLE `NHANVIEN` ADD PRIMARY KEY (`MANV`);
ALTER TABLE `PHONGBAN` ADD PRIMARY KEY (`MAPHG`);
ALTER TABLE `DEAN` ADD PRIMARY KEY (`MADA`);
ALTER TABLE `DIADIEM_PHG` ADD PRIMARY KEY (`MAPHG`, `DIADIEM`);
ALTER TABLE `PHANCONG` ADD PRIMARY KEY (`MA_NVIEN`, `MADA`, `STT`);
ALTER TABLE `CONGVIEC` ADD PRIMARY KEY (`MADA`, `STT`);
ALTER TABLE `THANNHAN` ADD PRIMARY KEY (`MA_NVIEN`, `TENTN`);

-- Tạo khóa ngoại
ALTER TABLE `NHANVIEN` ADD CONSTRAINT `fk_NHANVIEN_PHG_REFERENCES_PHONGBAN_MAPHG`
    FOREIGN KEY (`PHG`) REFERENCES `PHONGBAN`(`MAPHG`);
ALTER TABLE `PHONGBAN` ADD CONSTRAINT `fk_PHONGBAN_TRPHG_REFERENCES_NHANVIEN_MANV`
    FOREIGN KEY (`TRPHG`) REFERENCES `NHANVIEN`(`MANV`);
ALTER TABLE `DEAN` ADD CONSTRAINT `fk_DEAN_PHONG_REFERENCES_PHONGBAN_MAPHG`
    FOREIGN KEY (`PHONG`) REFERENCES `PHONGBAN`(`MAPHG`);
ALTER TABLE `DIADIEM_PHG` ADD CONSTRAINT `fk_DIADIEMPHG_MAPHG_REFERENCES_PHONGBAN_MAPHG`
    FOREIGN KEY (`MAPHG`) REFERENCES `PHONGBAN`(`MAPHG`);
ALTER TABLE `PHANCONG` ADD CONSTRAINT `fk_PHANCONG_MADA_STT_REFERENCES_CONGVIEC_MADA_STT`
    FOREIGN KEY (`MADA`, `STT`) REFERENCES `CONGVIEC`(`MADA`, `STT`);
ALTER TABLE `PHANCONG` ADD CONSTRAINT `fk_PHANCONG_MA_NVIEN_REFERENCES_NHANVIEN_MANV`
    FOREIGN KEY (`MA_NVIEN`) REFERENCES `NHANVIEN`(`MANV`);
ALTER TABLE `CONGVIEC` ADD CONSTRAINT `fk_CONGVIEC_MADA_REFERENCES_DEAN_MADA`
    FOREIGN KEY (`MADA`) REFERENCES `DEAN`(`MADA`);