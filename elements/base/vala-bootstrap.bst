kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/glib.bst
- filename: base/flex.bst
  type: build
- filename: base/bison.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build

variables:
  conf-local: --disable-valadoc

environment:
  VALAC: /no-valac

config:
  configure-commands:
    (<):
    - touch */*.stamp

sources:
- kind: git_tag
  url: gnome_archive:vala-bootstrap.git
  track: master
  track-tags: false
  ref: b2beeaccdf2307ced172646c2ada9765e1747b28
