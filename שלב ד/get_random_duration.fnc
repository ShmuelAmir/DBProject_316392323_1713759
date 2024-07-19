create or replace function get_random_duration return number is
  result number;
begin
  SELECT DURATION_OPERATION
    INTO result
    FROM (
        SELECT DURATION_OPERATION
        FROM OPERATION
        ORDER BY DBMS_RANDOM.VALUE
    ) WHERE ROWNUM = 1;
    
    RETURN result;
end get_random_duration;
/
