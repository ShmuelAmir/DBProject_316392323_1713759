CREATE OR REPLACE NONEDITIONABLE FUNCTION check_medication_availability(
    p_medication_name IN VARCHAR2,
    p_strength IN VARCHAR2,
    p_quantity_needed IN NUMBER
) RETURN BOOLEAN
IS
    v_quantity_in_stock NUMBER;
BEGIN
    SELECT QuantityInStock INTO v_quantity_in_stock
    FROM Medication
    WHERE LOWER(Name) = LOWER(p_medication_name)
    AND Strength = p_strength
    AND ROWNUM = 1;
    
    RETURN v_quantity_in_stock >= p_quantity_needed;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
END;
/
