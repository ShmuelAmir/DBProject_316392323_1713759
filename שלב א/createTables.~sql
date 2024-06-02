CREATE TABLE Department (
    DepartmentID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Location VARCHAR2(100) NOT NULL,
    Phone VARCHAR2(15) NOT NULL
);

CREATE TABLE Room (
    RoomID NUMBER PRIMARY KEY,
    Type VARCHAR2(50) NOT NULL,
    DepartmentID NUMBER NOT NULL,
    CONSTRAINT fk_room_department FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Doctor (
    DoctorID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Specialty VARCHAR2(100) NOT NULL,
    Phone VARCHAR2(15) NOT NULL,
    DepartmentID NUMBER,
    CONSTRAINT fk_doctor_department FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Patient (
    PatientID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    DateOfBirth DATE,
    Phone VARCHAR2(15),
    RoomID NUMBER,
    CONSTRAINT fk_patient_room FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);

CREATE TABLE Medication (
    MedicationID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Description VARCHAR2(255),
    ExpirationDate DATE NOT NULL,
    QuantityInStock NUMBER NOT NULL
);

CREATE TABLE Treatment (
    TreatmentID NUMBER PRIMARY KEY,
    Description VARCHAR2(255),
    PatientID NUMBER NOT NULL,
    DoctorID NUMBER NOT NULL,
    TreatmentDate DATE NOT NULL,
    CONSTRAINT fk_treatment_patient FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    CONSTRAINT fk_treatment_doctor FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    CONSTRAINT fk_treatment_medication FOREIGN KEY (MedicationID) REFERENCES Medication(MedicationID)
);

CREATE TABLE Medication_Treatment (
    MedicationID INT,
    TreatmentID INT,
    PRIMARY KEY (MedicationID, TreatmentID),
    FOREIGN KEY (MedicationID) REFERENCES Medications(MedicationID),
    FOREIGN KEY (TreatmentID) REFERENCES Treatments(TreatmentID)
);
