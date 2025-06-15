-- Step 1: Drop the trigger if it already exists (good practice for re-execution)
DROP TRIGGER IF EXISTS trg_pic_hours;

-- Step 2: Change the delimiter to allow for the procedure definition
DELIMITER //

-- Step 3: Create the trigger
CREATE TRIGGER trg_pic_hours
AFTER INSERT ON CREW           -- This trigger fires AFTER a new row is INSERTED into the CREW table
FOR EACH ROW                   -- The trigger body executes for each row inserted
BEGIN
    -- Declare a variable to store the hours flown from the CHARTER table
    DECLARE v_char_hours_flown FLOAT;

    -- Only proceed if the newly inserted crew member's job is 'Pilot'
    IF NEW.CREW_JOB = 'Pilot' THEN
        -- Retrieve the CHAR_HOURS_FLOWN for the specific charter trip
        SELECT CHAR_HOURS_FLOWN
        INTO v_char_hours_flown
        FROM CHARTER
        WHERE CHAR_TRIP = NEW.CHAR_TRIP; -- Link CREW entry to CHARTER trip

        -- Update the PILOT's PIL_PIC_HRS by adding the retrieved hours flown
        UPDATE PILOT
        SET PIL_PIC_HRS = PIL_PIC_HRS + v_char_hours_flown
        WHERE PIL_CODE = NEW.PIL_CODE; -- Link CREW entry to the specific PILOT
    END IF;
END //

-- Step 4: Reset the delimiter back to the default
DELIMITER ;