#!/bin/sh
 
cmpt=1
cm=3
echo -n "Mot de passe : "
read mdp
 
while [ "$mdp" != "ubuntu" ] && [ "$cmpt" != 4 ]
do
     echo -n "Mauvais mot de passe, plus que "$cm" chance(s): "
     read mdp
     cmpt=$(($cmpt+1))
     cm=$(($cm-1))
done
echo "Non mais, le brute-force est interdit en France !!"
