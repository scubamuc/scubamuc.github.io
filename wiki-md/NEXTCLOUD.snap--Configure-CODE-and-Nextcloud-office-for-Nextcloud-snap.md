# Collabora Online - Built-in CODE Server and Nextcloud office for Nextcloud snap

We do not maintain third party apps and thus we can't fix anything within them to make them work, nor do we have the manpower to do so.
Built-in CODE Server and Nextcloud office are third party apps which may need individual configuration for your scenario. We **cannot support** every scenario so you may need to do some research for your personal setup.

The following configurations were tested on a fresh Ubuntu Server 22.04 LTS for for x86_64 processor and Nextcloud snap `latest/stable` considering two scenarios:

> - The Nextcloud snap handles SSL itself and is accessed directly via https and port forwarding without a reverse proxy or local DNS.
> - The Nextcloud snap is behind a reverse proxy which handles SSL and redirects only http to the Nextcloud snap.

### 1\. Install missing packages

Install missing packages on host:

```
sudo apt install fontconfig glibc-source libfuse2
```

### 2\. Set Hostname

Set host in `/etc/hosts` on host, see [**Hosts & FQDN**](https://github.com/nextcloud-snap/nextcloud-snap/wiki/Hosts-and-FQDN-for-Nextcloud-snap)

Example:

```
127.0.0.1       localhost
127.0.1.1       your.domain.xyz hostname

## The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
```

### 3\. Set overwrite-cli in Config-php

Set `overwrite.cli.url` in [config-php](https://github.com/nextcloud-snap/nextcloud-snap/wiki/Configure-config.php) by adding the following line to your configuration:

```
  'overwrite.cli.url' => 'https://your.domain.xyz',
```

or issue command:

```
sudo nextcloud.occ config:system:set overwrite.cli.url --value="https://your.domain.xyz"
```

### 4\. Set trusted proxy in Config-php

Set [trusted proxy](https://github.com/nextcloud-snap/nextcloud-snap/wiki/Configure-config.php#setting-trusted-proxies) in [config-php](https://github.com/nextcloud-snap/nextcloud-snap/wiki/Configure-config.php) if your Nextcloud snap is behind a reverse proxy.

```
  'trusted_proxies' => 
    array (
      0 => 'your.proxy.ip',
     ),
```

or issue command:

```
sudo nextcloud.occ config:system:set trusted_proxies 0 --value="your.proxy.ip" ;
```

### 5\. Configure CODE

**5a.** Configure CODE & Office for Nextcloud snap on **AMD64**: \
These steps (in sequence) are required to reconfigure/reset and configure CODE & Nextcloud office on Nextcloud snap.

1. **disable CODE**: `sudo nextcloud.occ app:disable richdocumentscode`
2. **disable Office**: `sudo nextcloud.occ app:disable richdocuments`
3. **delete configs**: `sudo nextcloud.occ config:app:delete richdocuments public_wopi_url`
4. **delete configs**: `sudo nextcloud.occ config:app:delete richdocuments wopi_url`
5. **enable Office**: `sudo nextcloud.occ app:enable richdocuments`
6. **enable CODE**: `sudo nextcloud.occ app:enable richdocumentscode`

**5b.** Configure CODE & Office for Nextcloud snap on **ARM64**: \
These steps (in sequence) are required to reconfigure/reset and configure CODE & Nextcloud office on Nextcloud snap.

1. **disable CODE**: `sudo nextcloud.occ app:disable richdocumentscode_arm64`
2. **disable Office**: `sudo nextcloud.occ app:disable richdocuments`
3. **delete configs**: `sudo nextcloud.occ config:app:delete richdocuments public_wopi_url`
4. **delete configs**: `sudo nextcloud.occ config:app:delete richdocuments wopi_url`
5. **enable Office**: `sudo nextcloud.occ app:enable richdocuments`
6. **enable CODE**: `sudo nextcloud.occ app:enable richdocumentscode_arm64`

You should get a green check if you've followed the above sequence for your device.

![grafik](https://github.com/nextcloud-snap/nextcloud-snap/assets/54933878/c89e641d-ec54-4081-8e2d-7841b3b86072)

---

## Troubleshooting

**Your documents are not loading?**

<img src="https://github.com/nextcloud-snap/nextcloud-snap/assets/54933878/8afc6365-07e8-4ad4-b81b-9fd4fa9de0c9" alt="Your image title" width="250"/>

- Loading CODE after fresh install, app upgrade or after server restart may **take a while**, so be patient. See [here](https://github.com/CollaboraOnline/richdocumentscode#implementation)
- Double check steps **1** to **4**
- For **ARM64** devices: There is an actual upstream issue with ARM64 devices since v23.5.5. \
  Keep tracking and help with providing your system and setup information [here](https://github.com/CollaboraOnline/richdocumentscode/issues/226)

---

See also:

* [**Hosts and FQDN**](https://github.com/nextcloud-snap/nextcloud-snap/wiki/Hosts-and-FQDN-for-Nextcloud-snap)
* [**HTTP and HTTPS port configuration**](https://github.com/nextcloud-snap/nextcloud-snap/wiki/Port-configuration#http-and-https-port-configuration)
* [**Putting Nextcloud snap behind a reverse proxy**](https://github.com/nextcloud-snap/nextcloud-snap/wiki/Putting-the-snap-behind-a-reverse-proxy)
* [**Let reverse proxy handle encryption**](https://github.com/nextcloud-snap/nextcloud-snap/wiki/NGINX-proxy-manager)
