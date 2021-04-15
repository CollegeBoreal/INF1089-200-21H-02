#!/bin/sh

# --------------------------------------
#
#
#
# --------------------------------------

source ../.scripts/students.sh --source-only

   
echo "# Participation au `date +"%d-%m-%Y %H:%M"`"
echo ""


echo "| Table des matières            | Description                                             |"
echo "|-------------------------------|---------------------------------------------------------|"
echo "| :a: [Présence](#a-présence)   | L'étudiant.e a fait son travail    :heavy_check_mark:   |"
echo "| :b: [Précision](#b-précision) | L'étudiant.e a réussi son travail  :tada:               |"

echo ""
echo "## Légende"
echo ""

echo "| Signe              | Signification                 |"
echo "|--------------------|-------------------------------|"
echo "| :heavy_check_mark: | Prêt à être corrigé           |"
echo "| :x:                | Projet inexistant             |"


echo ""
echo "## :a: Présence"
echo ""
echo "|:hash:| Boréal :id:                | b:id:-fonction.ps1 | b:id:-structure.ps1 |:octocat: URL |"
echo "|------|----------------------------|--------------------|---------------------|--|"

i=0
OK=":white_check_mark:"
KO=":x:"

for id in "${ETUDIANTS[@]}"
do
   VALUE="| ${i} | ${id} - <image src='https://avatars0.githubusercontent.com/u/${AVATARS[$i]}?s=460&v=4' width=20 height=20></image> |"

   FONCTION=${id}/b${id}-fonction.ps1
   if [ -f "$FONCTION" ]; then
       VALUE="${VALUE} [${OK} b${id}-fonction.ps1](../${FONCTION}) |"
   else
       VALUE="${VALUE} ${KO} |"
   fi

   STRUCTURE=${id}/b${id}-structure.ps1
   if [ -f "$STRUCTURE" ]; then
       VALUE="${VALUE} [${OK} b${id}-structure.ps1](../${STRUCTURE}) |"
   else
       VALUE="${VALUE} ${KO} |"
   fi

   URL="https://github.com/${GITHUBS[$i]}/lab-programmation-script-powershell"
   curl -s ${URL} | grep "404 &ldquo;This is not the web page you are looking for&rdquo;" 2> /dev/null 1> /dev/null
   RESULT=$?
   if [ $RESULT==0 ]; then
       VALUE="${VALUE} [${GITHUBS[$i]}](${URL}) |"
   else
       VALUE="${VALUE} ${KO} |"
   fi

   echo ${VALUE}
   let "i++"
done
