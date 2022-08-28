# Clusterfiles

homeserver configuration

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
