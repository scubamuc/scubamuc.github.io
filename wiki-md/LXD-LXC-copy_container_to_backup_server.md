# Syncronise/Copy containers between LXD nodes

If an LXD-cluster with three nodes is overkill for you, failover can easily be scripted and works fine with two nodes even if the second node is a cold standby system. The only thing you'll have to look out for is regular container syncronisation. Note also, the snapshots belong to the container and are syncronised too.

One caveat of this model is that the controller node holding the primary database is not present. Always ensure that the syncronised containers on the secondary node are stopped as the containers have the same IP's as those the primary node which causes network issues.

Assuming you have two identical servers **LXD1** (primary LXD-server) and **LXD2** (secondary LXD-backup). Both servers should be known to eachother by adding them to remotes respectively. Needless to say that passwordless SSH between both servers should be available.

#### On production **LXD1** server

Check remote servers:

```
lxc remote list
```

Add remote server:

```
lxc remote add LXD2 <ip.address.of.server>:8443
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
##############################################################
## Syncronise/copy containers from LXD1 to LXD2 server
##############################################################
## Stop all containers on backup-server
  ssh <ip.address.of.LXD2> 'lxc stop --all'
#copy container1
  lxc copy CONTAINER1 LXD2: --stateless --refresh ;
#copy container2
  lxc copy CONTAINER2 LXD2: --stateless --refresh ;
exit
```
