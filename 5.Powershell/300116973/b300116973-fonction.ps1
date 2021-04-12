
function Stagiaire {
   
    <#
.SYNOPSIS
    Verifier un compte dans Active Directory
.DESCRIPTION
    
Verifier un compte dans Active Directory
.PARAMETER personneNom
L'identifiant de l'utilisateur. Generalement, il c'est le prenom
compte est alias de personneNom.
Ce parametre est obligatoire.
.EXAMPLE
It support -Compte "Erna"
.LINK
https://collegeboreal.ca
#>

# Definir la fonction

   [CmdletBinding()]
   param (
       [Parameter(Mandatory=$true)]
       [Alias("Compte")]
       [String]$personneNom
    )

    # verifier l'existance du compte dans Active Directory 
    try {$existAD =  (Get-ADUser $personneNom)}
    catch {$existAD = $false}


    # Afficher le message si le compte existence ou de creer le compte
    if ($existAD) {"Le compte It support {0} existe dans Active Directory." -F $personneNom}
    else {"vous deve creer le compte de {0} dans Active Directory." -F $personneNom}
}

Get-Help It support
    catch {$existAD = $false}


    # Affiche du message d'existence ou de creation du compte
    if ($existAD) {"Le compte It support {0} existe dans Active Directory." -F $personneNom}
    else {"vous deve creer le compte de {0} dans Active Directory." -F $personneNom}
}

Get-Help Stagaire

