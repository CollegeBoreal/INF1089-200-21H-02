<#
.SYNOPSIS
    Ce script est un laboratoire Powershell

.DESCRIPTION
    Ce script est utilisé pour le laboratoire de programmation en Powershell.

.NOTES
    Author: zoureni
    Derniere mise à jour: 2021-03-21

.PARAMETER personneNom
c'est le nom de l'utilisateur

.PARAMETER personneAge
c'est l'âge de l'utilisateur

.PARAMETER personneCollege
c'est le collège l'utilisateur fréquente

.PARAMETER personneProgramme
c'est le programme d'étude de l'utilisateur
#>

# Definition de la fonction
function information_etudiant 
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [Alias("Nom_d'étudiant")]
        [String]$personneNom,

        [Parameter(Mandatory=$true )]
        [Alias("age_d'étudiant")]
        [ValidateRange(12,99)]
        [Int]$personneAge,

        [Parameter(Mandatory=$true)]
        [Alias("college_d'étudiant")]
        [String]$personneCollege,

        [Parameter(Mandatory=$true)]
        [Alias("programme_d'étudiant")]
        [String]$personneProgramme     
    )

    # message de bienvenue 
    BEGIN {Write-Verbose "Début du script"}
    PROCESS { "Bonjour {0} ! Tu as {1} ans. tu est inscrit au {2} au programme de {3}" -F $personneNom, $personneAge, $personneCollege, $personneProgramme }       
    END {Write-Verbose "Fin du script"}
}

# Appel de la fonction
Get-Help information_etudiant
information_etudiant -verbose
