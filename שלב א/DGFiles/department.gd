
[General]
Version=1

[Preferences]
Username=
Password=2815
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SHMUELAMIR
Name=DEPARTMENT
Count=500

[Record]
Name=DEPARTMENTID
Type=NUMBER
Size=
Data=Sequence(1)
Master=

[Record]
Name=NAME
Type=VARCHAR2
Size=100
Data=List('Emergency', 'Cardiology', 'Oncology', 'Orthopedics', 'Neurology', 'Pediatrics', 'Obstetrics', 'Gynecology', 'Surgery', 'Intensive', 'Care', 'Unit', 'Laboratory', 'Radiology', 'Psychiatry', 'Physical', 'Therapy', 'Pharmacy', 'Nutrition'
=
=
=
=
=
=)
Master=

[Record]
Name=LOCATION
Type=VARCHAR2
Size=100
Data=[A]+'-'+[1]
Master=

[Record]
Name=PHONE
Type=VARCHAR2
Size=15
Data='0' + List(2,3,4,7,8,9) + Random(1000000, 9999999)
Master=

