CREATE TABLE Department (
    DepartmentID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Location VARCHAR2(100),
    Phone VARCHAR2(15)
);

CREATE TABLE Room (
    RoomID NUMBER PRIMARY KEY,
    Type VARCHAR2(50),
    DepartmentID NUMBER,
    CONSTRAINT fk_room_department FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Doctor (
    DoctorID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Specialty VARCHAR2(100),
    Phone VARCHAR2(15),
    DepartmentID NUMBER,
    CONSTRAINT fk_doctor_department FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Patient (
    PatientID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    DateOfBirth DATE,
    Phone VARCHAR2(15),
    DepartmentID NUMBER,
    CONSTRAINT fk_patient_department FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Medication (
    MedicationID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Description VARCHAR2(255),
    ExpirationDate DATE,
    QuantityInStock NUMBER
);

CREATE TABLE Treatment (
    TreatmentID NUMBER PRIMARY KEY,
    Description VARCHAR2(255),
    PatientID NUMBER,
    DoctorID NUMBER,
    TreatmentDate DATE,
    MedicationID NUMBER,
    CONSTRAINT fk_treatment_patient FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    CONSTRAINT fk_treatment_doctor FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    CONSTRAINT fk_treatment_medication FOREIGN KEY (MedicationID) REFERENCES Medication(MedicationID)
);
