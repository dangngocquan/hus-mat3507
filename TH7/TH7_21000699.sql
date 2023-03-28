-- (01) 37. Cho biết danh sách các đề án (MADA) có: nhân công với họ (HONV) là ‘Dinh’ hoặc , có người trưởng phòng chủ trì đề án với họ (HONV) là ‘Dinh’.
SELECT MADA
FROM phancong
WHERE MA_NVIEN IN (
    SELECT MANV 
    FROM nhanvien
    WHERE HONV = "Đinh"
)
UNION
SELECT MADA
FROM dean
WHERE PHONG IN (
    SELECT MAPHG
    FROM 
        phongban LEFT JOIN nhanvien
        ON phongban.TRPHG = nhanvien.MANV
    WHERE HONV = "Đinh"
);

-- (02) 38. Danh sách những nhân viên (HONV, TENLOT, TENNV) có trên 2 thân nhân.
SELECT HONV, TENLOT, TENNV
FROM 
    nhanvien LEFT JOIN thannhan
    ON nhanvien.MANV = thannhan.MA_NVIEN
GROUP BY nhanvien.MANV
HAVING COUNT(TENTN) > 2;

-- (03) 39. Danh sách những nhân viên (HONV, TENLOT, TENNV) không có thân nhân nào.
SELECT HONV, TENLOT, TENNV
FROM nhanvien
WHERE MANV NOT IN (
    SELECT MA_NVIEN
    FROM thannhan
);

-- (04) 40. Danh sách những trưởng phòng (HONV, TENLOT, TENNV) có tối thiểu một thân nhân.
SELECT HONV, TENLOT, TENNV
FROM 
    phongban LEFT JOIN nhanvien
    ON phongban.TRPHG = nhanvien.MANV
WHERE TRPHG IN (
    SELECT MA_NVIEN
    FROM thannhan
);

-- (05) 41. Tìm họ (HONV) của những trưởng phòng chưa có gia đình.
SELECT HONV
FROM 
    phongban LEFT JOIN nhanvien
    ON phongban.TRPHG = nhanvien.MANV
WHERE TRPHG IN (
    SELECT MA_NVIEN
    FROM thannhan
    WHERE NOT QUANHE = "Vợ chồng"
);

-- (06) 42. Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương trung bình của phòng "Nghiên cứu"
SELECT HONV, TENLOT, TENNV
FROM nhanvien
WHERE LUONG > (
    SELECT AVG(LUONG)
    FROM 
        nhanvien LEFT JOIN phongban
        ON nhanvien.PHG = phongban.MAPHG
    WHERE phongban.TENPHG = "Nghiên cứu"
);

-- (07) 43. Cho biết tên phòng ban và họ tên trưởng phòng của phòng ban có đông nhân viên nhất.
SELECT 
    phongban.TENPHG,
    CONCAT(nv.HONV, ' ', nv.TENLOT, ' ', nv.TENNV) AS "HOTEN_TRPHG"
FROM
    phongban JOIN nhanvien AS nv
    ON phongban.TRPHG = nv.MANV
WHERE phongban.MAPHG =  (
    SELECT PHG
    FROM nhanvien AS nv2
    GROUP BY nv2.PHG
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- (08) 44. Cho biết danh sách các mã đề án mà nhân viên có mã là 009 chưa làm.
SELECT *
FROM dean
WHERE MADA NOT IN (
    SELECT MADA
    FROM phancong
    WHERE MA_NVIEN = "009"
);

-- (09) 45. Cho biết danh sách các công việc (tên công việc) trong đề án ‘Sản phẩm X’ mà nhân viên có mã là 009 chưa làm.
SELECT *
FROM congviec
WHERE 
    (MADA, STT) NOT IN (
        SELECT MADA, STT
        FROM phancong
        WHERE MA_NVIEN = "009"
    )
    AND
    MADA IN (
        SELECT MADA
        FROM dean
        WHERE TENDA = "San pham X"
    );

-- (10) 46. Tìm họ tên (HONV, TENLOT, TENNV) và địa chỉ (DCHI) của những nhân viên làm việc cho một đề án ở ‘TP HCM’ nhưng phòng ban mà họ trực thuộc lại không tọa lạc ở thành phố ‘TP HCM’ .
SELECT HONV, TENLOT, TENNV, DCHI
FROM nhanvien
WHERE
    MANV IN (
        SELECT MA_NVIEN
        FROM
            phancong LEFT JOIN dean
            ON phancong.MADA = dean.MADA
        WHERE dean.DDIEM_DA = "TP HCM"
    )
    AND
    MANV IN (
        SELECT MANV
        FROM
            nhanvien LEFT JOIN diadiem_phg
            ON nhanvien.PHG = diadiem_phg.MAPHG
        WHERE NOT diadiem_phg.DIADIEM = "TP HCM"
    );

-- (11) 47. Tổng quát câu 46, tìm họ tên và địa chỉ của các nhân viên làm việc cho một đề án ở một thành phố nhưng phòng ban mà họ trực thuộc lại không toạ lạc ở thành phố đó.
SELECT HONV, TENLOT, TENNV, DCHI
FROM nhanvien
WHERE
    MANV IN (
        SELECT MA_NVIEN
        FROM
            (
                (
                    phancong LEFT JOIN dean ON phancong.MADA = dean.MADA
                ) 
                LEFT JOIN nhanvien ON phancong.MA_NVIEN = nhanvien.MANV
            )
            LEFT JOIN diadiem_phg ON nhanvien.PHG = diadiem_phg.MAPHG 
                
        WHERE NOT dean.DDIEM_DA = diadiem_phg.DIADIEM
    );