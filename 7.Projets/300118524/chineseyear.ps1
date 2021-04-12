param(
	[parameter( Mandatory = $true, HelpMessage = "Entrer une année entre 1900 et 2100:" )]
	[ValidateRange(1900,2100)]
	[int]$mon_annee
)
 
$noms = "Rat","Boeuf (ou Buffle)","Tigre","Lievre (ou Chat ou Lapin)","Dragon","Serpent","Cheval","Chèvre (ou Bouc)","Singe","coq","chien","Cochon (ou Sanglier)"
 
Write-Host $myYear -ForegroundColor White -NoNewline
if ( $mon_annee -lt ( Get-Date ).Year ) {
	Write-Host " était" -NoNewline
} elseif ( $mon_annee -gt ( Get-Date ).Year ) {
	Write-Host " serait" -NoNewline
} else {
	Write-Host " est" -NoNewline
}
Write-Host " l'annee de / du " -NoNewline
Write-Host $noms[ ( $mon_annee - 1900 ) % 12 ] -ForegroundColor Green
