# PROGRAMME POWERSHELL QUI DONNE L'ÉQUIVALENT DE L'ANNÉE GRÉGORIENNE EN ANNÉE CHINOISE

## EXPLICATION DU SCRIPT

- [X] Déclaration des variables

   - [] une année 
```
param(
	[parameter( Mandatory = $true, HelpMessage = "Entrer une année entre 1900 et 2100:" )]
	[ValidateRange(1900,2100)]
	[int]$mon_annee
)
```
- [X] Écriture de notre librairie
```
$noms = "Rat","Boeuf (ou Buffle)","Tigre","Lievre (ou Chat ou Lapin)","Dragon","Serpent","Cheval","Chèvre (ou Bouc)","Singe","coq","chien","Cochon (ou Sanglier)"
```
- [X] Fonction du script

   - [] Si 

   - [] Sinon 

   - [] autre

 - [X] Imprimer
