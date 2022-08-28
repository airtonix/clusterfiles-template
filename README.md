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

$ clusterfiles provision master masternode username sshkeypath
# time passes, logs spam

$ clusterfiles provision slave workernode1 username sshkeypath
# time passes, logs spam
```
