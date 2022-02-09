kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/texinfo.bst

depends:
- bootstrap-import.bst
- components/libassuan.bst
- components/libgpg-error.bst

variables:
  conf-local: >-
    --enable-pinentry-curses
    --disable-pinentry-qt
    --disable-pinentry-gtk2
    --disable-pinentry-gnome3
    --disable-pinentry-fltk

config:
  build-commands:
    (<):
    - make -C "%{builddir}/doc" ../../doc/stamp-vti

  install-commands:
    (>):
    - rm "%{install-root}%{bindir}/pinentry"

public:
  bst:
    integration-commands:
    # KDE images should provide qt, GNOME images should provide gnome3.
    # So we enable ncurses only if no other pinentry is already enabled.
    - |
      [ -x "%{bindir}/pinentry" ] || ln -s pinentry-ncurses "%{bindir}/pinentry"

sources:
- kind: git_tag
  url: github:gpg/pinentry.git
  track: master
  match:
  - 'pinentry-*'
  exclude:
  - '*-base'
  ref: pinentry-1.1.0-0-g02df3d26b986c8f2850eeba47efcb3aca9d5dbcb
