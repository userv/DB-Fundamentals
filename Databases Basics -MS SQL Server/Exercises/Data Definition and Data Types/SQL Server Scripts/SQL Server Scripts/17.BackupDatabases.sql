BACKUP DATABASE CarRental TO DISK = 'M:\DB_BACKUPS\CarRental.bak'
GO
BACKUP DATABASE Hotel TO DISK = 'M:\DB_BACKUPS\Hotel.bak'
GO
BACKUP DATABASE Movies TO DISK = 'M:\DB_BACKUPS\Movies.bak'
GO
BACKUP DATABASE Bank TO DISK = 'M:\DB_BACKUPS\Bank.bak' 
GO
DROP DATABASE Bank

RESTORE DATABASE Bank FROM DISK='M:\DB_BACKUPS\Bank.bak'