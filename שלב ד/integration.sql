-- rename my tables to avoid collesion
rename department to department_1;
rename doctor to doctor_1;
rename medication to medication_1;
rename medication_treatment to medication_treatment_1;
rename patient to patient_1;
rename room to room_1;
rename treatment to treatment_1;


-- alter and update patient
ALTER TABLE PATIENT_1
ADD sexe VARCHAR2(30);
ALTER TABLE PATIENT_1
ADD illness VARCHAR2(100);

UPDATE patient_1
SET SEXE = (SELECT COALESCE(patient.SEXE, 'Man')
            FROM patient
            WHERE patient.patient_id = patient_1.patientid),
    ILLNESS = (SELECT COALESCE(patient.ILLNESS, 'adrenalectomy')
               FROM patient
               WHERE patient.patient_id = patient_1.patientid)

UPDATE patient_1
SET SEXE = 'Man',
    ILLNESS = 'adrenalectomy'
WHERE SEXE IS NULL;

select * from patient;
select * from patient_1;


-- alter and update room
update operating_room
set room_id = ROWNUM;

ALTER TABLE room_1
ADD availability VARCHAR2(12) DEFAULT 'available';
ALTER TABLE room_1
ADD max_number_people INTEGER;

update room_1 t1
set t1.availability = (
  select availability
  from operating_room t2
  where t2.room_id = t1.roomid
); 
update room_1 t1
set t1.max_number_people = (
  select max_number_people
  from operating_room t2
  where t2.room_id = t1.roomid
); 

select * from room_1;
select * from operating_room;


--alter and update treatment
ALTER TABLE TREATMENT_1
ADD DURATION INTEGER;

UPDATE TREATMENT_1
SET DURATION = get_random_duration();

SELECT * FROM TREATMENT_1;
SELECT * FROM OPERATION;


--add many to many relationship between treatment and equipement
CREATE TABLE EQUIPEMENT_TREATMENT (
       EQUIPEMENTID INTEGER,
       TREATMENTID INTEGER,
       PRIMARY KEY (EQUIPEMENTID, TreatmentID),
       FOREIGN KEY (EQUIPEMENTID) REFERENCES EQUIPEMENT(EQUIPEMENT_ID) ON DELETE CASCADE,
       FOREIGN KEY (TreatmentID) REFERENCES Treatment_1(TreatmentID) ON DELETE CASCADE
);

SELECT * FROM EQUIPEMENT_TREATMENT;


-- point assist_by to treatment table
select * from assist_by;

update assist_by
set operation_id = (
    SELECT treatmentid
    FROM (
        SELECT treatmentid
        FROM treatment_1
        ORDER BY DBMS_RANDOM.VALUE
    ) WHERE ROWNUM = 1
);

alter table ASSIST_BY
  add constraint FK_TREATMENT foreign key (OPERATION_ID)
  references treatment_1 (TREATMENTID) on delete cascade;

select * from assist_by;


-- drop unnecessary tabels 
drop table doctor CASCADE CONSTRAINTS;
drop table operate_by CASCADE CONSTRAINTS;
drop table operating_room CASCADE CONSTRAINTS;
drop table operation CASCADE CONSTRAINTS;
drop table patient CASCADE CONSTRAINTS;


-- rename my tables to their original names
rename department_1 to department;
rename doctor_1 to doctor;
rename medication_1 to medication;
rename medication_treatment_1 to medication_treatment;
rename patient_1 to patient;
rename room_1 to room;
rename treatment_1 to treatment;
