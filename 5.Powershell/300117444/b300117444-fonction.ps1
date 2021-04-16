<#
.SYNOPSIS
    Ce script est un laboratoire Powershell
.DESCRIPTION
    Ce script est utilisé pour le laboratoire de programmation en Powershell.
.NOTES
    Author: CollegeBoreal
    Derniere mise à jour: yyyy-mm-dd
#>
# Definition de la fonction
function Stagiaire {

    [CmdletBinding()]
    param (
        [parameter(Mandatory=$true)]
        [String]$personneNom,

        
        [parameter(Mandatory=$true)]
        [ValidateRange(10,99)]

        [Int32]$personneAge
    )
    # message de bienvenue 
    BEGIN {Write-Verbose "Début du script"}
    PROCESS { "Bonjour {0} ! Tu as {1} ans." -F $personneNom, $personneAge }
    END {Write-Verbose "Fin du script"}

}





# Appel de la fonction

Stagiaire

Stagiaire "Pascal Siakam"

Stagiaire "Pascal Siakam" 1238  

Stagiaire "Pascal Siakam" 26  -verbose
