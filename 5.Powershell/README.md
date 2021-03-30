# :five: PowerShell


https://www.linkedin.com/learning/l-essentiel-de-windows-powershell-6/

* Créer un répertoire avec votre :id:

* Créer votre script PowerShell en donnant le nom b:id:.ps1

Example b300098957.ps1

:tada: [Participation](.scripts/Participation.md)

## :o: Installation de Visual Studio Code

:star: Windows

```
PS > choco install vscode
```

:star: MacOS

- [ ] installer Visual Studio Code

```
$ brew cas install vscode
```

- [ ] installer PowerShell

```
$ brew cask install powershell
```

## :a: PowerShell Core

```
PS > get-command -Module Microsoft.PowerShell.Core
```

## :b: Laboratoire

:one: Écrire les scripts en suivant le laboratoire ci-dessous dans [Github Leaning Lab](https://lab.github.com/CollegeBoreal):

https://lab.github.com/CollegeBoreal/lab-programmation-script-en-powershell


:two: Copier votre scripts dans le cours en remplaçant :id: par votre :id: github :octocat: :


https://github.com/:id:/lab-programmation-script-en-powershell

Copier les scripts:

Par example:

- [ ] Copier le fichier `b000000000-structure.ps1` dans votre :id: `Boréal` 

- [ ] Renommer le fichier `b000000000-structure.ps1` avec `b`:id:`-structure.ps1` 

Le faire pour les deux fichiers `b000000000-structure.ps1` et `b000000000-fonction.ps1`

En un mot, récupérer le travail que vous avez fait à travers [Github Leaning Lab](https://lab.github.com/CollegeBoreal) et le mettre dans celui du cours [5.Powershell](../5.Powershell)

:round_pushpin: Exécution

```
PS > # Charger la fonction à exécuter en mémoire
PS > . .\b0000000-fonction.ps1
PS > # Exécuter la fonction 
PS > Stagiaire -personneNom "Toto" -personneAge 50
```

:three: Amélioration

Le laboratoire vous garantit une note de passage, ajouter du code en améliorant le script embellira la note.

Example d'améliorations :
 
* la validation de paramètres :
 
https://www.linkedin.com/learning/l-essentiel-de-windows-powershell-6/valider-les-parametres-d-une-fonction?u=56968449
 
* La gestion des erreurs quand on fait un ‘look-up’ sur Active Directory
 
https://www.linkedin.com/learning/l-essentiel-de-windows-powershell-6/gerer-les-erreurs-d-une-fonction?u=56968449
 
* La création d’aide à la fonction
 
https://www.linkedin.com/learning/l-essentiel-de-windows-powershell-6/creer-l-aide-d-une-fonction?u=56968449
 
Une des améliorations suffit.

# References

** Politique d'execution

- Etablir


```
PS > Set-ExecutionPolicy RemoteSigned
```

Avec Scope


```
PS > Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
```

- Enlever

```
PS > Set-ExecutionPolicy Restricted
```

# [Participation](.scripts/Participation.md)
