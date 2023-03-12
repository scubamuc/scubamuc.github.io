# Enable LetsEncrypt in Nextcloud-snap

Enable LetsEncrypt for Nextcloud-snap:

```
sudo nextcloud.enable-https lets-encrypt
```

Enter email address and domain/subdomain

# Disable LetsEncrypt in Nextcloud-snap

Disable LetsEncrypt for Nextcloud-snap:

```
sudo nextcloud.disable-https lets-encrypt
```

## Disable renew service in Nextcloud-snap
Due to a sanpd [issue](https://forum.snapcraft.io/t/cant-mask-or-disable-snap-services-why-etc-systemd-instead-of-lib-systemd/33385) it may be necessary to disable the renewal-service manually.

`sudo snap stop --disable $SERVICE`

Example:

`sudo snap stop --disable nextcloud.renew-certs`

## Check renew service in Nextcloud-snap

Renew service `renew-certs.service` is automated in Nextcloud-snap.

Check renewal by issuing:

```
sudo journalctl -u snap.nextcloud.renew-certs.service
```

# Self signed certificate in Nextcloud-snap

Enable self signed certificate:

```
sudo /snap/bin/nextcloud.enable-https self-signed
```

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

# LetsEncrypt Log

View letsencrypt log in Netxtcloud-snap:

```
sudo cat /var/snap/nextcloud/current/certs/certbot/logs/letsencrypt.log
```

# Reverse proxy for LetsEncrypt 
Handle certificates with [reverse Proxy](https://github.com/nextcloud-snap/nextcloud-snap/wiki/Putting-the-snap-behind-a-reverse-proxy) or [NGINX-Proxy-Manager](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/NEXTCLOUD.snap--NGINX_Proxy_Settings.md#nginx-proxy-manager)
