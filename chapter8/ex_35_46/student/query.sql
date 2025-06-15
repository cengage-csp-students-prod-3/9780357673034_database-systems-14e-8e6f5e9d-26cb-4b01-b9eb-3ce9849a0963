-- Step 1: Drop the trigger if it already exists (good practice for re-execution)
DROP TRIGGER IF EXISTS trg_char_hours;

-- Step 2: Change the delimiter to allow for the trigger definition
DELIMITER //

-- Step 3: Create the trigger
CREATE TRIGGER trg_char_hours
AFTER INSERT ON CHARTER  -- This trigger fires AFTER a new row is INSERTED into the CHARTER table
FOR EACH ROW             -- The trigger body executes for each row inserted
BEGIN
    -- Update the AIRCRAFT table
    UPDATE AIRCRAFT
    SET
        -- Increment the Total Time Airframe by the hours flown in the new charter
        AC_TTAF = AC_TTAF + NEW.CHAR_HOURS_FLOWN,
        -- Increment the Total Time Engine Left by the hours flown in the new charter
        AC_TTEL = AC_TTEL + NEW.CHAR_HOURS_FLOWN,
        -- Increment the Total Time Engine Right by the hours flown in the new charter
        AC_TTER = AC_TTER + NEW.CHAR_HOURS_FLOWN
    WHERE
        -- Match the aircraft in the AIRCRAFT table using the AC_NUMBER from the newly inserted CHARTER row
        AC_NUMBER = NEW.AC_NUMBER;
END //

-- Step 4: Reset the delimiter back to the default
DELIMITER ;