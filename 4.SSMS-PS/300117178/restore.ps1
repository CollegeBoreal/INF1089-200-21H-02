# Copie du fichier en provenance d'Internet
curl -OutFile "backup\wwi.bak" `
 "https://github.com/Microsoft/sql-server-samples/releases/download/wide-world-importers-v1.0/WideWorldImporters-Full.bak"

# Execution du script permettant le chargement de la bases de donnees
docker exec --interactive --tty some-mssql `
    sqlcmd -U sa -P "Password123" ` -i C:\DATA\scripts\restore.sql
