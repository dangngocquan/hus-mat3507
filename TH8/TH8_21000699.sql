-- 01. Danh sách những nhân viên (HONV, TENLOT, TENNV) làm việc trong mọi đề án của công ty
SELECT HONV, TENLOT, TENNV
FROM nhanvien
WHERE NOT EXISTS (
    SELECT MADA
    FROM dean
    WHERE MADA NOT IN (
        SELECT MADA
        FROM phancong
        WHERE nhanvien.MANV = phancong.MA_NVIEN
    )
);

-- 02. Danh sách những nhân viên (HONV, TENLOT, TENNV) được phân công tất cả đề án do phòng số 4 chủ trì.
SELECT HONV, TENLOT, TENNV
FROM nhanvien
WHERE NOT EXISTS (
    SELECT MADA
    FROM dean
    WHERE 
        dean.PHONG = 4
        AND MADA NOT IN (
            SELECT MADA
            FROM phancong
            WHERE nhanvien.MANV = phancong.MA_NVIEN
        )
);

-- 03. Tìm những nhân viên (HONV, TENLOT, TENNV) được phân công tất cả đề án mà nhân viên ‘Đinh Bá Tiến’ làm việc
SELECT HONV, TENLOT, TENNV
FROM nhanvien
WHERE NOT EXISTS (
    SELECT MADA
    FROM phancong
    WHERE 
        phancong.MA_NVIEN = (
            SELECT MANV
            FROM nhanvien
            WHERE CONCAT(HONV, ' ', TENLOT, ' ', TENNV) = "Đinh Bá Tiến"
        )
        AND MADA NOT IN (
                SELECT MADA
                FROM phancong
                WHERE nhanvien.MANV = phancong.MA_NVIEN
        )
    );

-- 04. Cho biết những nhân được phân công cho tất cả các công việc trong đề án ‘Sản phẩm X’
SELECT *
FROM nhanvien
WHERE NOT EXISTS (
    SELECT MADA, STT
    FROM congviec
    WHERE
        MADA IN (
            SELECT MADA
            FROM dean
            WHERE TENDA = 'San pham X'
        )
        AND (MADA, STT) NOT IN (
            SELECT MADA, STT
            FROM phancong
            WHERE nhanvien.MANV = phancong.MA_NVIEN
        )
);

-- 05. Cho biết danh sách nhân viên tham gia vào tất cả các đề án ở TP HCM
SELECT *
FROM nhanvien
WHERE NOT EXISTS (
    SELECT MADA
    FROM dean
    WHERE
        DDIEM_DA = 'TP HCM'
        AND MADA NOT IN (
            SELECT MADA
            FROM phancong
            WHERE nhanvien.MANV = phancong.MA_NVIEN
        )
);

-- 06. Cho biết phòng ban chủ trì tất cả các đề án ở TP HCM
SELECT *
FROM phongban
WHERE NOT EXISTS (
    SELECT MADA
    FROM dean
    WHERE
        DDIEM_DA = 'TP HCM'
        AND MADA NOT IN (
            SELECT MADA
            FROM dean
            WHERE phongban.MAPHG = dean.PHONG
        )
);