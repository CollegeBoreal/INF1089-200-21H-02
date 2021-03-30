Add-Type -AssemblyName System.Windows.Forms

$PathDesktop = 'C:' + $env:HOMEPATH + '\Desktop'
$ContactOU = 'OU=Contacts,OU=Utilisateurs,DC=contoso,DC=local'
$DomainController = 'DomainController1'

function Select-FileDialog
{
	[CmdletBinding()]
	param ([string]$Title,
		[string]$Filter = 'All files *.*|*.*')
	Add-Type -AssemblyName System.Windows.Forms | Out-Null
	$fileDialogBox = New-Object -TypeName Windows.Forms.OpenFileDialog
	$fileDialogBox.ShowHelp = $false
	$fileDialogBox.initialDirectory = $PathDesktop
	$fileDialogBox.filter = $Filter
	$fileDialogBox.Title = $Title
	$Show = $fileDialogBox.ShowDialog()
	
	if ($Show -eq 'OK')
	{
		Return $fileDialogBox.FileName
	}
	Else
	{
		Write-Error -Message 'Op�ration annul�e'
		[Windows.Forms.MessageBox]::Show("Le script n'est pas en mesure de continuer. Op�ration stopp�e.", 'Op�ration stopp�e', 0, [Windows.Forms.MessageBoxIcon]::Error)
		Stop-TranscriptOnLog
		Exit
	}
}

# Disclaimer
$Disclaimer = [Windows.Forms.MessageBox]::Show(
	"
Ce script a pour but de rajouter des contacts dans l'Active Directory.
Pour cela, il injecte des donn�es venant d'un fichier .csv.
									/!\ Attention /!\
Si vous n'�tes pas s�r des actions � mener ou de l'impact, quitter ce script d�s � pr�sent.
Souhaitez-vous continuer ?
", "Active Directory - Ajout de contact", 1, [Windows.Forms.MessageBoxIcon]::Question)
If ($Disclaimer -eq "OK")
{
	Write-Host 'Patientez, traitement en cours ...'
}
Else
{
	Write-Error -Message 'Op�ration annul�e'
	[Windows.Forms.MessageBox]::Show("Le script n'est pas en mesure de continuer. Op�ration stopp�e.", 'Op�ration stopp�e', 0, [Windows.Forms.MessageBoxIcon]::Error)
	Stop-TranscriptOnLog
	Exit
}

Import-Module ActiveDirectory

##region Import information coming from input .CSV file
# Import CSV file
[Windows.Forms.MessageBox]::Show(
	"
S�lectionner dans cette fen�tre le fichier contenant :
  - Le 'Pr�nom' du contact � cr�er
  - Le 'Nom' du contact � cr�er ()
  - L'adresse e-mail du contact � cr�er
  
Le fichier doit �tre de la forme suivante :
Pr�nom	NOM	Mail
John	DOE	john.doe@dom.com
Jane	ROE	jane.roe@dom.com
", "Office 365 - Ajout de contact", 0, [Windows.Forms.MessageBoxIcon]::Question)

# Import list of users and related sharedmailbox and rights
$CSVInputFile = Select-FileDialog -Title 'Select CSV file' -Filter 'Fichier CSV (*.csv) |*.csv'
$csvValues = Import-Csv $CSVInputFile -Delimiter ';'
#endregion Import information coming from input .CSV file

#region Apply modification
$csvValues|ForEach-Object{

	New-ADUser `
        -Name $($_.FirstName + " " + $_.LastName) `
        -GivenName $_.FirstName `
        -Surname $_.LastName `
        -Department $_.Department `
        -State $_.State `
        -EmployeeID $_.EmployeeID `
        -DisplayName $($_.FirstName + " " + $_.LastName) `
        -Office $_.Office `
        -UserPrincipalName $_.UserPrincipalName `
        -SamAccountName $_.SamAccountName `
        -AccountPassword $( ConvertTo-SecureString $_.Password -AsPlainText -Force ) `
        -Enabled $True

        $user=$($_.FirstName + " " + $_.LastName)
        Write-Host "creation of $user..."
        Start-Sleep -Seconds 5
       

    
	
}
#endregion Apply modification

#region Show MessageBox to confirm action
[Windows.Forms.MessageBox]::Show(
	"Action men�e avec succ�s.
", "ActiveDirectory - Ajout de contact", 0, [Windows.Forms.MessageBoxIcon]::Information)
#endregion Show MessageBox to confirm action