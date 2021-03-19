<#
.SYNOPSIS
    Ce script est une laboratoire Powershell
.DESCRIPTION
    Ce script est utilisÃ© pour le laboratoire de programmation en Powershell.
.NOTES
    Author: wilfridboris
    Derniere mise Ã  jour: yyyy-mm-dd
#>
$villes = "Toronto","Mississauga","Scarborough","Brampton"
for ($i = 0; $i -le $villes.Count; $i = $i + 1) {
    $villes[$i]
}

Clear-Host
"0"-F ($villes.Count % 2)

[String]$personneNom = "Alice"
[int]$personneAge = 35
Write-Host " hi bonjour $personneNom,tu as $personneAge ans."
# Test sur l'age de la personne
switch ($personneAge) {
    {$_ -le 25} {Write-Host 'en pleine jeunesse'; break }
    {$_ -le 35} {Write-Host 'en pleine force vive'; break }
    {$_ -le 45} {Write-Host 'en pleine maturité'; break }
    Default {Write-Host 'en pleine serénité'}
