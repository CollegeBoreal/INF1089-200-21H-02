

# Definition de la fonction
function Stagiaire {
<#
.SYNOPSIS
    Prend 2 valuers le Nom et le age
.DESCRIPTION
    Ce script contient une fonction stagiaire qui prend le nom et age.
.EXAMPLE
   personneNom:votre nom
   personneAge:votre age

#>
[CmdletBinding()]
param (
        [Parameter(Mandatory=$true)]
        [string]$personneNom,
        [Parameter(Mandatory=$true)]
        [Int32]$personneAge
       
    )
    #try {$existeAD=(Get-ADUSer $personneNom)} catch{$existeAD=$false}
    #if($existeAD){"ce Copte de stagiare {0} existe dans Active Directory." -F $personneNom}
    #else{"je Vous consielle de creer un compte" -F$personneNom}
   
 BEGIN {Write-Verbose "Début du script"}
 PROCESS{ "Bonjour {0} ! Tu as {1} ans." -F $personneNom, $personneAge}
 END {Write-Verbose "Fin du script"}


}
# Get-Help Stagiaire
# Appel de la fonction
Stagiaire 

