DROP TRIGGER IF EXISTS BOOK_SHOW_BYSTATUS;

DELIMITER $$

CREATE TRIGGER BOOK_SHOW_BYSTATUS BEFORE UPDATE ON PAYMENT FOR EACH ROW
BEGIN
	IF NEW.PAYMENT_Status = 'Failure' THEN
		UPDATE BOOKING SET BOOKING_Status = 'Failure' WHERE BOOKING_ID = NEW.BOOKING_ID;
		DELETE FROM SHOW_SEAT WHERE BOOKING_ID = NEW.BOOKING_ID; 
	END IF;
END$$

DELIMITER ;