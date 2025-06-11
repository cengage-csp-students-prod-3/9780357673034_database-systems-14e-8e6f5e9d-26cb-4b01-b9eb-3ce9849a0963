USE InstantRide;
DROP PROCEDURE IF EXISTS EmailList;
DELIMITER $$
CREATE PROCEDURE EmailList(OUT result TEXT)
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE email_var VARCHAR(100);
DECLARE email_list TEXT DEFAULT '';
DECLARE email_cursor CURSOR FOR
SELECT USER_EMAIL FROM USERS ORDER BY USER_ID;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
OPEN email_cursor;
email_loop: LOOP
FETCH email_cursor INTO email_var;
IF done THEN
LEAVE email_loop;
END IF;
IF email_list = '' THEN
SET email_list = email_var;
ELSE
SET email_list = CONCAT(email_list, ';', email_var);
END IF;
END LOOP;
CLOSE email_cursor;

SET result = CONCAT(';', email_list);
END$$
DELIMITER ;
CALL EmailList();