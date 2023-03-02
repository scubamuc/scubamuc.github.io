# Nextcloud-snap security & setup warning

## Imagick PHP module not enabled

This warning is only that, a warning.

![grafik](https://user-images.githubusercontent.com/54933878/222382272-e264ee39-f632-464a-a112-1d4d2f816afa.png)

The Nextcloud-snap does not ship the Imagick PHP module as imagick is a security concern.

> I'm afraid imagick is a security concern, and as such isn't enabled on purpose. You see this warning if you enable the theming app, because the theming app uses it to generate favicons. As a result, that particular feature (favicon generation) isn't possible while using the snap.
