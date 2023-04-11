--
DELIMITER $$
DROP PROCEDURE IF EXISTS docSo $$
CREATE PROCEDURE docSo(IN a INT(11))
BEGIN 
    DECLARE message VARCHAR(255);

    CASE a
        WHEN 0 THEN
            SET message = 'KHONG';
        WHEN 1 THEN
            SET message = 'MOT';
        WHEN 2 THEN
            SET message = 'HAI';
        WHEN 3 THEN
            SET message = 'BA';
        WHEN 4 THEN
            SET message = 'BON';
        WHEN 5 THEN
            SET message = 'NAM';
        WHEN 6 THEN
            SET message = 'SAU';
        WHEN 7 THEN
            SET message = 'BAY';
        WHEN 8 THEN
            SET message = 'TAM';
        WHEN 9 THEN
            SET message = 'CHIN';
        ELSE
            SET message = 'KHONG TIM THAY';
    END CASE;

    SELECT message;
END; $$
DELIMITER ;

-- 
CALL docSo(1);
CALL docSo(2);
CALL docSo(3);
CALL docSo(4);
CALL docSo(5);
CALL docSo(6);
CALL docSo(7);
CALL docSo(8);
CALL docSo(9);
CALL docSo(10);

-- 
DROP TABLE IF EXISTS members;
CREATE TABLE IF NOT EXISTS members (
    us_id INT(11) NOT NULL AUTO_INCREMENT,
    us_gender TINYINT(1) DEFAULT '0',
    us_username VARCHAR(30) COLLATE utf8_unicode_ci DEFAULT NULL,
    us_password VARCHAR(32) COLLATE utf8_unicode_ci DEFAULT NULL,
    us_level TINYINT(1) DEFAULT '0',
    PRIMARY KEY (us_id)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

-- 
INSERT INTO members (us_id, us_gender, us_username, us_password, us_level) VALUES
(1, 0, 'admin', '57e34a1be668ebd6e40d430806beb099', 1),
(2, 1, 'member', '57e34a1be668ebd6e40d430806beb099', 2),
(3, 0, 'banded', '57e34a1be668ebd6e40d430806beb099', 0);

-- 
SELECT 
    us_username,
    CASE us_gender
        WHEN 1 THEN 'Nam'
        ELSE 'Nữ'
    END AS gender
FROM members;

-- 
DELIMITER $$
DROP PROCEDURE IF EXISTS loopWhile $$
CREATE PROCEDURE loopWhile(
    IN a INT(11),
    IN b INT(11)
) 
BEGIN
    DECLARE str VARCHAR(255) DEFAULT '';
    WHILE (a <= b) DO
        SET str = CONCAT(str, a, ',');
        SET a = a + 1;
    END WHILE;

    SELECT str;
END; $$
DELIMITER ;

-- 
CALL loopWhile(1, 10);