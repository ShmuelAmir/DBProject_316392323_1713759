ALTER TABLE Department
MODIFY Phone VARCHAR2(15) NOT NULL;

ALTER TABLE Medication
MODIFY QuantityInStock NUMBER DEFAULT 0;

ALTER TABLE Doctor
ADD CONSTRAINT chk_doctor_phone CHECK (REGEXP_LIKE(Phone, '^[0-9]{3}-[0-9]{3}-[0-9]{4}$'));


-- The violation queries

--INSERT INTO Department (DepartmentID, Name, Location) VALUES (3, 'Oncology', 'Building C');

--INSERT INTO Medication (MedicationID, Name, Description, ExpirationDate) 
--VALUES (1001, 'Aspirin', 'Pain reliever', ADD_MONTHS(SYSDATE, 12));

--SELECT * FROM MEDICATION
--WHERE MEDICATIONID = 1001;

--INSERT INTO Doctor (DoctorID, Name, Specialty, Phone, DepartmentID) 
--VALUES (1001, 'Dr. Smith', 'Cardiologist', 585, 1);

