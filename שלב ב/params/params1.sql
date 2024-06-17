SELECT t.TreatmentID, t.Description, p.Name AS PatientName, t.TreatmentDate
FROM Treatment t
LEFT JOIN Doctor d ON t.DoctorID = d.DoctorID
LEFT JOIN Patient p ON t.PatientID = p.PatientID
WHERE d.Name = '&<name="Doctor Name">';
