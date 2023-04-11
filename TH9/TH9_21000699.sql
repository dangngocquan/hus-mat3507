-- Create database
CREATE DATABSE demo01;

-- Create table
CREATE TABLE IF NOT EXISTS products (
    id INT(11) NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) COLLATE utf8_unicode_ci DEFAULT NULL,
    content TEXT COLLATE utf8_unicode_ci,
    PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3;

-- Add values
INSERT INTO products (id, title, content) VALUES
(1, 'Học lập trình online tại freetuts.net', 'Gioi thieu website Học lập trình online tại freetuts.net'),
(2, 'Tutorials học Stored Procedure', 'Website Tutorials học Stored Procedure');

-- Create procedure
DELIMITER $$
DROP PROCEDURE IF EXISTS getAllProducts $$
CREATE PROCEDURE getAllProducts()
BEGIN
    SELECT * FROM products;
END; $$
DELIMITER ;

-- Call procedure
CALL procedureName();

-- Check procedure status
SHOW PROCEDURE STATUS;

-- 
DELIMITER $$
DROP PROCEDURE IF EXISTS count_products $$
CREATE PROCEDURE count_products()
BEGIN
    DECLARE total_products INT DEFAULT 0;
    SELECT COUNT(*) INTO total_products
    FROM products;
END; $$
DELIMITER ;

--
DELIMITER $$
DROP PROCEDURE IF EXISTS tinhTong $$
CREATE PROCEDURE tinhTong()
BEGIN
    DECLARE a INT(11) DEFAULT 0;
    DECLARE b INT(11) DEFAULT 0;
    DECLARE tong INT(11) DEFAULT 0;

    SET a = 200;
    SET b = 300;
    SET tong = a + b;

    SELECT tong;
END; $$
DELIMITER ;

--
DELIMITER $$
DROP PROCEDURE IF EXISTS getById $$
CREATE PROCEDURE getById(IN idVal INT(11))
BEGIN
    SELECT * FROM products WHERE id = idVal; 
END; $$
DELIMITER ;

-- 
CALL getById(1);

-- 
DELIMITER $$
DROP PROCEDURE IF EXISTS changeTitle $$
CREATE PROCEDURE changeTitle(OUT title01 VARCHAR(255))
BEGIN
    SET title01 = 'Hoc lap trinh online tai freetuts.net';
END; $$
DELIMITER ;

--
CALL changeTitle(@title01);
SELECT @title01;

-- 
DELIMITER $$
DROP PROCEDURE IF EXISTS counter $$
CREATE PROCEDURE counter(INOUT number INT(11))
BEGIN
    SET number = number + 1;
END; $$
DELIMITER ;

-- 
SET @counter0 = 1;
CALL counter(@counter0);
SELECT @counter0;



-- Create table `members`
CREATE TABLE IF NOT EXISTS members (
    us_id INT(11) NOT NULL AUTO_INCREMENT,
    us_username VARCHAR(30) COLLATE utf8_unicode_ci DEFAULT NULL,
    us_password VARCHAR(32) COLLATE utf8_unicode_ci DEFAULT NULL,
    us_level TINYINT(1) DEFAULT '0',
    PRIMARY KEY (us_id)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4;

-- Add values
INSERT INTO members (us_id, us_username, us_password, us_level) VALUES
(1, 'admin', '57e34a1be668ebd6e40d430806beb099', 1),
(2, 'member', '57e34a1be668ebd6e40d430806beb099', 2),
(3, 'banded', '57e34a1be668ebd6e40d430806beb099', 0);

-- 
DELIMITER $$
DROP PROCEDURE IF EXISTS checkLogin $$
CREATE PROCEDURE checkLogin(
    IN input_username VARCHAR(255),
    IN input_password VARCHAR(255),
    OUT result VARCHAR(255)
)
BEGIN
    DECLARE flag INT(11) DEFAULT -1;

    SELECT us_level INTO flag
    FROM members
    WHERE us_username = input_username AND us_password = MD5(input_password);

    IF (flag <= 0) THEN
            SET result = 'Thong tin dang nhap sai';
        ELSEIF (flag = 0) THEN 
            SET result = 'Tai khoan bi khoa';
        ELSEIF (flag = 1) THEN
            SET result = 'Tai khoan admin';
        ELSE
            SET result = 'Tai khoan member';
    END IF;
    
END; $$
DELIMITER ;

-- 
CALL checkLogin('admin', 'vancuong', @result);
SELECT @result;

-- 
CALL checkLogin('member', 'vancuong', @result);
SELECT @result;

-- 
CALL checkLogin('banded', 'vancuong', @result);
SELECT @result;