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
$ clusterfiles

# prints help
```

## Quickstart


```sh
$ clusterfiles setup

# sets up asdf
# installs asdf plugins for k3sup, flux2
# installs k3sup and flux2 cli tools locally

$ clusterfiles master masternode.hostname username sshkeypath
# connects to masternode.hostname via ssh with username and sshkeypath
# installs k3s as master node
# retrieves kubeconfig and stores it locally as kubeconfig-masternode.hostname

$ clusterfiles join workernode.hostname username sshkeypath
# connects to masternode.hostname via ssh with username and sshkeypath
# installs k3s as worker agent
# retrieves kubeconfig and stores it locally as kubeconfig-workernode-hostname

$ clusterfiles bootstrap ssh://git@github.com/owner/repo.git
# time passes, logs spam
```
