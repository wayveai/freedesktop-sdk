kind: myautotools

depends:
  - filename: base-stack.bst
  - filename: desktop/json-glib.bst
  - filename: desktop/libsoup.bst

variables:
  conf-extra: |
    --disable-3g-source \
    --disable-cdma-source \
    --disable-modem-gps-source \
    --disable-nmea-source

sources:
  - kind: tar
    url: https://www.freedesktop.org/software/geoclue/releases/2.4/geoclue-2.4.7.tar.xz
    ref: d17b96bb5799a84723385ea5704235565e9c3dedd2b7afac475a06e550ae0ea6
