# Copy containers to backup server

Assuming you have a production server **LXD1** and a backup server **LXD2**. Both servers should be known to eachother by adding remote servers respectively.

On production **LXD1** server

Check remote LXC servers:

```
lxc remote list
```

Add remote LXC server:

```
lxc remote add <LXD2> <ip.address.of.server>:8443
```

On production **LXD1** server

Copy container to <***LXD2***\>

```
lxc copy CONTAINER <LXD2>: --stateless --refresh
```

Check containers on ***LXD2*** server:

```
lxc list LXD2:
```