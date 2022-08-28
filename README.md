# Clusterfiles

homeserver configuration.

Uses [`asdf`](https://github.com/asdf-vm/asdf), [`k3sup`](k3sup)  and [`flux2`](https://fluxcd.io/) to provision and keep a home cluster updated and running.

## Requirements

- `git`
- `bash` or `zsh`
- linux os installed on network connected hardware
- [your username setup on the remote hosts](https://github.com/alexellis/k3sup/issues/298) with `%wheel  ALL=(ALL)       NOPASSWD: ALL`


## Gettings started

```sh
$ curl -L https://raw.github.com/airtonix/clusterfiles/master/pull.sh | sh
```

Now reload your shell

```sh
$ clusterfiles help
```

## Quickstart


```sh
$ clusterfiles setup
# time passes

$ clusterfiles master masternode username sshkeypath
# time passes, logs spam

$ clusterfiles join workernode username sshkeypath
# time passes, logs spam

$ clusterfiles bootstrap
# time passes, logs spam
```
