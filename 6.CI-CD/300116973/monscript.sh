 #!/bin/sh

      affiche()
      {
      local local_var=100
      global_var=blessen
      echo "La variable locale est $local_var"
      echo "La variable globale est $global_var"
      }

      echo "======================"
      affiche
      echo "======= dehors ========"
      echo "La variable locale en dehors de la fonction est $local_var"
      echo "La variable globale en dehors de la fonction est $global_var"
    
