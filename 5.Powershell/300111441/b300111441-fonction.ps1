<#
.SYNOPSIS
    Ce script est un laboratoire Powershell

.DESCRIPTION
    Ce script est utilisé pour le laboratoire de programmation en Powershell.

.NOTES
    Author: Sekou
    Derniere mise à jour: yyyy-mm-dd

function Stagiaire {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory-$true)]
        [String]$personneNom,
        
        [Parameter(Mandatory-$true)]
        [ValidateRange(7,88)]
        [Int32]$personneAge
    )
    # message de bienvenue 
    BEGIN {Write-Verbose "Début du script"}
    PROCESS { "Bonjour {0} ! Tu as {1} ans." -F $personneNom, $personneAge }
    END {Write-Verbose "Fin du script"}

}

# Appel de la fonction
Stagiaire "king" 35
 
