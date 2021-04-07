# :six: CI/CD Batch

Ce laboratoire t'apprendra à utiliser les commandes `shell` sous Unix en créant un fichier `entrypoint.sh`, à créer ton propre conteneur `Docker` en créant un fichier `Dockerfile` et t'apprendra les bases du [`CI/CD`](https://en.wikipedia.org/wiki/CI/CD) `Continuous Integration` et `Continuous Delivery` avec le service `github actions` de `github.com`.

Une section [Indices](#fire-indices) est fournie ci-dessous comme documentation d'aide à terminer ce laboratoire.

Tu pourras t'appuyer d'une documentation en ligne pour continuer ce labobratoire en améliorant le fichier `Dockerfile` avec le [cours en ligne suivant](https://www.linkedin.com/learning/docker-essential-training-3-image-creation-management-and-registry/analyzing-a-dockerfile)

## :a: :id:

* Créer un répertoire avec votre :id:

* Créer votre fichier `README.md`

```
$ touch README.md
```

[Participation](Participation.md)

## :b: Laboratoire

:one: Écrire les scripts en suivant le laboratoire ci-dessous dans [Github Leaning Lab](https://lab.github.com/CollegeBoreal):

https://lab.github.com/CollegeBoreal/lab-github-actions:-bonjour-monde


:two: Copier votre scripts dans le cours en remplaçant :id: par votre :id: github :octocat: :

https://github.com/:id:/lab-bonjour-github-actions

- [ ] Copier les scripts:

Par example:

  - [ ] Copier le fichier `Dockerfile` dans votre :id: `Boréal` 

  - [ ] Copier le fichier `entrypoint.sh` dans votre :id: `Boréal` 


- [ ] Modifie ton fichier README.md pour plus de documentation


En un mot, récupérer le travail que vous avez fait à travers [Github Leaning Lab](https://lab.github.com/CollegeBoreal) et le mettre dans celui du cours [6.CI-CD](../6.CI-CD)

:three: Amélioration

Le laboratoire vous garantit une note de :five::zero:`%`, ajouter du code en améliorant les scripts embellira la note.

En rappel, pour éxécuter localement son fichier `Dockerfile`, on execute la commande :

`$ docker build --tag b`:id:`:1.0 .`

`$ docker run --tty --env INPUT_MON_NOM="Draman" b`:id:`:1.0`

`Bonjour tout le monde mon nom est Draman`

Pour visualiser les couches images de l'image créée

`% docker image history b`:id:`:1.0`
```
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
a555cf89a1b7        40 seconds ago      /bin/sh -c #(nop)  ENTRYPOINT ["/entrypoint.…   0B                  
4bb76bfb1e74        40 seconds ago      /bin/sh -c chmod +x /entrypoint.sh              65B                 
c010b45de5b3        40 seconds ago      /bin/sh -c #(nop) ADD file:44be7c7e599db7b1d…   65B                 
4e5021d210f6        2 weeks ago         /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B                  
<missing>           2 weeks ago         /bin/sh -c mkdir -p /run/systemd && echo 'do…   7B                  
<missing>           2 weeks ago         /bin/sh -c set -xe   && echo '#!/bin/sh' > /…   745B                
<missing>           2 weeks ago         /bin/sh -c [ -z "$(apt-get indextargets)" ]     987kB               
<missing>           2 weeks ago         /bin/sh -c #(nop) ADD file:594fa35cf803361e6…   63.2MB   
```

# :cl: Github Actions

- [ ] Créer son fichier `manifeste` dans le répertoire ci-dessous qui situe à la racine du cours `INF1089`:

`.github/workflows/`:id:.yaml`

- [ ] Créer son propre flux de travail `workflow`

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

# :fire: Indices 

Tu auras besoin de:

:round_pushpin: créer et manipuler une branche avec `git`:

https://github.com/CollegeBoreal/Tutoriels/tree/master/0.GIT/.branch

:round_pushpin: Créer une demande d'extraction `pull request` par le biais de l'interface web de github: 

https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request#creating-the-pull-request

:round_pushpin: Creér Répertoire Imbriqué

par exemple pour créer `.github/workflows` utilise la commande suivante avec le parametre `-p`:

```
$ mkdir -p .github/workflows
```

# References

https://docs.github.com/en/actions/guides
