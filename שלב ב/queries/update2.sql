SAVEPOINT sav4;

SELECT ROOMID as room_before FROM PATIENT
WHERE PATIENTID = 56;

UPDATE Patient
SET RoomID = (
    SELECT RoomID
    FROM Room
    WHERE Type = 'Private'
      AND (
        SELECT COUNT(*)
        FROM Patient
        WHERE Patient.RoomID = Room.RoomID
      ) < 1
      AND ROWNUM = 1 -- Select the first available room that meets the criteria
)
WHERE PATIENTID = 56;


SELECT ROOMID as room_after FROM PATIENT
WHERE PATIENTID = 56;

ROLLBACK TO sav4;
