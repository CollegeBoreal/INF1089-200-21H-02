# Lab github-actions: Bonjour Monde 💜

## :a: :id:

* Créer un répertoire avec votre :id:

* Créer votre fichier `README.md`

```
$ touch README.md
```


## :b: Laboratoire

:one: Écrire les scripts en suivant le laboratoire ci-dessous dans [Github Leaning Lab](https://lab.github.com/CollegeBoreal):

https://lab.github.com/CollegeBoreal/lab-github-actions:-bonjour-monde


:two: Copier votre scripts dans le cours en remplaçant :id: par votre :id: github :octocat: :

https://github.com/fadde68/lab-bonjour-github-actions

- [✔] Copier les scripts:

Par example:

  - [✔] Copier le fichier `Dockerfile` dans votre :id: `Boréal` 

  - [✔] Copier le fichier `entrypoint.sh` dans votre :id: `Boréal` 


- [✔] Modifie ton fichier README.md pour plus de documentation



## :c: Amélioration

Le laboratoire vous garantit une note de :five::zero:`%`, ajouter du code en améliorant les scripts embellira la note.

Pour éxécuter localement son fichier `Dockerfile`, on execute la commande :

```
$ docker build --tag b300115065:1.0 .

Sending build context to Docker daemon   5.12kB
Step 1/4 : FROM debian:9.5-slim
 ---> 4b4471f624dc
Step 2/4 : ADD entrypoint.sh /entrypoint.sh
 ---> Using cache
 ---> 1e8e10a051f4
Step 3/4 : RUN chmod +x /entrypoint.sh
 ---> Using cache
 ---> 51bc64de21ce
Step 4/4 : ENTRYPOINT ["/entrypoint.sh"]
 ---> Using cache
 ---> 919d27ebcbf5
Successfully built 919d27ebcbf5
Successfully tagged b300115065:1.0

```

`$ docker run --tty --env INPUT_MON_NOM="abdel" b300115065:1.0`

`Bonjour tout le monde mon nom est abdel`

Pour visualiser les couches images de l'image créée

```
$ docker image history b300115065:1.0
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
919d27ebcbf5        2 months ago        /bin/sh -c #(nop)  ENTRYPOINT ["/entrypoint.…   0B             
51bc64de21ce        2 months ago        /bin/sh -c chmod +x /entrypoint.sh              79B            
1e8e10a051f4        2 months ago        /bin/sh -c #(nop) ADD file:c63a97c860b6e940d…   79B            
4b4471f624dc        2 years ago         /bin/sh -c #(nop)  CMD ["bash"]                 0B             
<missing>           2 years ago         /bin/sh -c #(nop) ADD file:f8f26d117bc4a9289…   55.3MB            
```

# :cl: Github Actions

- [ ] Créer son fichier `manifeste` dans le répertoire ci-dessous qui situe à la racine du cours `INF1089`:

`.github/workflows/`:id:`.yaml`

- [ ] Créer son propre flux de travail `workflow` en modifiant le fichier ci-dessous

```yaml
name: MON-NOM-MON-ID-CHANGEZ-MOI-VITE

on: [push]

jobs:
  mon-super-script-que-je-suis-suppose-changer:
    name: Le script CI-CD de mon humble personne
    runs-on: ubuntu-latest
    steps:
      # Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
      - uses: actions/checkout@v2

      - shell: bash
        run: |
          git pull
          cd 6.CI-CD
          bash MON-ID/entrypoint.sh

      - name: Commit files
        run: |
          git config user.name github-actions
          git config user.email github-actions@github.com
          git add .
          git commit -m "CECI PROUVE QUE JE NE LIS PAS L'ENONCE"
          git push
```

:ab: Modifier le script `entrypoint.sh` ou son propre script 

- [ ] Changer le script pour qu'il genere un fichier texte qui change de valeur à chaque `commit`
- [ ] par exemple, imprimer l'heure
- [ ] par example, incrementer un chiffre


