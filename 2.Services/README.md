# Création d'un service sous Linux

## Vector

[What is vector?](https://vector.dev/docs/about/what-is-vector/)


### :gear: Installation 

:round_pushpin: avec un [`Package Manager`](https://vector.dev/docs/setup/installation/package-managers) `apt`

- [ ] Installer le référentiel de `vector`

```
$ curl -1sLf \
  'https://repositories.timber.io/public/vector/cfg/setup/bash.deb.sh' \
  | sudo -E bash
```

- [ ] Installer `vector`

```
$ sudo apt-get install vector
```

- [ ] Installer le fichier de configuration

* passer en mode super utilisateur

```
$ sudo su -
```

* installer le fichier [toml](https://en.wikipedia.org/wiki/TOML)

https://vector.dev/docs/reference/sinks/kafka/

```toml

$ cat << EOF > /etc/vector/vector.toml
# Vector's API for introspection
[api]
enabled = true
address = "10.13.237.9:8686"

# Host-level logs
[sources.logs]
type = "journald"

# --> Add transforms here to parse, enrich, and process data

# print all events, replace this with your desired sink(s)
# https://vector.dev/docs/reference/sinks/
[sinks.kafka]
  # General
  type = "kafka" # required
  inputs = [ "logs" ]
  bootstrap_servers = "10.13.237.9:9092" # required
  compression = "none" # optional, default
  key_field = "" # required
  topic = "topic-journald" # required

  # Batch

  # Encoding
  encoding.codec = "json" # required
EOF
```

## :b: redémarrer le service

```
$ sudo systemctl restart vector
```

* Observer le résultat

```
$ sudo journalctl --unit vector --follow
```

* Observer le résultat

http://10.13.237.9:8686/playground

## :ab: Analyse des services

https://www.techrepublic.com/article/how-to-analyze-systemd-boot-performance/

```
$ systemd-analyze critical-chain 
The time after the unit is active or started is printed after the "@" character.
The time the unit takes to start is printed after the "+" character.

graphical.target @17.784s
└─multi-user.target @17.783s
  └─docker.service @6.377s +11.403s
    └─containerd.service @6.240s +117ms
      └─network.target @6.228s
        └─wpa_supplicant.service @5.562s +637ms
          └─dbus.service @5.529s
            └─basic.target @5.462s
              └─sockets.target @5.462s
                └─docker.socket @5.450s +10ms
                  └─sysinit.target @5.433s
                    └─sys-fs-fuse-connections.mount @15.157s +24ms
                      └─systemd-modules-load.service @1.293s +171ms
                        └─systemd-journald.socket @1.246s
                          └─-.mount @1.206s
                            └─systemd-journald.socket @1.246s
                              └─...
```

```
$ pstree
systemd─┬─alsactl
        ├─avahi-daemon───avahi-daemon
        ├─bluealsa───3*[{bluealsa}]
        ├─bluetoothd
        ├─containerd───14*[{containerd}]
        ├─cron
        ├─dbus-daemon
        ├─dhcpcd
        ├─dockerd───13*[{dockerd}]
        ├─hciattach
        ├─lightdm─┬─Xorg───5*[{Xorg}]
        │         ├─lightdm─┬─lxsession─┬─lxpanel─┬─sh
        │         │         │           │         └─3*[{lxpanel}]
        │         │         │           ├─lxpolkit───2*[{lxpolkit}]
        │         │         │           ├─openbox
        │         │         │           ├─pcmanfm───2*[{pcmanfm}]
        │         │         │           ├─ssh-agent
        │         │         │           └─2*[{lxsession}]
        │         │         └─2*[{lightdm}]
        │         └─2*[{lightdm}]
        ├─login───bash
        ├─menu-cached───2*[{menu-cached}]
        ├─ntpd───{ntpd}
        ├─openvpn
        ├─polkitd───2*[{polkitd}]
        ├─rngd───3*[{rngd}]
        ├─rpiplay───12*[{rpiplay}]
        ├─rsyslogd───3*[{rsyslogd}]
        ├─ssh-agent
        ├─sshd─┬─sshd
        │      └─sshd───sshd───bash───pstree
        ├─systemd─┬─(sd-pam)
        │         ├─dbus-daemon
        │         ├─gvfs-afc-volume───3*[{gvfs-afc-volume}]
        │         ├─gvfs-goa-volume───2*[{gvfs-goa-volume}]
        │         ├─gvfs-gphoto2-vo───2*[{gvfs-gphoto2-vo}]
        │         ├─gvfs-mtp-volume───2*[{gvfs-mtp-volume}]
        │         ├─gvfs-udisks2-vo───2*[{gvfs-udisks2-vo}]
        │         ├─gvfsd─┬─gvfsd-trash───2*[{gvfsd-trash}]
        │         │       └─2*[{gvfsd}]
        │         └─gvfsd-fuse───5*[{gvfsd-fuse}]
        ├─systemd-journal
        ├─systemd-logind
        ├─systemd-udevd
        ├─thd
        ├─udisksd───4*[{udisksd}]
        └─2*[wpa_supplicant]
```

## :o: Gestion de services


# Références

https://medium.com/@benmorel/creating-a-linux-service-with-systemd-611b5c8b91d6
