
[General]
Version=1

[Preferences]
Username=
Password=2890
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##SQL
Name=BOOKING
Count=1500

[Record]
Name=GUEST_ID
Type=NUMBER
Size=
Data=List(select guest_id from Guest)
Master=

[Record]
Name=ROOM_NUMBER
Type=NUMBER
Size=
Data=List(select room_number from Room)
Master=

[Record]
Name=ENTRY_DATE
Type=DATE
Size=
Data=Random(01/01/1970, 01/01/2025)
Master=

[Record]
Name=DAYS
Type=NUMBER
Size=
Data=Random(1, 14)
Master=

[Record]
Name=EM_ID
Type=NUMBER
Size=
Data=List(select em_id from Receptionist)
Master=

