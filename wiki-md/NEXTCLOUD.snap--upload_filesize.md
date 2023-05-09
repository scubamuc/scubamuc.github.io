# Nextcloud.snap -- set upload filesize

Since these Options are managed within the Snap, this is not configurable!

```
sudo snap set nextcloud php.post-max-size=16G 
sudo snap set nextcloud php.upload-max-filesize=16GB
sudo snap set nextcloud php.max-execution-time=3600
```
