-- 1
SELECT *
FROM nhanvien
WHERE PHG = 4;

-- 2
SELECT *
FROM nhanvien
WHERE LUONG > 30000;

-- 3
SELECT *
FROM nhanvien
WHERE 
    (LUONG > 25000 AND PHG = 4) 
    OR (LUONG > 30000 AND PHG = 5);

-- 4
SELECT CONCAT(HONV, ' ', TENLOT, ' ', TENNV) AS HOTEN
FROM nhanvien, phongban, diadiem_phg
WHERE 
    nhanvien.PHG = phongban.MAPHG 
    AND phongban.MAPHG = diadiem_phg.MAPHG
    AND DIADIEM = 'TP HCM';

-- 5
SELECT CONCAT(HONV, ' ', TENLOT, ' ', TENNV) AS HOTEN
FROM nhanvien
WHERE HONV LIKE 'N%';

-- 6
SELECT NGSINH, DCHI
FROM nhanvien
WHERE 
    HONV = 'Đinh' 
    AND TENLOT = 'Bá' 
    AND TENNV = 'Tiến';

-- 7
SELECT *
FROM nhanvien
WHERE 
    YEAR(NGSINH) >= 1960 
    AND YEAR(NGSINH) <= 1965;

-- 8
SELECT 
    CONCAT(HONV, ' ', TENLOT, ' ', TENNV) AS HOTEN,
    YEAR(NGSINH) AS NAMSINH
FROM nhanvien;

-- 9
SELECT 
    CONCAT(HONV, ' ', TENLOT, ' ', TENNV) AS HOTEN,
    YEAR(CURRENT_TIMESTAMP) - YEAR(NGSINH) AS TUOI
FROM nhanvien;

-- 10
SELECT TENPHG, DIADIEM
FROM 
    phongban JOIN diadiem_phg
    ON phongban.MAPHG = diadiem_phg.MAPHG;

-- 11
SELECT 
    CONCAT(HONV, ' ', TENLOT, ' ', TENNV) AS HOTEN,
    PHG
FROM 
    nhanvien JOIN phongban
    ON nhanvien.MANV = phongban.TRPHG;

-- 12
SELECT 
    CONCAT(HONV, ' ', TENLOT, ' ', TENNV) AS HOTEN,
    DCHI
FROM 
    nhanvien JOIN phongban
    ON nhanvien.PHG = phongban.MAPHG
WHERE TENPHG = 'Nghiên cứu';

-- 13
SELECT 
    TENDA,
    TENPHG,
    CONCAT(HONV, ' ', TENLOT, ' ', TENNV) AS HOTEN,
    NG_NHANCHUC
FROM 
    (dean JOIN phongban
    ON dean.PHONG = phongban.MAPHG)
    JOIN nhanvien
    ON phongban.TRPHG = nhanvien.MANV;

-- 14
SELECT 
    CONCAT(HONV, ' ', TENLOT, ' ', TENNV) AS HOTENNV,
    TENTN
FROM 
    nhanvien LEFT JOIN thannhan 
    ON nhanvien.MANV = thannhan.MA_NVIEN
WHERE nhanvien.PHAI = 'Nữ';

-- 15
SELECT 
    CONCAT(nv1.HONV, ' ', nv1.TENLOT, ' ', nv1.TENNV) AS HOTENNV,
    CONCAT(nv2.HONV, ' ', nv2.TENLOT, ' ', nv2.TENNV) AS HOTENNQL
FROM 
    nhanvien AS nv1 
    LEFT JOIN nhanvien AS nv2 
    ON nv1.MA_NQL = nv2.MANV;

-- 16
SELECT 
    CONCAT(nv1.HONV, ' ', nv1.TENLOT, ' ', nv1.TENNV) AS HOTENNV,
    CONCAT(nv2.HONV, ' ', nv2.TENLOT, ' ', nv2.TENNV) AS HOTENNQL,
    CONCAT(nv3.HONV, ' ', nv3.TENLOT, ' ', nv3.TENNV) AS HOTENTRPHG
FROM 
    (
        nhanvien AS nv1 
        LEFT JOIN nhanvien AS nv2 
        ON nv1.MA_NQL = nv2.MANV
    )
    JOIN 
    (
        phongban JOIN nhanvien AS nv3 
        ON phongban.TRPHG = nv3.MANV
    )
    ON nv1.PHG = phongban.MAPHG;
    
-- 17
SELECT 
    CONCAT(nv1.HONV, ' ', nv1.TENLOT, ' ', nv1.TENNV) AS HOTENNV
FROM 
    (
        nhanvien AS nv1
        JOIN dean
        ON nv1.PHG = dean.PHONG
    )
    LEFT JOIN nhanvien AS nv2
    ON nv1.MA_NQL = nv2.MANV
WHERE 
    nv1.PHG = 5
    AND dean.TENDA = 'San pham X'
    AND CONCAT(nv2.HONV, ' ', nv2.TENLOT, ' ', nv2.TENNV) = 'Nguyễn Thanh Tùng';

