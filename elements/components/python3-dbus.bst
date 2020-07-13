kind: pip

build-depends:
- components/python3-pip.bst
- public-stacks/buildsystem-autotools.bst

depends:
- components/python3.bst
- components/libdbus.bst
- components/glib.bst

sources:
- kind: git_tag
  url: freedesktop:dbus/dbus-python.git
  track: master
  ref: dbus-python-1.2.16-0-g39b3099e1409118c6cf1260e8966d448cb16a93e
