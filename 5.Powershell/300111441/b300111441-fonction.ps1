<#
.SYNOPSIS
    Ce script est un laboratoire Powershell

.DESCRIPTION
    Ce script est utilisé pour le laboratoire de programmation en Powershell.

.NOTES
    Author: Sekou
    Derniere mise à jour: yyyy-mm-dd

# Definition de la fonction
 function Stagiaire {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [String]$personneNom,

        [Parameter(Mandatory=$true)]
        [ValidateRange(9,89)]
        [Int]$personneAge
    )
    # message de bienvenue 
    BEGIN {Write-Verbose "Début du script"}
    PROCESS { "Bonjour {0} ! Tu as {1} ans." -F $personneNom, $personneAge }
    END {Write-Verbose "Fin du script"}
 }

# Appel de la fonction
Stagiaire
Stagiaire "Zoure"
Stagiaire "Kourou" 35
Stagiaire "Poul" 8  -verbose
Get-Help Stagiaire
© 2021 GitHub, Inc.
