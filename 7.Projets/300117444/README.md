
## :four_leaf_clover: SCRIPT POUR RANGER VOTRE BUREAU WINDOWS 10 PAR DOSSIER . :four_leaf_clover:
Ce petit script est si pratique quil pourra vous etres utile . Il permet à la fois de s'initier aux opérateurs conditionnels (le code est relativement clair et simple à lire) et à ranger le bureau de Windows 10 dans des dossiers par types de fichier. Si vous voulez tester se code :
# :bowtie: Copiez et collez le code suivant dans une fenêtre de Powershell puis exécutez-le : 

$pathToUse = "C:\Utilisateurs\$env:username\Bureau"
$video = @(
'3g2','3gp','3gpp','asf','avi','divx','f4v',
'flv','h264','ifo','m2ts','m4v','mkv','mod','mov',
'mp4','mpeg','mpg','mswmm','mts','mxf','ogv','rm',
'srt','swf','ts','vep','vob','webm','wlmp','wmv'
)

$spreadsheets = @(
'csv','ods','xls','xlsx'
)

$images = @(
'arw','bmp','cr2','crw','dcm','dds','djvu','djvu',
'dmg','dng','fpx','gif','ico','ithmb','jp2','jpeg',
'jpg','nef','nrw','orf','pcd','pict','png','psd',
'sfw','tga','tif','tiff','webp','xcf'
)

$presentations = @(
'key','odp','pps','ppsx''ppt','pptm','pptx'
)

$docs = @(
'chm','doc','docm','docx','dot','dotx','eml','eps',
'hwp','log','m3u','odt','pages','pdf','pub','rtf',
'sxw','txt','wpd',' wps','xml','xps'
)

$cadFiles = @(
'dwg','dxf'
)

$misc = @(
'bin','cda','dat','dll','exe','isc',
'img','inf','ipa','kmz','lnk','pes',
'ps','rem','torrent','ttf','vcf'
)

$ebooks = @(
'azw','azw3','epub','fb2''lit','lrf','mbp','mobi',
'opf','prc'
)

$web = @(
'css','htm','html','js','json','php'
)

$arcs = @(
'7z','apk','bz2','cbr','gz','gzip','jar','rar',
'tar','tgz','zip','war'
)

$scripts = @(
'bat','cmd','vb','vbs','vbe','js',
'jse','ws','wsf','wsc','wsh','ps1',
'ps1xml','ps2','ps2xml','psc1','psc2','sql'
)

$files = Get-ChildItem -Path $pathToUse
Foreach ($x in $files){
if($docs.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "Documents" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"Documents"
}

elseif($spreadsheets.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "Spreadsheets" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"Spreadsheets"
}

elseif($images.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "Images" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"Images"
}

elseif($presentations.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "Presentations" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"Presentations"
}

elseif($video.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "Videos" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"Videos"
}

elseif($cadFiles.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "CAD Files" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"CAD Files"
}

elseif($misc.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "Misc" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"Misc"
}

elseif($ebooks.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "E-Books" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"E-Books"
}

elseif($web.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "Web" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"Web"
}

elseif($arcs.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "Archives" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"Archives"
}

elseif($scripts.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "Scripts" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"Scripts"
}

elseif($x.Directory){
New-Item -ItemType Directory -Path $pathToUse -Name "Other - misc" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"Other - misc"
}

else{
Write-Host $x
}
}

# Avec quelques petites modifications, vous pourrez creer n'importe quel dossier et rengez tout ce que vous souhaiter dedans sans effort . il suffit de remplacer par exemple 
$NomDuDossier = @(
'csv','ods','xls','xlsx' et mettre l'extention que vous souhaiter dedans pour qu'il aille directement dans le dossier voulu .  
