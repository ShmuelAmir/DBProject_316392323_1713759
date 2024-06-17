SELECT p.PatientID, p.Name, p.Phone, r.Type AS RoomType
FROM Patient p
JOIN Room r ON p.RoomID = r.RoomID
JOIN Department d ON r.DepartmentID = d.DepartmentID
WHERE d.Name = '&<name="Department Name"
                  hint="Only patients from this department will be listed">';
