# :one:.Journal


https://www.loggly.com/ultimate-guide/using-journalctl/

https://www.linkedin.com/learning/cert-prep-comptia-linux-plus-xko-004/locate-and-interpret-system-log-files

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
La liste de démarrages

```
$ journalctl --list-boots
```

## :m: Time Ranges

```
$ journalctl --since "1 hour ago"
```

```
$ journalctl --since "2 days ago"
```

```
$ journalctl --since "2015-06-26 23:15:00" --until "2015-06-26 23:20:00"
```

## :m: By Unit

```
$ journalctl --unit nginx.service
```

```
$ journalctl --unit nginx.service --unit mysql.service
```

## :m: Filtering

```
$ journalctl --boot --grep ACPI
```

avec `grep` et `awk`

```
$ journalctl --grep sshd --grep open  | awk '{print $1 " " $2 " " $3}'
```
