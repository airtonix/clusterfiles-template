# Clusterfiles

homeserver configuration.

Uses [`asdf`](https://github.com/asdf-vm/asdf), [`k3sup`](k3sup)  and [`flux2`](https://fluxcd.io/) to provision and keep a home cluster updated and running.

## Requirements

- `git`
- `bash` or `zsh`
- linux os installed on network connected hardware
- [your username setup on the remote hosts](https://github.com/alexellis/k3sup/issues/298) with `%wheel  ALL=(ALL)       NOPASSWD: ALL`
- A github personal access token with `repo` scope stored on your workstation under the environment variable `GITHUB_TOKEN`


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


## Troubleshooting

### Flux hangs on waiting for reconciliation

```
◎ waiting for Kustomization "flux-system/flux-system" to be reconciled
```

Possible issues:
- dns queries unable to be resolved

Confirmations:

```
$ kubectl run -it --rm --restart=Never busybox --image=busybox:1.28 -- nslookup google.com
```

Should output something like:

```
If you don't see a command prompt, try pressing enter.
Name:      google.com
Address 1: 2404:6800:4015:803::200e mel05s02-in-x0e.1e100.net
Address 2: 142.250.66.206 syd09s23-in-f14.1e100.net
pod "busybox" deleted
```

if instead you get

```
If you don't see a command prompt, try pressing enter.
nslookup: can't resolve 'google.com'
pod "busybox" deleted
pod default/busybox terminated (Error)
```

Then most likely, we need to disable firewall (or ideally allow traffic from the k3s subnet):

```
$ ssh node
$ iptables --flush && \
iptables -tnat --flush && \
systemctl stop firewalld && \
systemctl disable firewalld && \
systemctl restart docker
```
