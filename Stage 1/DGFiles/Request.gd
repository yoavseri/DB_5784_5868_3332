
[General]
Version=1

[Preferences]
Username=
Password=2400
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##SQL
Name=REQUEST
Count=400

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

