CREATE OR REPLACE PROCEDURE find_high_workload_doctors (
       p_ref_cursor OUT SYS_REFCURSOR
) IS
    v_doctor_name Doctor.Name%TYPE;
    v_doctor_specialty Doctor.Specialty%TYPE;
    v_treatment_count NUMBER;
BEGIN
    OPEN p_ref_cursor FOR
        SELECT d.Name, d.Specialty, COUNT(t.TreatmentID) AS TreatmentCount
        FROM Doctor d
        LEFT JOIN Treatment t ON d.DoctorID = t.DoctorID
        GROUP BY d.DoctorID, d.Name, d.Specialty
        HAVING COUNT(t.TreatmentID) > (
            SELECT AVG(treatment_count)
            FROM (
                SELECT COUNT(TreatmentID) AS treatment_count
                FROM Treatment
                GROUP BY DoctorID
            )
        )
        ORDER BY TreatmentCount DESC;
    
    DBMS_OUTPUT.PUT_LINE('Doctors with High Workloads:');
    DBMS_OUTPUT.PUT_LINE('--------------------');
    
    LOOP
        FETCH p_ref_cursor INTO v_doctor_name, v_doctor_specialty, v_treatment_count;
        EXIT WHEN p_ref_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Dr. ' || v_doctor_name || ' (' || v_doctor_specialty || 
                             '): ' || v_treatment_count || ' treatments');
    END LOOP;
    
    CLOSE p_ref_cursor;
EXCEPTION
    WHEN OTHERS THEN
        IF p_ref_cursor%ISOPEN THEN
            CLOSE p_ref_cursor;
        END IF;
        RAISE;
END find_high_workload_doctors;
/
