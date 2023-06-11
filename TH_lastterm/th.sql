-- TRUY VẤN ĐƠN GIẢN

-- 1. Tìm các nhân viên làm việc ở phòng số 4
SELECT *
FROM nhanvien
WHERE PHG = 4;

-- 2. Tìm các nhân viên có mức lương trên 30000
SELECT *
FROM nhanvien
WHERE LUONG > 30000;

-- 3. Tìm các nhân viên có mức lương trên 25,000 ở phòng 4 hoặc các nhân viên có mức lương trên 30,000 ở phòng 5
SELECT *
FROM nhanvien
WHERE (LUONG > 25000 AND PHG = 4) OR (LUONG > 30000 AND PHG = 5);

-- 4. Cho biết họ tên đầy đủ của các nhân viên ở TP HCM
SELECT (HONV || TENLOT || TENNV) AS HOTENNV
FROM nhanvien, diadiem_phg
WHERE nhanvien.PHG = diadiem_phg.MAPHG AND DIADIEM = 'TP HCM';

-- 5. Cho biết họ tên đầy đủ của các nhân viên có họ bắt đầu bằng ký tự ‘N’
SELECT (HOTEN || TENLOT || TENNV) AS HOTENNV
FROM nhanvien
WHERE HONV LIKE 'N%';

-- 6. Cho biết ngày sinh và địa chỉ của nhân viên Dinh Ba Tien
SELECT NGSINH, DCHI
FROM nhanvien
WHERE (HOTEN || TENLOT || TENNV) = 'Dinh Ba Tien';

-- Nếu chỉ là ngày sinh (không phải ngày tháng năm sinh)
SELECT 
    strftime(%d, NGSINH) AS NGAYSINH, 
    DCHI
FROM nhanvien
WHERE (HOTEN || TENLOT || TENNV) = 'Dinh Ba Tien';

-- 7. Cho biết các nhân viên có năm sinh trong khoảng 1960 đến 1965
SELECT *
FROM nhanvien
WHERE strftime(%d, NGSINH) >= '1960' AND strftime(%d, NGSINH) <= '1965'

-- 8. Cho biết các nhân viên và năm sinh của nhân viên
SELECT 
    (HOTEN || TENLOT || TENNV) AS HOTENNV, 
    strftime(%Y, NGSINH) AS NAMSINH
FROM nhanvien

-- 9. Cho biết các nhân viên và tuổi của nhân viên
SELECT 
    (HOTEN || TENLOT || TENNV) AS HOTENNV, 
    strftime(%Y, CURRENT_TIMESTAMP) - strftime(%Y, NGSINH) AS TUOI
FROM nhanvien;

-- Hoặc
SELECT 
    (HOTEN || TENLOT || TENNV) AS HOTENNV, 
    CONVERT(strftime(%Y, CURRENT_TIMESTAMP), SIGNED INTEGER) - CONVERT(strftime(%Y, NGSINH), SIGNED INTEGER) AS TUOI
FROM nhanvien;



-- TRUY VẤN CÓ SỬ DỤNG PHÉP KẾT

-- 10. Với mỗi phòng ban, cho biết tên phòng ban và địa điểm phòng
SELECT phongban.TENPHG, diadiem_phg.DIADIEM
FROM phogban, diadiem_phg
WHERE phogban.MAPHG = diadiem_phg.MAPHG;

-- 11. Tìm tên những người trưởng phòng của từng phòng ban
SELECT 
    phongban.TENPHG,
    phongban.MAPHG,
    (nhanvien.HONV || nhanvien.TENLOT || nhanvien.TENNV) AS TRGPHONG
FROM phongban, nhanvien
WHERE phongban.TRPHG = nhanvien.MANV;

-- 12. Tìm tên và địa chỉ của tất cả các nhân viên của phòng "Nghiên cứu".
SELECT 
    (HONV || TENLOT || TENNV) AS HOTENNV,
    DCHI
FROM nhanvien
WHERE PHG IN (
    SELECT MAPHG
    FROM phongban
    WHERE TENPHG = 'Nghiên cứu'
);

-- 13. Với mỗi đề án ở Hà Nội, cho biết tên đề án, tên phòng ban, họ tên và ngày nhận chức của trưởng phòng của phòng ban chủ trì đề án đó.
SELECT
    dean.TENDA,
    phongban.TENPHG,
    (HONV || TENLOT || TENNV) AS TRPHONG,
    nhanvien.NG_NHANCHUC
FROM dean, phongban, nhanvien
WHERE 
    dean.PHONG = phongban.MAPHG
    AND phongban.TRGPHONG = nhanvien.MANV;

-- 14. Tìm tên những nữ nhân viên và tên người thân của họ
SELECT
    (nv.HONV || nv.TENLOT || nv.TENNV) AS HOTENNV,
    thannhan.TENTN
FROM 
    nhanvien LEFT JOIN thannhan ON nhanvien.MANV = thannhan.MA_NVIEN
WHERE
    nhanvien.PHAI = 'Nữ';


-- 15. Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên người quản lý trực tiếp của nhân viên đó
SELECT
    (nv1.HONV || nv1.TENLOT || nv1.TENNV) AS HOTENNV,
    (nv2.HONV || nv2.TENLOT || nv2.TENNV) AS HOTEN_NQL
FROM
    nhanvien AS nv1 LEFT JOIN nhanvien AS nv2 ON nv1.MA_NQL = nv2.MANV;

-- 16. Với mỗi nhân viên, cho biết họ tên của nhân viên đó, họ tên người trưởng phòng và họ tên người quản lý trực tiếp của nhân viên đó
SELECT
    (nv1.HONV || nv1.TENLOT || nv1.TENNV) AS HOTENNV,
    (nv2.HONV || nv2.TENLOT || nv2.TENNV) AS HOTENTRPHG,
    (nv3.HONV || nv3.TENLOT || nv3.TENNV) AS HOTEN_NQL
FROM
    nhanvien AS nv1 JOIN phongban AS pb ON nv1.PHG = pb.MAPHG
    LEFT JOIN nhanvien AS nv2 ON pb.TRPHG = nv2.MANV
    LEFT JOIN nhanvien AS nv3 ON nv1.MA_NQL = nv3.MANV;

-- 17. Tên những nhân viên phòng số 5 có tham gia vào đề án "San pham X" và nhân viên này do "Nguyen Thanh Tung" quản lý trực tiếp
SELECT (HONV || TENLOT || TENNV) AS HOTENNV
FROM nhanvien
WHERE 
    PHG = 5
    AND MANV IN (
        SELECT MA_NVIEN
        FROM phancong
        WHERE MADA IN (
            SELECT MADA
            FROM dean
            WHERE TENDA = 'San pham X'
        )
    )
    AND MA_NQL IN (
        SELECT nv1.MANV
        FROM nhanvien AS nv1
        WHERE (nv1.HONV || nv1.TENLOT || nv1.TENNV) = 'Nguyen Thanh Tung'
    );