SELECT t.TreatmentID, t.Description, p.Name AS PatientName, t.TreatmentDate
FROM Treatment t
LEFT JOIN Doctor d ON t.DoctorID = d.DoctorID
LEFT JOIN Patient p ON t.PatientID = p.PatientID
WHERE d.Name = '&<name="Doctor Name">';


SELECT p.PatientID, p.Name, p.Phone, r.Type AS RoomType
FROM Patient p
JOIN Room r ON p.RoomID = r.RoomID
JOIN Department d ON r.DepartmentID = d.DepartmentID
WHERE d.Name = '&<name="Department Name"
                  hint="Only patients from this department will be listed">';


SELECT MedicationID, Name, Description, QuantityInStock
FROM Medication
WHERE QuantityInStock = '&<name="Quantity In Stock"
                           list="10, 20, 30, 40">';


SELECT t.TreatmentID, t.Description, d.Name AS DoctorName, p.Name AS PatientName, t.TreatmentDate
FROM Treatment t
JOIN Doctor d ON t.DoctorID = d.DoctorID
JOIN Patient p ON t.PatientID = p.PatientID
WHERE t.TreatmentDate > TO_DATE('&<name="Date"
                                   type="date">', 'YYYY-MM-DD');
