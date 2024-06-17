SAVEPOINT sav3;

SELECT COUNT(*) as count_before FROM MEDICATION
WHERE QUANTITYINSTOCK = 10;

UPDATE MEDICATION
SET QUANTITYINSTOCK = 50,
    EXPIRATIONDATE = ADD_MONTHS(CURRENT_DATE, 60)
WHERE QUANTITYINSTOCK = 10;

SELECT COUNT(*) as count_after FROM MEDICATION
WHERE QUANTITYINSTOCK = 10;

ROLLBACK TO sav3;
