# :one:.Journal


https://www.loggly.com/ultimate-guide/using-journalctl/

## :a: Journalisation

```
$ journalctl
```



Journalctl splits the results into pages, similar to the less command in Linux. You can navigate using the arrow keys, the Page Up/Page Down keys, and the space bar. To quit navigation, press the Q key.


## :m: Boot Messages

Journalisation de démarrage

```
$ journalctl --boot
```

You can view messages from an earlier boot by passing in its offset from the current boot. For example, the previous boot has an offset of -1, the boot before that is -2, and so on.

Dernière journalisation de démarrage

```
$ journalctl -b -1
```
