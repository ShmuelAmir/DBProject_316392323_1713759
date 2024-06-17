SELECT t.TreatmentID, t.Description, d.Name AS DoctorName, p.Name AS PatientName, t.TreatmentDate
FROM Treatment t
JOIN Doctor d ON t.DoctorID = d.DoctorID
JOIN Patient p ON t.PatientID = p.PatientID
WHERE t.TreatmentDate > TO_DATE('&<name="Date"
                                   type="date">', 'YYYY-MM-DD');
