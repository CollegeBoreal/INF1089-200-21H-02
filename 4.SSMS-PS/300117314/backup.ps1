# backup de la base de donnes WorldWideImporters
docker exec --interactive --tty some-mssql `
sqlcmd -U sa -P "Password123" ` -i C:\DATA\scripts\backup.sql
