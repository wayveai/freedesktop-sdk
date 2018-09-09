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
- filename: desktop/libgvc.bst

sources:
- kind: tar
  url: https://download.gnome.org/sources/vala/0.42/vala-0.42.2.tar.xz
  ref: 9e89aa42152b1cef551568f827aa2deea2a9b5487d78c91474c8617b618e5f07
