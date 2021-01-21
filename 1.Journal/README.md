# :one:.Journal


https://www.loggly.com/ultimate-guide/using-journalctl/

## :a: Journalisation

```
$ journalctl -b
```



Journalctl splits the results into pages, similar to the less command in Linux. You can navigate using the arrow keys, the Page Up/Page Down keys, and the space bar. To quit navigation, press the Q key.


## :m: Boot Messages

Journalisation de démarrage

```
$ journalctl -b
```

Dernière journalisation de démarrage

```
$ journalctl -b -1
```
