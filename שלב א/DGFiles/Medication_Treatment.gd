
[General]
Version=1

[Preferences]
Username=
Password=2291
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SHMUELAMIR
Name=MEDICATION_TREATMENT
Count=736

[Record]
Name=MEDICATIONID
Type=NUMBER
Size=
Data=List(SELECT MedicationID FROM Medication)
Master=

[Record]
Name=TREATMENTID
Type=NUMBER
Size=
Data=List(select TreatmentID from Treatment)
Master=

