CREATE OR REPLACE NONEDITIONABLE PROCEDURE handle_emergency_treatment(
    p_patient_name IN VARCHAR2,
    p_patient_dob IN DATE,
    p_doctor_id IN NUMBER,
    p_medication_list IN SYS_REFCURSOR,
    p_treatment_result OUT SYS_REFCURSOR
)
IS
    v_patient_id NUMBER;
    v_treatment_id NUMBER;
    v_room_id NUMBER;
    v_medication_id NUMBER;
    v_emergency_dept_id NUMBER;

    TYPE medication_record IS RECORD (
        med_name VARCHAR2(100),
        strength VARCHAR2(50),
        quantity NUMBER
    );
    v_medication medication_record;

    insufficient_medication EXCEPTION;
    PRAGMA EXCEPTION_INIT(insufficient_medication, -20001);
BEGIN
    -- Find or create patient
    BEGIN
        SELECT PatientID INTO v_patient_id
        FROM Patient
        WHERE Name = p_patient_name AND DateOfBirth = p_patient_dob;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            -- Create new patient
            SELECT NVL(MAX(PatientID), 0) + 1 INTO v_patient_id FROM Patient;
            INSERT INTO Patient (PatientID, Name, DateOfBirth)
            VALUES (v_patient_id, p_patient_name, p_patient_dob);
    END;

    -- Find available room in Emergency Department
    SELECT DepartmentID INTO v_emergency_dept_id
    FROM Department
    WHERE UPPER(Name) = 'EMERGENCY'
    AND ROWNUM = 1;
    

    SELECT MIN(RoomID) INTO v_room_id
    FROM Room
    WHERE DepartmentID = v_emergency_dept_id
    AND RoomID NOT IN (SELECT RoomID FROM Patient WHERE RoomID IS NOT NULL);

    -- Assign room to patient
    UPDATE Patient
    SET RoomID = v_room_id
    WHERE PatientID = v_patient_id;

    -- Create new treatment
    SELECT NVL(MAX(TreatmentID), 0) + 1 INTO v_treatment_id FROM Treatment;
    INSERT INTO Treatment (TreatmentID, Description, PatientID, DoctorID, TreatmentDate)
    VALUES (v_treatment_id, 'Emergency Treatment', v_patient_id, p_doctor_id, SYSDATE);

    -- Process medications
    LOOP
        FETCH p_medication_list INTO v_medication;
        EXIT WHEN p_medication_list%NOTFOUND;
   
        IF NOT check_medication_availability(
            v_medication.med_name, 
            v_medication.strength, 
            v_medication.quantity
        ) THEN
            RAISE insufficient_medication;
        END IF;

        SELECT MedicationID INTO v_medication_id
        FROM Medication
        WHERE LOWER(Name) = LOWER(v_medication.med_name)
        AND Strength = v_medication.strength
        AND ROWNUM = 1;         
                
        -- Update medication stock
        UPDATE Medication
        SET QuantityInStock = QuantityInStock - v_medication.quantity
        WHERE MedicationID = v_medication_id;

        DECLARE
            v_count NUMBER;
        BEGIN
          SELECT COUNT(*) INTO v_count
          FROM MEDICATION_TREATMENT
          WHERE MEDICATIONID = v_medication_id
          AND TREATMENTID = v_treatment_id;
          
          IF v_count = 0 THEN
            -- Link medication to treatment
            INSERT INTO Medication_Treatment (MedicationID, TreatmentID)
            VALUES (v_medication_id, v_treatment_id);
          END IF;
        END;
    END LOOP;

    -- Prepare treatment result
    OPEN p_treatment_result FOR
    SELECT t.TreatmentID, 
           p.Name AS PatientName, 
           d.Name AS DoctorName, 
           m.Name AS MedicationName, 
           m.Strength, 
           COUNT(*) AS Quantity
    FROM Treatment t
    JOIN Patient p ON t.PatientID = p.PatientID
    JOIN Doctor d ON t.DoctorID = d.DoctorID
    JOIN Medication_Treatment mt ON t.TreatmentID = mt.TreatmentID
    JOIN Medication m ON mt.MedicationID = m.MedicationID
    WHERE t.TreatmentID = v_treatment_id
    GROUP BY t.TreatmentID, p.Name, d.Name, m.Name, m.Strength;

    COMMIT;

EXCEPTION
    WHEN insufficient_medication THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20001, 'Insufficient medication in stock');
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/
