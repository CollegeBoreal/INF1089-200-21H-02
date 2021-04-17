<#
.SYNOPSIS
    Ce script est un laboratoire Powershell

.DESCRIPTION
    Ce script est utilisé pour le laboratoire de programmation en Powershell.

.NOTES
    Author: Sekou
    Derniere mise à jour: yyyy-mm-dd

.PARAMETER personneNom
c'est le nom de l'utilisateur

.PARAMETER personneAge
c'est l'âge de l'utilisateur

.PARAMETER personneEntreprise
c'est l'entrprise l'utilisateur fréquente

.PARAMETER personneProfession
c'est la profession de l'utilisateur
#>

# Definition de la fonction
function information_travailleur {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [Alias("Nom_du_travailleur")]
        [String]$personneNom,
        
        [Parameter(Mandatory=$true)]
        [Alias("age_du_travailleur")]
        [ValidateRange(7,77)]
        [Int]$personneAge,

        [Parameter(Mandatory=$true)]
        [Alias("entrprise_du_travailleur)]
        [String]$personneEntrprise,     

        [Parameter(Mandatory=$true)]
        [Alias("profession_du_travailleur)]
        [String]$personneProfession,     
    )

    # message de bienvenue 
    BEGIN {Write-Verbose "Début du script"}
    PROCESS { "Bonjour {0} ! Tu as {1} ans. tu est inscrit au {2} au programme de {3}" -F $personneNom, $personneAge, $personneCollege, $personneProgramme }       
    END {Write-Verbose "Fin du script"}
}

# Appel de la fonction
Get-Help information_du_travailleur
information_travailleur -verbose
