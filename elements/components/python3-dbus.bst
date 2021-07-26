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
  ref: dbus-python-1.2.18-0-g7bf42eed2d241a0cf3879f6080e31a2e2867a2f5
