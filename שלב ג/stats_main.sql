DECLARE
    v_stats number;
    v_ref_cursor SYS_REFCURSOR;
    v_doctor_name VARCHAR2(100);
    v_doctor_specialty VARCHAR2(100);
    v_treatment_count NUMBER;
    v_total_patients NUMBER := 0;
    
    -- Cursor for departments
    CURSOR c_departments IS
        SELECT  DepartmentID, Name, Location
        FROM Department D
        WHERE EXISTS (
              SELECT ROOMID
              FROM ROOM R
              WHERE R.DEPARTMENTID = D.DEPARTMENTID
        )
        AND ROWNUM < 100
        ORDER BY DepartmentID 
    ;
    
    -- Record type for department
    TYPE r_department IS RECORD (
        DepartmentID number,
        Name varchar2(100),
        Location varchar2(100)
    );
    v_department r_department;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Department Analysis:');
    DBMS_OUTPUT.PUT_LINE('--------------------');
    
    -- Analyze each department using the function
    OPEN c_departments;
    LOOP
        FETCH c_departments INTO v_department;
        EXIT WHEN c_departments%NOTFOUND;
        
        v_stats := get_dept_stats(v_department.DepartmentID);      
        v_total_patients := v_total_patients + v_stats;
        
        DBMS_OUTPUT.PUT_LINE('Department: ' || v_department.Name);
        DBMS_OUTPUT.PUT_LINE('Location: ' || v_department.Location);
        DBMS_OUTPUT.PUT_LINE('Patients: ' || v_stats);
        DBMS_OUTPUT.PUT_LINE('--------------------');
    END LOOP;
    CLOSE c_departments;    

    -- Calculate and display overall statistics
    DBMS_OUTPUT.PUT_LINE('--------------------');
    DBMS_OUTPUT.PUT_LINE('Overall Statistics:');
    DBMS_OUTPUT.PUT_LINE('Total Patients: ' || v_total_patients);
    
    find_high_workload_doctors(v_ref_cursor);

    LOOP
        FETCH v_ref_cursor INTO v_doctor_name, v_doctor_specialty, v_treatment_count;
        EXIT WHEN v_ref_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Dr. ' || v_doctor_name || ' (' || v_doctor_specialty || 
                             '): ' || v_treatment_count || ' treatments');
    END LOOP;

    CLOSE v_ref_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
