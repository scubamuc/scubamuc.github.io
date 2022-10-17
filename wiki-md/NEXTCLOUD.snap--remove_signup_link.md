# Remove signup link

requires a new line in the standard config file under

\
`/var/snap/nextcloud/current/nextcloud/config/config.php`

which includes

\
`'simpleSignUpLink.shown' => false,`