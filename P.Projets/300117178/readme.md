## Powershell  Events and Monitoring
------------------------------------------------
### Ce script Powerhsell affiche  les journeaux/evenements du systeme (plus precisement la partie application) et print le resultat dans  un fichier html
Cree un fichier **LogAppView.html** dans C:\

## How To exceute the Script?
```
.\LogAppView.ps1 -days 1

```
prends en parametre une **date** qui marque le range 


```
param([Int32]$days=1)

$css= "<style>"
$css= $css+ "BODY{ text-align: center; background-color:white;}"
$css= $css+ "TABLE{    font-family: 'Lucida Sans Unicode', 'Lucida Grande', Sans-Serif;font-size: 12px;margin: 10px;width: 100%;text-align: center;border-collapse: collapse;border-top: 7px solid #004466;border-bottom: 7px solid #004466;}"
$css= $css+ "TH{font-size: 13px;font-weight: normal;padding: 1px;background: #cceeff;border-right: 1px solid #004466;border-left: 1px solid #004466;color: #004466;}"
$css= $css+ "TD{padding: 1px;background: #e5f7ff;border-right: 1px solid #004466;border-left: 1px solid #004466;color: #669;hover:black;}"
$css= $css+  "TD:hover{ background-color:#004466;}"
$css= $css+ "</style>" 
 
$StartDate = (get-date).adddays(-$days)
 
$body = Get-WinEvent -FilterHashtable @{logname="Application"; starttime=$StartDate} -ErrorAction SilentlyContinue
 
$body | ConvertTo-HTML -Head $css MachineName,ID,TimeCreated,Message > C:\LogAppView.html l
```


