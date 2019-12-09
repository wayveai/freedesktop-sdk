kind: autotools

build-depends:
- bootstrap-import.bst
- public-stacks/buildsystem-autotools.bst
- components/glib.bst
- components/gtk3.bst
- components/systemd.bst

- components/libdaemon.bst
- components/pygobject.bst
- components/python3-dbus.bst
- components/xmltoman.bst

variables:
  conf-local: >-
    --with-distro=none
    --disable-qt3
    --disable-qt4
    --disable-gtk
    --enable-gtk3
    --disable-python
    --disable-mono

config:
  install-commands:
    (>):
    - |
      install -Dm644 -t "%{install-root}%{indep-libdir}/sysusers.d" \
                     freedesktop-sdk/avahi.conf

sources:
- kind: git_tag
  url: github:lathiat/avahi.git
  track: master
  ref: v0.7-0-g6242e5f0fe001b7de2ccaa9431db279b2ee76b83
- kind: patch
  path: patches/avahi/gettext.patch
- kind: local
  path: files/avahi/avahi.conf
  directory: freedesktop-sdk

public:
  bst:
    split-rules:
      ui:
      - "%{bindir}/bssh"
      - "%{bindir}/bvnc"
      - "%{bindir}/bshell"
      - "%{libdir}/libavahi-ui-gtk3.so*"
      - "%{libdir}/pkgconfig/avahi-ui-gtk3.pc"
      - "%{debugdir}%{bindir}/bssh.debug"
      - "%{debugdir}%{libdir}/libavahi-ui-gtk3.so*.debug"
