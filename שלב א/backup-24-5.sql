prompt PL/SQL Developer Export Tables for user SHMUELAMIR@XE
prompt Created by shmulik on Friday, May 24, 2024
set feedback off
set define off

prompt Creating DEPARTMENT...
create table DEPARTMENT
(
  departmentid NUMBER not null,
  name         VARCHAR2(100),
  location     VARCHAR2(100),
  phone        VARCHAR2(15)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DEPARTMENT
  add primary key (DEPARTMENTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating DOCTOR...
create table DOCTOR
(
  doctorid     NUMBER not null,
  name         VARCHAR2(100),
  specialty    VARCHAR2(100),
  phone        VARCHAR2(15),
  departmentid NUMBER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DOCTOR
  add primary key (DOCTORID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DOCTOR
  add constraint FK_DOCTOR_DEPARTMENT foreign key (DEPARTMENTID)
  references DEPARTMENT (DEPARTMENTID);

prompt Creating MEDICATION...
create table MEDICATION
(
  medicationid    NUMBER not null,
  name            VARCHAR2(100),
  description     VARCHAR2(255),
  expirationdate  DATE,
  quantityinstock NUMBER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MEDICATION
  add primary key (MEDICATIONID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating PATIENT...
create table PATIENT
(
  patientid    NUMBER not null,
  name         VARCHAR2(100),
  dateofbirth  DATE,
  phone        VARCHAR2(15),
  departmentid NUMBER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PATIENT
  add primary key (PATIENTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PATIENT
  add constraint FK_PATIENT_DEPARTMENT foreign key (DEPARTMENTID)
  references DEPARTMENT (DEPARTMENTID);

prompt Creating ROOM...
create table ROOM
(
  roomid       NUMBER not null,
  type         VARCHAR2(50),
  departmentid NUMBER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOM
  add primary key (ROOMID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOM
  add constraint FK_ROOM_DEPARTMENT foreign key (DEPARTMENTID)
  references DEPARTMENT (DEPARTMENTID);

prompt Creating TREATMENT...
create table TREATMENT
(
  treatmentid   NUMBER not null,
  description   VARCHAR2(255),
  patientid     NUMBER,
  doctorid      NUMBER,
  treatmentdate DATE,
  medicationid  NUMBER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TREATMENT
  add primary key (TREATMENTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TREATMENT
  add constraint FK_TREATMENT_DOCTOR foreign key (DOCTORID)
  references DOCTOR (DOCTORID);
alter table TREATMENT
  add constraint FK_TREATMENT_MEDICATION foreign key (MEDICATIONID)
  references MEDICATION (MEDICATIONID);
alter table TREATMENT
  add constraint FK_TREATMENT_PATIENT foreign key (PATIENTID)
  references PATIENT (PATIENTID);

prompt Disabling triggers for DEPARTMENT...
alter table DEPARTMENT disable all triggers;
prompt Disabling triggers for DOCTOR...
alter table DOCTOR disable all triggers;
prompt Disabling triggers for MEDICATION...
alter table MEDICATION disable all triggers;
prompt Disabling triggers for PATIENT...
alter table PATIENT disable all triggers;
prompt Disabling triggers for ROOM...
alter table ROOM disable all triggers;
prompt Disabling triggers for TREATMENT...
alter table TREATMENT disable all triggers;
prompt Disabling foreign key constraints for DOCTOR...
alter table DOCTOR disable constraint FK_DOCTOR_DEPARTMENT;
prompt Disabling foreign key constraints for PATIENT...
alter table PATIENT disable constraint FK_PATIENT_DEPARTMENT;
prompt Disabling foreign key constraints for ROOM...
alter table ROOM disable constraint FK_ROOM_DEPARTMENT;
prompt Disabling foreign key constraints for TREATMENT...
alter table TREATMENT disable constraint FK_TREATMENT_DOCTOR;
alter table TREATMENT disable constraint FK_TREATMENT_MEDICATION;
alter table TREATMENT disable constraint FK_TREATMENT_PATIENT;
prompt Deleting TREATMENT...
delete from TREATMENT;
commit;
prompt Deleting ROOM...
delete from ROOM;
commit;
prompt Deleting PATIENT...
delete from PATIENT;
commit;
prompt Deleting MEDICATION...
delete from MEDICATION;
commit;
prompt Deleting DOCTOR...
delete from DOCTOR;
commit;
prompt Deleting DEPARTMENT...
delete from DEPARTMENT;
commit;
prompt Loading DEPARTMENT...
insert into DEPARTMENT (departmentid, name, location, phone)
values (227, 'Care', 'L-5', '037237470');
insert into DEPARTMENT (departmentid, name, location, phone)
values (228, 'Orthopedics', 'V-7', '072429457');
insert into DEPARTMENT (departmentid, name, location, phone)
values (229, 'Pharmacy', 'F-4', '021994572');
insert into DEPARTMENT (departmentid, name, location, phone)
values (230, 'Nutrition', 'T-4', '089557341');
insert into DEPARTMENT (departmentid, name, location, phone)
values (231, 'Radiology', 'A-4', '032318201');
insert into DEPARTMENT (departmentid, name, location, phone)
values (232, 'Surgery', 'U-5', '082479764');
insert into DEPARTMENT (departmentid, name, location, phone)
values (233, 'Neurology', 'N-2', '087740617');
insert into DEPARTMENT (departmentid, name, location, phone)
values (234, 'Gynecology', 'L-9', '094265206');
insert into DEPARTMENT (departmentid, name, location, phone)
values (235, 'Orthopedics', 'K-9', '046399373');
insert into DEPARTMENT (departmentid, name, location, phone)
values (236, 'Cardiology', 'R-6', '039130962');
insert into DEPARTMENT (departmentid, name, location, phone)
values (237, 'Pediatrics', 'W-4', '049942235');
insert into DEPARTMENT (departmentid, name, location, phone)
values (238, 'Therapy', 'L-5', '048357060');
insert into DEPARTMENT (departmentid, name, location, phone)
values (239, 'Radiology', 'V-5', '088480331');
insert into DEPARTMENT (departmentid, name, location, phone)
values (240, 'Intensive', 'M-8', '023131520');
insert into DEPARTMENT (departmentid, name, location, phone)
values (241, 'Emergency', 'K-6', '095777902');
insert into DEPARTMENT (departmentid, name, location, phone)
values (242, 'Neurology', 'Q-3', '097309766');
insert into DEPARTMENT (departmentid, name, location, phone)
values (243, 'Surgery', 'C-5', '024766387');
insert into DEPARTMENT (departmentid, name, location, phone)
values (244, 'Orthopedics', 'G-7', '073739900');
insert into DEPARTMENT (departmentid, name, location, phone)
values (245, 'Neurology', 'G-7', '045924756');
insert into DEPARTMENT (departmentid, name, location, phone)
values (246, 'Nutrition', 'D-1', '049872970');
insert into DEPARTMENT (departmentid, name, location, phone)
values (247, 'Orthopedics', 'B-8', '089639215');
insert into DEPARTMENT (departmentid, name, location, phone)
values (248, 'Nutrition', 'L-5', '096655658');
insert into DEPARTMENT (departmentid, name, location, phone)
values (249, 'Laboratory', 'O-5', '027406437');
insert into DEPARTMENT (departmentid, name, location, phone)
values (250, 'Care', 'S-5', '078504591');
insert into DEPARTMENT (departmentid, name, location, phone)
values (251, 'Laboratory', 'F-5', '026237609');
insert into DEPARTMENT (departmentid, name, location, phone)
values (252, 'Unit', 'N-8', '046299161');
insert into DEPARTMENT (departmentid, name, location, phone)
values (253, 'Obstetrics', 'T-7', '098918461');
insert into DEPARTMENT (departmentid, name, location, phone)
values (254, 'Radiology', 'G-5', '074115874');
insert into DEPARTMENT (departmentid, name, location, phone)
values (255, 'Unit', 'U-5', '022445448');
insert into DEPARTMENT (departmentid, name, location, phone)
values (256, 'Orthopedics', 'J-6', '076674324');
insert into DEPARTMENT (departmentid, name, location, phone)
values (257, 'Therapy', 'A-2', '076053017');
insert into DEPARTMENT (departmentid, name, location, phone)
values (258, 'Intensive', 'K-6', '049485392');
insert into DEPARTMENT (departmentid, name, location, phone)
values (259, 'Obstetrics', 'Q-6', '049333782');
insert into DEPARTMENT (departmentid, name, location, phone)
values (260, 'Obstetrics', 'E-4', '078298719');
insert into DEPARTMENT (departmentid, name, location, phone)
values (261, 'Unit', 'O-6', '035095046');
insert into DEPARTMENT (departmentid, name, location, phone)
values (262, 'Laboratory', 'S-8', '071951370');
insert into DEPARTMENT (departmentid, name, location, phone)
values (263, 'Laboratory', 'F-8', '074353884');
insert into DEPARTMENT (departmentid, name, location, phone)
values (264, 'Emergency', 'I-6', '035935455');
insert into DEPARTMENT (departmentid, name, location, phone)
values (265, 'Psychiatry', 'J-2', '046311489');
insert into DEPARTMENT (departmentid, name, location, phone)
values (266, 'Nutrition', 'D-7', '075241699');
insert into DEPARTMENT (departmentid, name, location, phone)
values (267, 'Emergency', 'D-1', '096828152');
insert into DEPARTMENT (departmentid, name, location, phone)
values (268, 'Gynecology', 'P-7', '097111176');
insert into DEPARTMENT (departmentid, name, location, phone)
values (269, 'Surgery', 'I-7', '038905569');
insert into DEPARTMENT (departmentid, name, location, phone)
values (270, 'Psychiatry', 'P-9', '095551026');
insert into DEPARTMENT (departmentid, name, location, phone)
values (271, 'Cardiology', 'N-6', '028535748');
insert into DEPARTMENT (departmentid, name, location, phone)
values (272, 'Physical', 'P-5', '022654579');
insert into DEPARTMENT (departmentid, name, location, phone)
values (273, 'Neurology', 'Q-7', '092057989');
insert into DEPARTMENT (departmentid, name, location, phone)
values (274, 'Intensive', 'D-4', '033224285');
insert into DEPARTMENT (departmentid, name, location, phone)
values (275, 'Emergency', 'A-9', '028439825');
insert into DEPARTMENT (departmentid, name, location, phone)
values (276, 'Cardiology', 'V-3', '032739810');
insert into DEPARTMENT (departmentid, name, location, phone)
values (277, 'Neurology', 'G-4', '047726925');
insert into DEPARTMENT (departmentid, name, location, phone)
values (278, 'Surgery', 'M-1', '088656051');
insert into DEPARTMENT (departmentid, name, location, phone)
values (279, 'Radiology', 'P-4', '096853243');
insert into DEPARTMENT (departmentid, name, location, phone)
values (280, 'Gynecology', 'N-9', '042169114');
insert into DEPARTMENT (departmentid, name, location, phone)
values (281, 'Intensive', 'X-9', '089128673');
insert into DEPARTMENT (departmentid, name, location, phone)
values (282, 'Surgery', 'J-3', '049265088');
insert into DEPARTMENT (departmentid, name, location, phone)
values (283, 'Unit', 'J-1', '095589629');
insert into DEPARTMENT (departmentid, name, location, phone)
values (284, 'Radiology', 'T-1', '091879124');
insert into DEPARTMENT (departmentid, name, location, phone)
values (285, 'Pediatrics', 'C-3', '026070840');
insert into DEPARTMENT (departmentid, name, location, phone)
values (286, 'Obstetrics', 'B-3', '028653467');
insert into DEPARTMENT (departmentid, name, location, phone)
values (287, 'Neurology', 'O-2', '028896662');
insert into DEPARTMENT (departmentid, name, location, phone)
values (288, 'Surgery', 'D-2', '098905157');
insert into DEPARTMENT (departmentid, name, location, phone)
values (289, 'Unit', 'R-2', '038559953');
insert into DEPARTMENT (departmentid, name, location, phone)
values (290, 'Neurology', 'Q-1', '047309631');
insert into DEPARTMENT (departmentid, name, location, phone)
values (291, 'Unit', 'M-9', '094218471');
insert into DEPARTMENT (departmentid, name, location, phone)
values (292, 'Psychiatry', 'D-3', '022287889');
insert into DEPARTMENT (departmentid, name, location, phone)
values (293, 'Obstetrics', 'B-5', '037355350');
insert into DEPARTMENT (departmentid, name, location, phone)
values (294, 'Psychiatry', 'S-1', '033464781');
insert into DEPARTMENT (departmentid, name, location, phone)
values (295, 'Surgery', 'D-5', '083083995');
insert into DEPARTMENT (departmentid, name, location, phone)
values (296, 'Therapy', 'L-3', '077656791');
insert into DEPARTMENT (departmentid, name, location, phone)
values (297, 'Physical', 'D-3', '037391235');
insert into DEPARTMENT (departmentid, name, location, phone)
values (298, 'Gynecology', 'Q-6', '094961949');
insert into DEPARTMENT (departmentid, name, location, phone)
values (299, 'Therapy', 'Q-9', '028668202');
insert into DEPARTMENT (departmentid, name, location, phone)
values (300, 'Therapy', 'Z-9', '082474695');
insert into DEPARTMENT (departmentid, name, location, phone)
values (301, 'Physical', 'J-1', '085238784');
insert into DEPARTMENT (departmentid, name, location, phone)
values (302, 'Intensive', 'H-1', '029247156');
insert into DEPARTMENT (departmentid, name, location, phone)
values (303, 'Cardiology', 'W-9', '083823037');
insert into DEPARTMENT (departmentid, name, location, phone)
values (304, 'Pediatrics', 'F-1', '026177873');
insert into DEPARTMENT (departmentid, name, location, phone)
values (305, 'Radiology', 'L-6', '041030147');
insert into DEPARTMENT (departmentid, name, location, phone)
values (306, 'Laboratory', 'K-5', '099842003');
insert into DEPARTMENT (departmentid, name, location, phone)
values (307, 'Emergency', 'C-2', '041624968');
insert into DEPARTMENT (departmentid, name, location, phone)
values (308, 'Care', 'T-6', '089695993');
insert into DEPARTMENT (departmentid, name, location, phone)
values (309, 'Neurology', 'X-5', '042516255');
insert into DEPARTMENT (departmentid, name, location, phone)
values (310, 'Radiology', 'P-6', '028907085');
insert into DEPARTMENT (departmentid, name, location, phone)
values (311, 'Orthopedics', 'A-5', '034736004');
insert into DEPARTMENT (departmentid, name, location, phone)
values (312, 'Care', 'C-2', '034086337');
insert into DEPARTMENT (departmentid, name, location, phone)
values (313, 'Surgery', 'D-7', '078180278');
insert into DEPARTMENT (departmentid, name, location, phone)
values (314, 'Emergency', 'I-9', '028755607');
insert into DEPARTMENT (departmentid, name, location, phone)
values (315, 'Emergency', 'P-1', '091125075');
insert into DEPARTMENT (departmentid, name, location, phone)
values (316, 'Neurology', 'T-7', '071266647');
insert into DEPARTMENT (departmentid, name, location, phone)
values (317, 'Nutrition', 'H-4', '073578636');
insert into DEPARTMENT (departmentid, name, location, phone)
values (318, 'Oncology', 'P-7', '022426561');
insert into DEPARTMENT (departmentid, name, location, phone)
values (319, 'Neurology', 'K-9', '038946633');
insert into DEPARTMENT (departmentid, name, location, phone)
values (320, 'Cardiology', 'T-9', '085080987');
insert into DEPARTMENT (departmentid, name, location, phone)
values (321, 'Pharmacy', 'H-6', '037331410');
insert into DEPARTMENT (departmentid, name, location, phone)
values (322, 'Pharmacy', 'Q-9', '033676852');
insert into DEPARTMENT (departmentid, name, location, phone)
values (323, 'Nutrition', 'C-1', '035623349');
insert into DEPARTMENT (departmentid, name, location, phone)
values (324, 'Surgery', 'N-4', '031182978');
insert into DEPARTMENT (departmentid, name, location, phone)
values (325, 'Surgery', 'C-9', '047434051');
insert into DEPARTMENT (departmentid, name, location, phone)
values (326, 'Emergency', 'V-4', '036001748');
commit;
prompt 100 records committed...
insert into DEPARTMENT (departmentid, name, location, phone)
values (327, 'Obstetrics', 'B-4', '021429799');
insert into DEPARTMENT (departmentid, name, location, phone)
values (328, 'Oncology', 'C-4', '029470798');
insert into DEPARTMENT (departmentid, name, location, phone)
values (329, 'Gynecology', 'S-4', '088812253');
insert into DEPARTMENT (departmentid, name, location, phone)
values (330, 'Pharmacy', 'R-8', '035543020');
insert into DEPARTMENT (departmentid, name, location, phone)
values (331, 'Physical', 'M-7', '037123991');
insert into DEPARTMENT (departmentid, name, location, phone)
values (332, 'Oncology', 'F-7', '042058311');
insert into DEPARTMENT (departmentid, name, location, phone)
values (333, 'Cardiology', 'T-8', '021291857');
insert into DEPARTMENT (departmentid, name, location, phone)
values (334, 'Radiology', 'T-6', '038994156');
insert into DEPARTMENT (departmentid, name, location, phone)
values (335, 'Laboratory', 'O-9', '087423622');
insert into DEPARTMENT (departmentid, name, location, phone)
values (336, 'Intensive', 'K-3', '035016707');
insert into DEPARTMENT (departmentid, name, location, phone)
values (337, 'Intensive', 'K-4', '031405680');
insert into DEPARTMENT (departmentid, name, location, phone)
values (338, 'Neurology', 'P-9', '023862015');
insert into DEPARTMENT (departmentid, name, location, phone)
values (339, 'Obstetrics', 'J-4', '089373939');
insert into DEPARTMENT (departmentid, name, location, phone)
values (340, 'Nutrition', 'I-8', '032371022');
insert into DEPARTMENT (departmentid, name, location, phone)
values (341, 'Therapy', 'D-8', '098709127');
insert into DEPARTMENT (departmentid, name, location, phone)
values (342, 'Neurology', 'K-5', '095694310');
insert into DEPARTMENT (departmentid, name, location, phone)
values (343, 'Physical', 'I-4', '092904074');
insert into DEPARTMENT (departmentid, name, location, phone)
values (344, 'Unit', 'X-2', '071085916');
insert into DEPARTMENT (departmentid, name, location, phone)
values (345, 'Cardiology', 'P-4', '087526463');
insert into DEPARTMENT (departmentid, name, location, phone)
values (346, 'Pediatrics', 'O-7', '032132278');
insert into DEPARTMENT (departmentid, name, location, phone)
values (347, 'Cardiology', 'G-8', '076118729');
insert into DEPARTMENT (departmentid, name, location, phone)
values (348, 'Nutrition', 'F-4', '046025086');
insert into DEPARTMENT (departmentid, name, location, phone)
values (349, 'Oncology', 'J-4', '083299636');
insert into DEPARTMENT (departmentid, name, location, phone)
values (350, 'Intensive', 'R-7', '032897925');
insert into DEPARTMENT (departmentid, name, location, phone)
values (351, 'Neurology', 'O-1', '091122092');
insert into DEPARTMENT (departmentid, name, location, phone)
values (352, 'Laboratory', 'W-6', '027118685');
insert into DEPARTMENT (departmentid, name, location, phone)
values (353, 'Gynecology', 'T-8', '043961502');
insert into DEPARTMENT (departmentid, name, location, phone)
values (354, 'Physical', 'P-4', '032075212');
insert into DEPARTMENT (departmentid, name, location, phone)
values (355, 'Orthopedics', 'W-1', '099420851');
insert into DEPARTMENT (departmentid, name, location, phone)
values (356, 'Surgery', 'Q-3', '022223122');
insert into DEPARTMENT (departmentid, name, location, phone)
values (357, 'Orthopedics', 'T-1', '073005345');
insert into DEPARTMENT (departmentid, name, location, phone)
values (358, 'Surgery', 'H-8', '043294572');
insert into DEPARTMENT (departmentid, name, location, phone)
values (359, 'Therapy', 'I-1', '099203186');
insert into DEPARTMENT (departmentid, name, location, phone)
values (360, 'Intensive', 'F-2', '049407628');
insert into DEPARTMENT (departmentid, name, location, phone)
values (361, 'Pediatrics', 'H-8', '045172564');
insert into DEPARTMENT (departmentid, name, location, phone)
values (362, 'Physical', 'A-4', '098680104');
insert into DEPARTMENT (departmentid, name, location, phone)
values (363, 'Unit', 'E-5', '092040611');
insert into DEPARTMENT (departmentid, name, location, phone)
values (364, 'Unit', 'Q-1', '076651942');
insert into DEPARTMENT (departmentid, name, location, phone)
values (365, 'Unit', 'J-9', '072930387');
insert into DEPARTMENT (departmentid, name, location, phone)
values (366, 'Cardiology', 'B-2', '079668857');
insert into DEPARTMENT (departmentid, name, location, phone)
values (367, 'Intensive', 'X-9', '037809546');
insert into DEPARTMENT (departmentid, name, location, phone)
values (368, 'Surgery', 'Y-2', '039189516');
insert into DEPARTMENT (departmentid, name, location, phone)
values (369, 'Emergency', 'D-7', '043161517');
insert into DEPARTMENT (departmentid, name, location, phone)
values (370, 'Laboratory', 'L-5', '072061545');
insert into DEPARTMENT (departmentid, name, location, phone)
values (371, 'Orthopedics', 'D-9', '042879488');
insert into DEPARTMENT (departmentid, name, location, phone)
values (372, 'Laboratory', 'I-8', '081980596');
insert into DEPARTMENT (departmentid, name, location, phone)
values (373, 'Psychiatry', 'R-8', '077737548');
insert into DEPARTMENT (departmentid, name, location, phone)
values (374, 'Neurology', 'B-2', '024914089');
insert into DEPARTMENT (departmentid, name, location, phone)
values (375, 'Psychiatry', 'Q-6', '027864656');
insert into DEPARTMENT (departmentid, name, location, phone)
values (376, 'Care', 'U-3', '085049566');
insert into DEPARTMENT (departmentid, name, location, phone)
values (377, 'Psychiatry', 'A-4', '096898062');
insert into DEPARTMENT (departmentid, name, location, phone)
values (378, 'Care', 'C-2', '072129354');
insert into DEPARTMENT (departmentid, name, location, phone)
values (379, 'Radiology', 'J-8', '072485995');
insert into DEPARTMENT (departmentid, name, location, phone)
values (380, 'Oncology', 'P-9', '032670920');
insert into DEPARTMENT (departmentid, name, location, phone)
values (381, 'Oncology', 'P-5', '071607253');
insert into DEPARTMENT (departmentid, name, location, phone)
values (382, 'Psychiatry', 'B-2', '096858452');
insert into DEPARTMENT (departmentid, name, location, phone)
values (383, 'Obstetrics', 'W-6', '074340399');
insert into DEPARTMENT (departmentid, name, location, phone)
values (384, 'Cardiology', 'U-1', '039638244');
insert into DEPARTMENT (departmentid, name, location, phone)
values (385, 'Therapy', 'X-5', '091309971');
insert into DEPARTMENT (departmentid, name, location, phone)
values (386, 'Therapy', 'F-4', '041070998');
insert into DEPARTMENT (departmentid, name, location, phone)
values (387, 'Gynecology', 'Q-6', '022624040');
insert into DEPARTMENT (departmentid, name, location, phone)
values (388, 'Nutrition', 'D-8', '091100582');
insert into DEPARTMENT (departmentid, name, location, phone)
values (389, 'Cardiology', 'U-7', '088759052');
insert into DEPARTMENT (departmentid, name, location, phone)
values (390, 'Unit', 'Q-4', '048903677');
insert into DEPARTMENT (departmentid, name, location, phone)
values (391, 'Gynecology', 'H-7', '047106670');
insert into DEPARTMENT (departmentid, name, location, phone)
values (392, 'Psychiatry', 'Z-7', '041700557');
insert into DEPARTMENT (departmentid, name, location, phone)
values (393, 'Oncology', 'Q-1', '035835816');
insert into DEPARTMENT (departmentid, name, location, phone)
values (394, 'Psychiatry', 'L-5', '046646515');
insert into DEPARTMENT (departmentid, name, location, phone)
values (395, 'Pharmacy', 'A-6', '076903781');
insert into DEPARTMENT (departmentid, name, location, phone)
values (396, 'Cardiology', 'M-3', '031998630');
insert into DEPARTMENT (departmentid, name, location, phone)
values (397, 'Pediatrics', 'K-7', '081535601');
insert into DEPARTMENT (departmentid, name, location, phone)
values (398, 'Orthopedics', 'Z-1', '084476215');
insert into DEPARTMENT (departmentid, name, location, phone)
values (399, 'Laboratory', 'U-1', '084843482');
insert into DEPARTMENT (departmentid, name, location, phone)
values (400, 'Surgery', 'D-9', '032417856');
insert into DEPARTMENT (departmentid, name, location, phone)
values (401, 'Oncology', 'D-3', '027540210');
insert into DEPARTMENT (departmentid, name, location, phone)
values (402, 'Emergency', 'B-5', '047295938');
insert into DEPARTMENT (departmentid, name, location, phone)
values (403, 'Nutrition', 'D-4', '047474988');
insert into DEPARTMENT (departmentid, name, location, phone)
values (404, 'Cardiology', 'V-8', '021193538');
insert into DEPARTMENT (departmentid, name, location, phone)
values (405, 'Radiology', 'X-1', '097049151');
insert into DEPARTMENT (departmentid, name, location, phone)
values (406, 'Cardiology', 'A-2', '045290908');
insert into DEPARTMENT (departmentid, name, location, phone)
values (407, 'Cardiology', 'E-1', '036015577');
insert into DEPARTMENT (departmentid, name, location, phone)
values (408, 'Orthopedics', 'R-8', '046062125');
insert into DEPARTMENT (departmentid, name, location, phone)
values (409, 'Emergency', 'Q-8', '092791536');
insert into DEPARTMENT (departmentid, name, location, phone)
values (410, 'Oncology', 'Z-6', '033059211');
insert into DEPARTMENT (departmentid, name, location, phone)
values (411, 'Laboratory', 'Y-8', '043782904');
insert into DEPARTMENT (departmentid, name, location, phone)
values (412, 'Psychiatry', 'H-8', '097673753');
insert into DEPARTMENT (departmentid, name, location, phone)
values (413, 'Emergency', 'N-3', '037390526');
insert into DEPARTMENT (departmentid, name, location, phone)
values (414, 'Obstetrics', 'D-5', '038427161');
insert into DEPARTMENT (departmentid, name, location, phone)
values (415, 'Oncology', 'S-4', '043909538');
insert into DEPARTMENT (departmentid, name, location, phone)
values (416, 'Unit', 'L-3', '047962785');
insert into DEPARTMENT (departmentid, name, location, phone)
values (417, 'Laboratory', 'L-4', '033502183');
insert into DEPARTMENT (departmentid, name, location, phone)
values (418, 'Radiology', 'S-3', '073308616');
insert into DEPARTMENT (departmentid, name, location, phone)
values (419, 'Pharmacy', 'K-9', '088386601');
insert into DEPARTMENT (departmentid, name, location, phone)
values (420, 'Orthopedics', 'D-7', '049960743');
insert into DEPARTMENT (departmentid, name, location, phone)
values (421, 'Radiology', 'T-2', '032400615');
insert into DEPARTMENT (departmentid, name, location, phone)
values (422, 'Surgery', 'T-6', '042217613');
insert into DEPARTMENT (departmentid, name, location, phone)
values (423, 'Pediatrics', 'N-4', '089733391');
insert into DEPARTMENT (departmentid, name, location, phone)
values (424, 'Pediatrics', 'R-1', '073785987');
insert into DEPARTMENT (departmentid, name, location, phone)
values (425, 'Surgery', 'Y-1', '087931283');
insert into DEPARTMENT (departmentid, name, location, phone)
values (426, 'Surgery', 'R-4', '029293695');
commit;
prompt 200 records committed...
insert into DEPARTMENT (departmentid, name, location, phone)
values (427, 'Emergency', 'C-6', '033839842');
insert into DEPARTMENT (departmentid, name, location, phone)
values (428, 'Nutrition', 'V-4', '083794541');
insert into DEPARTMENT (departmentid, name, location, phone)
values (429, 'Radiology', 'E-9', '021004349');
insert into DEPARTMENT (departmentid, name, location, phone)
values (430, 'Care', 'E-6', '091949311');
insert into DEPARTMENT (departmentid, name, location, phone)
values (431, 'Psychiatry', 'R-7', '049778725');
insert into DEPARTMENT (departmentid, name, location, phone)
values (432, 'Oncology', 'A-1', '035126410');
insert into DEPARTMENT (departmentid, name, location, phone)
values (433, 'Cardiology', 'X-3', '028049940');
insert into DEPARTMENT (departmentid, name, location, phone)
values (434, 'Cardiology', 'H-9', '028498666');
insert into DEPARTMENT (departmentid, name, location, phone)
values (435, 'Intensive', 'J-4', '073634439');
insert into DEPARTMENT (departmentid, name, location, phone)
values (436, 'Psychiatry', 'I-6', '089131795');
insert into DEPARTMENT (departmentid, name, location, phone)
values (437, 'Laboratory', 'X-1', '094107192');
insert into DEPARTMENT (departmentid, name, location, phone)
values (438, 'Physical', 'Y-2', '027377380');
insert into DEPARTMENT (departmentid, name, location, phone)
values (439, 'Cardiology', 'G-9', '078645290');
insert into DEPARTMENT (departmentid, name, location, phone)
values (440, 'Orthopedics', 'R-7', '048411557');
insert into DEPARTMENT (departmentid, name, location, phone)
values (441, 'Nutrition', 'B-7', '036468969');
insert into DEPARTMENT (departmentid, name, location, phone)
values (442, 'Radiology', 'E-6', '027812354');
insert into DEPARTMENT (departmentid, name, location, phone)
values (443, 'Gynecology', 'U-5', '031206111');
insert into DEPARTMENT (departmentid, name, location, phone)
values (444, 'Neurology', 'R-1', '074456315');
insert into DEPARTMENT (departmentid, name, location, phone)
values (445, 'Intensive', 'W-1', '026054118');
insert into DEPARTMENT (departmentid, name, location, phone)
values (446, 'Gynecology', 'D-1', '028051196');
insert into DEPARTMENT (departmentid, name, location, phone)
values (447, 'Radiology', 'D-4', '025528115');
insert into DEPARTMENT (departmentid, name, location, phone)
values (448, 'Radiology', 'K-7', '097118554');
insert into DEPARTMENT (departmentid, name, location, phone)
values (108, 'Oncology', 'B-7', '032666699');
insert into DEPARTMENT (departmentid, name, location, phone)
values (109, 'Pharmacy', 'C-3', '089835079');
insert into DEPARTMENT (departmentid, name, location, phone)
values (110, 'Oncology', 'G-7', '072113088');
insert into DEPARTMENT (departmentid, name, location, phone)
values (111, 'Surgery', 'J-1', '097620859');
insert into DEPARTMENT (departmentid, name, location, phone)
values (112, 'Emergency', 'S-6', '099344840');
insert into DEPARTMENT (departmentid, name, location, phone)
values (113, 'Care', 'V-7', '039649062');
insert into DEPARTMENT (departmentid, name, location, phone)
values (114, 'Psychiatry', 'A-5', '031436114');
insert into DEPARTMENT (departmentid, name, location, phone)
values (115, 'Unit', 'Y-3', '041069072');
insert into DEPARTMENT (departmentid, name, location, phone)
values (116, 'Psychiatry', 'C-6', '089910902');
insert into DEPARTMENT (departmentid, name, location, phone)
values (117, 'Unit', 'Q-1', '032806925');
insert into DEPARTMENT (departmentid, name, location, phone)
values (118, 'Emergency', 'U-9', '023039813');
insert into DEPARTMENT (departmentid, name, location, phone)
values (119, 'Nutrition', 'Z-4', '086310763');
insert into DEPARTMENT (departmentid, name, location, phone)
values (120, 'Intensive', 'V-7', '022177110');
insert into DEPARTMENT (departmentid, name, location, phone)
values (121, 'Obstetrics', 'G-3', '028303864');
insert into DEPARTMENT (departmentid, name, location, phone)
values (122, 'Care', 'B-7', '032874656');
insert into DEPARTMENT (departmentid, name, location, phone)
values (123, 'Intensive', 'L-7', '092590068');
insert into DEPARTMENT (departmentid, name, location, phone)
values (124, 'Unit', 'I-1', '028147206');
insert into DEPARTMENT (departmentid, name, location, phone)
values (125, 'Care', 'M-7', '021754220');
insert into DEPARTMENT (departmentid, name, location, phone)
values (126, 'Cardiology', 'K-5', '092549520');
insert into DEPARTMENT (departmentid, name, location, phone)
values (127, 'Therapy', 'G-4', '027765355');
insert into DEPARTMENT (departmentid, name, location, phone)
values (128, 'Radiology', 'W-7', '042472931');
insert into DEPARTMENT (departmentid, name, location, phone)
values (129, 'Physical', 'T-4', '097085019');
insert into DEPARTMENT (departmentid, name, location, phone)
values (130, 'Obstetrics', 'Y-2', '084589438');
insert into DEPARTMENT (departmentid, name, location, phone)
values (131, 'Nutrition', 'M-6', '072470054');
insert into DEPARTMENT (departmentid, name, location, phone)
values (132, 'Gynecology', 'Y-1', '091477890');
insert into DEPARTMENT (departmentid, name, location, phone)
values (133, 'Psychiatry', 'W-8', '084300807');
insert into DEPARTMENT (departmentid, name, location, phone)
values (134, 'Pediatrics', 'X-4', '096471674');
insert into DEPARTMENT (departmentid, name, location, phone)
values (135, 'Orthopedics', 'H-5', '045524453');
insert into DEPARTMENT (departmentid, name, location, phone)
values (136, 'Obstetrics', 'L-7', '025483172');
insert into DEPARTMENT (departmentid, name, location, phone)
values (137, 'Nutrition', 'C-5', '089241645');
insert into DEPARTMENT (departmentid, name, location, phone)
values (138, 'Pediatrics', 'H-4', '092299483');
insert into DEPARTMENT (departmentid, name, location, phone)
values (139, 'Therapy', 'T-4', '075145361');
insert into DEPARTMENT (departmentid, name, location, phone)
values (140, 'Surgery', 'R-9', '032419111');
insert into DEPARTMENT (departmentid, name, location, phone)
values (141, 'Cardiology', 'P-1', '078506142');
insert into DEPARTMENT (departmentid, name, location, phone)
values (142, 'Intensive', 'U-7', '073222959');
insert into DEPARTMENT (departmentid, name, location, phone)
values (143, 'Pharmacy', 'C-5', '091750490');
insert into DEPARTMENT (departmentid, name, location, phone)
values (144, 'Radiology', 'W-8', '078957541');
insert into DEPARTMENT (departmentid, name, location, phone)
values (145, 'Gynecology', 'B-1', '041961403');
insert into DEPARTMENT (departmentid, name, location, phone)
values (146, 'Pediatrics', 'V-9', '088966307');
insert into DEPARTMENT (departmentid, name, location, phone)
values (147, 'Unit', 'Y-6', '036404433');
insert into DEPARTMENT (departmentid, name, location, phone)
values (148, 'Care', 'Y-6', '031648952');
insert into DEPARTMENT (departmentid, name, location, phone)
values (149, 'Radiology', 'V-1', '032511770');
insert into DEPARTMENT (departmentid, name, location, phone)
values (150, 'Unit', 'T-3', '099070952');
insert into DEPARTMENT (departmentid, name, location, phone)
values (151, 'Intensive', 'D-8', '073203131');
insert into DEPARTMENT (departmentid, name, location, phone)
values (152, 'Nutrition', 'U-4', '096798883');
insert into DEPARTMENT (departmentid, name, location, phone)
values (153, 'Nutrition', 'W-7', '027048222');
insert into DEPARTMENT (departmentid, name, location, phone)
values (154, 'Physical', 'A-5', '074713838');
insert into DEPARTMENT (departmentid, name, location, phone)
values (155, 'Orthopedics', 'R-2', '043143683');
insert into DEPARTMENT (departmentid, name, location, phone)
values (156, 'Nutrition', 'U-2', '098067970');
insert into DEPARTMENT (departmentid, name, location, phone)
values (157, 'Orthopedics', 'N-2', '078750315');
insert into DEPARTMENT (departmentid, name, location, phone)
values (158, 'Emergency', 'H-4', '078210293');
insert into DEPARTMENT (departmentid, name, location, phone)
values (159, 'Pediatrics', 'V-2', '024276381');
insert into DEPARTMENT (departmentid, name, location, phone)
values (160, 'Obstetrics', 'B-8', '078029978');
insert into DEPARTMENT (departmentid, name, location, phone)
values (161, 'Neurology', 'W-4', '086162538');
insert into DEPARTMENT (departmentid, name, location, phone)
values (162, 'Therapy', 'L-3', '046560845');
insert into DEPARTMENT (departmentid, name, location, phone)
values (163, 'Psychiatry', 'E-9', '038185855');
insert into DEPARTMENT (departmentid, name, location, phone)
values (164, 'Emergency', 'C-5', '026172241');
insert into DEPARTMENT (departmentid, name, location, phone)
values (165, 'Therapy', 'Z-5', '072716960');
insert into DEPARTMENT (departmentid, name, location, phone)
values (166, 'Physical', 'F-3', '073651355');
insert into DEPARTMENT (departmentid, name, location, phone)
values (167, 'Physical', 'C-9', '022098188');
insert into DEPARTMENT (departmentid, name, location, phone)
values (168, 'Care', 'W-1', '039072836');
insert into DEPARTMENT (departmentid, name, location, phone)
values (169, 'Emergency', 'O-7', '091624030');
insert into DEPARTMENT (departmentid, name, location, phone)
values (170, 'Neurology', 'S-6', '075965851');
insert into DEPARTMENT (departmentid, name, location, phone)
values (171, 'Pediatrics', 'T-7', '077160883');
insert into DEPARTMENT (departmentid, name, location, phone)
values (172, 'Therapy', 'Y-5', '031738909');
insert into DEPARTMENT (departmentid, name, location, phone)
values (173, 'Orthopedics', 'T-6', '073303434');
insert into DEPARTMENT (departmentid, name, location, phone)
values (174, 'Intensive', 'K-5', '047921420');
insert into DEPARTMENT (departmentid, name, location, phone)
values (175, 'Pharmacy', 'K-2', '047692561');
insert into DEPARTMENT (departmentid, name, location, phone)
values (176, 'Pediatrics', 'P-8', '089340496');
insert into DEPARTMENT (departmentid, name, location, phone)
values (177, 'Orthopedics', 'W-9', '025776850');
insert into DEPARTMENT (departmentid, name, location, phone)
values (178, 'Emergency', 'W-4', '078184561');
insert into DEPARTMENT (departmentid, name, location, phone)
values (179, 'Nutrition', 'G-2', '021449252');
insert into DEPARTMENT (departmentid, name, location, phone)
values (180, 'Care', 'R-6', '042824232');
insert into DEPARTMENT (departmentid, name, location, phone)
values (181, 'Oncology', 'T-6', '031694498');
insert into DEPARTMENT (departmentid, name, location, phone)
values (182, 'Emergency', 'N-8', '049578346');
insert into DEPARTMENT (departmentid, name, location, phone)
values (183, 'Radiology', 'R-3', '048204174');
insert into DEPARTMENT (departmentid, name, location, phone)
values (184, 'Therapy', 'X-8', '087141319');
insert into DEPARTMENT (departmentid, name, location, phone)
values (185, 'Neurology', 'S-6', '023917359');
commit;
prompt 300 records committed...
insert into DEPARTMENT (departmentid, name, location, phone)
values (186, 'Psychiatry', 'M-7', '022439782');
insert into DEPARTMENT (departmentid, name, location, phone)
values (187, 'Neurology', 'B-1', '082187854');
insert into DEPARTMENT (departmentid, name, location, phone)
values (188, 'Care', 'L-3', '028074126');
insert into DEPARTMENT (departmentid, name, location, phone)
values (189, 'Nutrition', 'A-1', '097826924');
insert into DEPARTMENT (departmentid, name, location, phone)
values (190, 'Cardiology', 'W-4', '025536743');
insert into DEPARTMENT (departmentid, name, location, phone)
values (191, 'Pharmacy', 'F-5', '026185478');
insert into DEPARTMENT (departmentid, name, location, phone)
values (192, 'Gynecology', 'W-6', '072895792');
insert into DEPARTMENT (departmentid, name, location, phone)
values (193, 'Orthopedics', 'C-1', '087784363');
insert into DEPARTMENT (departmentid, name, location, phone)
values (194, 'Pediatrics', 'F-5', '096903846');
insert into DEPARTMENT (departmentid, name, location, phone)
values (195, 'Cardiology', 'C-1', '092338348');
insert into DEPARTMENT (departmentid, name, location, phone)
values (196, 'Gynecology', 'M-4', '092347218');
insert into DEPARTMENT (departmentid, name, location, phone)
values (197, 'Obstetrics', 'I-6', '037410983');
insert into DEPARTMENT (departmentid, name, location, phone)
values (198, 'Unit', 'B-5', '029206645');
insert into DEPARTMENT (departmentid, name, location, phone)
values (199, 'Neurology', 'I-2', '079946307');
insert into DEPARTMENT (departmentid, name, location, phone)
values (200, 'Cardiology', 'E-2', '039665816');
insert into DEPARTMENT (departmentid, name, location, phone)
values (201, 'Gynecology', 'F-5', '021611847');
insert into DEPARTMENT (departmentid, name, location, phone)
values (202, 'Psychiatry', 'W-6', '088493528');
insert into DEPARTMENT (departmentid, name, location, phone)
values (203, 'Oncology', 'P-7', '087818023');
insert into DEPARTMENT (departmentid, name, location, phone)
values (204, 'Radiology', 'R-4', '084650388');
insert into DEPARTMENT (departmentid, name, location, phone)
values (205, 'Pediatrics', 'L-6', '099514432');
insert into DEPARTMENT (departmentid, name, location, phone)
values (206, 'Emergency', 'H-7', '087444676');
insert into DEPARTMENT (departmentid, name, location, phone)
values (207, 'Pediatrics', 'Q-8', '081965993');
insert into DEPARTMENT (departmentid, name, location, phone)
values (208, 'Nutrition', 'L-4', '037996511');
insert into DEPARTMENT (departmentid, name, location, phone)
values (209, 'Surgery', 'B-2', '035744206');
insert into DEPARTMENT (departmentid, name, location, phone)
values (210, 'Physical', 'H-6', '034477473');
insert into DEPARTMENT (departmentid, name, location, phone)
values (211, 'Care', 'Q-5', '041693154');
insert into DEPARTMENT (departmentid, name, location, phone)
values (1, 'Obstetrics', 'P-1', '075882538');
insert into DEPARTMENT (departmentid, name, location, phone)
values (2, 'Orthopedics', 'X-6', '071640949');
insert into DEPARTMENT (departmentid, name, location, phone)
values (3, 'Psychiatry', 'N-6', '097696917');
insert into DEPARTMENT (departmentid, name, location, phone)
values (4, 'Neurology', 'R-2', '038833406');
insert into DEPARTMENT (departmentid, name, location, phone)
values (5, 'Neurology', 'D-9', '036727896');
insert into DEPARTMENT (departmentid, name, location, phone)
values (6, 'Psychiatry', 'F-7', '085097400');
insert into DEPARTMENT (departmentid, name, location, phone)
values (7, 'Neurology', 'H-4', '028157439');
insert into DEPARTMENT (departmentid, name, location, phone)
values (8, 'Obstetrics', 'O-1', '074914023');
insert into DEPARTMENT (departmentid, name, location, phone)
values (9, 'Obstetrics', 'N-4', '044852847');
insert into DEPARTMENT (departmentid, name, location, phone)
values (10, 'Obstetrics', 'U-8', '081827681');
insert into DEPARTMENT (departmentid, name, location, phone)
values (11, 'Laboratory', 'A-4', '097269470');
insert into DEPARTMENT (departmentid, name, location, phone)
values (12, 'Pediatrics', 'T-1', '034867747');
insert into DEPARTMENT (departmentid, name, location, phone)
values (13, 'Laboratory', 'F-9', '037438884');
insert into DEPARTMENT (departmentid, name, location, phone)
values (14, 'Surgery', 'H-7', '044874827');
insert into DEPARTMENT (departmentid, name, location, phone)
values (15, 'Obstetrics', 'A-3', '046776771');
insert into DEPARTMENT (departmentid, name, location, phone)
values (16, 'Unit', 'W-5', '075647054');
insert into DEPARTMENT (departmentid, name, location, phone)
values (17, 'Pharmacy', 'U-6', '094227015');
insert into DEPARTMENT (departmentid, name, location, phone)
values (18, 'Unit', 'S-3', '028279816');
insert into DEPARTMENT (departmentid, name, location, phone)
values (19, 'Radiology', 'U-9', '024532875');
insert into DEPARTMENT (departmentid, name, location, phone)
values (20, 'Neurology', 'X-7', '023616275');
insert into DEPARTMENT (departmentid, name, location, phone)
values (21, 'Obstetrics', 'K-1', '025255248');
insert into DEPARTMENT (departmentid, name, location, phone)
values (22, 'Orthopedics', 'H-3', '042668425');
insert into DEPARTMENT (departmentid, name, location, phone)
values (23, 'Gynecology', 'Z-6', '026104304');
insert into DEPARTMENT (departmentid, name, location, phone)
values (24, 'Oncology', 'D-7', '082021747');
insert into DEPARTMENT (departmentid, name, location, phone)
values (25, 'Gynecology', 'T-1', '079276746');
insert into DEPARTMENT (departmentid, name, location, phone)
values (26, 'Gynecology', 'I-9', '096913276');
insert into DEPARTMENT (departmentid, name, location, phone)
values (27, 'Cardiology', 'N-4', '086359129');
insert into DEPARTMENT (departmentid, name, location, phone)
values (28, 'Emergency', 'Y-9', '042685602');
insert into DEPARTMENT (departmentid, name, location, phone)
values (29, 'Unit', 'I-9', '029030512');
insert into DEPARTMENT (departmentid, name, location, phone)
values (30, 'Nutrition', 'Z-7', '029980453');
insert into DEPARTMENT (departmentid, name, location, phone)
values (31, 'Therapy', 'N-6', '027837755');
insert into DEPARTMENT (departmentid, name, location, phone)
values (32, 'Oncology', 'P-4', '083157561');
insert into DEPARTMENT (departmentid, name, location, phone)
values (33, 'Gynecology', 'A-9', '026786501');
insert into DEPARTMENT (departmentid, name, location, phone)
values (34, 'Surgery', 'I-4', '097320069');
insert into DEPARTMENT (departmentid, name, location, phone)
values (35, 'Therapy', 'U-6', '049952814');
insert into DEPARTMENT (departmentid, name, location, phone)
values (36, 'Orthopedics', 'J-7', '044809110');
insert into DEPARTMENT (departmentid, name, location, phone)
values (37, 'Therapy', 'W-5', '026837008');
insert into DEPARTMENT (departmentid, name, location, phone)
values (38, 'Radiology', 'E-4', '023410150');
insert into DEPARTMENT (departmentid, name, location, phone)
values (39, 'Physical', 'E-5', '094315033');
insert into DEPARTMENT (departmentid, name, location, phone)
values (40, 'Therapy', 'D-1', '073604437');
insert into DEPARTMENT (departmentid, name, location, phone)
values (41, 'Unit', 'X-7', '027856230');
insert into DEPARTMENT (departmentid, name, location, phone)
values (42, 'Intensive', 'U-7', '047313212');
insert into DEPARTMENT (departmentid, name, location, phone)
values (43, 'Surgery', 'Q-7', '094731949');
insert into DEPARTMENT (departmentid, name, location, phone)
values (44, 'Nutrition', 'T-4', '099532497');
insert into DEPARTMENT (departmentid, name, location, phone)
values (45, 'Orthopedics', 'I-2', '032299862');
insert into DEPARTMENT (departmentid, name, location, phone)
values (46, 'Unit', 'H-6', '045354915');
insert into DEPARTMENT (departmentid, name, location, phone)
values (47, 'Obstetrics', 'T-6', '087676357');
insert into DEPARTMENT (departmentid, name, location, phone)
values (48, 'Intensive', 'D-8', '087934591');
insert into DEPARTMENT (departmentid, name, location, phone)
values (49, 'Therapy', 'Q-5', '021266609');
insert into DEPARTMENT (departmentid, name, location, phone)
values (50, 'Intensive', 'H-6', '025284153');
insert into DEPARTMENT (departmentid, name, location, phone)
values (51, 'Obstetrics', 'T-8', '046271355');
insert into DEPARTMENT (departmentid, name, location, phone)
values (52, 'Surgery', 'W-6', '043211824');
insert into DEPARTMENT (departmentid, name, location, phone)
values (53, 'Care', 'I-5', '076493484');
insert into DEPARTMENT (departmentid, name, location, phone)
values (54, 'Intensive', 'F-3', '085523975');
insert into DEPARTMENT (departmentid, name, location, phone)
values (55, 'Gynecology', 'M-4', '033088864');
insert into DEPARTMENT (departmentid, name, location, phone)
values (56, 'Obstetrics', 'U-2', '078646818');
insert into DEPARTMENT (departmentid, name, location, phone)
values (57, 'Obstetrics', 'A-2', '076406774');
insert into DEPARTMENT (departmentid, name, location, phone)
values (58, 'Emergency', 'C-7', '096372690');
insert into DEPARTMENT (departmentid, name, location, phone)
values (59, 'Laboratory', 'U-8', '035308509');
insert into DEPARTMENT (departmentid, name, location, phone)
values (60, 'Unit', 'G-5', '091324064');
insert into DEPARTMENT (departmentid, name, location, phone)
values (61, 'Obstetrics', 'Q-8', '043400544');
insert into DEPARTMENT (departmentid, name, location, phone)
values (62, 'Psychiatry', 'F-3', '032264556');
insert into DEPARTMENT (departmentid, name, location, phone)
values (63, 'Gynecology', 'P-9', '096033713');
insert into DEPARTMENT (departmentid, name, location, phone)
values (64, 'Care', 'D-8', '027383280');
insert into DEPARTMENT (departmentid, name, location, phone)
values (65, 'Therapy', 'M-8', '039764553');
insert into DEPARTMENT (departmentid, name, location, phone)
values (66, 'Physical', 'S-2', '044449397');
insert into DEPARTMENT (departmentid, name, location, phone)
values (67, 'Cardiology', 'D-9', '022811907');
insert into DEPARTMENT (departmentid, name, location, phone)
values (68, 'Intensive', 'I-3', '028090148');
insert into DEPARTMENT (departmentid, name, location, phone)
values (69, 'Orthopedics', 'V-8', '045933463');
insert into DEPARTMENT (departmentid, name, location, phone)
values (70, 'Gynecology', 'L-6', '091700558');
insert into DEPARTMENT (departmentid, name, location, phone)
values (71, 'Nutrition', 'D-4', '047655702');
insert into DEPARTMENT (departmentid, name, location, phone)
values (72, 'Pharmacy', 'E-6', '037458811');
insert into DEPARTMENT (departmentid, name, location, phone)
values (73, 'Neurology', 'C-5', '049979205');
insert into DEPARTMENT (departmentid, name, location, phone)
values (74, 'Nutrition', 'Z-9', '022910542');
commit;
prompt 400 records committed...
insert into DEPARTMENT (departmentid, name, location, phone)
values (75, 'Pediatrics', 'T-6', '045111924');
insert into DEPARTMENT (departmentid, name, location, phone)
values (76, 'Cardiology', 'D-8', '021410509');
insert into DEPARTMENT (departmentid, name, location, phone)
values (77, 'Neurology', 'M-7', '034518394');
insert into DEPARTMENT (departmentid, name, location, phone)
values (78, 'Intensive', 'H-9', '091683725');
insert into DEPARTMENT (departmentid, name, location, phone)
values (79, 'Pharmacy', 'I-8', '046175371');
insert into DEPARTMENT (departmentid, name, location, phone)
values (80, 'Orthopedics', 'F-1', '094702709');
insert into DEPARTMENT (departmentid, name, location, phone)
values (81, 'Unit', 'I-6', '039456649');
insert into DEPARTMENT (departmentid, name, location, phone)
values (82, 'Obstetrics', 'W-6', '072285512');
insert into DEPARTMENT (departmentid, name, location, phone)
values (83, 'Pediatrics', 'X-4', '036094171');
insert into DEPARTMENT (departmentid, name, location, phone)
values (84, 'Obstetrics', 'T-4', '046113134');
insert into DEPARTMENT (departmentid, name, location, phone)
values (85, 'Oncology', 'S-4', '026241707');
insert into DEPARTMENT (departmentid, name, location, phone)
values (86, 'Nutrition', 'B-6', '095557317');
insert into DEPARTMENT (departmentid, name, location, phone)
values (87, 'Pharmacy', 'Q-8', '047363616');
insert into DEPARTMENT (departmentid, name, location, phone)
values (88, 'Obstetrics', 'D-5', '033613034');
insert into DEPARTMENT (departmentid, name, location, phone)
values (89, 'Neurology', 'V-4', '086547202');
insert into DEPARTMENT (departmentid, name, location, phone)
values (90, 'Therapy', 'S-4', '088656733');
insert into DEPARTMENT (departmentid, name, location, phone)
values (91, 'Therapy', 'G-2', '091455353');
insert into DEPARTMENT (departmentid, name, location, phone)
values (92, 'Unit', 'X-8', '033514106');
insert into DEPARTMENT (departmentid, name, location, phone)
values (93, 'Unit', 'U-4', '092558975');
insert into DEPARTMENT (departmentid, name, location, phone)
values (94, 'Care', 'E-2', '042732281');
insert into DEPARTMENT (departmentid, name, location, phone)
values (95, 'Psychiatry', 'C-2', '033078794');
insert into DEPARTMENT (departmentid, name, location, phone)
values (96, 'Laboratory', 'V-5', '094823405');
insert into DEPARTMENT (departmentid, name, location, phone)
values (97, 'Gynecology', 'R-7', '046285812');
insert into DEPARTMENT (departmentid, name, location, phone)
values (98, 'Emergency', 'A-7', '048892092');
insert into DEPARTMENT (departmentid, name, location, phone)
values (99, 'Oncology', 'H-4', '028021633');
insert into DEPARTMENT (departmentid, name, location, phone)
values (100, 'Psychiatry', 'Q-9', '081290654');
insert into DEPARTMENT (departmentid, name, location, phone)
values (101, 'Obstetrics', 'L-1', '089566456');
insert into DEPARTMENT (departmentid, name, location, phone)
values (102, 'Pediatrics', 'F-4', '096075924');
insert into DEPARTMENT (departmentid, name, location, phone)
values (103, 'Emergency', 'Y-4', '098866337');
insert into DEPARTMENT (departmentid, name, location, phone)
values (104, 'Psychiatry', 'P-3', '038882298');
insert into DEPARTMENT (departmentid, name, location, phone)
values (105, 'Physical', 'U-9', '044694794');
insert into DEPARTMENT (departmentid, name, location, phone)
values (106, 'Unit', 'X-1', '092689861');
insert into DEPARTMENT (departmentid, name, location, phone)
values (107, 'Nutrition', 'G-1', '037129489');
insert into DEPARTMENT (departmentid, name, location, phone)
values (212, 'Radiology', 'B-9', '026386815');
insert into DEPARTMENT (departmentid, name, location, phone)
values (213, 'Nutrition', 'Q-4', '024708991');
insert into DEPARTMENT (departmentid, name, location, phone)
values (214, 'Cardiology', 'Y-1', '041317731');
insert into DEPARTMENT (departmentid, name, location, phone)
values (215, 'Care', 'J-3', '022367968');
insert into DEPARTMENT (departmentid, name, location, phone)
values (216, 'Nutrition', 'J-9', '087070506');
insert into DEPARTMENT (departmentid, name, location, phone)
values (217, 'Orthopedics', 'H-3', '035813985');
insert into DEPARTMENT (departmentid, name, location, phone)
values (218, 'Care', 'K-4', '081896115');
insert into DEPARTMENT (departmentid, name, location, phone)
values (219, 'Psychiatry', 'Q-2', '033434861');
insert into DEPARTMENT (departmentid, name, location, phone)
values (220, 'Psychiatry', 'J-2', '086916530');
insert into DEPARTMENT (departmentid, name, location, phone)
values (221, 'Cardiology', 'H-4', '024779335');
insert into DEPARTMENT (departmentid, name, location, phone)
values (222, 'Psychiatry', 'Z-3', '044679139');
insert into DEPARTMENT (departmentid, name, location, phone)
values (223, 'Gynecology', 'J-7', '042456881');
insert into DEPARTMENT (departmentid, name, location, phone)
values (224, 'Oncology', 'K-8', '075174742');
insert into DEPARTMENT (departmentid, name, location, phone)
values (225, 'Unit', 'M-3', '098482109');
insert into DEPARTMENT (departmentid, name, location, phone)
values (226, 'Oncology', 'I-7', '021794100');
insert into DEPARTMENT (departmentid, name, location, phone)
values (449, 'Obstetrics', 'C-9', '096929131');
insert into DEPARTMENT (departmentid, name, location, phone)
values (450, 'Physical', 'V-9', '096510603');
insert into DEPARTMENT (departmentid, name, location, phone)
values (451, 'Obstetrics', 'S-3', '045002847');
insert into DEPARTMENT (departmentid, name, location, phone)
values (452, 'Intensive', 'C-6', '083402115');
insert into DEPARTMENT (departmentid, name, location, phone)
values (453, 'Pharmacy', 'T-3', '035651104');
insert into DEPARTMENT (departmentid, name, location, phone)
values (454, 'Surgery', 'S-4', '079453055');
insert into DEPARTMENT (departmentid, name, location, phone)
values (455, 'Emergency', 'O-1', '092567114');
insert into DEPARTMENT (departmentid, name, location, phone)
values (456, 'Gynecology', 'S-4', '072303444');
insert into DEPARTMENT (departmentid, name, location, phone)
values (457, 'Psychiatry', 'V-6', '075353860');
insert into DEPARTMENT (departmentid, name, location, phone)
values (458, 'Pharmacy', 'N-5', '078051207');
insert into DEPARTMENT (departmentid, name, location, phone)
values (459, 'Cardiology', 'I-8', '026615764');
insert into DEPARTMENT (departmentid, name, location, phone)
values (460, 'Obstetrics', 'Q-6', '073688967');
insert into DEPARTMENT (departmentid, name, location, phone)
values (461, 'Orthopedics', 'H-3', '028749107');
insert into DEPARTMENT (departmentid, name, location, phone)
values (462, 'Laboratory', 'X-9', '077949352');
insert into DEPARTMENT (departmentid, name, location, phone)
values (463, 'Pharmacy', 'O-6', '089259195');
insert into DEPARTMENT (departmentid, name, location, phone)
values (464, 'Gynecology', 'G-2', '022442986');
insert into DEPARTMENT (departmentid, name, location, phone)
values (465, 'Surgery', 'X-8', '098464509');
insert into DEPARTMENT (departmentid, name, location, phone)
values (466, 'Neurology', 'G-4', '037681326');
insert into DEPARTMENT (departmentid, name, location, phone)
values (467, 'Radiology', 'E-7', '027972464');
insert into DEPARTMENT (departmentid, name, location, phone)
values (468, 'Pediatrics', 'U-1', '096370442');
insert into DEPARTMENT (departmentid, name, location, phone)
values (469, 'Radiology', 'L-6', '094390552');
insert into DEPARTMENT (departmentid, name, location, phone)
values (470, 'Therapy', 'W-6', '044554243');
insert into DEPARTMENT (departmentid, name, location, phone)
values (471, 'Therapy', 'F-2', '096932871');
insert into DEPARTMENT (departmentid, name, location, phone)
values (472, 'Emergency', 'B-5', '033588951');
insert into DEPARTMENT (departmentid, name, location, phone)
values (473, 'Therapy', 'M-5', '037958072');
insert into DEPARTMENT (departmentid, name, location, phone)
values (474, 'Oncology', 'U-7', '089857409');
insert into DEPARTMENT (departmentid, name, location, phone)
values (475, 'Oncology', 'L-7', '028592896');
insert into DEPARTMENT (departmentid, name, location, phone)
values (476, 'Laboratory', 'W-7', '086394460');
insert into DEPARTMENT (departmentid, name, location, phone)
values (477, 'Physical', 'L-3', '044518317');
insert into DEPARTMENT (departmentid, name, location, phone)
values (478, 'Orthopedics', 'A-4', '033505825');
insert into DEPARTMENT (departmentid, name, location, phone)
values (479, 'Psychiatry', 'R-3', '038285366');
insert into DEPARTMENT (departmentid, name, location, phone)
values (480, 'Neurology', 'W-7', '093834920');
insert into DEPARTMENT (departmentid, name, location, phone)
values (481, 'Emergency', 'O-4', '079247428');
insert into DEPARTMENT (departmentid, name, location, phone)
values (482, 'Orthopedics', 'T-2', '023477617');
insert into DEPARTMENT (departmentid, name, location, phone)
values (483, 'Care', 'F-1', '076907714');
insert into DEPARTMENT (departmentid, name, location, phone)
values (484, 'Neurology', 'U-1', '078476336');
insert into DEPARTMENT (departmentid, name, location, phone)
values (485, 'Intensive', 'T-4', '023247213');
insert into DEPARTMENT (departmentid, name, location, phone)
values (486, 'Intensive', 'V-7', '044654803');
insert into DEPARTMENT (departmentid, name, location, phone)
values (487, 'Cardiology', 'B-8', '024982229');
insert into DEPARTMENT (departmentid, name, location, phone)
values (488, 'Pediatrics', 'R-3', '037095579');
insert into DEPARTMENT (departmentid, name, location, phone)
values (489, 'Gynecology', 'L-3', '096764072');
insert into DEPARTMENT (departmentid, name, location, phone)
values (490, 'Obstetrics', 'V-1', '042926744');
insert into DEPARTMENT (departmentid, name, location, phone)
values (491, 'Nutrition', 'N-3', '036639139');
insert into DEPARTMENT (departmentid, name, location, phone)
values (492, 'Psychiatry', 'W-9', '045284326');
insert into DEPARTMENT (departmentid, name, location, phone)
values (493, 'Intensive', 'M-3', '048697974');
insert into DEPARTMENT (departmentid, name, location, phone)
values (494, 'Nutrition', 'H-9', '097665667');
insert into DEPARTMENT (departmentid, name, location, phone)
values (495, 'Physical', 'B-9', '071319440');
insert into DEPARTMENT (departmentid, name, location, phone)
values (496, 'Unit', 'D-9', '087198516');
insert into DEPARTMENT (departmentid, name, location, phone)
values (497, 'Neurology', 'M-8', '074823346');
insert into DEPARTMENT (departmentid, name, location, phone)
values (498, 'Psychiatry', 'T-9', '031933640');
insert into DEPARTMENT (departmentid, name, location, phone)
values (499, 'Therapy', 'E-5', '041244313');
insert into DEPARTMENT (departmentid, name, location, phone)
values (500, 'Gynecology', 'M-1', '087937677');
commit;
prompt 500 records loaded
prompt Loading DOCTOR...
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (1, 'Sidoney Midford', 'Oncology', '570-114-9920', 231);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (2, 'Viviana Brimble', 'Cardiology', '538-137-9614', 260);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (3, 'Federico Tomley', 'Radiology', '497-440-5766', 63);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (4, 'Binnie Ivanshintsev', 'Intensive', '466-978-6412', 464);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (5, 'Dennet Kilcullen', 'Therapy', '180-335-1020', 401);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (6, 'Skippie Delmage', 'Neurology', '426-489-5356', 425);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (7, 'Gilles Bortoloni', 'Laboratory', '224-245-6180', 464);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (8, 'Lauren Thomen', 'Radiology', '474-682-3790', 422);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (9, 'Caro Bleackly', 'Pediatrics', '231-550-8551', 396);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (10, 'Hasty Clymer', 'Physical', '971-489-6375', 464);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (11, 'Case Verbrugge', 'Oncology', '403-891-8646', 363);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (12, 'Maisey Naisbet', 'Gynecology', '678-639-3357', 73);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (13, 'Pauli Danett', 'Intensive', '693-251-4800', 367);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (14, 'Sarah Pirrone', 'Nutrition', '129-321-8567', 29);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (15, 'Gusella Spada', 'Pharmacy', '500-898-7483', 270);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (16, 'Raina Jeacop', 'Gynecology', '450-929-7716', 187);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (17, 'Herbert Coursor', 'Pediatrics', '529-857-8473', 381);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (18, 'Phelia Getcliffe', 'Pharmacy', '934-431-0071', 277);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (19, 'Charlotte Estoile', 'Physical', '301-735-8250', 323);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (20, 'Moselle Augustin', 'Therapy', '114-118-3974', 105);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (21, 'Simone Dewi', 'Emergency', '883-545-9833', 336);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (22, 'Hertha Cutchee', 'Therapy', '746-569-9680', 151);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (23, 'Vi Doree', 'Gynecology', '248-775-2612', 71);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (24, 'Floyd Prime', 'Oncology', '121-215-7684', 275);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (25, 'Steffen Linfield', 'Laboratory', '362-782-3860', 20);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (26, 'Leonard Barnaby', 'Surgery', '846-272-1884', 334);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (27, 'Erica Hasloch', 'Laboratory', '173-210-5505', 67);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (28, 'Haleigh Renshaw', 'Care', '264-471-3636', 96);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (29, 'Brigitte Leversuch', 'Therapy', '321-527-3034', 176);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (30, 'Filbert Maccrae', 'Surgery', '957-305-6078', 370);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (31, 'Thea Whitloe', 'Pediatrics', '721-250-7464', 147);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (32, 'Redford Andren', 'Pharmacy', '772-580-8820', 21);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (33, 'Ranee Graysmark', 'Therapy', '300-568-6332', 98);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (34, 'Curtice Stook', 'Therapy', '850-518-6307', 71);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (35, 'Haslett Turnbull', 'Obstetrics', '987-774-3027', 375);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (36, 'Alfy Georgievski', 'Gynecology', '235-749-8813', 175);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (37, 'Atlanta Aubry', 'Cardiology', '908-267-5239', 472);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (38, 'Stacey Wehner', 'Neurology', '663-947-6606', 337);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (39, 'Jennine Warlow', 'Intensive', '198-743-5218', 122);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (40, 'Sisile Janc', 'Emergency', '664-161-9589', 76);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (41, 'Ellary Humby', 'Pediatrics', '350-562-9425', 177);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (42, 'Ninnetta Heigho', 'Unit', '816-658-5278', 128);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (43, 'Marie Arnatt', 'Orthopedics', '689-765-9074', 206);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (44, 'Krista Cowlin', 'Oncology', '407-822-8335', 405);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (45, 'Vilma Heaton', 'Unit', '340-360-8431', 28);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (46, 'Ally Nortcliffe', 'Gynecology', '339-144-8121', 251);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (47, 'Etti Langelay', 'Orthopedics', '117-254-0468', 162);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (48, 'Violetta Longstreeth', 'Oncology', '269-711-2089', 127);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (49, 'Jarrad Van Haeften', 'Gynecology', '233-485-4841', 193);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (50, 'Horton Schlagh', 'Psychiatry', '804-220-7178', 428);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (51, 'Toni Bellow', 'Radiology', '673-380-8109', 77);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (52, 'Melisandra McKue', 'Care', '612-788-2273', 451);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (53, 'Nick Godwyn', 'Gynecology', '650-784-1681', 73);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (54, 'Max Brugsma', 'Surgery', '288-105-1847', 464);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (55, 'Neville Bondesen', 'Nutrition', '917-407-5841', 155);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (56, 'Jamaal Hildrew', 'Laboratory', '593-131-4169', 451);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (57, 'Lavena Pickaver', 'Cardiology', '551-683-5448', 489);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (58, 'Elsa Chattey', 'Emergency', '765-846-1381', 168);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (59, 'Arlen Valens-Smith', 'Oncology', '662-101-6220', 455);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (60, 'Mickey Edginton', 'Physical', '332-661-8808', 92);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (61, 'Monica Jina', 'Obstetrics', '749-276-4778', 155);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (62, 'Dennie Crittal', 'Pharmacy', '990-573-6667', 469);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (63, 'Kellen Karoly', 'Cardiology', '460-995-3687', 462);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (64, 'Beret Craine', 'Therapy', '280-378-8126', 273);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (65, 'Fidelio Pierpoint', 'Psychiatry', '285-268-4515', 387);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (66, 'Patrice Petracco', 'Oncology', '646-285-9331', 347);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (67, 'Tammie Messer', 'Psychiatry', '372-187-4878', 178);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (68, 'Romola Swidenbank', 'Psychiatry', '275-872-5187', 364);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (69, 'Eldon Dagnan', 'Obstetrics', '317-134-7540', 321);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (70, 'Natalie Elgee', 'Nutrition', '670-424-1755', 205);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (71, 'Hatty Yeardley', 'Nutrition', '344-442-2918', 37);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (72, 'Trueman Sinnocke', 'Orthopedics', '483-610-2820', 479);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (73, 'Had Grigaut', 'Physical', '546-292-9096', 379);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (74, 'Andris Sorsby', 'Cardiology', '120-273-6400', 246);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (75, 'Tripp Houten', 'Gynecology', '136-537-6041', 162);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (76, 'Rowe Dagger', 'Nutrition', '541-249-4023', 81);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (77, 'Sharl Gameson', 'Surgery', '955-952-3269', 160);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (78, 'Erika Samsworth', 'Therapy', '904-165-8303', 14);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (79, 'Nina Comusso', 'Surgery', '333-230-2912', 20);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (80, 'Lindy Scolland', 'Laboratory', '862-212-9233', 153);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (81, 'Bartlet Pilfold', 'Orthopedics', '407-133-4798', 322);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (82, 'Thoma Pochin', 'Unit', '489-254-0104', 132);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (83, 'Cob Wilkinson', 'Therapy', '304-469-5359', 384);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (84, 'Carey Glashby', 'Intensive', '834-396-1252', 205);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (85, 'Izzy Westcar', 'Emergency', '519-337-5385', 426);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (86, 'Loree McSorley', 'Surgery', '434-698-9761', 311);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (87, 'Ernesta Widmoor', 'Cardiology', '992-305-4980', 198);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (88, 'Adelind Aitchinson', 'Surgery', '836-635-6442', 187);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (89, 'Etan Logesdale', 'Pharmacy', '768-185-7625', 8);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (90, 'Christian Moorcroft', 'Care', '757-674-6080', 394);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (91, 'Grady Andreassen', 'Pediatrics', '725-653-6838', 373);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (92, 'Evita Scarre', 'Surgery', '412-934-1361', 50);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (93, 'Jon Leatt', 'Care', '579-787-7431', 240);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (94, 'Samantha Birt', 'Surgery', '908-820-2129', 175);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (95, 'Terri-jo Jaffrey', 'Oncology', '873-791-0625', 222);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (96, 'Obediah Crumpe', 'Physical', '463-863-8437', 233);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (97, 'Antin Peetermann', 'Nutrition', '733-127-8707', 26);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (98, 'Montague Fawthrop', 'Laboratory', '501-419-9856', 350);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (99, 'Montgomery Ohanessian', 'Intensive', '427-746-4936', 432);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (100, 'Susana Senn', 'Nutrition', '776-484-1870', 396);
commit;
prompt 100 records committed...
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (101, 'Norene Hulburt', 'Cardiology', '975-564-9239', 488);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (102, 'Henderson Ballefant', 'Oncology', '434-892-7379', 60);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (103, 'Bron Siflet', 'Orthopedics', '468-325-2948', 47);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (104, 'Sisely MacHostie', 'Physical', '328-730-1083', 449);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (105, 'Estel Bartholomew', 'Gynecology', '685-224-9082', 316);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (106, 'Royal Sein', 'Pharmacy', '960-783-2704', 24);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (107, 'Sindee Worcester', 'Laboratory', '827-210-0755', 116);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (108, 'Gay Schleicher', 'Cardiology', '980-305-3051', 84);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (109, 'Sidoney Bloor', 'Unit', '700-471-5883', 433);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (110, 'Chrysa Kitchenham', 'Intensive', '223-308-4157', 415);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (111, 'Estel Abrahm', 'Nutrition', '284-678-9204', 72);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (112, 'Denise Lydster', 'Emergency', '192-953-7070', 8);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (113, 'Natala Breheny', 'Neurology', '201-266-5452', 280);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (114, 'Dario Weatherhead', 'Orthopedics', '375-476-9276', 414);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (115, 'Roseanne MacGarrity', 'Care', '432-740-9741', 304);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (116, 'Elmo Pretley', 'Cardiology', '466-215-1312', 347);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (117, 'Lanette Warsap', 'Psychiatry', '945-908-4415', 185);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (118, 'Brantley Filppetti', 'Pediatrics', '704-797-6494', 82);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (119, 'Marten Niaves', 'Neurology', '808-560-7718', 443);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (120, 'Klaus Adshede', 'Gynecology', '396-330-7411', 336);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (121, 'Erl McMechan', 'Pharmacy', '620-761-3771', 166);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (122, 'Chris Galiford', 'Cardiology', '758-256-9618', 451);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (123, 'Katinka Grivori', 'Obstetrics', '880-449-7435', 287);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (124, 'Vidovic Dayborne', 'Gynecology', '301-209-0812', 181);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (125, 'Jere Pattinson', 'Nutrition', '572-591-1776', 222);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (126, 'Allyce Elcum', 'Obstetrics', '912-301-4919', 87);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (127, 'Lee Moreman', 'Therapy', '486-224-9185', 321);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (128, 'Helge Ransbury', 'Care', '466-286-5306', 60);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (129, 'Desi Scrivinor', 'Intensive', '794-197-4756', 50);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (130, 'Janine Brindley', 'Psychiatry', '120-408-6274', 244);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (131, 'Maximilien Aizikowitz', 'Care', '177-506-1233', 333);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (132, 'Gale Haglington', 'Intensive', '578-325-0851', 41);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (133, 'Jasper Brasted', 'Unit', '691-171-9675', 49);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (134, 'Moreen Freer', 'Nutrition', '574-877-0746', 198);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (135, 'Morly Sumsion', 'Gynecology', '143-506-3764', 78);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (136, 'Claire Sterte', 'Neurology', '591-945-7965', 6);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (137, 'Annalise Hayth', 'Emergency', '855-800-7250', 433);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (138, 'Glenn Paquet', 'Cardiology', '797-126-5504', 19);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (139, 'Carena Easterfield', 'Cardiology', '775-831-6197', 76);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (140, 'Tim Gildroy', 'Orthopedics', '576-306-7569', 70);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (141, 'Tarra Gillaspy', 'Physical', '782-847-7995', 162);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (142, 'Reginald Guage', 'Therapy', '656-189-9667', 348);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (143, 'Codi Tolwood', 'Nutrition', '811-337-6035', 130);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (144, 'Ammamaria Dysert', 'Care', '656-930-8498', 379);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (145, 'Bendite Maylott', 'Neurology', '513-295-3464', 451);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (146, 'Tobey Lamdin', 'Pharmacy', '702-485-5295', 390);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (147, 'Galven Asey', 'Therapy', '447-836-1397', 42);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (148, 'Conrado Asel', 'Obstetrics', '891-308-1601', 384);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (149, 'Lotta Eliez', 'Intensive', '720-688-8789', 72);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (150, 'Stanislas Fontanet', 'Neurology', '514-790-0884', 227);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (151, 'Ginny Stather', 'Orthopedics', '839-503-0232', 98);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (152, 'Gunilla Biskupek', 'Therapy', '144-546-2231', 300);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (153, 'Janeta Frazier', 'Orthopedics', '822-391-9887', 82);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (154, 'Rory O''Doogan', 'Nutrition', '139-337-4333', 334);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (155, 'Tristam Faich', 'Neurology', '101-239-2014', 298);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (156, 'Nerita Domeney', 'Orthopedics', '774-138-3528', 121);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (157, 'Ninnetta Mouncher', 'Oncology', '803-886-8961', 243);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (158, 'Gianna Tidder', 'Surgery', '446-357-1204', 4);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (159, 'Raynell Giovanetti', 'Surgery', '322-988-2361', 105);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (160, 'Rodd Veryan', 'Nutrition', '629-306-1719', 170);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (161, 'Justen Murison', 'Surgery', '481-517-4326', 135);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (162, 'Carina Coult', 'Gynecology', '722-633-6363', 233);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (163, 'Dorothee Spat', 'Surgery', '200-352-3291', 240);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (164, 'Tomi Elflain', 'Nutrition', '546-462-3073', 446);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (165, 'Cynthy Abbatucci', 'Laboratory', '834-171-8805', 354);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (166, 'Lorrayne Doog', 'Care', '191-654-0673', 361);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (167, 'Marnie Trapp', 'Cardiology', '429-172-3435', 378);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (168, 'Floyd Petrakov', 'Unit', '653-581-1266', 84);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (169, 'Bogart Thews', 'Intensive', '326-555-7792', 241);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (170, 'Ham Tarbet', 'Emergency', '874-337-4844', 425);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (171, 'Darla Skae', 'Cardiology', '377-647-7121', 39);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (172, 'Cooper Brambley', 'Intensive', '977-676-6379', 56);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (173, 'Derry Guerreiro', 'Obstetrics', '562-912-5418', 50);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (174, 'Andreana Tattersfield', 'Pharmacy', '895-410-1968', 281);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (175, 'Rawley Livingston', 'Orthopedics', '200-495-0840', 122);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (176, 'Evvy Chason', 'Surgery', '417-593-5529', 450);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (177, 'Lesya Cleveley', 'Gynecology', '617-861-1318', 108);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (178, 'Shirline Halloran', 'Pharmacy', '403-642-2905', 202);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (179, 'Daphne Carrel', 'Pharmacy', '672-538-8682', 314);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (180, 'Maudie Grinikhinov', 'Intensive', '604-201-9668', 91);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (181, 'Shantee Noon', 'Pediatrics', '544-454-1361', 348);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (182, 'Stirling Wooton', 'Cardiology', '519-474-0232', 356);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (183, 'Christophe Bowdidge', 'Psychiatry', '931-554-1047', 384);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (184, 'Ahmed Fozzard', 'Psychiatry', '543-392-9268', 43);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (185, 'Grazia Ventham', 'Unit', '685-219-5741', 449);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (186, 'Mychal Giacopelo', 'Psychiatry', '966-297-0376', 35);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (187, 'Ambrose de Broke', 'Laboratory', '240-194-6098', 239);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (188, 'Haleigh Carleton', 'Radiology', '515-785-6141', 404);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (189, 'Kittie Mechem', 'Surgery', '653-883-5911', 165);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (190, 'Mitchael Goly', 'Pediatrics', '442-273-2515', 464);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (191, 'Basile Stolworthy', 'Orthopedics', '568-505-0192', 459);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (192, 'Innis Tebbett', 'Radiology', '704-210-4884', 356);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (193, 'Whitby Adam', 'Intensive', '686-429-9992', 227);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (194, 'Laurence Witsey', 'Emergency', '467-791-4131', 232);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (195, 'Alfi Iannello', 'Neurology', '466-961-6766', 489);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (196, 'Currie Keller', 'Oncology', '952-651-8186', 358);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (197, 'Aguie Eardley', 'Therapy', '682-635-6653', 463);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (198, 'Anstice Pengilley', 'Radiology', '505-970-1737', 435);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (199, 'Malcolm Ceaplen', 'Neurology', '327-201-3623', 109);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (200, 'Alric Cambling', 'Cardiology', '349-974-0247', 441);
commit;
prompt 200 records committed...
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (201, 'Baillie Burford', 'Cardiology', '768-593-1246', 215);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (202, 'Nixie Greenhouse', 'Neurology', '421-134-1433', 268);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (203, 'Gabriella Matyushkin', 'Surgery', '801-667-5106', 317);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (204, 'Letitia Netting', 'Intensive', '659-448-1553', 413);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (205, 'Curry Mayzes', 'Cardiology', '881-705-1758', 308);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (206, 'Yevette Braybrooks', 'Orthopedics', '710-857-6533', 169);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (207, 'Amalia Thurlby', 'Pharmacy', '407-314-5014', 34);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (208, 'Tiffy Caine', 'Radiology', '418-460-4633', 196);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (209, 'Ronnica Carayol', 'Intensive', '950-611-1829', 376);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (210, 'Gustaf Santus', 'Unit', '308-336-3291', 177);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (211, 'Abey Ragate', 'Unit', '933-231-5031', 329);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (212, 'Ruddy Chase', 'Care', '658-157-5626', 64);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (213, 'Arda Tunaclift', 'Intensive', '892-559-2020', 398);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (214, 'Row Welling', 'Pediatrics', '432-961-2006', 392);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (215, 'Ange Foskett', 'Intensive', '466-876-2468', 403);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (216, 'Rosaleen Matzel', 'Oncology', '303-177-0653', 378);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (217, 'Jessalin Brodhead', 'Radiology', '194-109-8010', 119);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (218, 'Theodor Longland', 'Oncology', '304-941-9861', 417);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (219, 'See Ferrara', 'Cardiology', '339-338-0347', 441);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (220, 'Cecilla Kersey', 'Therapy', '348-585-0359', 200);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (221, 'Luce Pamphilon', 'Cardiology', '759-518-9243', 94);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (222, 'Clay Kimmitt', 'Oncology', '505-493-6809', 209);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (223, 'Abdul Maykin', 'Emergency', '534-989-2629', 177);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (224, 'Kata Crasswell', 'Care', '257-158-2990', 334);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (225, 'Everard Lambdon', 'Emergency', '767-672-1477', 185);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (226, 'Benn Cliss', 'Orthopedics', '711-841-5884', 12);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (227, 'Chrotoem Urry', 'Intensive', '108-622-7174', 423);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (228, 'Tracie Franek', 'Neurology', '277-870-1615', 125);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (229, 'Ricki Dungay', 'Intensive', '103-531-1059', 97);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (230, 'Martica Skene', 'Orthopedics', '278-130-8165', 238);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (231, 'Bridgette Dei', 'Unit', '113-549-1723', 390);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (232, 'Codi Pane', 'Neurology', '616-668-1509', 130);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (233, 'Brook Tallman', 'Oncology', '504-904-8241', 104);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (234, 'Rawley Lampitt', 'Neurology', '189-710-5354', 330);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (235, 'Jackelyn Rimmer', 'Pediatrics', '100-814-4114', 292);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (236, 'Dunstan Hutten', 'Therapy', '672-224-1830', 462);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (237, 'Margo Berka', 'Pharmacy', '845-474-7036', 435);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (238, 'Debbie Antoney', 'Surgery', '906-645-6220', 289);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (239, 'Aldrich Antic', 'Cardiology', '748-930-7518', 323);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (240, 'Hieronymus Magill', 'Oncology', '321-698-4953', 187);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (241, 'Cristal Gladtbach', 'Radiology', '245-149-0880', 476);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (242, 'Worden Langsdon', 'Neurology', '848-552-7496', 169);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (243, 'Kara-lynn McGiff', 'Nutrition', '331-284-1694', 281);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (244, 'Marcella Baldick', 'Gynecology', '985-894-2509', 62);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (245, 'Ara Wightman', 'Physical', '812-744-5916', 17);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (246, 'Isabelita Killoran', 'Orthopedics', '117-264-3513', 493);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (247, 'Sara Wakenshaw', 'Nutrition', '477-665-0790', 441);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (248, 'Andriette Pickavant', 'Neurology', '294-286-2192', 310);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (249, 'Brew Fritchley', 'Care', '798-650-7159', 55);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (250, 'Kit Eberz', 'Pediatrics', '403-392-3855', 391);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (251, 'Balduin Hedlestone', 'Surgery', '844-543-5857', 441);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (252, 'Fifi Fontes', 'Physical', '661-205-5687', 168);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (253, 'Maxim Fanner', 'Unit', '196-663-7768', 417);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (254, 'Zea Bartosiak', 'Unit', '101-222-2092', 352);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (255, 'Toby Proby', 'Care', '453-628-3243', 128);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (256, 'Rolph Gheorghe', 'Pediatrics', '644-934-0514', 210);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (257, 'Misha Domnick', 'Orthopedics', '364-721-7772', 377);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (258, 'Gloria Thornber', 'Obstetrics', '297-289-4911', 11);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (259, 'Moise Vollam', 'Neurology', '184-259-2042', 130);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (260, 'Abagael Scothron', 'Laboratory', '574-405-7289', 199);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (261, 'Cosetta Jacombs', 'Pharmacy', '223-492-1503', 203);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (262, 'Caresa Brimmicombe', 'Obstetrics', '857-619-2163', 429);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (263, 'Franz Sebright', 'Gynecology', '136-542-1779', 384);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (264, 'Karrie Layhe', 'Surgery', '671-335-9673', 134);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (265, 'Tobe Pulbrook', 'Laboratory', '833-286-8254', 171);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (266, 'Muhammad Cawthery', 'Care', '657-790-3400', 304);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (267, 'Floria Hallatt', 'Pharmacy', '813-390-4729', 317);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (268, 'Aile Aldus', 'Physical', '911-417-0541', 192);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (269, 'Terry Pryce', 'Obstetrics', '416-166-2852', 68);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (270, 'Christian Bibbie', 'Orthopedics', '593-256-2532', 83);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (271, 'Jourdan McLeod', 'Laboratory', '930-137-4111', 324);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (272, 'Jabez Dumpleton', 'Nutrition', '204-695-1652', 14);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (273, 'Nelie Cavil', 'Cardiology', '226-870-7494', 2);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (274, 'Iosep Hullyer', 'Obstetrics', '192-362-7492', 91);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (275, 'Laird Minithorpe', 'Surgery', '430-190-9751', 430);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (276, 'Guy Bruineman', 'Neurology', '252-429-8647', 499);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (277, 'Brunhilda Christauffour', 'Cardiology', '454-691-4684', 485);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (278, 'Mariele Brimblecomb', 'Radiology', '114-478-8649', 153);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (279, 'Siana Brownlie', 'Obstetrics', '350-756-3923', 401);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (280, 'Clare Hadwin', 'Cardiology', '470-956-7443', 78);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (281, 'Marcelia Struthers', 'Laboratory', '379-837-1601', 296);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (282, 'Arleen Gerriets', 'Intensive', '568-138-9482', 480);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (283, 'Kynthia Pummell', 'Unit', '793-716-9032', 363);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (284, 'Dory Bexley', 'Emergency', '404-184-4579', 193);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (285, 'Gilburt Ackers', 'Neurology', '550-651-6714', 1);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (286, 'Dee Longbone', 'Emergency', '857-283-1501', 32);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (287, 'Ancell Salandino', 'Unit', '705-785-6140', 165);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (288, 'Amory Hiskey', 'Therapy', '194-551-9892', 171);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (289, 'Morgen Uglow', 'Obstetrics', '942-777-6296', 57);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (290, 'Kore Tomlinson', 'Oncology', '988-100-1983', 300);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (291, 'Theadora Bent', 'Orthopedics', '603-678-5279', 11);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (292, 'Lesly Braam', 'Radiology', '510-963-7502', 180);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (293, 'Carlin Ferris', 'Nutrition', '904-629-5277', 101);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (294, 'Minetta Docherty', 'Neurology', '897-621-4676', 185);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (295, 'Marcelia Perillio', 'Emergency', '159-517-4943', 389);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (296, 'Brewer Whybrow', 'Orthopedics', '383-363-1394', 454);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (297, 'Trixi Daugherty', 'Psychiatry', '505-498-9025', 48);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (298, 'Trent Carl', 'Psychiatry', '145-299-4123', 445);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (299, 'Marcy Byers', 'Obstetrics', '229-549-0916', 21);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (300, 'Kinna Blucher', 'Therapy', '531-347-0986', 19);
commit;
prompt 300 records committed...
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (301, 'Melinde Cardero', 'Care', '619-381-6122', 273);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (302, 'Brittni Week', 'Psychiatry', '149-119-2564', 333);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (303, 'Hugo Mathison', 'Pediatrics', '647-417-9898', 88);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (304, 'Enrique Francescone', 'Neurology', '678-960-3560', 415);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (305, 'Zaria Paxforde', 'Therapy', '452-505-3803', 5);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (306, 'Dory Losemann', 'Orthopedics', '970-118-1404', 176);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (307, 'Emmye Bruneau', 'Laboratory', '950-695-0843', 184);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (308, 'Reed Hanne', 'Oncology', '248-854-4559', 177);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (309, 'Crosby Grafton', 'Emergency', '193-500-6043', 236);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (310, 'Ali Filippov', 'Physical', '385-995-6328', 173);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (311, 'Lucienne Harsum', 'Pharmacy', '517-898-8031', 205);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (312, 'Merle Bushell', 'Unit', '768-689-7128', 249);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (313, 'Gerri Donaghie', 'Psychiatry', '532-805-6033', 481);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (314, 'Cammi Slayford', 'Oncology', '784-152-6478', 188);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (315, 'Marge McMeanma', 'Obstetrics', '858-424-2247', 75);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (316, 'Bert Zylberdik', 'Psychiatry', '916-416-5772', 164);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (317, 'Margo Brittles', 'Gynecology', '402-239-0908', 297);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (318, 'Ailina Wayte', 'Psychiatry', '936-779-6751', 64);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (319, 'Sandie Bernon', 'Unit', '486-128-6831', 170);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (320, 'Rosina Campion', 'Intensive', '470-111-7995', 181);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (321, 'Dosi Bradder', 'Orthopedics', '118-845-0449', 315);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (322, 'Allie Gilhooley', 'Orthopedics', '708-452-5623', 39);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (323, 'Reinwald Mangeney', 'Physical', '101-343-8301', 128);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (324, 'Bree Glander', 'Nutrition', '572-357-6354', 448);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (325, 'Devora Crosseland', 'Emergency', '435-363-9844', 232);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (326, 'Drusie Matias', 'Therapy', '949-950-9061', 464);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (327, 'Quent Burnside', 'Care', '553-855-5285', 144);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (328, 'Teador Bewley', 'Pediatrics', '763-470-0090', 239);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (329, 'Reginauld Ringrose', 'Pediatrics', '276-140-7785', 277);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (330, 'Savina Kilmurray', 'Psychiatry', '308-313-6454', 365);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (331, 'Stephen Brayford', 'Laboratory', '551-788-4895', 362);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (332, 'Adolphus Ferraron', 'Therapy', '285-225-6557', 129);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (333, 'Sybyl Josefovic', 'Nutrition', '153-295-0037', 39);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (334, 'Mandel Wallbutton', 'Pediatrics', '531-128-3669', 405);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (335, 'Preston Stonhard', 'Care', '364-332-3434', 108);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (336, 'Koressa Elrick', 'Neurology', '917-379-2691', 25);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (337, 'Rebeka McPhillimey', 'Laboratory', '941-161-2908', 390);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (338, 'Valentia McNish', 'Obstetrics', '453-941-9325', 305);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (339, 'Arden Padgett', 'Therapy', '161-756-9446', 474);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (340, 'Osborne Kick', 'Oncology', '735-689-8694', 382);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (341, 'Had Darcy', 'Nutrition', '299-729-8779', 95);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (342, 'Fay Applebee', 'Radiology', '206-173-3447', 335);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (343, 'Eula Beggi', 'Psychiatry', '478-595-7100', 92);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (344, 'Marion Diboll', 'Pediatrics', '645-261-6671', 244);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (345, 'Raynell Maillard', 'Therapy', '133-206-5603', 273);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (346, 'Ludvig Jellings', 'Laboratory', '413-544-8286', 444);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (347, 'Antone Tregensoe', 'Psychiatry', '555-780-2111', 268);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (348, 'Perceval Baruch', 'Obstetrics', '340-540-1395', 480);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (349, 'Ursula Persitt', 'Neurology', '742-221-4567', 118);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (350, 'Red Davisson', 'Radiology', '664-878-3095', 175);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (351, 'Clarie Davana', 'Pharmacy', '891-216-3977', 88);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (352, 'Sherrie Bouttell', 'Therapy', '859-138-4961', 157);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (353, 'Ruddie Pallatina', 'Emergency', '951-479-8286', 441);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (354, 'Gennie Sleit', 'Unit', '744-992-9155', 28);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (355, 'Deane Fyndon', 'Emergency', '132-887-6277', 259);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (356, 'Laurena Rapelli', 'Radiology', '275-200-6671', 55);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (357, 'Alexandre McFfaden', 'Nutrition', '507-506-3407', 351);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (358, 'Gabriela Treswell', 'Gynecology', '180-614-1239', 1);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (359, 'Ian Cabera', 'Laboratory', '621-854-2161', 397);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (360, 'Annalee Florez', 'Intensive', '985-142-9037', 112);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (361, 'Sinclair Mayfield', 'Orthopedics', '608-538-0422', 173);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (362, 'Thorsten Shannon', 'Surgery', '818-285-5309', 451);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (363, 'Breanne Ianelli', 'Orthopedics', '256-434-1508', 104);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (364, 'Roscoe Guinness', 'Neurology', '940-108-1434', 240);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (365, 'Brittni Drought', 'Obstetrics', '352-849-8851', 26);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (366, 'Adrian Goublier', 'Pharmacy', '796-243-7074', 90);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (367, 'Emalia Sibylla', 'Neurology', '877-758-4090', 483);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (368, 'Packston Barrick', 'Unit', '368-595-9017', 151);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (369, 'Joletta Izakovitz', 'Nutrition', '677-175-0062', 51);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (370, 'Marcelle Wyre', 'Unit', '738-871-7502', 490);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (371, 'Jeremiah Moult', 'Gynecology', '370-566-5228', 432);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (372, 'Yale Leebetter', 'Nutrition', '605-574-2407', 329);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (373, 'Gert MacKegg', 'Cardiology', '754-756-3014', 143);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (374, 'Skelly Node', 'Physical', '476-450-7583', 203);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (375, 'Thomasa Oddy', 'Gynecology', '638-485-5063', 227);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (376, 'Guglielma Davydenko', 'Nutrition', '185-907-5178', 426);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (377, 'Morgen Stayte', 'Cardiology', '349-237-7296', 471);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (378, 'Vanni Dobbin', 'Obstetrics', '961-834-1950', 392);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (379, 'Kayla Muzzollo', 'Radiology', '226-923-4703', 230);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (380, 'Cleavland Cawkill', 'Gynecology', '631-715-3429', 52);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (381, 'Marlene Kleinber', 'Cardiology', '605-894-3408', 155);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (382, 'Billy Wimbush', 'Oncology', '798-792-6801', 332);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (383, 'Ilyse Barkes', 'Orthopedics', '559-347-7802', 50);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (384, 'Dalia Maxworthy', 'Physical', '708-442-7533', 171);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (385, 'Juline McGowan', 'Gynecology', '765-621-7725', 494);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (386, 'Sarita Tasker', 'Intensive', '408-493-1994', 5);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (387, 'Cori Waddingham', 'Pediatrics', '828-663-5915', 246);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (388, 'Paddy Harrild', 'Radiology', '728-238-1627', 455);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (389, 'Berna Joutapaitis', 'Psychiatry', '529-461-7442', 40);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (390, 'Gerianne Kynd', 'Cardiology', '230-438-5151', 342);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (391, 'Suki McGerraghty', 'Cardiology', '869-465-1691', 344);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (392, 'Devi Tilney', 'Obstetrics', '568-908-1063', 214);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (393, 'Vera Fautley', 'Gynecology', '278-964-2940', 442);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (394, 'Brinn Haselwood', 'Orthopedics', '803-315-3284', 341);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (395, 'Amity Bust', 'Nutrition', '176-186-3698', 389);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (396, 'Lilllie Hunnable', 'Emergency', '428-605-7649', 355);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (397, 'Vasily Whayman', 'Pediatrics', '993-422-2649', 251);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (398, 'Arlena Mundall', 'Surgery', '249-213-5164', 484);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (399, 'Fabe Philippsohn', 'Oncology', '605-294-1403', 337);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (400, 'Nadine Owttrim', 'Physical', '151-429-1886', 418);
commit;
prompt 400 records committed...
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (401, 'Nahum Boards', 'Radiology', '592-710-5887', 28);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (402, 'Manfred Saffell', 'Intensive', '465-974-5343', 467);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (403, 'Erik Wey', 'Physical', '441-401-1309', 352);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (404, 'Dasie Flint', 'Pharmacy', '863-533-3241', 487);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (405, 'Em Verbrugghen', 'Neurology', '469-868-3370', 83);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (406, 'Roseann Tombs', 'Orthopedics', '734-482-9869', 268);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (407, 'Herbert Hasted', 'Obstetrics', '777-234-3846', 20);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (408, 'Herminia Brevetor', 'Emergency', '807-554-1681', 369);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (409, 'Guillaume Stormouth', 'Care', '542-629-2199', 489);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (410, 'Dalenna Manicom', 'Physical', '955-641-7514', 349);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (411, 'Ava Chatters', 'Pharmacy', '915-154-6710', 394);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (412, 'Jaymie Figgins', 'Radiology', '622-262-5092', 434);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (413, 'Ernesto Ballinger', 'Physical', '297-935-3126', 81);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (414, 'Elliot Puve', 'Pharmacy', '109-389-0958', 154);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (415, 'Francisco Noddle', 'Physical', '196-146-9507', 120);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (416, 'Les Simonato', 'Emergency', '328-478-9859', 67);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (417, 'Vickie Studders', 'Care', '678-369-5064', 170);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (418, 'Erick Adlington', 'Radiology', '960-863-9753', 454);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (419, 'Krystle Neild', 'Psychiatry', '759-867-8477', 14);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (420, 'Dorena Oxterby', 'Unit', '115-226-0951', 38);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (421, 'Fair Ligoe', 'Gynecology', '186-584-7852', 172);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (422, 'Janel Woolrich', 'Surgery', '444-311-2437', 84);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (423, 'Grayce Simison', 'Oncology', '265-196-6980', 254);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (424, 'Cole Baseke', 'Nutrition', '708-322-9039', 413);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (425, 'Tandie Crosoer', 'Pharmacy', '789-353-2895', 115);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (426, 'Merwyn Ineson', 'Emergency', '980-522-3397', 380);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (427, 'Lorinda Sandyfirth', 'Emergency', '434-150-2429', 93);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (428, 'Amery Cargill', 'Neurology', '346-757-0018', 479);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (429, 'Petr Traice', 'Emergency', '367-666-7238', 242);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (430, 'Orlando Tankus', 'Gynecology', '350-672-1656', 480);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (431, 'Natalina Huc', 'Unit', '672-923-7106', 392);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (432, 'Beckie Casier', 'Nutrition', '589-850-5165', 399);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (433, 'Geraldine Bernli', 'Surgery', '817-416-4223', 441);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (434, 'Katey Nilles', 'Pediatrics', '560-446-9002', 249);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (435, 'Morgan Hasselby', 'Therapy', '998-859-2458', 103);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (436, 'Sinclair Haggeth', 'Neurology', '941-398-8135', 264);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (437, 'Feliza Zarb', 'Neurology', '439-878-2295', 36);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (438, 'Waiter Hasloch', 'Neurology', '795-763-2606', 4);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (439, 'Maxim Rouzet', 'Physical', '564-499-9806', 258);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (440, 'Antonie Rossiter', 'Intensive', '769-494-1398', 435);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (441, 'Frasquito Drinan', 'Oncology', '426-824-9158', 27);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (442, 'Alvina Gaudon', 'Intensive', '521-898-5373', 40);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (443, 'Drona Di Gregorio', 'Neurology', '546-331-1208', 124);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (444, 'Bentlee Pickvance', 'Nutrition', '274-280-3928', 24);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (445, 'Emmie Abbate', 'Orthopedics', '630-455-6613', 373);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (446, 'Josey Charters', 'Orthopedics', '832-770-3894', 94);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (447, 'Carmencita Capel', 'Pharmacy', '498-300-9469', 215);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (448, 'Marget Steggles', 'Psychiatry', '428-785-4513', 412);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (449, 'Renault Collett', 'Pediatrics', '992-571-5541', 116);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (450, 'Moll Klementz', 'Laboratory', '983-465-8747', 474);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (451, 'Bearnard McGuinley', 'Emergency', '204-330-8085', 419);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (452, 'Debor Mugglestone', 'Nutrition', '950-594-9907', 23);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (453, 'Merilee Harrell', 'Psychiatry', '593-583-6102', 428);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (454, 'Bev Byfford', 'Psychiatry', '658-736-1369', 478);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (455, 'Gram Vaneschi', 'Obstetrics', '956-348-0591', 365);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (456, 'Edwina Charnock', 'Oncology', '246-727-2668', 199);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (457, 'Artur Bassil', 'Obstetrics', '484-895-1675', 48);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (458, 'Melania Geleman', 'Oncology', '469-103-5494', 486);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (459, 'Angel Laise', 'Pharmacy', '745-755-9840', 393);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (460, 'Sianna Sylvaine', 'Psychiatry', '579-107-4077', 331);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (461, 'Aldric Louiset', 'Laboratory', '289-326-6883', 402);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (462, 'Wolfy Suttaby', 'Unit', '974-729-9393', 64);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (463, 'Annmarie Bartosinski', 'Intensive', '772-807-8527', 219);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (464, 'Quintina Stegers', 'Gynecology', '253-789-0656', 221);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (465, 'Iorgo Tuffey', 'Oncology', '939-235-3862', 136);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (466, 'Sal Casey', 'Radiology', '454-397-3608', 3);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (467, 'Sinclare Corro', 'Radiology', '370-209-1744', 60);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (468, 'Meryl Brabon', 'Therapy', '604-403-0149', 364);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (469, 'Herman Staig', 'Radiology', '750-933-2032', 160);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (470, 'Art Antoniewski', 'Gynecology', '130-961-2392', 114);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (471, 'Alexandrina Wickling', 'Laboratory', '952-342-4105', 133);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (472, 'Livvie Bengough', 'Surgery', '127-483-5758', 398);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (473, 'Esme Sprowson', 'Unit', '791-179-0300', 202);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (474, 'Hilton Wickie', 'Psychiatry', '761-982-8877', 256);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (475, 'Janina Van der Brugge', 'Obstetrics', '892-361-2314', 216);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (476, 'Marybeth Greenset', 'Nutrition', '214-231-6422', 223);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (477, 'Tore Iddens', 'Unit', '406-396-8099', 188);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (478, 'Loralee Gillion', 'Therapy', '504-382-1074', 43);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (479, 'Shaughn Fleetwood', 'Psychiatry', '392-512-0145', 422);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (480, 'Larina Clues', 'Neurology', '746-900-1212', 351);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (481, 'Torrin Bennington', 'Unit', '153-150-8547', 492);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (482, 'Dwayne Tapton', 'Gynecology', '141-284-5544', 46);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (483, 'Ulric Dumbarton', 'Pediatrics', '360-355-2767', 363);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (484, 'Koren Osbourne', 'Pharmacy', '985-538-6810', 316);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (485, 'Milly Lashford', 'Radiology', '324-481-1728', 210);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (486, 'Washington Benet', 'Nutrition', '503-241-9678', 177);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (487, 'Sidonia Bricksey', 'Pharmacy', '368-805-3142', 187);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (488, 'Jon Marzellano', 'Care', '627-249-9989', 233);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (489, 'Kettie Keepe', 'Unit', '820-586-2475', 485);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (490, 'Lorain Loudiane', 'Oncology', '213-722-5904', 108);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (491, 'Raul McGonigal', 'Care', '577-286-0910', 212);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (492, 'Any Lyttle', 'Pharmacy', '701-937-3637', 250);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (493, 'Shena Willimot', 'Cardiology', '849-987-4258', 439);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (494, 'Madelena Dunne', 'Neurology', '672-597-1295', 225);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (495, 'Karlen Mournian', 'Oncology', '110-140-4700', 310);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (496, 'Aylmar Pirot', 'Care', '701-785-0212', 275);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (497, 'Kristofor Beynkn', 'Gynecology', '378-132-7828', 129);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (498, 'Charla Mitkin', 'Psychiatry', '330-936-3826', 427);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (499, 'Nev Plampeyn', 'Emergency', '288-795-0528', 296);
insert into DOCTOR (doctorid, name, specialty, phone, departmentid)
values (500, 'Husain Archdeckne', 'Orthopedics', '336-640-0463', 78);
commit;
prompt 500 records loaded
prompt Loading MEDICATION...
prompt Table is empty
prompt Loading PATIENT...
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (1, 'Gunter Cardenas', to_date('02-01-1970', 'dd-mm-yyyy'), '429-336-0573', 358);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (2, 'Bridgette Trythall', to_date('18-01-1955', 'dd-mm-yyyy'), '918-471-5952', 145);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (3, 'Gino Heigho', to_date('09-04-1960', 'dd-mm-yyyy'), '835-722-0925', 484);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (4, 'Hall Lighten', to_date('05-02-2008', 'dd-mm-yyyy'), '167-744-3457', 203);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (5, 'Devinne Sweetnam', to_date('05-09-1981', 'dd-mm-yyyy'), '268-371-1270', 136);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (6, 'Dennis Kix', to_date('06-11-2014', 'dd-mm-yyyy'), '545-504-8168', 91);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (7, 'Viki MacCulloch', to_date('22-10-2023', 'dd-mm-yyyy'), '630-151-8128', 219);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (8, 'Lucius Allan', to_date('02-02-1963', 'dd-mm-yyyy'), '812-537-6652', 255);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (9, 'Kaela Cabena', to_date('19-07-1999', 'dd-mm-yyyy'), '406-699-9131', 226);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (10, 'Caitrin Shepley', to_date('28-05-1973', 'dd-mm-yyyy'), '106-272-4005', 451);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (11, 'Zollie Whiteland', to_date('14-07-2004', 'dd-mm-yyyy'), '120-264-9406', 48);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (12, 'Binnie Bellchamber', to_date('07-08-2013', 'dd-mm-yyyy'), '762-163-7130', 228);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (13, 'Moishe Spon', to_date('02-03-1990', 'dd-mm-yyyy'), '125-721-3337', 279);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (14, 'Geoffry Aujouanet', to_date('10-01-1992', 'dd-mm-yyyy'), '335-125-5086', 331);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (15, 'Westley Dorricott', to_date('13-04-1961', 'dd-mm-yyyy'), '815-492-8058', 305);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (16, 'Nana Lidgertwood', to_date('05-06-1975', 'dd-mm-yyyy'), '991-334-2714', 464);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (17, 'Biddy Addionizio', to_date('27-05-1951', 'dd-mm-yyyy'), '397-789-2584', 182);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (18, 'Juliane Zupone', to_date('04-03-2005', 'dd-mm-yyyy'), '568-578-7375', 194);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (19, 'Dimitry Tithacott', to_date('19-06-1963', 'dd-mm-yyyy'), '594-914-2976', 42);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (20, 'Kesley Avey', to_date('25-01-2012', 'dd-mm-yyyy'), '510-724-3174', 365);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (21, 'Cthrine Niesing', to_date('07-02-2021', 'dd-mm-yyyy'), '317-770-3561', 50);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (22, 'Kelsy Tebbutt', to_date('01-07-2022', 'dd-mm-yyyy'), '728-991-8826', 260);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (23, 'Barbi Muzzlewhite', to_date('26-11-1979', 'dd-mm-yyyy'), '811-425-5462', 233);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (24, 'Creighton Standfield', to_date('23-12-2010', 'dd-mm-yyyy'), '274-297-6695', 139);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (25, 'Salomon Reith', to_date('02-06-1974', 'dd-mm-yyyy'), '505-416-7364', 360);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (26, 'Aldis Gallety', to_date('14-01-1951', 'dd-mm-yyyy'), '372-350-9884', 260);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (27, 'Hattie Hillaby', to_date('25-03-1958', 'dd-mm-yyyy'), '217-260-3541', 179);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (28, 'Hyatt Ogborne', to_date('29-05-1950', 'dd-mm-yyyy'), '446-834-9516', 384);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (29, 'Gerard Wike', to_date('18-08-1998', 'dd-mm-yyyy'), '422-658-2629', 409);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (30, 'Waldon Belvard', to_date('25-10-1986', 'dd-mm-yyyy'), '453-348-5622', 11);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (31, 'Genna Prandi', to_date('04-08-1958', 'dd-mm-yyyy'), '596-862-2837', 160);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (32, 'Carry Sandercock', to_date('17-03-2006', 'dd-mm-yyyy'), '113-487-0375', 325);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (33, 'Lelah Moreland', to_date('04-02-2003', 'dd-mm-yyyy'), '383-972-9792', 412);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (34, 'Nedi Rontree', to_date('17-03-1976', 'dd-mm-yyyy'), '492-392-7694', 349);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (35, 'Nissy Guerre', to_date('03-04-1964', 'dd-mm-yyyy'), '263-637-2745', 439);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (36, 'Anatola Grewar', to_date('13-07-1979', 'dd-mm-yyyy'), '962-259-1913', 173);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (37, 'Del Ledwitch', to_date('18-04-2005', 'dd-mm-yyyy'), '660-417-9917', 43);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (38, 'Zia Hadlington', to_date('25-03-2009', 'dd-mm-yyyy'), '714-638-9023', 349);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (39, 'Rania Hardacre', to_date('17-03-1957', 'dd-mm-yyyy'), '550-113-1090', 423);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (40, 'Cicily Sikorsky', to_date('08-11-1985', 'dd-mm-yyyy'), '638-585-9577', 229);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (41, 'Jefferey Silvester', to_date('07-11-1962', 'dd-mm-yyyy'), '712-655-2738', 259);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (42, 'Lazar Rosenvasser', to_date('22-05-1991', 'dd-mm-yyyy'), '796-856-5044', 341);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (43, 'Dwayne Gallimore', to_date('12-05-2006', 'dd-mm-yyyy'), '924-516-1128', 21);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (44, 'Beltran Strond', to_date('25-08-1963', 'dd-mm-yyyy'), '541-596-4857', 433);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (45, 'Hilda Jobson', to_date('18-06-1950', 'dd-mm-yyyy'), '308-464-4184', 130);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (46, 'Clemmy Maydway', to_date('15-03-1996', 'dd-mm-yyyy'), '641-850-8132', 493);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (47, 'Elise Spatarul', to_date('13-04-1954', 'dd-mm-yyyy'), '723-602-0546', 382);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (48, 'Janot Gothup', to_date('30-11-2004', 'dd-mm-yyyy'), '752-911-2026', 85);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (49, 'Mabel Ginnaly', to_date('28-02-1956', 'dd-mm-yyyy'), '200-614-3330', 495);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (50, 'Heloise Flement', to_date('26-04-1991', 'dd-mm-yyyy'), '379-555-1588', 380);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (51, 'Lissa Madeley', to_date('18-12-2012', 'dd-mm-yyyy'), '596-997-5462', 207);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (52, 'Glynda O''Spellissey', to_date('21-01-1986', 'dd-mm-yyyy'), '538-427-9761', 113);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (53, 'Barbaraanne Blewitt', to_date('22-03-2016', 'dd-mm-yyyy'), '890-120-6284', 366);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (54, 'Martainn Bruhke', to_date('26-03-2016', 'dd-mm-yyyy'), '781-886-4118', 115);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (55, 'Munmro Lippitt', to_date('24-11-1971', 'dd-mm-yyyy'), '645-442-3460', 471);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (56, 'Jim Elecum', to_date('25-02-1951', 'dd-mm-yyyy'), '528-436-2648', 207);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (57, 'El Kirke', to_date('02-08-2002', 'dd-mm-yyyy'), '710-294-3636', 259);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (58, 'Hal Hedge', to_date('29-12-1977', 'dd-mm-yyyy'), '245-360-8171', 409);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (59, 'Lucio Heimes', to_date('12-09-2019', 'dd-mm-yyyy'), '652-548-2853', 290);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (60, 'Enrika Hedges', to_date('30-04-2021', 'dd-mm-yyyy'), '436-413-2553', 339);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (61, 'Willyt Ferraresi', to_date('20-07-2020', 'dd-mm-yyyy'), '295-393-8016', 71);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (62, 'Alfredo Bette', to_date('27-06-1985', 'dd-mm-yyyy'), '880-960-4168', 146);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (63, 'Molly Piscopiello', to_date('22-11-1998', 'dd-mm-yyyy'), '213-443-3274', 242);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (64, 'Seline Durrad', to_date('12-01-2018', 'dd-mm-yyyy'), '805-670-3145', 158);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (65, 'Amalle Ilott', to_date('08-01-2014', 'dd-mm-yyyy'), '772-782-8497', 222);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (66, 'Clarance Gavey', to_date('20-01-2011', 'dd-mm-yyyy'), '575-369-1321', 241);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (67, 'Cris Wooderson', to_date('21-07-2009', 'dd-mm-yyyy'), '660-378-1808', 87);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (68, 'Thomasine Taile', to_date('05-05-2015', 'dd-mm-yyyy'), '173-307-1577', 141);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (69, 'Nicola Humby', to_date('30-09-1975', 'dd-mm-yyyy'), '535-634-6980', 64);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (70, 'Andrea Adriano', to_date('27-06-1984', 'dd-mm-yyyy'), '795-401-5474', 433);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (71, 'Karlan Lyston', to_date('31-10-1995', 'dd-mm-yyyy'), '976-135-6739', 295);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (72, 'Gerik Kenneford', to_date('26-01-2023', 'dd-mm-yyyy'), '855-449-8208', 254);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (73, 'Cristy Nicol', to_date('06-07-1958', 'dd-mm-yyyy'), '249-978-4838', 475);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (74, 'Venus Jenik', to_date('16-09-2018', 'dd-mm-yyyy'), '211-249-7852', 106);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (75, 'Xymenes Finn', to_date('26-06-1966', 'dd-mm-yyyy'), '964-368-2607', 279);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (76, 'Angie Buntin', to_date('25-12-1979', 'dd-mm-yyyy'), '518-444-4586', 403);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (77, 'Delmore Gomez', to_date('02-11-2000', 'dd-mm-yyyy'), '928-357-7637', 378);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (78, 'Sunshine Pandey', to_date('31-03-2006', 'dd-mm-yyyy'), '793-428-1646', 151);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (79, 'Nana Bashford', to_date('27-09-2009', 'dd-mm-yyyy'), '175-208-1859', 53);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (80, 'Bethena Perez', to_date('06-08-1996', 'dd-mm-yyyy'), '661-619-4184', 177);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (81, 'Ramonda Wetherby', to_date('04-06-1953', 'dd-mm-yyyy'), '728-170-0724', 453);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (82, 'Teador Browell', to_date('30-09-2022', 'dd-mm-yyyy'), '731-892-5522', 425);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (83, 'Valle Kamenar', to_date('17-10-2005', 'dd-mm-yyyy'), '678-527-1310', 250);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (84, 'Townsend Cuppitt', to_date('20-05-1985', 'dd-mm-yyyy'), '200-110-0211', 28);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (85, 'Jordana Duck', to_date('24-02-2009', 'dd-mm-yyyy'), '582-252-5254', 429);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (86, 'Bogey Kmicicki', to_date('18-12-1999', 'dd-mm-yyyy'), '755-874-3632', 248);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (87, 'Skipp Loosemore', to_date('14-05-2007', 'dd-mm-yyyy'), '108-995-7310', 401);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (88, 'Sindee Ebbage', to_date('08-07-1974', 'dd-mm-yyyy'), '695-638-4084', 275);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (89, 'Calley Kubicek', to_date('18-05-1991', 'dd-mm-yyyy'), '235-166-6463', 475);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (90, 'Prudi Montel', to_date('20-11-1963', 'dd-mm-yyyy'), '749-407-1837', 174);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (91, 'Antony Braghini', to_date('23-10-1975', 'dd-mm-yyyy'), '737-730-6449', 411);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (92, 'Farrah McJury', to_date('05-04-1996', 'dd-mm-yyyy'), '911-551-6125', 328);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (93, 'Thorin Matczak', to_date('18-11-1986', 'dd-mm-yyyy'), '455-274-6266', 158);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (94, 'Kizzee Reckhouse', to_date('27-01-1982', 'dd-mm-yyyy'), '860-182-0195', 500);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (95, 'Rachel Tremelling', to_date('30-11-1986', 'dd-mm-yyyy'), '706-881-7934', 444);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (96, 'Garnette Mandres', to_date('12-03-1960', 'dd-mm-yyyy'), '124-725-5592', 237);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (97, 'Callie Eilert', to_date('27-07-2008', 'dd-mm-yyyy'), '621-345-4176', 9);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (98, 'Moises Bolver', to_date('09-03-1952', 'dd-mm-yyyy'), '391-623-8165', 303);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (99, 'Emmy Drysdale', to_date('16-03-1993', 'dd-mm-yyyy'), '465-428-5231', 326);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (100, 'Tome Whilde', to_date('23-03-1956', 'dd-mm-yyyy'), '179-950-6662', 449);
commit;
prompt 100 records committed...
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (101, 'Valentin Bailles', to_date('17-07-1968', 'dd-mm-yyyy'), '841-529-2606', 457);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (102, 'Belvia Benbow', to_date('15-10-2008', 'dd-mm-yyyy'), '126-851-1801', 459);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (103, 'Domenic Beeckx', to_date('27-07-1953', 'dd-mm-yyyy'), '780-633-1738', 192);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (104, 'Nollie Kubat', to_date('24-01-2021', 'dd-mm-yyyy'), '338-569-0869', 428);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (105, 'Elizabet Fischer', to_date('28-09-1952', 'dd-mm-yyyy'), '232-318-6591', 386);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (106, 'Zia Stolli', to_date('26-12-1992', 'dd-mm-yyyy'), '597-674-7703', 460);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (107, 'Calypso Hildrew', to_date('26-05-2017', 'dd-mm-yyyy'), '186-740-6626', 172);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (108, 'Sibbie Babalola', to_date('21-06-2004', 'dd-mm-yyyy'), '145-342-3043', 355);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (109, 'Tabor Gillett', to_date('20-10-2003', 'dd-mm-yyyy'), '774-408-6109', 317);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (110, 'Fionna Brudenell', to_date('21-04-1976', 'dd-mm-yyyy'), '905-175-5354', 426);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (111, 'Celisse Crace', to_date('22-02-2023', 'dd-mm-yyyy'), '497-426-0193', 144);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (112, 'Dylan O''Shields', to_date('08-08-2018', 'dd-mm-yyyy'), '236-355-3236', 336);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (113, 'Urbanus Dongate', to_date('13-04-2017', 'dd-mm-yyyy'), '390-562-8709', 394);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (114, 'Ginnie Templar', to_date('05-08-2010', 'dd-mm-yyyy'), '862-755-4898', 8);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (115, 'Claire Lorey', to_date('14-03-2017', 'dd-mm-yyyy'), '898-369-3346', 470);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (116, 'Amata Cogman', to_date('23-04-1955', 'dd-mm-yyyy'), '491-255-1866', 230);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (117, 'Diandra Vinsen', to_date('14-02-1985', 'dd-mm-yyyy'), '979-247-3473', 40);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (118, 'Emmery Danbi', to_date('13-11-2009', 'dd-mm-yyyy'), '276-495-8893', 354);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (119, 'Alexina Urlin', to_date('14-06-1954', 'dd-mm-yyyy'), '529-576-1488', 120);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (120, 'Shandy Barrus', to_date('24-01-2015', 'dd-mm-yyyy'), '582-957-2004', 466);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (121, 'Corry Whear', to_date('31-05-1976', 'dd-mm-yyyy'), '940-994-4943', 163);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (122, 'Kent Sotham', to_date('02-11-2023', 'dd-mm-yyyy'), '751-708-0965', 306);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (123, 'Elle Simonassi', to_date('23-12-1985', 'dd-mm-yyyy'), '615-251-6013', 428);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (124, 'Jesus Ingree', to_date('11-01-1983', 'dd-mm-yyyy'), '518-381-6224', 318);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (125, 'Alia Veall', to_date('09-04-2012', 'dd-mm-yyyy'), '478-622-3172', 311);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (126, 'Orin Ferry', to_date('13-01-1995', 'dd-mm-yyyy'), '713-526-4524', 274);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (127, 'Silvana Swindell', to_date('31-03-1978', 'dd-mm-yyyy'), '756-564-8392', 405);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (128, 'Ozzie Warrier', to_date('20-03-1979', 'dd-mm-yyyy'), '755-686-6025', 294);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (129, 'Joby Fryd', to_date('16-02-2014', 'dd-mm-yyyy'), '500-847-0201', 49);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (130, 'Ara Richmond', to_date('05-10-1990', 'dd-mm-yyyy'), '721-447-1237', 281);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (131, 'Debor McGloin', to_date('22-07-1957', 'dd-mm-yyyy'), '889-169-3330', 154);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (132, 'Jarred Biggins', to_date('30-10-1982', 'dd-mm-yyyy'), '781-233-6016', 115);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (133, 'Adriaens Divine', to_date('10-08-1973', 'dd-mm-yyyy'), '616-681-0467', 369);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (134, 'Cindelyn Rackam', to_date('31-03-1982', 'dd-mm-yyyy'), '382-346-4297', 98);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (135, 'Sigismund Quig', to_date('01-02-1953', 'dd-mm-yyyy'), '351-210-1006', 84);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (136, 'Gerrie Phippard', to_date('28-07-1957', 'dd-mm-yyyy'), '206-271-9408', 465);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (137, 'Joey Igo', to_date('15-12-1984', 'dd-mm-yyyy'), '502-402-5946', 210);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (138, 'Cleavland Bursnall', to_date('13-01-1956', 'dd-mm-yyyy'), '686-496-2099', 228);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (139, 'Gherardo Petrussi', to_date('07-12-1996', 'dd-mm-yyyy'), '405-530-7595', 108);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (140, 'Woodman Neggrini', to_date('04-02-2001', 'dd-mm-yyyy'), '335-128-2580', 152);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (141, 'Shell Clemenson', to_date('09-12-1963', 'dd-mm-yyyy'), '837-507-8137', 4);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (142, 'Josepha Keijser', to_date('29-09-1997', 'dd-mm-yyyy'), '521-700-2998', 451);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (143, 'Krystyna Brydell', to_date('09-12-1965', 'dd-mm-yyyy'), '357-987-1088', 261);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (144, 'Sergent Schiersch', to_date('25-03-1987', 'dd-mm-yyyy'), '639-415-6160', 202);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (145, 'Salomone Janzen', to_date('01-10-1999', 'dd-mm-yyyy'), '595-666-9943', 345);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (146, 'Brigida Woodrow', to_date('02-07-2008', 'dd-mm-yyyy'), '491-979-5621', 190);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (147, 'Finlay Perch', to_date('18-08-2021', 'dd-mm-yyyy'), '533-370-0216', 320);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (148, 'Kirbee MacRedmond', to_date('01-03-1960', 'dd-mm-yyyy'), '263-360-1191', 189);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (149, 'Bridget Sarrell', to_date('06-11-1959', 'dd-mm-yyyy'), '426-625-9610', 2);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (150, 'Guy Pantlin', to_date('21-01-1983', 'dd-mm-yyyy'), '148-138-3280', 5);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (151, 'Freeman Rojas', to_date('30-09-2018', 'dd-mm-yyyy'), '391-965-6103', 389);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (152, 'Lee Mariolle', to_date('02-01-1993', 'dd-mm-yyyy'), '639-606-3893', 426);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (153, 'Retha Wessing', to_date('21-09-1977', 'dd-mm-yyyy'), '491-240-0733', 391);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (154, 'Arne Bottrell', to_date('17-10-1953', 'dd-mm-yyyy'), '202-921-3181', 330);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (155, 'Kenny Robert', to_date('09-11-1985', 'dd-mm-yyyy'), '469-953-3997', 235);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (156, 'Colan Kennler', to_date('11-07-1987', 'dd-mm-yyyy'), '712-179-3467', 263);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (157, 'Judd Martins', to_date('10-07-1968', 'dd-mm-yyyy'), '380-697-1938', 259);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (158, 'Lucila Muldrew', to_date('24-12-1971', 'dd-mm-yyyy'), '930-586-6583', 239);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (159, 'Silvano Mangan', to_date('27-01-1955', 'dd-mm-yyyy'), '139-604-1833', 201);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (160, 'Gratia Kobieriecki', to_date('22-05-2021', 'dd-mm-yyyy'), '200-788-8129', 483);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (161, 'Rozella Tonry', to_date('19-07-2010', 'dd-mm-yyyy'), '589-637-3847', 408);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (162, 'Philip Belliard', to_date('10-03-2010', 'dd-mm-yyyy'), '965-604-0038', 454);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (163, 'Beltran Drysdale', to_date('30-08-1995', 'dd-mm-yyyy'), '875-974-8464', 254);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (164, 'Shurwood Pryor', to_date('21-06-1990', 'dd-mm-yyyy'), '365-789-2400', 475);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (165, 'Maureen Dessaur', to_date('17-06-2007', 'dd-mm-yyyy'), '731-311-4139', 79);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (166, 'Freddy Rizzelli', to_date('26-04-2007', 'dd-mm-yyyy'), '492-918-1504', 175);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (167, 'Sibelle Fishlee', to_date('18-07-2009', 'dd-mm-yyyy'), '474-540-8850', 34);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (168, 'Fabien Marlow', to_date('06-06-2022', 'dd-mm-yyyy'), '332-967-2535', 465);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (169, 'Bronson Evers', to_date('15-03-2009', 'dd-mm-yyyy'), '289-314-6524', 5);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (170, 'Abagail Sealey', to_date('21-11-1994', 'dd-mm-yyyy'), '247-493-4433', 35);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (171, 'Kyrstin Thresher', to_date('20-03-1984', 'dd-mm-yyyy'), '341-136-4941', 126);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (172, 'Elisabeth Skates', to_date('27-02-2015', 'dd-mm-yyyy'), '276-826-4437', 494);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (173, 'Corinne Janks', to_date('28-06-2005', 'dd-mm-yyyy'), '103-731-8803', 82);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (174, 'Jammie Akehurst', to_date('08-08-1995', 'dd-mm-yyyy'), '700-833-4559', 88);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (175, 'Hollyanne Scothron', to_date('04-07-1956', 'dd-mm-yyyy'), '397-327-4495', 67);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (176, 'Sandor Kornousek', to_date('02-08-1978', 'dd-mm-yyyy'), '686-918-0379', 53);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (177, 'Patric Hum', to_date('11-07-1991', 'dd-mm-yyyy'), '401-364-0702', 401);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (178, 'Hube Bisp', to_date('21-10-2022', 'dd-mm-yyyy'), '117-324-7029', 363);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (179, 'Lenette Hiscoe', to_date('09-03-1953', 'dd-mm-yyyy'), '669-308-6227', 51);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (180, 'Yule Gummory', to_date('02-09-2015', 'dd-mm-yyyy'), '326-644-2531', 383);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (181, 'Eugine Veitch', to_date('13-10-1952', 'dd-mm-yyyy'), '822-729-6274', 400);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (182, 'Launce Kelbie', to_date('24-04-1989', 'dd-mm-yyyy'), '733-181-9785', 288);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (183, 'Sadie Bernade', to_date('16-12-1968', 'dd-mm-yyyy'), '143-978-6410', 175);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (184, 'Amie Alflatt', to_date('25-07-1969', 'dd-mm-yyyy'), '656-254-5386', 336);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (185, 'Diannne Domnick', to_date('26-12-1986', 'dd-mm-yyyy'), '878-797-6765', 241);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (186, 'Eli Chasteney', to_date('21-02-2009', 'dd-mm-yyyy'), '734-490-8769', 357);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (187, 'Bride Simonin', to_date('24-10-1988', 'dd-mm-yyyy'), '405-207-0276', 435);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (188, 'Corabel Pavie', to_date('23-08-1983', 'dd-mm-yyyy'), '195-549-3578', 116);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (189, 'Wyatt Tavener', to_date('27-01-1970', 'dd-mm-yyyy'), '396-400-8995', 196);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (190, 'Saraann Ullyatt', to_date('08-11-2018', 'dd-mm-yyyy'), '442-879-3851', 107);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (191, 'Ev Cummine', to_date('21-10-1973', 'dd-mm-yyyy'), '140-159-7372', 22);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (192, 'Vin Dyzart', to_date('27-06-1991', 'dd-mm-yyyy'), '693-748-6218', 112);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (193, 'Morena Heaker', to_date('01-09-2013', 'dd-mm-yyyy'), '553-842-8860', 233);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (194, 'Brnaby Tremmil', to_date('01-03-1971', 'dd-mm-yyyy'), '697-112-9353', 253);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (195, 'Obediah Hacking', to_date('24-01-2023', 'dd-mm-yyyy'), '221-359-4748', 181);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (196, 'Dix Burchard', to_date('23-03-2008', 'dd-mm-yyyy'), '171-969-0377', 145);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (197, 'Kristos Osgarby', to_date('17-09-1972', 'dd-mm-yyyy'), '200-296-2377', 490);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (198, 'Carroll Jacklings', to_date('08-11-1976', 'dd-mm-yyyy'), '337-801-4255', 425);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (199, 'Iver Denacamp', to_date('19-12-2009', 'dd-mm-yyyy'), '163-992-4259', 86);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (200, 'Odetta Clausner', to_date('30-09-1971', 'dd-mm-yyyy'), '132-981-7975', 246);
commit;
prompt 200 records committed...
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (201, 'Hi Adamovitz', to_date('05-12-1980', 'dd-mm-yyyy'), '359-524-1416', 436);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (202, 'Crysta Paddick', to_date('23-03-1951', 'dd-mm-yyyy'), '668-374-2051', 33);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (203, 'Artemis Silley', to_date('09-06-1994', 'dd-mm-yyyy'), '594-989-3616', 473);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (204, 'Hanny Sherme', to_date('31-05-2003', 'dd-mm-yyyy'), '790-156-6399', 285);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (205, 'Aurie Brouwer', to_date('21-10-1986', 'dd-mm-yyyy'), '735-229-9031', 97);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (206, 'Elizabeth Hydes', to_date('27-02-2022', 'dd-mm-yyyy'), '254-355-0530', 351);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (207, 'Suellen De Zuani', to_date('12-02-2004', 'dd-mm-yyyy'), '758-762-3154', 369);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (208, 'Edy Enoksson', to_date('04-01-1988', 'dd-mm-yyyy'), '244-562-2631', 390);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (209, 'Jemimah Shoobridge', to_date('28-11-1958', 'dd-mm-yyyy'), '167-327-4214', 348);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (210, 'Tabatha Blasio', to_date('28-12-2001', 'dd-mm-yyyy'), '825-177-6108', 53);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (211, 'Hedvige Ends', to_date('11-05-1964', 'dd-mm-yyyy'), '609-334-2719', 249);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (212, 'Patti Palfrie', to_date('02-02-2011', 'dd-mm-yyyy'), '468-441-3683', 162);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (213, 'Sasha Moan', to_date('01-02-1953', 'dd-mm-yyyy'), '215-268-0367', 85);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (214, 'Hugh Hinchshaw', to_date('12-02-1965', 'dd-mm-yyyy'), '674-182-4154', 192);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (215, 'Georgetta Trubshawe', to_date('13-01-1997', 'dd-mm-yyyy'), '809-732-7906', 125);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (216, 'Arleta Abbate', to_date('27-07-1989', 'dd-mm-yyyy'), '336-583-3419', 329);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (217, 'Jeffrey Brookzie', to_date('13-08-1953', 'dd-mm-yyyy'), '538-489-2032', 46);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (218, 'Michelle Arnefield', to_date('14-09-1982', 'dd-mm-yyyy'), '239-976-7239', 307);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (219, 'Carrol Huffer', to_date('25-12-1980', 'dd-mm-yyyy'), '425-132-1035', 103);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (220, 'Gayle Bicheno', to_date('17-02-1964', 'dd-mm-yyyy'), '554-895-2564', 267);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (221, 'Violetta Berrill', to_date('25-06-2016', 'dd-mm-yyyy'), '715-492-5722', 20);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (222, 'Alia Montacute', to_date('11-02-1975', 'dd-mm-yyyy'), '617-918-6095', 108);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (223, 'Fremont Rotlauf', to_date('31-08-1963', 'dd-mm-yyyy'), '305-541-6555', 2);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (224, 'Mathias Hymers', to_date('07-05-2019', 'dd-mm-yyyy'), '515-786-7634', 435);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (225, 'Atlante Cowburn', to_date('27-05-2007', 'dd-mm-yyyy'), '776-654-8171', 247);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (226, 'Konstanze Elford', to_date('22-12-2021', 'dd-mm-yyyy'), '654-382-5775', 440);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (227, 'Xever Damsell', to_date('03-11-1996', 'dd-mm-yyyy'), '804-708-2690', 256);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (228, 'Halley Trickey', to_date('11-12-1951', 'dd-mm-yyyy'), '910-472-3315', 405);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (229, 'Umeko Amori', to_date('26-10-1991', 'dd-mm-yyyy'), '180-328-7306', 25);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (230, 'Helge Bengefield', to_date('06-10-1961', 'dd-mm-yyyy'), '973-971-9945', 302);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (231, 'Boycey Skeemor', to_date('13-12-2023', 'dd-mm-yyyy'), '518-353-7554', 399);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (232, 'Melisandra Hazeldene', to_date('11-03-2016', 'dd-mm-yyyy'), '678-460-1776', 459);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (233, 'Eldon McCleverty', to_date('27-08-1982', 'dd-mm-yyyy'), '606-133-7484', 244);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (234, 'Piggy Baggs', to_date('30-09-1989', 'dd-mm-yyyy'), '697-738-8738', 232);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (235, 'Catlee Klimkovich', to_date('23-06-1973', 'dd-mm-yyyy'), '908-702-0132', 452);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (236, 'Valene Mardle', to_date('07-05-1962', 'dd-mm-yyyy'), '283-608-9535', 182);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (237, 'Moses Riccione', to_date('21-09-1974', 'dd-mm-yyyy'), '941-960-2379', 248);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (238, 'Oriana Putman', to_date('18-05-1974', 'dd-mm-yyyy'), '461-831-9006', 356);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (239, 'Esmaria Snalham', to_date('31-05-1964', 'dd-mm-yyyy'), '318-838-0880', 292);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (240, 'Randy Goering', to_date('07-05-2021', 'dd-mm-yyyy'), '217-132-0416', 63);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (241, 'Luis Gover', to_date('22-09-1951', 'dd-mm-yyyy'), '689-314-4916', 53);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (242, 'Corena Nezey', to_date('06-02-2004', 'dd-mm-yyyy'), '816-802-9233', 416);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (243, 'Nicolai de Merida', to_date('11-09-2021', 'dd-mm-yyyy'), '729-387-3718', 231);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (244, 'Lotte Birden', to_date('30-09-1984', 'dd-mm-yyyy'), '146-743-6245', 292);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (245, 'Chicky Shiel', to_date('05-12-2001', 'dd-mm-yyyy'), '466-849-1408', 41);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (246, 'Victoria Lebell', to_date('13-12-1976', 'dd-mm-yyyy'), '538-854-4611', 271);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (247, 'Janeen Joddins', to_date('29-10-1979', 'dd-mm-yyyy'), '433-419-3136', 349);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (248, 'Nady Readman', to_date('04-09-1964', 'dd-mm-yyyy'), '753-799-5989', 472);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (249, 'Winfred Fowlie', to_date('17-09-1988', 'dd-mm-yyyy'), '926-223-8071', 42);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (250, 'Hyacinthe Ruane', to_date('07-02-1994', 'dd-mm-yyyy'), '397-198-3999', 458);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (251, 'Reinaldos Geydon', to_date('16-04-1992', 'dd-mm-yyyy'), '581-713-8235', 270);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (252, 'Joshia Finci', to_date('21-03-2015', 'dd-mm-yyyy'), '813-906-5393', 314);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (253, 'Martha Chown', to_date('20-03-1963', 'dd-mm-yyyy'), '801-223-7852', 70);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (254, 'Arabele Ceci', to_date('22-03-1955', 'dd-mm-yyyy'), '621-154-2884', 295);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (255, 'Lesya Dorsey', to_date('13-04-1957', 'dd-mm-yyyy'), '619-869-8319', 13);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (256, 'Sherry Leasor', to_date('15-06-1978', 'dd-mm-yyyy'), '764-370-5951', 409);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (257, 'Guillema Cline', to_date('03-04-1998', 'dd-mm-yyyy'), '985-192-7574', 370);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (258, 'Sofie Laurenceau', to_date('19-06-1950', 'dd-mm-yyyy'), '864-160-3705', 313);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (259, 'Stinky Arni', to_date('04-07-1978', 'dd-mm-yyyy'), '143-118-3350', 304);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (260, 'Mitzi Peltz', to_date('18-08-1991', 'dd-mm-yyyy'), '312-885-2043', 167);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (261, 'Rance Maddocks', to_date('13-09-2014', 'dd-mm-yyyy'), '723-524-2119', 318);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (262, 'Lynda Donke', to_date('18-01-1960', 'dd-mm-yyyy'), '949-777-7886', 237);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (263, 'Jillian Comber', to_date('04-02-2015', 'dd-mm-yyyy'), '506-213-2233', 465);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (264, 'Claribel Hartman', to_date('14-04-1984', 'dd-mm-yyyy'), '135-737-7990', 314);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (265, 'Eimile Goggin', to_date('19-03-1956', 'dd-mm-yyyy'), '592-227-7376', 451);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (266, 'Mariquilla Jemison', to_date('07-05-1966', 'dd-mm-yyyy'), '481-767-5434', 120);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (267, 'Anny Isacsson', to_date('08-08-1970', 'dd-mm-yyyy'), '611-133-4278', 204);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (268, 'Clarie Mainland', to_date('01-06-1977', 'dd-mm-yyyy'), '304-946-5014', 97);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (269, 'Rubi McKirton', to_date('19-04-1993', 'dd-mm-yyyy'), '427-604-8987', 215);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (270, 'Meier Lukins', to_date('12-04-1964', 'dd-mm-yyyy'), '294-460-1058', 70);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (271, 'Buddy Peasegood', to_date('26-06-2009', 'dd-mm-yyyy'), '185-554-6315', 318);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (272, 'Ethe Airdrie', to_date('27-11-1970', 'dd-mm-yyyy'), '538-719-5614', 187);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (273, 'Kassey Burnsyde', to_date('27-07-1951', 'dd-mm-yyyy'), '243-737-2504', 484);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (274, 'Carlynn Pearde', to_date('10-10-1992', 'dd-mm-yyyy'), '131-940-3884', 168);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (275, 'Rachael Klejin', to_date('06-10-1985', 'dd-mm-yyyy'), '970-243-3643', 89);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (276, 'Hale David', to_date('26-11-1960', 'dd-mm-yyyy'), '304-798-0158', 318);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (277, 'Pattie Largent', to_date('15-06-2016', 'dd-mm-yyyy'), '214-437-7580', 18);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (278, 'Mar Cheeney', to_date('17-04-1962', 'dd-mm-yyyy'), '337-339-5709', 366);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (279, 'Vinny Jakubovski', to_date('16-01-1999', 'dd-mm-yyyy'), '722-837-1622', 375);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (280, 'Alistair Stranger', to_date('04-12-2008', 'dd-mm-yyyy'), '623-104-0774', 236);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (281, 'Lorrie McRonald', to_date('20-02-2007', 'dd-mm-yyyy'), '184-752-9695', 97);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (282, 'Jamima Vivyan', to_date('14-09-1958', 'dd-mm-yyyy'), '670-497-9891', 479);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (283, 'Keely Kiossel', to_date('07-02-1984', 'dd-mm-yyyy'), '898-602-1186', 208);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (284, 'Koressa Niblo', to_date('06-05-1980', 'dd-mm-yyyy'), '668-284-4300', 336);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (285, 'Tallia Cogle', to_date('08-09-2016', 'dd-mm-yyyy'), '456-309-2432', 223);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (286, 'Tymothy Dirkin', to_date('13-05-1977', 'dd-mm-yyyy'), '329-584-0563', 104);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (287, 'Erick Hovard', to_date('23-10-1963', 'dd-mm-yyyy'), '416-916-4227', 22);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (288, 'Wenda Haberjam', to_date('02-12-1957', 'dd-mm-yyyy'), '842-472-5659', 171);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (289, 'Blondelle Whittam', to_date('16-10-1996', 'dd-mm-yyyy'), '316-222-7286', 346);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (290, 'Debi Dyshart', to_date('01-09-1970', 'dd-mm-yyyy'), '651-436-9912', 248);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (291, 'Gabriela Herrieven', to_date('07-09-2004', 'dd-mm-yyyy'), '613-447-5873', 124);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (292, 'Clyve Simonin', to_date('15-08-1958', 'dd-mm-yyyy'), '672-604-3469', 377);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (293, 'Kaela Culleford', to_date('01-02-1979', 'dd-mm-yyyy'), '552-657-6833', 471);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (294, 'Eduard Alywen', to_date('13-02-1980', 'dd-mm-yyyy'), '609-299-9842', 276);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (295, 'Trueman Maun', to_date('12-04-1965', 'dd-mm-yyyy'), '918-648-7882', 364);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (296, 'Herc Crepin', to_date('30-01-1986', 'dd-mm-yyyy'), '209-732-8537', 88);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (297, 'Ailina McInnes', to_date('19-10-1975', 'dd-mm-yyyy'), '502-449-2306', 319);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (298, 'Dame Morffew', to_date('26-07-1972', 'dd-mm-yyyy'), '384-386-4995', 76);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (299, 'Rooney Guarnier', to_date('03-02-2005', 'dd-mm-yyyy'), '794-174-8242', 217);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (300, 'Lamont Vido', to_date('10-10-1980', 'dd-mm-yyyy'), '182-550-3585', 451);
commit;
prompt 300 records committed...
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (301, 'Catriona Sturzaker', to_date('09-03-1995', 'dd-mm-yyyy'), '549-576-9879', 97);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (302, 'Dickie Linger', to_date('03-06-1968', 'dd-mm-yyyy'), '527-271-3615', 423);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (303, 'Jorey Byass', to_date('15-10-1967', 'dd-mm-yyyy'), '860-534-2837', 161);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (304, 'Alfy Balcombe', to_date('21-03-1990', 'dd-mm-yyyy'), '102-287-3649', 211);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (305, 'Park Venneur', to_date('13-09-1970', 'dd-mm-yyyy'), '394-953-1230', 22);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (306, 'Freida Middlemiss', to_date('19-01-2006', 'dd-mm-yyyy'), '907-243-4049', 499);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (307, 'Germaine Scrowston', to_date('01-04-2002', 'dd-mm-yyyy'), '540-221-7321', 270);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (308, 'Derril Blackledge', to_date('11-03-1997', 'dd-mm-yyyy'), '418-392-6158', 192);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (309, 'Jonah Frentz', to_date('12-10-2018', 'dd-mm-yyyy'), '424-590-2653', 276);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (310, 'Tabby Myhill', to_date('02-03-2008', 'dd-mm-yyyy'), '365-844-7051', 492);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (311, 'Cindra Lattka', to_date('09-02-1981', 'dd-mm-yyyy'), '486-825-2768', 323);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (312, 'Ozzie Scholcroft', to_date('21-12-1967', 'dd-mm-yyyy'), '456-132-3077', 268);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (313, 'Wally Briston', to_date('02-03-1956', 'dd-mm-yyyy'), '350-723-0446', 443);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (314, 'Marielle Tuft', to_date('28-03-2014', 'dd-mm-yyyy'), '246-512-3727', 214);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (315, 'Ophelie Hegden', to_date('31-05-2008', 'dd-mm-yyyy'), '337-812-2081', 120);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (316, 'Bertrand Ledner', to_date('24-02-1973', 'dd-mm-yyyy'), '311-365-5179', 327);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (317, 'Tess Grose', to_date('26-02-1999', 'dd-mm-yyyy'), '204-361-4609', 103);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (318, 'Jessee Dunphie', to_date('17-01-2018', 'dd-mm-yyyy'), '600-898-5732', 263);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (319, 'Glori Stebbing', to_date('10-09-2017', 'dd-mm-yyyy'), '642-422-5745', 288);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (320, 'Gertie Kowalski', to_date('21-02-1972', 'dd-mm-yyyy'), '614-636-6225', 321);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (321, 'Leif Joskovitch', to_date('18-09-2015', 'dd-mm-yyyy'), '216-236-9137', 494);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (322, 'Waldon Bothwell', to_date('23-11-1958', 'dd-mm-yyyy'), '866-466-8155', 410);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (323, 'Gianina Whistance', to_date('30-03-2010', 'dd-mm-yyyy'), '493-389-9723', 445);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (324, 'Rosette Widmore', to_date('05-05-1996', 'dd-mm-yyyy'), '366-213-5837', 433);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (325, 'Garvy Savoury', to_date('05-11-1963', 'dd-mm-yyyy'), '489-102-7162', 485);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (326, 'Humberto Marfell', to_date('15-01-2022', 'dd-mm-yyyy'), '423-890-3940', 283);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (327, 'Gayle Sharplin', to_date('20-03-1992', 'dd-mm-yyyy'), '998-627-4797', 59);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (328, 'Brod Willcocks', to_date('04-01-1985', 'dd-mm-yyyy'), '864-126-8021', 162);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (329, 'Nerte Ast', to_date('23-11-1954', 'dd-mm-yyyy'), '493-930-3420', 145);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (330, 'Rollins Gerran', to_date('22-07-1977', 'dd-mm-yyyy'), '102-194-3220', 297);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (331, 'Irvin Camilleri', to_date('26-10-1987', 'dd-mm-yyyy'), '654-501-9474', 237);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (332, 'Lorri Melley', to_date('29-04-1963', 'dd-mm-yyyy'), '327-933-7272', 301);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (333, 'Arabel MacNess', to_date('21-01-1956', 'dd-mm-yyyy'), '796-496-3909', 237);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (334, 'Wilmette Cleveland', to_date('17-01-1979', 'dd-mm-yyyy'), '713-416-1034', 68);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (335, 'Hedvige Carlisso', to_date('10-12-2020', 'dd-mm-yyyy'), '245-581-8055', 93);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (336, 'Claudia McDowall', to_date('13-12-2000', 'dd-mm-yyyy'), '731-824-3083', 468);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (337, 'Verine Bramelt', to_date('12-04-1976', 'dd-mm-yyyy'), '222-352-6809', 411);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (338, 'Giavani Nystrom', to_date('23-11-1962', 'dd-mm-yyyy'), '221-919-2637', 162);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (339, 'Shellysheldon Levesque', to_date('27-06-1984', 'dd-mm-yyyy'), '521-572-3184', 401);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (340, 'Barrie Hadden', to_date('04-05-1970', 'dd-mm-yyyy'), '510-994-2441', 21);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (341, 'Urbano Thelwll', to_date('15-04-2022', 'dd-mm-yyyy'), '471-731-9546', 278);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (342, 'Filippo Landsbury', to_date('19-10-1983', 'dd-mm-yyyy'), '268-127-7621', 176);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (343, 'Wayne Trigg', to_date('04-05-1996', 'dd-mm-yyyy'), '726-816-2835', 119);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (344, 'Broddie Grimsdale', to_date('16-09-1988', 'dd-mm-yyyy'), '762-247-8799', 118);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (345, 'Loren O''Halligan', to_date('20-10-1956', 'dd-mm-yyyy'), '128-303-0449', 423);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (346, 'Hayden Detheridge', to_date('12-11-1960', 'dd-mm-yyyy'), '307-775-6122', 108);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (347, 'Lissy Hynes', to_date('29-03-1957', 'dd-mm-yyyy'), '485-589-6577', 179);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (348, 'Fannie Haskell', to_date('18-09-1987', 'dd-mm-yyyy'), '463-789-5400', 229);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (349, 'Patricia Rosie', to_date('07-07-1998', 'dd-mm-yyyy'), '138-361-8635', 179);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (350, 'Byrom Conahy', to_date('27-06-2023', 'dd-mm-yyyy'), '798-898-2405', 433);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (351, 'Gwendolyn Portch', to_date('24-06-2006', 'dd-mm-yyyy'), '414-534-9108', 8);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (352, 'Damon Belleny', to_date('18-07-2004', 'dd-mm-yyyy'), '704-223-6789', 383);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (353, 'Doretta Feragh', to_date('02-05-1955', 'dd-mm-yyyy'), '658-801-2358', 479);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (354, 'Bernelle Moorwood', to_date('16-01-1964', 'dd-mm-yyyy'), '310-186-6885', 332);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (355, 'Linzy Rickaby', to_date('18-09-1965', 'dd-mm-yyyy'), '778-573-0118', 166);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (356, 'Germain Hasson', to_date('28-02-1954', 'dd-mm-yyyy'), '642-896-1865', 301);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (357, 'Gaspard Ezzell', to_date('20-06-1993', 'dd-mm-yyyy'), '663-734-2888', 373);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (358, 'Teirtza Downing', to_date('16-11-1989', 'dd-mm-yyyy'), '820-705-3058', 425);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (359, 'Kinsley Antony', to_date('03-07-2007', 'dd-mm-yyyy'), '433-788-2236', 173);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (360, 'Adolpho Burdge', to_date('20-06-2023', 'dd-mm-yyyy'), '544-146-9611', 16);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (361, 'Ugo Newall', to_date('24-07-1973', 'dd-mm-yyyy'), '288-773-5420', 163);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (362, 'Rosetta Sends', to_date('06-10-1990', 'dd-mm-yyyy'), '903-275-3234', 313);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (363, 'Eloisa Heak', to_date('07-11-1990', 'dd-mm-yyyy'), '850-127-7395', 235);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (364, 'Luciana Ludgate', to_date('30-10-1977', 'dd-mm-yyyy'), '389-199-6562', 493);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (365, 'Mayor Lesmonde', to_date('21-03-1994', 'dd-mm-yyyy'), '612-489-6052', 247);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (366, 'King Ladlow', to_date('22-03-2013', 'dd-mm-yyyy'), '968-944-0033', 451);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (367, 'Sabrina Shaudfurth', to_date('02-04-2020', 'dd-mm-yyyy'), '705-577-8220', 233);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (368, 'Renelle Blacktin', to_date('22-12-2013', 'dd-mm-yyyy'), '678-306-0104', 374);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (369, 'Allen Reith', to_date('03-01-2010', 'dd-mm-yyyy'), '920-347-9304', 124);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (370, 'Tabatha Ludgate', to_date('21-06-1953', 'dd-mm-yyyy'), '634-963-5312', 298);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (371, 'Rozalie Ogger', to_date('12-09-1963', 'dd-mm-yyyy'), '974-791-9163', 63);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (372, 'Caitrin Wolverson', to_date('26-10-2021', 'dd-mm-yyyy'), '191-759-5566', 360);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (373, 'Hardy Rowlson', to_date('11-03-2008', 'dd-mm-yyyy'), '636-807-6523', 85);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (374, 'Agnese Janaszkiewicz', to_date('31-12-1959', 'dd-mm-yyyy'), '738-293-4505', 249);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (375, 'Lauralee Himpson', to_date('25-08-1966', 'dd-mm-yyyy'), '589-273-3566', 330);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (376, 'Stephen Norris', to_date('02-10-1951', 'dd-mm-yyyy'), '926-813-3098', 341);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (377, 'Yvon Prendergrast', to_date('13-06-1993', 'dd-mm-yyyy'), '616-393-3608', 262);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (378, 'Clyve Cruickshank', to_date('09-12-1974', 'dd-mm-yyyy'), '290-210-7463', 246);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (379, 'Juli Ronaghan', to_date('07-10-1968', 'dd-mm-yyyy'), '492-383-9102', 266);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (380, 'Lucienne Gerrietz', to_date('19-05-1978', 'dd-mm-yyyy'), '840-659-1065', 102);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (381, 'Elston Pauer', to_date('31-10-2005', 'dd-mm-yyyy'), '749-679-0654', 242);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (382, 'Erena Sheivels', to_date('03-01-1985', 'dd-mm-yyyy'), '369-852-0609', 28);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (383, 'Say Mordon', to_date('07-07-1981', 'dd-mm-yyyy'), '572-397-6601', 156);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (384, 'Rebekah Leinweber', to_date('15-05-1987', 'dd-mm-yyyy'), '352-962-9419', 40);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (385, 'Urbanus Harg', to_date('29-09-1960', 'dd-mm-yyyy'), '777-926-3378', 120);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (386, 'Hunter Harsum', to_date('22-05-1956', 'dd-mm-yyyy'), '762-720-4773', 104);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (387, 'Devora Stuchbery', to_date('23-01-1994', 'dd-mm-yyyy'), '336-389-5478', 276);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (388, 'Deina Laurencot', to_date('07-01-1981', 'dd-mm-yyyy'), '718-483-8962', 10);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (389, 'Austina St. Paul', to_date('13-02-1966', 'dd-mm-yyyy'), '152-148-6638', 370);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (390, 'Alexa Pacher', to_date('22-01-2020', 'dd-mm-yyyy'), '909-652-0217', 62);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (391, 'Garnet Burnip', to_date('26-06-1996', 'dd-mm-yyyy'), '161-328-2596', 349);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (392, 'Kimmie Reilingen', to_date('16-10-1971', 'dd-mm-yyyy'), '507-937-5114', 421);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (393, 'Juan Brendeke', to_date('23-07-2006', 'dd-mm-yyyy'), '311-204-2079', 395);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (394, 'Wolfie Chmarny', to_date('23-06-2002', 'dd-mm-yyyy'), '568-565-9032', 315);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (395, 'Astra MacCroary', to_date('12-06-1960', 'dd-mm-yyyy'), '621-181-3522', 89);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (396, 'Rocky Redpath', to_date('11-06-2005', 'dd-mm-yyyy'), '227-713-1813', 353);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (397, 'Kimberlyn Hourican', to_date('15-03-1977', 'dd-mm-yyyy'), '511-404-3093', 451);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (398, 'Padget Bulleyn', to_date('15-09-1953', 'dd-mm-yyyy'), '435-576-8127', 467);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (399, 'Camilla Manston', to_date('23-12-1983', 'dd-mm-yyyy'), '645-603-8353', 406);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (400, 'Violet Demanche', to_date('02-08-1994', 'dd-mm-yyyy'), '777-664-1917', 87);
commit;
prompt 400 records committed...
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (401, 'Napoleon Humberston', to_date('11-05-2008', 'dd-mm-yyyy'), '315-185-2719', 87);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (402, 'Rica Noirel', to_date('16-06-1977', 'dd-mm-yyyy'), '704-591-6242', 159);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (403, 'Olympe Zapatero', to_date('06-07-2004', 'dd-mm-yyyy'), '993-598-4177', 192);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (404, 'Joshua Louedey', to_date('25-02-1972', 'dd-mm-yyyy'), '566-276-6826', 371);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (405, 'Chrissy Gratrex', to_date('29-09-1970', 'dd-mm-yyyy'), '516-692-3850', 481);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (406, 'Carl Janus', to_date('16-07-1983', 'dd-mm-yyyy'), '336-675-9822', 191);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (407, 'Sybille Reinbach', to_date('25-09-1973', 'dd-mm-yyyy'), '507-963-7534', 35);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (408, 'Nissie Kegley', to_date('31-10-1971', 'dd-mm-yyyy'), '363-266-3448', 297);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (409, 'Jessie Lowbridge', to_date('11-03-1991', 'dd-mm-yyyy'), '866-777-8263', 94);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (410, 'Phaedra Maggs', to_date('25-12-1995', 'dd-mm-yyyy'), '485-365-4574', 421);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (411, 'Eleanor Geater', to_date('25-10-1999', 'dd-mm-yyyy'), '200-873-7612', 214);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (412, 'Gabriel Matteoli', to_date('22-09-1971', 'dd-mm-yyyy'), '922-839-6987', 242);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (413, 'Filmore Shewery', to_date('20-11-2010', 'dd-mm-yyyy'), '862-184-0946', 254);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (414, 'Kaile Roughley', to_date('19-09-1957', 'dd-mm-yyyy'), '635-730-4867', 245);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (415, 'Shana Lanning', to_date('19-04-1977', 'dd-mm-yyyy'), '939-918-2415', 423);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (416, 'Deeann Dugald', to_date('02-11-1999', 'dd-mm-yyyy'), '717-188-9041', 389);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (417, 'Gonzales Guilliatt', to_date('16-01-1995', 'dd-mm-yyyy'), '360-318-5299', 404);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (418, 'Jacquetta Abells', to_date('12-08-1956', 'dd-mm-yyyy'), '366-503-9051', 175);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (419, 'Clarke Roofe', to_date('26-01-1961', 'dd-mm-yyyy'), '202-116-1771', 400);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (420, 'Husein Millea', to_date('13-06-1970', 'dd-mm-yyyy'), '405-275-4014', 117);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (421, 'Elspeth Leyson', to_date('04-03-2008', 'dd-mm-yyyy'), '711-324-4277', 490);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (422, 'Bridget Rannie', to_date('16-06-2019', 'dd-mm-yyyy'), '133-504-6591', 296);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (423, 'Ulrich Earengey', to_date('14-11-1985', 'dd-mm-yyyy'), '863-372-0201', 462);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (424, 'Adena Orta', to_date('12-03-2005', 'dd-mm-yyyy'), '111-236-8427', 110);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (425, 'Cherise Watkinson', to_date('09-07-1992', 'dd-mm-yyyy'), '213-557-4648', 411);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (426, 'Garald Smeaton', to_date('16-09-1971', 'dd-mm-yyyy'), '619-226-6769', 366);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (427, 'Franciska Meese', to_date('22-03-1957', 'dd-mm-yyyy'), '917-193-8144', 376);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (428, 'Helen-elizabeth Draisey', to_date('08-03-2015', 'dd-mm-yyyy'), '855-536-2952', 45);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (429, 'Maddy Maddox', to_date('01-01-2003', 'dd-mm-yyyy'), '153-540-3809', 387);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (430, 'Aubrey Norker', to_date('08-06-1962', 'dd-mm-yyyy'), '539-966-7098', 229);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (431, 'Felipe Knoble', to_date('23-06-1981', 'dd-mm-yyyy'), '770-218-9917', 290);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (432, 'Owen Paulusch', to_date('20-01-2017', 'dd-mm-yyyy'), '875-583-4054', 481);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (433, 'Mozelle Meeus', to_date('27-09-1996', 'dd-mm-yyyy'), '593-616-3186', 459);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (434, 'Alysa Piatkowski', to_date('27-09-1966', 'dd-mm-yyyy'), '782-775-1861', 478);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (435, 'Alida Tigner', to_date('22-11-2010', 'dd-mm-yyyy'), '623-784-9754', 82);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (436, 'Lisabeth Argont', to_date('19-09-1984', 'dd-mm-yyyy'), '220-591-3763', 102);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (437, 'Karita Hirschmann', to_date('02-05-2000', 'dd-mm-yyyy'), '808-798-5895', 236);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (438, 'Mallory Dotterill', to_date('08-02-1961', 'dd-mm-yyyy'), '964-249-5682', 59);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (439, 'Tiffani Mintoft', to_date('06-05-1959', 'dd-mm-yyyy'), '134-830-1892', 404);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (440, 'Korry Antuoni', to_date('08-09-2013', 'dd-mm-yyyy'), '379-591-5497', 239);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (441, 'Heloise Akrigg', to_date('30-05-2020', 'dd-mm-yyyy'), '764-358-2951', 125);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (442, 'Morissa Couth', to_date('27-01-1997', 'dd-mm-yyyy'), '438-904-5089', 32);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (443, 'Mano Robers', to_date('22-08-1994', 'dd-mm-yyyy'), '223-925-7907', 385);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (444, 'Sherri Duesbury', to_date('14-04-1963', 'dd-mm-yyyy'), '426-763-9252', 77);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (445, 'Merrielle Burner', to_date('14-10-1985', 'dd-mm-yyyy'), '525-511-9345', 383);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (446, 'Fremont Reside', to_date('21-08-2021', 'dd-mm-yyyy'), '822-994-0758', 474);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (447, 'Aleece Reisin', to_date('04-02-1972', 'dd-mm-yyyy'), '633-512-9661', 476);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (448, 'Olly Florey', to_date('08-01-2023', 'dd-mm-yyyy'), '773-273-7915', 337);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (449, 'Marilin Sapsford', to_date('24-04-2023', 'dd-mm-yyyy'), '983-166-6113', 474);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (450, 'Carmelina Lerer', to_date('30-08-2007', 'dd-mm-yyyy'), '719-194-2101', 23);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (451, 'Astra Buncom', to_date('22-04-1974', 'dd-mm-yyyy'), '331-125-4562', 347);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (452, 'Garreth Fratczak', to_date('08-11-1970', 'dd-mm-yyyy'), '487-480-1083', 143);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (453, 'Mandi Kingswood', to_date('14-08-1959', 'dd-mm-yyyy'), '549-505-8179', 465);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (454, 'Nissa Lipman', to_date('15-07-1988', 'dd-mm-yyyy'), '643-754-7663', 6);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (455, 'Gerry Absalom', to_date('12-03-1986', 'dd-mm-yyyy'), '644-719-0760', 440);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (456, 'Chelsie Matuska', to_date('19-01-1981', 'dd-mm-yyyy'), '665-106-1813', 459);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (457, 'Blakeley Verrell', to_date('11-01-2008', 'dd-mm-yyyy'), '325-333-5066', 495);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (458, 'Margit Tigner', to_date('19-12-2008', 'dd-mm-yyyy'), '285-747-7971', 216);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (459, 'Fara Rowbrey', to_date('10-09-2000', 'dd-mm-yyyy'), '115-670-9206', 434);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (460, 'Stacee Wrack', to_date('12-09-1968', 'dd-mm-yyyy'), '435-962-7830', 253);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (461, 'Sylas Knevet', to_date('02-11-2007', 'dd-mm-yyyy'), '376-744-3088', 157);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (462, 'Emmery Gabe', to_date('28-10-1998', 'dd-mm-yyyy'), '976-408-5136', 50);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (463, 'Bili Skellern', to_date('27-12-2000', 'dd-mm-yyyy'), '194-832-6998', 262);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (464, 'Torie Rossi', to_date('21-06-1963', 'dd-mm-yyyy'), '978-732-8533', 404);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (465, 'Warren Jimmes', to_date('13-01-1970', 'dd-mm-yyyy'), '705-453-5647', 108);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (466, 'Jabez Wallsworth', to_date('24-03-1986', 'dd-mm-yyyy'), '581-913-2233', 385);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (467, 'Eloise Tierney', to_date('22-05-2014', 'dd-mm-yyyy'), '167-360-3606', 206);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (468, 'Ogden Clyant', to_date('03-05-1958', 'dd-mm-yyyy'), '481-591-4296', 205);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (469, 'Vina Higginbottam', to_date('24-06-2010', 'dd-mm-yyyy'), '610-956-2628', 361);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (470, 'Nedi Beart', to_date('11-06-1955', 'dd-mm-yyyy'), '826-380-4258', 441);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (471, 'Fransisco Grigorey', to_date('06-07-2017', 'dd-mm-yyyy'), '142-738-8527', 151);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (472, 'Mady Yendle', to_date('28-09-2021', 'dd-mm-yyyy'), '396-226-5168', 239);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (473, 'Dunn Jorden', to_date('06-12-1970', 'dd-mm-yyyy'), '616-231-2013', 271);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (474, 'Torrey Laugharne', to_date('20-01-1977', 'dd-mm-yyyy'), '691-136-1250', 397);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (475, 'Genvieve Burton', to_date('11-09-1974', 'dd-mm-yyyy'), '379-196-3028', 406);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (476, 'Stan Moyles', to_date('11-02-2009', 'dd-mm-yyyy'), '203-347-2316', 446);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (477, 'Whitman Dows', to_date('27-05-2001', 'dd-mm-yyyy'), '604-977-9312', 209);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (478, 'Baxie Tebbe', to_date('23-01-1993', 'dd-mm-yyyy'), '832-664-9729', 310);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (479, 'Meyer Curado', to_date('21-07-2007', 'dd-mm-yyyy'), '467-606-6252', 176);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (480, 'Damaris Broxap', to_date('15-11-1952', 'dd-mm-yyyy'), '552-772-1595', 53);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (481, 'Stevy Ablett', to_date('30-04-1979', 'dd-mm-yyyy'), '213-270-4363', 238);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (482, 'Everard Seadon', to_date('24-01-1975', 'dd-mm-yyyy'), '984-712-0632', 399);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (483, 'Mickie Bohden', to_date('04-04-1968', 'dd-mm-yyyy'), '673-902-6020', 240);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (484, 'Garvin Truin', to_date('16-03-2006', 'dd-mm-yyyy'), '636-189-0706', 405);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (485, 'Riane Allcorn', to_date('29-09-1983', 'dd-mm-yyyy'), '302-659-3080', 456);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (486, 'Myrilla Langtry', to_date('09-08-1967', 'dd-mm-yyyy'), '401-581-1307', 271);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (487, 'Margie Mc Mechan', to_date('25-07-2011', 'dd-mm-yyyy'), '887-899-6552', 482);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (488, 'Crysta D''Alwis', to_date('08-03-1957', 'dd-mm-yyyy'), '655-951-9261', 103);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (489, 'Kirbie Marklew', to_date('04-09-1987', 'dd-mm-yyyy'), '209-578-2068', 128);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (490, 'Benedetto Mora', to_date('23-01-1994', 'dd-mm-yyyy'), '568-760-1068', 105);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (491, 'Tessie Benaine', to_date('27-08-1957', 'dd-mm-yyyy'), '118-518-4444', 255);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (492, 'Hermione Pollington', to_date('05-03-1989', 'dd-mm-yyyy'), '125-477-6523', 192);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (493, 'Ruthi Raynham', to_date('29-05-2017', 'dd-mm-yyyy'), '706-826-0815', 58);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (494, 'Clary Guirard', to_date('12-11-1966', 'dd-mm-yyyy'), '127-186-6608', 38);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (495, 'Tracie Haulkham', to_date('29-05-1971', 'dd-mm-yyyy'), '332-709-4796', 449);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (496, 'Tom Sweating', to_date('27-04-1965', 'dd-mm-yyyy'), '153-483-7354', 54);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (497, 'Geri Catherine', to_date('16-03-1989', 'dd-mm-yyyy'), '757-712-5330', 460);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (498, 'Russell Studdal', to_date('22-05-1997', 'dd-mm-yyyy'), '817-527-3117', 253);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (499, 'Ellynn Quigg', to_date('10-04-1992', 'dd-mm-yyyy'), '678-988-5213', 73);
insert into PATIENT (patientid, name, dateofbirth, phone, departmentid)
values (500, 'Mattie O''Dulchonta', to_date('12-10-1996', 'dd-mm-yyyy'), '685-661-6737', 407);
commit;
prompt 500 records loaded
prompt Loading ROOM...
insert into ROOM (roomid, type, departmentid)
values (1, 'General Ward', 488);
insert into ROOM (roomid, type, departmentid)
values (2, 'Labor and Delivery', 2);
insert into ROOM (roomid, type, departmentid)
values (3, 'Emergency', 241);
insert into ROOM (roomid, type, departmentid)
values (4, 'Maternity', 487);
insert into ROOM (roomid, type, departmentid)
values (5, 'Isolation', 9);
insert into ROOM (roomid, type, departmentid)
values (6, 'Semi-Private', 296);
insert into ROOM (roomid, type, departmentid)
values (7, 'Isolation', 294);
insert into ROOM (roomid, type, departmentid)
values (8, 'Emergency', 198);
insert into ROOM (roomid, type, departmentid)
values (9, 'Private', 480);
insert into ROOM (roomid, type, departmentid)
values (10, 'ICU', 218);
insert into ROOM (roomid, type, departmentid)
values (11, 'Rehabilitation', 429);
insert into ROOM (roomid, type, departmentid)
values (12, 'Emergency', 69);
insert into ROOM (roomid, type, departmentid)
values (13, 'Psychiatric', 176);
insert into ROOM (roomid, type, departmentid)
values (14, 'Emergency', 289);
insert into ROOM (roomid, type, departmentid)
values (15, 'Labor and Delivery', 348);
insert into ROOM (roomid, type, departmentid)
values (16, 'Psychiatric', 303);
insert into ROOM (roomid, type, departmentid)
values (17, 'Private', 101);
insert into ROOM (roomid, type, departmentid)
values (18, 'Rehabilitation', 236);
insert into ROOM (roomid, type, departmentid)
values (19, 'ICU', 465);
insert into ROOM (roomid, type, departmentid)
values (20, 'NICU', 451);
insert into ROOM (roomid, type, departmentid)
values (21, 'Surgery', 119);
insert into ROOM (roomid, type, departmentid)
values (22, 'ICU', 384);
insert into ROOM (roomid, type, departmentid)
values (23, 'PICU', 245);
insert into ROOM (roomid, type, departmentid)
values (24, 'Recovery', 392);
insert into ROOM (roomid, type, departmentid)
values (25, 'PICU', 245);
insert into ROOM (roomid, type, departmentid)
values (26, 'Isolation', 458);
insert into ROOM (roomid, type, departmentid)
values (27, 'Isolation', 197);
insert into ROOM (roomid, type, departmentid)
values (28, 'Semi-Private', 203);
insert into ROOM (roomid, type, departmentid)
values (29, 'Surgery', 100);
insert into ROOM (roomid, type, departmentid)
values (30, 'Rehabilitation', 291);
insert into ROOM (roomid, type, departmentid)
values (31, 'CCU', 30);
insert into ROOM (roomid, type, departmentid)
values (32, 'Isolation', 450);
insert into ROOM (roomid, type, departmentid)
values (33, 'Emergency', 8);
insert into ROOM (roomid, type, departmentid)
values (34, 'Recovery', 430);
insert into ROOM (roomid, type, departmentid)
values (35, 'Private', 453);
insert into ROOM (roomid, type, departmentid)
values (36, 'Maternity', 372);
insert into ROOM (roomid, type, departmentid)
values (37, 'Labor and Delivery', 261);
insert into ROOM (roomid, type, departmentid)
values (38, 'Surgery', 161);
insert into ROOM (roomid, type, departmentid)
values (39, 'NICU', 148);
insert into ROOM (roomid, type, departmentid)
values (40, 'Surgery', 484);
insert into ROOM (roomid, type, departmentid)
values (41, 'Isolation', 36);
insert into ROOM (roomid, type, departmentid)
values (42, 'Labor and Delivery', 428);
insert into ROOM (roomid, type, departmentid)
values (43, 'Rehabilitation', 382);
insert into ROOM (roomid, type, departmentid)
values (44, 'Semi-Private', 73);
insert into ROOM (roomid, type, departmentid)
values (45, 'Emergency', 466);
insert into ROOM (roomid, type, departmentid)
values (46, 'ICU', 170);
insert into ROOM (roomid, type, departmentid)
values (47, 'General Ward', 290);
insert into ROOM (roomid, type, departmentid)
values (48, 'Surgery', 115);
insert into ROOM (roomid, type, departmentid)
values (49, 'Recovery', 370);
insert into ROOM (roomid, type, departmentid)
values (50, 'Labor and Delivery', 55);
insert into ROOM (roomid, type, departmentid)
values (51, 'NICU', 302);
insert into ROOM (roomid, type, departmentid)
values (52, 'NICU', 84);
insert into ROOM (roomid, type, departmentid)
values (53, 'CCU', 141);
insert into ROOM (roomid, type, departmentid)
values (54, 'Recovery', 122);
insert into ROOM (roomid, type, departmentid)
values (55, 'Rehabilitation', 235);
insert into ROOM (roomid, type, departmentid)
values (56, 'ICU', 176);
insert into ROOM (roomid, type, departmentid)
values (57, 'PICU', 286);
insert into ROOM (roomid, type, departmentid)
values (58, 'ICU', 335);
insert into ROOM (roomid, type, departmentid)
values (59, 'Emergency', 39);
insert into ROOM (roomid, type, departmentid)
values (60, 'Surgery', 439);
insert into ROOM (roomid, type, departmentid)
values (61, 'ICU', 124);
insert into ROOM (roomid, type, departmentid)
values (62, 'Surgery', 35);
insert into ROOM (roomid, type, departmentid)
values (63, 'Surgery', 194);
insert into ROOM (roomid, type, departmentid)
values (64, 'NICU', 302);
insert into ROOM (roomid, type, departmentid)
values (65, 'NICU', 141);
insert into ROOM (roomid, type, departmentid)
values (66, 'Surgery', 305);
insert into ROOM (roomid, type, departmentid)
values (67, 'PICU', 274);
insert into ROOM (roomid, type, departmentid)
values (68, 'Labor and Delivery', 22);
insert into ROOM (roomid, type, departmentid)
values (69, 'Emergency', 3);
insert into ROOM (roomid, type, departmentid)
values (70, 'CCU', 239);
insert into ROOM (roomid, type, departmentid)
values (71, 'General Ward', 155);
insert into ROOM (roomid, type, departmentid)
values (72, 'Maternity', 24);
insert into ROOM (roomid, type, departmentid)
values (73, 'Maternity', 217);
insert into ROOM (roomid, type, departmentid)
values (74, 'Maternity', 112);
insert into ROOM (roomid, type, departmentid)
values (75, 'Rehabilitation', 387);
insert into ROOM (roomid, type, departmentid)
values (76, 'General Ward', 160);
insert into ROOM (roomid, type, departmentid)
values (77, 'Semi-Private', 462);
insert into ROOM (roomid, type, departmentid)
values (78, 'Private', 468);
insert into ROOM (roomid, type, departmentid)
values (79, 'Private', 222);
insert into ROOM (roomid, type, departmentid)
values (80, 'PICU', 365);
insert into ROOM (roomid, type, departmentid)
values (81, 'Labor and Delivery', 63);
insert into ROOM (roomid, type, departmentid)
values (82, 'Maternity', 103);
insert into ROOM (roomid, type, departmentid)
values (83, 'Isolation', 297);
insert into ROOM (roomid, type, departmentid)
values (84, 'Recovery', 221);
insert into ROOM (roomid, type, departmentid)
values (85, 'Isolation', 128);
insert into ROOM (roomid, type, departmentid)
values (86, 'Recovery', 458);
insert into ROOM (roomid, type, departmentid)
values (87, 'Recovery', 468);
insert into ROOM (roomid, type, departmentid)
values (88, 'NICU', 432);
insert into ROOM (roomid, type, departmentid)
values (89, 'CCU', 341);
insert into ROOM (roomid, type, departmentid)
values (90, 'Semi-Private', 420);
insert into ROOM (roomid, type, departmentid)
values (91, 'Maternity', 310);
insert into ROOM (roomid, type, departmentid)
values (92, 'Isolation', 200);
insert into ROOM (roomid, type, departmentid)
values (93, 'Surgery', 409);
insert into ROOM (roomid, type, departmentid)
values (94, 'PICU', 32);
insert into ROOM (roomid, type, departmentid)
values (95, 'Surgery', 267);
insert into ROOM (roomid, type, departmentid)
values (96, 'Rehabilitation', 10);
insert into ROOM (roomid, type, departmentid)
values (97, 'PICU', 168);
insert into ROOM (roomid, type, departmentid)
values (98, 'PICU', 97);
insert into ROOM (roomid, type, departmentid)
values (99, 'PICU', 460);
insert into ROOM (roomid, type, departmentid)
values (100, 'General Ward', 320);
commit;
prompt 100 records committed...
insert into ROOM (roomid, type, departmentid)
values (101, 'ICU', 341);
insert into ROOM (roomid, type, departmentid)
values (102, 'CCU', 203);
insert into ROOM (roomid, type, departmentid)
values (103, 'NICU', 149);
insert into ROOM (roomid, type, departmentid)
values (104, 'Psychiatric', 157);
insert into ROOM (roomid, type, departmentid)
values (105, 'Emergency', 459);
insert into ROOM (roomid, type, departmentid)
values (106, 'Maternity', 147);
insert into ROOM (roomid, type, departmentid)
values (107, 'Emergency', 355);
insert into ROOM (roomid, type, departmentid)
values (108, 'Surgery', 121);
insert into ROOM (roomid, type, departmentid)
values (109, 'NICU', 430);
insert into ROOM (roomid, type, departmentid)
values (110, 'Emergency', 263);
insert into ROOM (roomid, type, departmentid)
values (111, 'Emergency', 136);
insert into ROOM (roomid, type, departmentid)
values (112, 'NICU', 295);
insert into ROOM (roomid, type, departmentid)
values (113, 'Semi-Private', 274);
insert into ROOM (roomid, type, departmentid)
values (114, 'Rehabilitation', 162);
insert into ROOM (roomid, type, departmentid)
values (115, 'NICU', 19);
insert into ROOM (roomid, type, departmentid)
values (116, 'Rehabilitation', 58);
insert into ROOM (roomid, type, departmentid)
values (117, 'Rehabilitation', 500);
insert into ROOM (roomid, type, departmentid)
values (118, 'CCU', 376);
insert into ROOM (roomid, type, departmentid)
values (119, 'Recovery', 88);
insert into ROOM (roomid, type, departmentid)
values (120, 'Maternity', 307);
insert into ROOM (roomid, type, departmentid)
values (121, 'CCU', 159);
insert into ROOM (roomid, type, departmentid)
values (122, 'Psychiatric', 405);
insert into ROOM (roomid, type, departmentid)
values (123, 'General Ward', 234);
insert into ROOM (roomid, type, departmentid)
values (124, 'Psychiatric', 89);
insert into ROOM (roomid, type, departmentid)
values (125, 'Recovery', 31);
insert into ROOM (roomid, type, departmentid)
values (126, 'NICU', 175);
insert into ROOM (roomid, type, departmentid)
values (127, 'General Ward', 50);
insert into ROOM (roomid, type, departmentid)
values (128, 'NICU', 129);
insert into ROOM (roomid, type, departmentid)
values (129, 'PICU', 491);
insert into ROOM (roomid, type, departmentid)
values (130, 'NICU', 401);
insert into ROOM (roomid, type, departmentid)
values (131, 'General Ward', 391);
insert into ROOM (roomid, type, departmentid)
values (132, 'Labor and Delivery', 276);
insert into ROOM (roomid, type, departmentid)
values (133, 'Maternity', 7);
insert into ROOM (roomid, type, departmentid)
values (134, 'General Ward', 353);
insert into ROOM (roomid, type, departmentid)
values (135, 'Maternity', 89);
insert into ROOM (roomid, type, departmentid)
values (136, 'PICU', 344);
insert into ROOM (roomid, type, departmentid)
values (137, 'General Ward', 320);
insert into ROOM (roomid, type, departmentid)
values (138, 'Maternity', 34);
insert into ROOM (roomid, type, departmentid)
values (139, 'ICU', 324);
insert into ROOM (roomid, type, departmentid)
values (140, 'General Ward', 371);
insert into ROOM (roomid, type, departmentid)
values (141, 'NICU', 257);
insert into ROOM (roomid, type, departmentid)
values (142, 'Private', 259);
insert into ROOM (roomid, type, departmentid)
values (143, 'Rehabilitation', 145);
insert into ROOM (roomid, type, departmentid)
values (144, 'Recovery', 274);
insert into ROOM (roomid, type, departmentid)
values (145, 'ICU', 217);
insert into ROOM (roomid, type, departmentid)
values (146, 'Private', 141);
insert into ROOM (roomid, type, departmentid)
values (147, 'General Ward', 160);
insert into ROOM (roomid, type, departmentid)
values (148, 'General Ward', 416);
insert into ROOM (roomid, type, departmentid)
values (149, 'Rehabilitation', 301);
insert into ROOM (roomid, type, departmentid)
values (150, 'ICU', 488);
insert into ROOM (roomid, type, departmentid)
values (151, 'Rehabilitation', 369);
insert into ROOM (roomid, type, departmentid)
values (152, 'CCU', 78);
insert into ROOM (roomid, type, departmentid)
values (153, 'NICU', 111);
insert into ROOM (roomid, type, departmentid)
values (154, 'NICU', 102);
insert into ROOM (roomid, type, departmentid)
values (155, 'NICU', 162);
insert into ROOM (roomid, type, departmentid)
values (156, 'Recovery', 335);
insert into ROOM (roomid, type, departmentid)
values (157, 'Recovery', 191);
insert into ROOM (roomid, type, departmentid)
values (158, 'ICU', 481);
insert into ROOM (roomid, type, departmentid)
values (159, 'CCU', 470);
insert into ROOM (roomid, type, departmentid)
values (160, 'Private', 342);
insert into ROOM (roomid, type, departmentid)
values (161, 'Semi-Private', 139);
insert into ROOM (roomid, type, departmentid)
values (162, 'Maternity', 437);
insert into ROOM (roomid, type, departmentid)
values (163, 'PICU', 72);
insert into ROOM (roomid, type, departmentid)
values (164, 'NICU', 24);
insert into ROOM (roomid, type, departmentid)
values (165, 'Rehabilitation', 359);
insert into ROOM (roomid, type, departmentid)
values (166, 'General Ward', 111);
insert into ROOM (roomid, type, departmentid)
values (167, 'Maternity', 59);
insert into ROOM (roomid, type, departmentid)
values (168, 'Isolation', 173);
insert into ROOM (roomid, type, departmentid)
values (169, 'NICU', 487);
insert into ROOM (roomid, type, departmentid)
values (170, 'NICU', 400);
insert into ROOM (roomid, type, departmentid)
values (171, 'Isolation', 454);
insert into ROOM (roomid, type, departmentid)
values (172, 'Private', 451);
insert into ROOM (roomid, type, departmentid)
values (173, 'Surgery', 457);
insert into ROOM (roomid, type, departmentid)
values (174, 'NICU', 285);
insert into ROOM (roomid, type, departmentid)
values (175, 'General Ward', 489);
insert into ROOM (roomid, type, departmentid)
values (176, 'Recovery', 296);
insert into ROOM (roomid, type, departmentid)
values (177, 'Private', 234);
insert into ROOM (roomid, type, departmentid)
values (178, 'Surgery', 71);
insert into ROOM (roomid, type, departmentid)
values (179, 'CCU', 38);
insert into ROOM (roomid, type, departmentid)
values (180, 'CCU', 244);
insert into ROOM (roomid, type, departmentid)
values (181, 'CCU', 200);
insert into ROOM (roomid, type, departmentid)
values (182, 'Psychiatric', 30);
insert into ROOM (roomid, type, departmentid)
values (183, 'Isolation', 204);
insert into ROOM (roomid, type, departmentid)
values (184, 'Emergency', 144);
insert into ROOM (roomid, type, departmentid)
values (185, 'PICU', 195);
insert into ROOM (roomid, type, departmentid)
values (186, 'NICU', 450);
insert into ROOM (roomid, type, departmentid)
values (187, 'Psychiatric', 67);
insert into ROOM (roomid, type, departmentid)
values (188, 'Maternity', 290);
insert into ROOM (roomid, type, departmentid)
values (189, 'Semi-Private', 215);
insert into ROOM (roomid, type, departmentid)
values (190, 'PICU', 91);
insert into ROOM (roomid, type, departmentid)
values (191, 'Emergency', 80);
insert into ROOM (roomid, type, departmentid)
values (192, 'Maternity', 453);
insert into ROOM (roomid, type, departmentid)
values (193, 'Recovery', 266);
insert into ROOM (roomid, type, departmentid)
values (194, 'PICU', 51);
insert into ROOM (roomid, type, departmentid)
values (195, 'Private', 134);
insert into ROOM (roomid, type, departmentid)
values (196, 'Rehabilitation', 324);
insert into ROOM (roomid, type, departmentid)
values (197, 'Psychiatric', 379);
insert into ROOM (roomid, type, departmentid)
values (198, 'General Ward', 27);
insert into ROOM (roomid, type, departmentid)
values (199, 'Psychiatric', 266);
insert into ROOM (roomid, type, departmentid)
values (200, 'Private', 357);
commit;
prompt 200 records committed...
insert into ROOM (roomid, type, departmentid)
values (201, 'Isolation', 269);
insert into ROOM (roomid, type, departmentid)
values (202, 'Private', 496);
insert into ROOM (roomid, type, departmentid)
values (203, 'Labor and Delivery', 32);
insert into ROOM (roomid, type, departmentid)
values (204, 'Surgery', 26);
insert into ROOM (roomid, type, departmentid)
values (205, 'Recovery', 166);
insert into ROOM (roomid, type, departmentid)
values (206, 'Rehabilitation', 297);
insert into ROOM (roomid, type, departmentid)
values (207, 'Emergency', 33);
insert into ROOM (roomid, type, departmentid)
values (208, 'Rehabilitation', 480);
insert into ROOM (roomid, type, departmentid)
values (209, 'Labor and Delivery', 291);
insert into ROOM (roomid, type, departmentid)
values (210, 'General Ward', 111);
insert into ROOM (roomid, type, departmentid)
values (211, 'Surgery', 97);
insert into ROOM (roomid, type, departmentid)
values (212, 'General Ward', 112);
insert into ROOM (roomid, type, departmentid)
values (213, 'Isolation', 492);
insert into ROOM (roomid, type, departmentid)
values (214, 'Surgery', 362);
insert into ROOM (roomid, type, departmentid)
values (215, 'Psychiatric', 117);
insert into ROOM (roomid, type, departmentid)
values (216, 'Psychiatric', 30);
insert into ROOM (roomid, type, departmentid)
values (217, 'Isolation', 34);
insert into ROOM (roomid, type, departmentid)
values (218, 'Semi-Private', 13);
insert into ROOM (roomid, type, departmentid)
values (219, 'Maternity', 47);
insert into ROOM (roomid, type, departmentid)
values (220, 'Recovery', 432);
insert into ROOM (roomid, type, departmentid)
values (221, 'General Ward', 52);
insert into ROOM (roomid, type, departmentid)
values (222, 'PICU', 274);
insert into ROOM (roomid, type, departmentid)
values (223, 'Psychiatric', 56);
insert into ROOM (roomid, type, departmentid)
values (224, 'NICU', 395);
insert into ROOM (roomid, type, departmentid)
values (225, 'ICU', 152);
insert into ROOM (roomid, type, departmentid)
values (226, 'General Ward', 212);
insert into ROOM (roomid, type, departmentid)
values (227, 'Emergency', 331);
insert into ROOM (roomid, type, departmentid)
values (228, 'General Ward', 59);
insert into ROOM (roomid, type, departmentid)
values (229, 'Surgery', 173);
insert into ROOM (roomid, type, departmentid)
values (230, 'ICU', 272);
insert into ROOM (roomid, type, departmentid)
values (231, 'Surgery', 44);
insert into ROOM (roomid, type, departmentid)
values (232, 'Emergency', 233);
insert into ROOM (roomid, type, departmentid)
values (233, 'Recovery', 102);
insert into ROOM (roomid, type, departmentid)
values (234, 'Private', 200);
insert into ROOM (roomid, type, departmentid)
values (235, 'ICU', 471);
insert into ROOM (roomid, type, departmentid)
values (236, 'Recovery', 386);
insert into ROOM (roomid, type, departmentid)
values (237, 'Maternity', 150);
insert into ROOM (roomid, type, departmentid)
values (238, 'CCU', 374);
insert into ROOM (roomid, type, departmentid)
values (239, 'Surgery', 268);
insert into ROOM (roomid, type, departmentid)
values (240, 'PICU', 68);
insert into ROOM (roomid, type, departmentid)
values (241, 'Psychiatric', 481);
insert into ROOM (roomid, type, departmentid)
values (242, 'ICU', 43);
insert into ROOM (roomid, type, departmentid)
values (243, 'Isolation', 404);
insert into ROOM (roomid, type, departmentid)
values (244, 'Psychiatric', 218);
insert into ROOM (roomid, type, departmentid)
values (245, 'CCU', 95);
insert into ROOM (roomid, type, departmentid)
values (246, 'Semi-Private', 470);
insert into ROOM (roomid, type, departmentid)
values (247, 'CCU', 251);
insert into ROOM (roomid, type, departmentid)
values (248, 'Surgery', 386);
insert into ROOM (roomid, type, departmentid)
values (249, 'Labor and Delivery', 375);
insert into ROOM (roomid, type, departmentid)
values (250, 'ICU', 481);
insert into ROOM (roomid, type, departmentid)
values (251, 'Isolation', 328);
insert into ROOM (roomid, type, departmentid)
values (252, 'ICU', 365);
insert into ROOM (roomid, type, departmentid)
values (253, 'ICU', 279);
insert into ROOM (roomid, type, departmentid)
values (254, 'Psychiatric', 421);
insert into ROOM (roomid, type, departmentid)
values (255, 'Psychiatric', 202);
insert into ROOM (roomid, type, departmentid)
values (256, 'Labor and Delivery', 223);
insert into ROOM (roomid, type, departmentid)
values (257, 'Maternity', 199);
insert into ROOM (roomid, type, departmentid)
values (258, 'ICU', 17);
insert into ROOM (roomid, type, departmentid)
values (259, 'CCU', 45);
insert into ROOM (roomid, type, departmentid)
values (260, 'Surgery', 240);
insert into ROOM (roomid, type, departmentid)
values (261, 'Isolation', 473);
insert into ROOM (roomid, type, departmentid)
values (262, 'Labor and Delivery', 146);
insert into ROOM (roomid, type, departmentid)
values (263, 'NICU', 353);
insert into ROOM (roomid, type, departmentid)
values (264, 'Semi-Private', 262);
insert into ROOM (roomid, type, departmentid)
values (265, 'Surgery', 44);
insert into ROOM (roomid, type, departmentid)
values (266, 'Psychiatric', 11);
insert into ROOM (roomid, type, departmentid)
values (267, 'Psychiatric', 306);
insert into ROOM (roomid, type, departmentid)
values (268, 'Recovery', 448);
insert into ROOM (roomid, type, departmentid)
values (269, 'CCU', 295);
insert into ROOM (roomid, type, departmentid)
values (270, 'PICU', 220);
insert into ROOM (roomid, type, departmentid)
values (271, 'Emergency', 306);
insert into ROOM (roomid, type, departmentid)
values (272, 'CCU', 431);
insert into ROOM (roomid, type, departmentid)
values (273, 'Private', 18);
insert into ROOM (roomid, type, departmentid)
values (274, 'Maternity', 275);
insert into ROOM (roomid, type, departmentid)
values (275, 'General Ward', 152);
insert into ROOM (roomid, type, departmentid)
values (276, 'General Ward', 382);
insert into ROOM (roomid, type, departmentid)
values (277, 'General Ward', 56);
insert into ROOM (roomid, type, departmentid)
values (278, 'ICU', 466);
insert into ROOM (roomid, type, departmentid)
values (279, 'Labor and Delivery', 379);
insert into ROOM (roomid, type, departmentid)
values (280, 'Semi-Private', 487);
insert into ROOM (roomid, type, departmentid)
values (281, 'PICU', 91);
insert into ROOM (roomid, type, departmentid)
values (282, 'NICU', 167);
insert into ROOM (roomid, type, departmentid)
values (283, 'Psychiatric', 258);
insert into ROOM (roomid, type, departmentid)
values (284, 'Isolation', 316);
insert into ROOM (roomid, type, departmentid)
values (285, 'General Ward', 96);
insert into ROOM (roomid, type, departmentid)
values (286, 'General Ward', 49);
insert into ROOM (roomid, type, departmentid)
values (287, 'Rehabilitation', 443);
insert into ROOM (roomid, type, departmentid)
values (288, 'General Ward', 118);
insert into ROOM (roomid, type, departmentid)
values (289, 'ICU', 437);
insert into ROOM (roomid, type, departmentid)
values (290, 'NICU', 185);
insert into ROOM (roomid, type, departmentid)
values (291, 'Psychiatric', 281);
insert into ROOM (roomid, type, departmentid)
values (292, 'PICU', 500);
insert into ROOM (roomid, type, departmentid)
values (293, 'Psychiatric', 136);
insert into ROOM (roomid, type, departmentid)
values (294, 'Maternity', 72);
insert into ROOM (roomid, type, departmentid)
values (295, 'Maternity', 274);
insert into ROOM (roomid, type, departmentid)
values (296, 'NICU', 34);
insert into ROOM (roomid, type, departmentid)
values (297, 'Maternity', 283);
insert into ROOM (roomid, type, departmentid)
values (298, 'Surgery', 57);
insert into ROOM (roomid, type, departmentid)
values (299, 'CCU', 200);
insert into ROOM (roomid, type, departmentid)
values (300, 'Private', 252);
commit;
prompt 300 records committed...
insert into ROOM (roomid, type, departmentid)
values (301, 'Maternity', 116);
insert into ROOM (roomid, type, departmentid)
values (302, 'Maternity', 165);
insert into ROOM (roomid, type, departmentid)
values (303, 'Maternity', 389);
insert into ROOM (roomid, type, departmentid)
values (304, 'General Ward', 60);
insert into ROOM (roomid, type, departmentid)
values (305, 'Semi-Private', 245);
insert into ROOM (roomid, type, departmentid)
values (306, 'Semi-Private', 340);
insert into ROOM (roomid, type, departmentid)
values (307, 'Maternity', 158);
insert into ROOM (roomid, type, departmentid)
values (308, 'NICU', 53);
insert into ROOM (roomid, type, departmentid)
values (309, 'Surgery', 42);
insert into ROOM (roomid, type, departmentid)
values (310, 'PICU', 84);
insert into ROOM (roomid, type, departmentid)
values (311, 'Psychiatric', 396);
insert into ROOM (roomid, type, departmentid)
values (312, 'Emergency', 232);
insert into ROOM (roomid, type, departmentid)
values (313, 'Maternity', 179);
insert into ROOM (roomid, type, departmentid)
values (314, 'Maternity', 11);
insert into ROOM (roomid, type, departmentid)
values (315, 'Maternity', 312);
insert into ROOM (roomid, type, departmentid)
values (316, 'Psychiatric', 139);
insert into ROOM (roomid, type, departmentid)
values (317, 'Psychiatric', 329);
insert into ROOM (roomid, type, departmentid)
values (318, 'Rehabilitation', 301);
insert into ROOM (roomid, type, departmentid)
values (319, 'ICU', 334);
insert into ROOM (roomid, type, departmentid)
values (320, 'Surgery', 387);
insert into ROOM (roomid, type, departmentid)
values (321, 'Surgery', 20);
insert into ROOM (roomid, type, departmentid)
values (322, 'Psychiatric', 61);
insert into ROOM (roomid, type, departmentid)
values (323, 'ICU', 169);
insert into ROOM (roomid, type, departmentid)
values (324, 'Private', 99);
insert into ROOM (roomid, type, departmentid)
values (325, 'Isolation', 144);
insert into ROOM (roomid, type, departmentid)
values (326, 'General Ward', 98);
insert into ROOM (roomid, type, departmentid)
values (327, 'Surgery', 17);
insert into ROOM (roomid, type, departmentid)
values (328, 'NICU', 260);
insert into ROOM (roomid, type, departmentid)
values (329, 'Maternity', 127);
insert into ROOM (roomid, type, departmentid)
values (330, 'General Ward', 89);
insert into ROOM (roomid, type, departmentid)
values (331, 'Emergency', 438);
insert into ROOM (roomid, type, departmentid)
values (332, 'General Ward', 463);
insert into ROOM (roomid, type, departmentid)
values (333, 'Recovery', 249);
insert into ROOM (roomid, type, departmentid)
values (334, 'Labor and Delivery', 164);
insert into ROOM (roomid, type, departmentid)
values (335, 'PICU', 381);
insert into ROOM (roomid, type, departmentid)
values (336, 'Private', 76);
insert into ROOM (roomid, type, departmentid)
values (337, 'Maternity', 128);
insert into ROOM (roomid, type, departmentid)
values (338, 'Rehabilitation', 395);
insert into ROOM (roomid, type, departmentid)
values (339, 'Psychiatric', 366);
insert into ROOM (roomid, type, departmentid)
values (340, 'PICU', 301);
insert into ROOM (roomid, type, departmentid)
values (341, 'Surgery', 349);
insert into ROOM (roomid, type, departmentid)
values (342, 'Emergency', 186);
insert into ROOM (roomid, type, departmentid)
values (343, 'CCU', 324);
insert into ROOM (roomid, type, departmentid)
values (344, 'Maternity', 147);
insert into ROOM (roomid, type, departmentid)
values (345, 'CCU', 262);
insert into ROOM (roomid, type, departmentid)
values (346, 'Labor and Delivery', 76);
insert into ROOM (roomid, type, departmentid)
values (347, 'Psychiatric', 88);
insert into ROOM (roomid, type, departmentid)
values (348, 'Labor and Delivery', 312);
insert into ROOM (roomid, type, departmentid)
values (349, 'Isolation', 429);
insert into ROOM (roomid, type, departmentid)
values (350, 'Private', 442);
insert into ROOM (roomid, type, departmentid)
values (351, 'Maternity', 50);
insert into ROOM (roomid, type, departmentid)
values (352, 'Semi-Private', 460);
insert into ROOM (roomid, type, departmentid)
values (353, 'Emergency', 225);
insert into ROOM (roomid, type, departmentid)
values (354, 'Labor and Delivery', 116);
insert into ROOM (roomid, type, departmentid)
values (355, 'Isolation', 465);
insert into ROOM (roomid, type, departmentid)
values (356, 'General Ward', 421);
insert into ROOM (roomid, type, departmentid)
values (357, 'Rehabilitation', 104);
insert into ROOM (roomid, type, departmentid)
values (358, 'PICU', 398);
insert into ROOM (roomid, type, departmentid)
values (359, 'Semi-Private', 416);
insert into ROOM (roomid, type, departmentid)
values (360, 'Maternity', 277);
insert into ROOM (roomid, type, departmentid)
values (361, 'Psychiatric', 11);
insert into ROOM (roomid, type, departmentid)
values (362, 'Recovery', 484);
insert into ROOM (roomid, type, departmentid)
values (363, 'Psychiatric', 433);
insert into ROOM (roomid, type, departmentid)
values (364, 'Maternity', 373);
insert into ROOM (roomid, type, departmentid)
values (365, 'Emergency', 460);
insert into ROOM (roomid, type, departmentid)
values (366, 'General Ward', 297);
insert into ROOM (roomid, type, departmentid)
values (367, 'NICU', 272);
insert into ROOM (roomid, type, departmentid)
values (368, 'Maternity', 222);
insert into ROOM (roomid, type, departmentid)
values (369, 'NICU', 258);
insert into ROOM (roomid, type, departmentid)
values (370, 'Surgery', 223);
insert into ROOM (roomid, type, departmentid)
values (371, 'Private', 344);
insert into ROOM (roomid, type, departmentid)
values (372, 'Psychiatric', 323);
insert into ROOM (roomid, type, departmentid)
values (373, 'Psychiatric', 396);
insert into ROOM (roomid, type, departmentid)
values (374, 'NICU', 258);
insert into ROOM (roomid, type, departmentid)
values (375, 'Emergency', 308);
insert into ROOM (roomid, type, departmentid)
values (376, 'Rehabilitation', 382);
insert into ROOM (roomid, type, departmentid)
values (377, 'NICU', 88);
insert into ROOM (roomid, type, departmentid)
values (378, 'Rehabilitation', 51);
insert into ROOM (roomid, type, departmentid)
values (379, 'CCU', 311);
insert into ROOM (roomid, type, departmentid)
values (380, 'Emergency', 436);
insert into ROOM (roomid, type, departmentid)
values (381, 'Surgery', 471);
insert into ROOM (roomid, type, departmentid)
values (382, 'NICU', 366);
insert into ROOM (roomid, type, departmentid)
values (383, 'Isolation', 394);
insert into ROOM (roomid, type, departmentid)
values (384, 'Rehabilitation', 395);
insert into ROOM (roomid, type, departmentid)
values (385, 'ICU', 458);
insert into ROOM (roomid, type, departmentid)
values (386, 'Psychiatric', 445);
insert into ROOM (roomid, type, departmentid)
values (387, 'Maternity', 48);
insert into ROOM (roomid, type, departmentid)
values (388, 'General Ward', 475);
insert into ROOM (roomid, type, departmentid)
values (389, 'Recovery', 248);
insert into ROOM (roomid, type, departmentid)
values (390, 'Private', 269);
insert into ROOM (roomid, type, departmentid)
values (391, 'NICU', 428);
insert into ROOM (roomid, type, departmentid)
values (392, 'CCU', 48);
insert into ROOM (roomid, type, departmentid)
values (393, 'Surgery', 497);
insert into ROOM (roomid, type, departmentid)
values (394, 'General Ward', 242);
insert into ROOM (roomid, type, departmentid)
values (395, 'Private', 221);
insert into ROOM (roomid, type, departmentid)
values (396, 'Labor and Delivery', 395);
insert into ROOM (roomid, type, departmentid)
values (397, 'Labor and Delivery', 134);
insert into ROOM (roomid, type, departmentid)
values (398, 'General Ward', 267);
insert into ROOM (roomid, type, departmentid)
values (399, 'ICU', 176);
insert into ROOM (roomid, type, departmentid)
values (400, 'PICU', 366);
commit;
prompt 400 records committed...
insert into ROOM (roomid, type, departmentid)
values (401, 'Maternity', 350);
insert into ROOM (roomid, type, departmentid)
values (402, 'Maternity', 233);
insert into ROOM (roomid, type, departmentid)
values (403, 'Psychiatric', 285);
insert into ROOM (roomid, type, departmentid)
values (404, 'Isolation', 442);
insert into ROOM (roomid, type, departmentid)
values (405, 'Psychiatric', 227);
insert into ROOM (roomid, type, departmentid)
values (406, 'Emergency', 410);
insert into ROOM (roomid, type, departmentid)
values (407, 'CCU', 119);
insert into ROOM (roomid, type, departmentid)
values (408, 'Recovery', 211);
insert into ROOM (roomid, type, departmentid)
values (409, 'PICU', 29);
insert into ROOM (roomid, type, departmentid)
values (410, 'CCU', 250);
insert into ROOM (roomid, type, departmentid)
values (411, 'Recovery', 329);
insert into ROOM (roomid, type, departmentid)
values (412, 'Rehabilitation', 242);
insert into ROOM (roomid, type, departmentid)
values (413, 'Recovery', 157);
insert into ROOM (roomid, type, departmentid)
values (414, 'Emergency', 90);
insert into ROOM (roomid, type, departmentid)
values (415, 'Private', 293);
insert into ROOM (roomid, type, departmentid)
values (416, 'General Ward', 372);
insert into ROOM (roomid, type, departmentid)
values (417, 'Psychiatric', 247);
insert into ROOM (roomid, type, departmentid)
values (418, 'Recovery', 267);
insert into ROOM (roomid, type, departmentid)
values (419, 'Emergency', 425);
insert into ROOM (roomid, type, departmentid)
values (420, 'Semi-Private', 395);
insert into ROOM (roomid, type, departmentid)
values (421, 'Private', 434);
insert into ROOM (roomid, type, departmentid)
values (422, 'Surgery', 136);
insert into ROOM (roomid, type, departmentid)
values (423, 'PICU', 138);
insert into ROOM (roomid, type, departmentid)
values (424, 'Emergency', 160);
insert into ROOM (roomid, type, departmentid)
values (425, 'Private', 267);
insert into ROOM (roomid, type, departmentid)
values (426, 'General Ward', 492);
insert into ROOM (roomid, type, departmentid)
values (427, 'NICU', 464);
insert into ROOM (roomid, type, departmentid)
values (428, 'Recovery', 72);
insert into ROOM (roomid, type, departmentid)
values (429, 'NICU', 287);
insert into ROOM (roomid, type, departmentid)
values (430, 'General Ward', 405);
insert into ROOM (roomid, type, departmentid)
values (431, 'NICU', 334);
insert into ROOM (roomid, type, departmentid)
values (432, 'Semi-Private', 2);
insert into ROOM (roomid, type, departmentid)
values (433, 'Rehabilitation', 248);
insert into ROOM (roomid, type, departmentid)
values (434, 'Rehabilitation', 455);
insert into ROOM (roomid, type, departmentid)
values (435, 'General Ward', 5);
insert into ROOM (roomid, type, departmentid)
values (436, 'General Ward', 104);
insert into ROOM (roomid, type, departmentid)
values (437, 'Private', 11);
insert into ROOM (roomid, type, departmentid)
values (438, 'PICU', 378);
insert into ROOM (roomid, type, departmentid)
values (439, 'NICU', 154);
insert into ROOM (roomid, type, departmentid)
values (440, 'Emergency', 34);
insert into ROOM (roomid, type, departmentid)
values (441, 'PICU', 83);
insert into ROOM (roomid, type, departmentid)
values (442, 'Semi-Private', 112);
insert into ROOM (roomid, type, departmentid)
values (443, 'CCU', 118);
insert into ROOM (roomid, type, departmentid)
values (444, 'CCU', 81);
insert into ROOM (roomid, type, departmentid)
values (445, 'PICU', 311);
insert into ROOM (roomid, type, departmentid)
values (446, 'CCU', 256);
insert into ROOM (roomid, type, departmentid)
values (447, 'Psychiatric', 300);
insert into ROOM (roomid, type, departmentid)
values (448, 'Private', 197);
insert into ROOM (roomid, type, departmentid)
values (449, 'General Ward', 245);
insert into ROOM (roomid, type, departmentid)
values (450, 'Maternity', 430);
insert into ROOM (roomid, type, departmentid)
values (451, 'Isolation', 225);
insert into ROOM (roomid, type, departmentid)
values (452, 'Isolation', 441);
insert into ROOM (roomid, type, departmentid)
values (453, 'General Ward', 142);
insert into ROOM (roomid, type, departmentid)
values (454, 'Recovery', 46);
insert into ROOM (roomid, type, departmentid)
values (455, 'Emergency', 253);
insert into ROOM (roomid, type, departmentid)
values (456, 'Isolation', 326);
insert into ROOM (roomid, type, departmentid)
values (457, 'Emergency', 134);
insert into ROOM (roomid, type, departmentid)
values (458, 'Isolation', 483);
insert into ROOM (roomid, type, departmentid)
values (459, 'NICU', 448);
insert into ROOM (roomid, type, departmentid)
values (460, 'Labor and Delivery', 68);
insert into ROOM (roomid, type, departmentid)
values (461, 'Private', 55);
insert into ROOM (roomid, type, departmentid)
values (462, 'ICU', 164);
insert into ROOM (roomid, type, departmentid)
values (463, 'NICU', 110);
insert into ROOM (roomid, type, departmentid)
values (464, 'PICU', 249);
insert into ROOM (roomid, type, departmentid)
values (465, 'Emergency', 417);
insert into ROOM (roomid, type, departmentid)
values (466, 'Surgery', 49);
insert into ROOM (roomid, type, departmentid)
values (467, 'Labor and Delivery', 449);
insert into ROOM (roomid, type, departmentid)
values (468, 'CCU', 381);
insert into ROOM (roomid, type, departmentid)
values (469, 'General Ward', 44);
insert into ROOM (roomid, type, departmentid)
values (470, 'Recovery', 24);
insert into ROOM (roomid, type, departmentid)
values (471, 'Recovery', 433);
insert into ROOM (roomid, type, departmentid)
values (472, 'CCU', 377);
insert into ROOM (roomid, type, departmentid)
values (473, 'Isolation', 371);
insert into ROOM (roomid, type, departmentid)
values (474, 'Recovery', 202);
insert into ROOM (roomid, type, departmentid)
values (475, 'Psychiatric', 276);
insert into ROOM (roomid, type, departmentid)
values (476, 'Labor and Delivery', 432);
insert into ROOM (roomid, type, departmentid)
values (477, 'Isolation', 385);
insert into ROOM (roomid, type, departmentid)
values (478, 'Labor and Delivery', 130);
insert into ROOM (roomid, type, departmentid)
values (479, 'General Ward', 92);
insert into ROOM (roomid, type, departmentid)
values (480, 'Isolation', 301);
insert into ROOM (roomid, type, departmentid)
values (481, 'Recovery', 232);
insert into ROOM (roomid, type, departmentid)
values (482, 'ICU', 401);
insert into ROOM (roomid, type, departmentid)
values (483, 'PICU', 205);
insert into ROOM (roomid, type, departmentid)
values (484, 'NICU', 497);
insert into ROOM (roomid, type, departmentid)
values (485, 'CCU', 479);
insert into ROOM (roomid, type, departmentid)
values (486, 'NICU', 173);
insert into ROOM (roomid, type, departmentid)
values (487, 'Private', 107);
insert into ROOM (roomid, type, departmentid)
values (488, 'Isolation', 383);
insert into ROOM (roomid, type, departmentid)
values (489, 'Labor and Delivery', 32);
insert into ROOM (roomid, type, departmentid)
values (490, 'Surgery', 93);
insert into ROOM (roomid, type, departmentid)
values (491, 'Emergency', 85);
insert into ROOM (roomid, type, departmentid)
values (492, 'Surgery', 174);
insert into ROOM (roomid, type, departmentid)
values (493, 'Labor and Delivery', 203);
insert into ROOM (roomid, type, departmentid)
values (494, 'PICU', 126);
insert into ROOM (roomid, type, departmentid)
values (495, 'General Ward', 493);
insert into ROOM (roomid, type, departmentid)
values (496, 'Private', 350);
insert into ROOM (roomid, type, departmentid)
values (497, 'CCU', 447);
insert into ROOM (roomid, type, departmentid)
values (498, 'NICU', 297);
insert into ROOM (roomid, type, departmentid)
values (499, 'Private', 184);
insert into ROOM (roomid, type, departmentid)
values (500, 'Semi-Private', 469);
commit;
prompt 500 records loaded
prompt Loading TREATMENT...
prompt Table is empty
prompt Enabling foreign key constraints for DOCTOR...
alter table DOCTOR enable constraint FK_DOCTOR_DEPARTMENT;
prompt Enabling foreign key constraints for PATIENT...
alter table PATIENT enable constraint FK_PATIENT_DEPARTMENT;
prompt Enabling foreign key constraints for ROOM...
alter table ROOM enable constraint FK_ROOM_DEPARTMENT;
prompt Enabling foreign key constraints for TREATMENT...
alter table TREATMENT enable constraint FK_TREATMENT_DOCTOR;
alter table TREATMENT enable constraint FK_TREATMENT_MEDICATION;
alter table TREATMENT enable constraint FK_TREATMENT_PATIENT;
prompt Enabling triggers for DEPARTMENT...
alter table DEPARTMENT enable all triggers;
prompt Enabling triggers for DOCTOR...
alter table DOCTOR enable all triggers;
prompt Enabling triggers for MEDICATION...
alter table MEDICATION enable all triggers;
prompt Enabling triggers for PATIENT...
alter table PATIENT enable all triggers;
prompt Enabling triggers for ROOM...
alter table ROOM enable all triggers;
prompt Enabling triggers for TREATMENT...
alter table TREATMENT enable all triggers;

set feedback on
set define on
prompt Done
