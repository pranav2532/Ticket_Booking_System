BEGIN;

SELECT * FROM Seats 
WHERE seat_id = 101 
FOR UPDATE NOWAIT;

-- Check availability
UPDATE Seats
SET status = 'BOOKED'
WHERE seat_id = 101 AND status = 'AVAILABLE';

INSERT INTO Bookings (booking_id, user_id, seat_id, status)
VALUES (1, 10, 101, 'CONFIRMED');

COMMIT;

-- If error:
ROLLBACK;
-------
SELECT * FROM Seats
WHERE status = 'AVAILABLE'
FOR UPDATE SKIP LOCKED;

-------

BEGIN;
SELECT * FROM Seats WHERE seat_id = 1 FOR UPDATE;
SELECT * FROM Seats WHERE seat_id = 2 FOR UPDATE;

BEGIN;
SELECT * FROM Seats WHERE seat_id = 2 FOR UPDATE;
SELECT * FROM Seats WHERE seat_id = 1 FOR UPDATE;

-------

UPDATE Seats
SET status = 'BOOKED', version = version + 1
WHERE seat_id = 101 AND version = 1;

-----
BEGIN;

SELECT * FROM Seats WHERE seat_id = 101 FOR UPDATE;

UPDATE Seats SET status = 'BOOKED' WHERE seat_id = 101;

-- Payment fails
ROLLBACK;



-------

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-------
