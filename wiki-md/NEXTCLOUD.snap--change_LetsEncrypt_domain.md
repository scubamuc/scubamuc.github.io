# Change Nextcloud Lets Encrypt Domain

1. Disable Lets Encrypt
2. Remove all current Certificates
3. Get new Certificates

* **disable HTTPS** (this just removes a symlink, it doesn’t remove any certs):

```
$ sudo nextcloud.disable-https
```

* **remove all/any certificates** that are there (this includes self-signed certs, Let’s Encrypt certs, everything). Make sure you get this command right, you don’t want to delete anything else in the current/ dir:

```
$ sudo rm -rf /var/snap/nextcloud/current/certs
```

* pretend you’re **enabling HTTPS** for the first time, using only the domains you want:

```
$ sudo nextcloud.enable-https lets-encrypt
```

---

### View lets Encrypt logs:

```
$ sudo journalctl -u snap.nextcloud.renew-certs
```