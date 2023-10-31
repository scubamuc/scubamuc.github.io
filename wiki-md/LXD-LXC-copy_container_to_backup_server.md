# Syncronise/Copy containers between LXD servers

Assuming you have two identical servers **LXD1** and **LXD2**. Both servers should be known to eachother by adding them to remotes respectively.

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

Example script:

```
#!/bin/bash
##############################################################
## Syncronise/copy containers from LXD1 to LXD2 server
##############################################################
#copy container1
  lxc copy CONTAINER1 LXD-BACKUP: --stateless --refresh ;
#copy container2
  lxc copy CONTAINER2 LXD-BACKUP: --stateless --refresh ;
exit
```
