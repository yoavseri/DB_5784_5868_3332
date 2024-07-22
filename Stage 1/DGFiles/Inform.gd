
[General]
Version=1

[Preferences]
Username=
Password=2676
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##SQL
Name=INFORM
Count=500

[Record]
Name=EM_ID
Type=NUMBER
Size=
Data=List(select em_id from ReservationAgent)
Master=

[Record]
Name=GUEST_ID
Type=NUMBER
Size=
Data=List(select guest_id from Guest)
Master=

