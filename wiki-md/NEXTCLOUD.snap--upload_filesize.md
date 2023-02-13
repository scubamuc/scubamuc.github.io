# Nextcloud.snap -- set upload filesize

Since snap manages the app, one is not able to directly commit changes, it has to do through snap itself. Given the options and commands available in this app, one can just replace underscores with dashes after php in the name of the parameter, like:

```
php.upload-max-filesize
php.post-max-size
php.max-input-time
php.max-execution-time
```

And then for the upload size:

```
sudo snap set nextcloud php.post-max-size=16G 
sudo snap set nextcloud php.upload-max-filesize=16GB
sudo snap set nextcloud php.max-execution-time=3600
```
