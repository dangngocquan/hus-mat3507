-- 1
SELECT 
    phongban.TENPHG,
    diadiem_phg.DIADIEM
FROM 
    phongban LEFT JOIN diadiem_phg
    ON phongban.MAPHG = diadiem_phg.MAPHG;

-- 2
SELECT 
    phongban.TENPHG,
    nhanvien.TENNV AS TRPHG
FROM 
    phongban LEFT JOIN nhanvien
    ON phongban.TRPHG = nhanvien.MANV; 

-- 3
SELECT
    nhanvien.TENNV,
    nhanvien.DCHI
FROM 
    nhanvien LEFT JOIN phongban
    ON nhanvien.PHG = phongban.MAPHG
WHERE 
    phongban.TENPHG = 'Nghiên cứu';

-- 3 (way 2)
SELECT
    nhanvien.TENNV,
    nhanvien.DCHI
FROM nhanvien
WHERE 
    PHG = (
        SELECT MAPHG
        FROM phongban
        WHERE TENPHG = 'Nghiên cứu'
    );

-- 4
SELECT
    dean.TENDA,
    phongban.TENPHG,
    CONCAT(nv.HONV, ' ', nv.TENLOT, ' ', nv.TENNV) AS HOTEN_TRPHG,
    phongban.NG_NHANCHUC
FROM
    (
        dean LEFT JOIN phongban
        ON dean.PHONG = phongban.MAPHG
    )
    LEFT JOIN nhanvien AS nv
    ON phongban.TRPHG = nv.MANV
WHERE 
    dean.DDIEM_DA = 'Hà Nội';

-- 5
SELECT 
    nhanvien.TENNV,
    thannhan.TENTN
FROM
    nhanvien LEFT JOIN thannhan
    ON nhanvien.MANV = thannhan.MA_NVIEN
WHERE
    nhanvien.PHAI = 'Nữ';

-- 6
SELECT 
    CONCAT(nv1.HONV, ' ', nv1.TENLOT, ' ', nv1.TENNV) AS HOTEN_NV,
    CONCAT(nv2.HONV, ' ', nv2.TENLOT, ' ', nv2.TENNV) AS HOTEN_NQL
FROM 
    nhanvien AS nv1
    LEFT JOIN nhanvien AS nv2
    ON nv1.MA_NQL = nv2.MANV;

-- 7
SELECT 
    CONCAT(nv1.HONV, ' ', nv1.TENLOT, ' ', nv1.TENNV) AS HOTEN_NV,
    CONCAT(nv2.HONV, ' ', nv2.TENLOT, ' ', nv2.TENNV) AS HOTEN_TRPHG,
    CONCAT(nv3.HONV, ' ', nv3.TENLOT, ' ', nv3.TENNV) AS HOTEN_TRPHG
FROM
    (
        (
            nhanvien AS nv1
            LEFT JOIN nhanvien AS nv2
            ON nv1.MA_NQL = nv2.MANV
        )
        LEFT JOIN phongban
        ON nv1.PHG = phongban.MAPHG
    )
    LEFT JOIN nhanvien AS nv3
    ON phongban.TRPHG = nv3.MANV;

-- 8
SELECT nv1.TENNV
FROM
    (
        (
            nhanvien AS nv1 
            LEFT JOIN phongban
            ON nv1.PHG = phongban.MAPHG
        )
        LEFT JOIN dean
        ON phongban.MAPHG = dean.PHONG
    ) 
    LEFT JOIN nhanvien AS nv2
    ON nv1.MA_NQL = nv2.MANV
WHERE
    nv1.PHG = 5
    AND dean.TENDA = 'San pham X'
    AND CONCAT(nv2.HONV, ' ', nv2.TENLOT, ' ', nv2.TENNV) = 'Nguyễn Thanh Tùng';

-- 8 (way 2)
SELECT TENNV
FROM nhanvien
WHERE
    PHG = 5
    AND PHG IN (
        SELECT PHONG
        FROM dean
        WHERE TENDA = 'San pham X'
    )
    AND MA_NQL IN (
        SELECT MANV
        FROM nhanvien
        WHERE CONCAT(HONV, ' ', TENLOT, ' ', TENNV) = 'Nguyễn Thanh Tùng'
    );

-- 9
SELECT dean.TENDA
FROM
    nhanvien AS nv
    LEFT JOIN dean
    ON nv.PHG = dean.PHONG
WHERE
    CONCAT(nv.HONV, ' ', nv.TENLOT, ' ', nv.TENNV) = 'Đinh Bá Tiến';

-- 9 (way 2)
SELECT TENDA
FROM dean
WHERE 
    PHONG IN (
        SELECT PHG
        FROM nhanvien
        WHERE CONCAT(HONV, ' ', TENLOT, ' ', TENNV) = 'Đinh Bá Tiến'
    );

-- 10 
SELECT COUNT(MADA) AS SL_DEAN
FROM dean

-- 11
SELECT COUNT(MADA) AS SL_DEAN
FROM dean
WHERE
    PHONG IN (
        SELECT MAPHG
        FROM phongban
        WHERE TENPHG = 'Nghiên cứu'
    );

-- 12
SELECT AVG(LUONG) AS LUONG_TB
FROM nhanvien
WHERE PHAI = 'Nữ';

-- 13
SELECT COUNT(TENTN) AS SL_THANNHAN
FROM 
    nhanvien LEFT JOIN thannhan
    ON nhanvien.MANV = thannhan.MA_NVIEN
WHERE
    CONCAT(HONV, ' ', TENLOT, ' ', TENNV) = 'Đinh Bá Tiến';

-- 14
SELECT
    dean.TENDA,
    SUM(phancong.THOIGIAN) AS TONG_TGIAN
FROM
    dean LEFT JOIN phancong
    ON dean.MADA = phancong.MADA
GROUP BY 
    dean.MADA;

-- 15
SELECT
    dean.TENDA,
    COUNT(phancong.MA_NVIEN) AS SL_NVIEN
FROM
    dean LEFT JOIN phancong
    ON dean.MADA = phancong.MADA
GROUP BY 
    dean.MADA;

-- 16
SELECT 
    CONCAT(nv.HONV, ' ', nv.TENLOT, ' ', nv.TENNV) AS HOTEN_NVIEN,
    COUNT(thannhan.TENTN) AS SL_THANNHAN
FROM
    nhanvien AS nv
    LEFT JOIN thannhan
    ON nv.MANV = thannhan.MA_NVIEN
GROUP BY
    nv.MANV;

-- 17
SELECT 
    CONCAT(nv.HONV, ' ', nv.TENLOT, ' ', nv.TENNV) AS HOTEN_NVIEN,
    COUNT(phancong.MADA) AS SL_DEAN
FROM
    nhanvien AS nv
    LEFT JOIN phancong
    ON nv.MANV = phancong.MA_NVIEN
GROUP BY
    nv.MANV;

-- 18
SELECT 
    CONCAT(nv1.HONV, ' ', nv1.TENLOT, ' ', nv1.TENNV) AS HOTEN_NVIEN,
    COUNT(nv2.MANV) AS SL_NVIEN_DANGQL
FROM
    nhanvien AS nv1
    LEFT JOIN nhanvien AS nv2
    ON nv1.MANV = nv2.MA_NQL
GROUP BY
    nv1.MANV;

-- 19
SELECT
    phongban.TENPHG,
    AVG(nv.LUONG) AS LUONG_TB
FROM
    phongban LEFT JOIN
    nhanvien AS nv
    ON phongban.MAPHG = nv.PHG
GROUP BY
    phongban.MAPHG;

-- 20
SELECT
    pb.TENPHG,
    COUNT(nv.MANV) AS SL_NVIEN
FROM
    phongban AS pb 
    LEFT JOIN nhanvien AS nv
    ON pb.MAPHG = nv.PHG
GROUP BY
    pb.MAPHG
HAVING 
    AVG(nv.LUONG) > 30000;

-- 21
SELECT
    pb.TENPHG,
    COUNT(dean.PHONG) AS SL_DEAN
FROM
    phongban AS pb
    LEFT JOIN dean
    ON pb.MAPHG = dean.PHONG
GROUP BY
    pb.MAPHG;

-- 22
SELECT
    pb.TENPHG,
    CONCAT(nv.HONV, ' ', nv.TENLOT, ' ', nv.TENNV) AS HOTEN_TRPHG,
    COUNT(dean.PHONG) AS SL_DEAN
FROM
    (
        phongban AS pb
        LEFT JOIN dean
        ON pb.MAPHG = dean.PHONG
    ) 
    LEFT JOIN nhanvien AS nv
    ON pb.TRPHG = nv.MANV
GROUP BY
    pb.MAPHG;

-- 23
SELECT
    pb.TENPHG,
    COUNT(dean.MADA) AS SL_DEAN
FROM
    phongban AS pb
    LEFT JOIN dean
    ON pb.MAPHG = dean.PHONG
WHERE 
    pb.MAPHG IN (
        SELECT pb1.MAPHG
        FROM
            phongban AS pb1
            LEFT JOIN nhanvien AS nv
            On pb1.MAPHG = nv.PHG
        GROUP BY
            pb1.MAPHG
        HAVING
            AVG(nv.LUONG) > 40000
    )
GROUP BY
    pb.MAPHG;

-- 24
SELECT
    DDIEM_DA,
    COUNT(MADA) AS SL_DEAN
FROM dean
GROUP BY DDIEM_DA;

-- 25
SELECT
    dean.TENDA,
    COUNT(congviec.TEN_CONG_VIEC) AS SL_CONGVIEC
FROM
    dean LEFT JOIN congviec
    ON dean.MADA = congviec.MADA
GROUP BY 
    dean.MADA;

-- 26
SELECT
    congviec.TEN_CONG_VIEC,
    COUNT(phancong.MA_NVIEN) AS SL_NVIEN
FROM
    congviec LEFT JOIN phancong
    ON (
        congviec.MADA = phancong.MADA
        AND congviec.STT = phancong.STT
    )
WHERE
    congviec.MADA = 30
GROUP BY
    congviec.MADA, congviec.STT;

-- 27
SELECT
    congviec.TEN_CONG_VIEC,
    COUNT(phancong.MA_NVIEN) AS SL_NVIEN
FROM
    congviec LEFT JOIN phancong
    ON (
        congviec.MADA = phancong.MADA
        AND congviec.STT = phancong.STT
    )
WHERE
    congviec.MADA IN (
        SELECT MADA
        FROM dean
        WHERE TENDA = 'Dao tao'
    )
GROUP BY
    congviec.MADA, congviec.STT;
