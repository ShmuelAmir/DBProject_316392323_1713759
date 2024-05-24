
[General]
Version=1

[Preferences]
Username=
Password=2488
Database=
DateFormat=
CommitCount=100
CommitDelay=0
InitScript=

[Table]
Owner=SHMUELAMIR
Name=ROOM
Count=500

[Record]
Name=ROOMID
Type=NUMBER
Size=
Data=Sequence(1)
Master=

[Record]
Name=TYPE
Type=VARCHAR2
Size=50
Data=List('General Ward', 'Private', 'Semi-Private', 'ICU', 'CCU', 'NICU', 'PICU', 'Maternity', 'Surgery', 'Recovery', 'Emergency', 'Isolation', 'Labor and Delivery', 'Rehabilitation', 'Psychiatric')
Master=

[Record]
Name=DEPARTMENTID
Type=NUMBER
Size=
Data=List(SELECT DepartmentID FROM DEPARTMENT)
Master=

