| ---------------- | SCRIPT POWERSHELL DONNANT L'ÉQUIVALENT DE L'ANNÉE GRÉGORIENNE|----------------|

| ---------------- | EN ZODIAQUE CHINOIS :u6e80::u5272::u5408::u7a7a::u6307::u7121:|----------------|

### EXPLICATION DU SCRIPT

- [X] Déclaration d'une variable `mon_annee` **obligatoire**

```ps1
param(
	[parameter( Mandatory = $true, HelpMessage = "Entrer une année entre 1900 et 2100:" )]
	[ValidateRange(1900,2100)]
	[int]$mon_annee
)
```
- [X] Écriture de notre librairie

```ps1
$noms = "Rat","Boeuf (ou Buffle)","Tigre","Lievre (ou Chat ou Lapin)","Dragon","Serpent","Cheval","Chèvre (ou Bouc)","Singe","coq","chien","Cochon (ou Sanglier)"
```

- [x] Imprime la variable `mon_annee` en couleur rouge :red_circle: sans retour à la ligne


```ps1
Write-Host $mon_annee -ForegroundColor Red -NoNewline
```

- [X] Fonction pour gérer le temps de notre phrase lors du print final

   - [ ] `Si` la variable `mon_annéé` est `-lt` :left_right_arrow: `less than` à notre année actuel :arrow_right: on utilise le temps passé

   ```ps1
   if ( $mon_annee -lt ( Get-Date ).Year ) {
	Write-Host " etait" -NoNewline
   }
   ```

   - [ ] `SINON` la variable `mon_annéé` est `-gt` :left_right_arrow: `great than` à notre année actuel :arrow_right: on utilise le temps futur


   ```ps1
   elseif ( $mon_annee -gt ( Get-Date ).Year ) {
	Write-Host " serait" -NoNewline
   }
   ```

   - [ ] `autre` quand la variable `mon_annee` ne respecte pas ces conditions  :arrow_up: alors :arrow_right: on utilise le temps présent

   ```ps1
   else {
	Write-Host " est" -NoNewline
   }
   ```

 - [X] Imprimer le nom correspondant 
 
    - le zodiaque chinois attibue un animal à chaque année en un cycle de 12 années 

    - ⬇️: ⬇️: ⬇️:
    
    - La réponse de ce modulo correspond à une position dans la librairie `noms` qui sera imprimé en couleur verte :green_book: :four_leaf_clover:

```ps1
Write-Host $noms[ ( $mon_annee - 1900 ) % 12 ] -ForegroundColor Green
```


