kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/gtk-doc.bst
- components/systemd.bst

depends:
- components/glib.bst
- components/libgudev.bst

variables:
  conf-local: >-
    --disable-gtk-tests
    --disable-Werror

sources:
- kind: git_tag
  url: freedesktop:hadess/iio-sensor-proxy.git
  track: master
  ref: 3.0-0-ga4e4e55c06a83b901eac35f570aa727bec9b8231
