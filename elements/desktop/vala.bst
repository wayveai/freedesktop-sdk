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
  url: https://download.gnome.org/sources/vala/0.42/vala-0.42.4.tar.xz
  ref: b528906d080ac5b6043285a82c194c988e495c70da71ae19c1fc7811509f4f1e
