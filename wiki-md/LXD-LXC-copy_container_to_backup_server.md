# Syncronise/Copy containers between LXD nodes

If an LXD-cluster with three nodes is overkill for you, a cold standby failover can easily be configured and works fine with two nodes. Be sure to configure WOL (Wake on Lan) for the cold standby node and ensure regular (skripted) container syncronisation. Note also, container snapshots on the primary node belong to the container and are syncronised to the secondary node.

One caveat of this model is that the controller node holding the primary database is not present. Thus ensure that the containers on the secondary node are stopped as the syncronised containers have identical IP's as those on the primary node which causes network issues.

Assuming you have two identical servers **LXD1** (primary LXD-server) and **LXD2** (secondary LXD-backup). Both servers should be known to eachother by adding them to remotes respectively. Needless to say that passwordless SSH between both servers should be configured.

#### On production **LXD1** server

Check remote servers:

```
lxc remote list
```

add remote server:

on **LXD1**
```
lxc remote add LXD2 <ip.address.of.server>:8443
```

#### On secondary **LXD2** server

add remote server:

on **LXD2**
```
lxc remote add LXD1 <ip.address.of.server>:8443
```

#### On production **LXD1** server

Copy container to ***LXD2***

```
lxc copy CONTAINER LXD2: --stateless --refresh
```

Check containers on ***LXD2*** server:

```
lxc list LXD2:
```

Copying or syncronising containers between servers can be scripted.
Be sure to *stop* the containers to be syncronised on ***LXD2*** server.

Example script:

```
#!/bin/bash
####################################################################
## Syncronise/copy containers and snapshots from LXD1 to LXD2 server
####################################################################
## Stop all containers on backup-server
  ssh <ip.address.of.LXD2> 'lxc stop --all'
#copy container1
  lxc copy CONTAINER1 LXD2: --stateless --refresh ;
#copy container2
  lxc copy CONTAINER2 LXD2: --stateless --refresh ;
exit
```
