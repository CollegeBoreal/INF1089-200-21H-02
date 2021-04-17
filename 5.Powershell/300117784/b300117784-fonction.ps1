# Definition de la fonction
function Etudiant {
<#
.SYNOPSIS
    Prend 2 valuers le Nom et id
.DESCRIPTION
    Ce script contient une fonction étudiant qui prend le nom et id.
.EXAMPLE
   personneNom:votre nom
   personneId:votre id
#>
[CmdletBinding()]
param (
        [Parameter(Mandatory=$true)]
        [ValidateLength(3,10)]
        [string]$personneNom,
        [Parameter(Mandatory=$true)]
        [ValidateLength(9)]
        [string]$personneId
       
    )

    
   
 BEGIN {Write-Verbose "Début du script"}
 PROCESS { "Bienvenue {0} ! Votre id est  {1} ." -F $personneNom, $personneId}
 END {Write-Verbose "Fin du script"}


}

Etudiant
