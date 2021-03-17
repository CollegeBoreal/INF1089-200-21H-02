RESTORE FILELISTONLY FROM DISK = 'C:\data\backup\wwi.bak'
RESTORE DATABASE WideWorldImporters FROM DISK = 'C:\data\backup\wwi.bak' WITH MOVE 'WWI_Primary' TO 'C:\data\WideWorldImporters.mdf', MOVE 'WWI_UserData' TO 'C:\data\WideWorldImporters_userdata.ndf', MOVE 'WWI_Log' TO 'C:\data\WideWorldImporters.ldf', MOVE 'WWI_InMemory_Data_1' TO 'C:\data\WideWorldImporters_InMemory_Data_1'
