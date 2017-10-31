kind: myautotools

depends:
  - filename: base-stack.bst
  - filename: desktop/cairo.bst
  - filename: desktop/harfbuzz.bst
  - filename: desktop/fontconfig.bst
  - filename: desktop/gobject-introspection.bst

sources:
  - kind: tar
    url: https://download.gnome.org/sources/pango/1.40/pango-1.40.13.tar.xz
    ref: f84e98db1078772ff4935b40a1629ff82ef0dfdd08d2cbcc0130c8c437857196

