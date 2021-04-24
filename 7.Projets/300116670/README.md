


# SE CONNECTER A PLUSIEURS SERVEURS WINDOWS VIA RDP À L'AIDE D'UN SCRIPT POWERSHELL :computer:

Le but principal de ce script powershell est de permettre de se connecter sur plusieurs serveurs avec RDP. 

## 🏁🌟 LE SCRIPT 🌟🏁


```powershell
$servers=Get-Content ".\serverslist.txt"

foreach($server in $servers){

     cmdkey /generic:$server /user:"\UserName" /pass:"Password"
    
     mstsc /v: $server
    
     #to bypass the security alerts or certificate errors that has to be done manually
    
     sleep 5
    
     cmdkey /delete:$server
    }
```

**QUELQUES PRECISIONS CONCERNANT LE SCRIPT**

La ligne de commande ci-dessous permet d'entre les credentials: remplacez les champs "Username" et "Password" par vos informations

        cmdkey /generic:$server /user:"UserName" /pass:"Password"
        
        
La ligne de commande ci-dessous permet de specifier l'ordinateur à distance auquel vous voulez vous connectez.
        
        mstsc /v: $server
        
        
La ligne de commande ci-dessous sert à effacer les credentials apres avoir établi la connexion avec le serveur
        
        cmdkey /delete:$server
        

    

    
    
## 🖥️ CREATION DU FICHIER SERVEURSLIST.TXT 🖥️


![image](https://user-images.githubusercontent.com/55238107/115604350-470ddf00-a2af-11eb-89f0-e6557e7afc78.png)

    
    Ce fichier contiendra les adresses IP des serveurs auxquels vous voulez vous connecter et sera appelé par votre script au niveau de la ligne suivante
    
       $servers=Get-Content ".\serverslist.txt"
       
## EXECUTION DU SCRIPT


# References

https://social.technet.microsoft.com/Forums/en-US/55035066-8e5f-483e-8e36-3dac199f5006/powershell-script-to-rdp-automatically-into-multiple-servers?forum=winserverpowershell
