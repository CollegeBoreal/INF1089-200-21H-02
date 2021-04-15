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
echo "|:hash:| Boréal :id:                | `start.ps1`   | `backup.ps1` | `scripts/backup.sql` |"
echo "|------|----------------------------|-------------|--------|------------|"

i=0
OK=":white_check_mark:"
KO=":x:"

for id in "${ETUDIANTS[@]}"
do
   VALUE="| ${i} | ${id} - <image src='https://avatars0.githubusercontent.com/u/${AVATARS[$i]}?s=460&v=4' width=20 height=20></image> |"

   START=${id}/start.ps1
   if [ -f "$START" ]; then
       VALUE="${VALUE} [${OK}](../${START}) |"
   else
       VALUE="${VALUE} ${KO} |"
   fi

   BACKUP=${id}/backup.ps1
   if [ -f "$BACKUP" ]; then
        VALUE="${VALUE} [${OK}](../${BACKUP}) |"
        BACKUP_SQL=${id}/scripts/backup.sql
        if [ -f "$BACKUP_SQL" ]; then
            VALUE="${VALUE} [${OK}](../${BACKUP_SQL}) |"
        else
            VALUE="${VALUE} ${KO} |"
        fi
   else
       VALUE="${VALUE} ${KO} | ${KO} |"
   fi
   echo ${VALUE}
   let "i++"
done
