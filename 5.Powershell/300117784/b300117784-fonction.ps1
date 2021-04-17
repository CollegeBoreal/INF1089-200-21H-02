# Definition de la fonction
function Etudiant {
<#
.SYNOPSIS
    Prend 2 valuers le Nom et id
.DESCRIPTION
    Ce script contient une fonction étudiant qui prend le nom et id.
.EXAMPLE
   Nom:votre nom
   Id:votre id
#>
[CmdletBinding()]
param (
        [Parameter(Mandatory=$true)]
        [ValidateLength(3,10)]
        [string]$Nom,
        [Parameter(Mandatory=$true)]
        [ValidateLength(1,9)]
        [string]$Id
       
    )

    
   
 BEGIN {Write-Verbose "Début du script"}
 PROCESS { "Bienvenue {0} ! Votre id est  {1} ." -F $Nom, $Id}
 END {Write-Verbose "Fin du script"}


}

Etudiant
