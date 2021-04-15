<#
.SYNOPSIS
    Ce script est un laboratoire Powershell
.DESCRIPTION
    Ce script est utilisé pour le laboratoire de programmation en Powershell.
.NOTES
    Author: hassana
    Derniere mise à jour: yyyy-mm-dd
#>

# Definition de la fonction
function Stagiaire
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [String]$personneNom,

        [Parameter(Mandatory=$true )]
        [ValidateRange(18,45)]
        [Int]$personneAge
    )

    # message de bienvenue
    BEGIN {Write-Verbose "Début du script"}
    PROCESS { "Salut Mr ou Mdme {0} !Vous etes admissible a nos services car votre age ( {1} ans.) fait parti de notre intervalle d age selectionne  " -F $personneNom, $personneAge }
    END {Write-Verbose "Fin du script"}
}

# Appel de la fonction
Get-help Stagiaire
Stagiaire
