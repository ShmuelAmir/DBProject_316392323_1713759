-- Function to get department statistics
create or replace FUNCTION get_dept_stats(p_dept_id NUMBER) RETURN number IS
    v_result number;
BEGIN
    -- Count patients in the department
    SELECT COUNT(DISTINCT p.PatientID) INTO v_result
    FROM Patient p
    JOIN Room r ON p.RoomID = r.RoomID
    WHERE r.DepartmentID = p_dept_id;
    
    RETURN v_result;
END;
/
