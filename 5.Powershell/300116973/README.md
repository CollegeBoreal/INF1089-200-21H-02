# script powershell qui permet de verifier si un compte utilisateur existe dans le active directory.

Notre script b300116973-fonction.ps1 permet de voir si un utilisateur existe ou pas dans active directory. Le but ici est de creer le compte s'il n'existe pas.

le script suivant vous permet de le faire:

```
function Stagiaire {
   
    <#
.SYNOPSIS
    Verifier l'existance d'un compte dans Active Directory
.DESCRIPTION
    
verifier l'existence d'un compte dans Active Directory. l'objectif est de creer le compte s'il n'existe pas.
.PARAMETER personneNom
C'est l'identifiant de l'utilisateur. Generalement, il s'agit du prenom
compte est alias de personneNom.
Ce parametre est obligatoire.
.EXAMPLE
Stagiaire -Compte "Nathy"
.LINK
https://collegeboreal.ca
#>

# Definition de la fonction

   [CmdletBinding()]
   param (
       [Parameter(Mandatory=$true)]
       [Alias("Compte")]
       [String]$personneNom
    )

    # Test d'existence du compte dans Active Directory 
    try {$existAD =  (Get-ADUser $personneNom)}
    catch {$existAD = $false}


    # Affiche du message d'existence ou de creation du compte
    if ($existAD) {"Le compte du stagiaire {0} existe dans Active Directory." -F $personneNom}
    else {"vous deve creer le compte de {0} dans Active Directory." -F $personneNom}
}

Get-Help Stagaire
```
