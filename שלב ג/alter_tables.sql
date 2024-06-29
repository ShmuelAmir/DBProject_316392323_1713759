--ALTER TABLE Medication ADD (
--    Strength VARCHAR2(50)
--);

--update medication
--set strength = ROUND(DBMS_RANDOM.VALUE(1, 5), 0);

--select * from medication;

SELECT QuantityInStock
    FROM Medication
    WHERE LOWER(Name) = LOWER('Rhus toxicodendron')
    AND Strength = 5;
