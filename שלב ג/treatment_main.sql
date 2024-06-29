DECLARE
    v_medication_list SYS_REFCURSOR;
    v_treatment_result SYS_REFCURSOR;
    v_patient_name VARCHAR2(100) := 'Kaela Cabena';
    v_patient_dob DATE := TO_DATE('1999-07-19', 'YYYY-MM-DD');
    v_doctor_id NUMBER;
    
    v_treatment_id NUMBER;
    v_patient_name_result VARCHAR2(100);
    v_doctor_name VARCHAR2(100);
    v_medication_name VARCHAR2(100);
    v_strength VARCHAR2(50);
    v_quantity NUMBER;
BEGIN
    -- Find a doctor in the Emergency Department
    SELECT DoctorID INTO v_doctor_id
    FROM Doctor d
    JOIN Department dep ON d.DepartmentID = dep.DepartmentID
    WHERE UPPER(dep.Name) = 'EMERGENCY'
    AND ROWNUM = 1;

    -- Prepare medication list
    OPEN v_medication_list FOR
    SELECT Name, Strength, 1 AS Quantity
    FROM Medication
    WHERE UPPER(Name) IN ('ASPIRIN', 'MENTHOL', 'OCTOCRYLENE')
    AND QuantityInStock > 0;
    

    -- Handle emergency treatment
    handle_emergency_treatment(
        p_patient_name => v_patient_name,
        p_patient_dob => v_patient_dob,
        p_doctor_id => v_doctor_id,
        p_medication_list => v_medication_list,
        p_treatment_result => v_treatment_result
    );

    -- Display treatment result
    DBMS_OUTPUT.PUT_LINE('Emergency Treatment Result:');
    LOOP
        FETCH v_treatment_result INTO 
            v_treatment_id, v_patient_name_result, v_doctor_name, 
            v_medication_name, v_strength, v_quantity;
        EXIT WHEN v_treatment_result%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Treatment ID: ' || v_treatment_id);
        DBMS_OUTPUT.PUT_LINE('Patient: ' || v_patient_name_result);
        DBMS_OUTPUT.PUT_LINE('Doctor: ' || v_doctor_name);
        DBMS_OUTPUT.PUT_LINE('Medication: ' || v_medication_name || 
                             ', Strength: ' || v_strength || 
                             ' (Quantity: ' || v_quantity || ')');
        DBMS_OUTPUT.PUT_LINE('---');
    END LOOP;
    CLOSE v_treatment_result;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        ROLLBACK;
END;
