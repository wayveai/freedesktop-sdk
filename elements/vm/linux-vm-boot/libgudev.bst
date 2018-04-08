kind: autotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/buildsystem-autotools.bst
    type: build
  - filename: base/glib.bst
  - filename: base/util-linux.bst
  - filename: desktop/systemd.bst
  - filename: desktop/gtk-doc.bst
    type: build

# umockdev depends on vala and is recursively dependent on libgudev.
# Only useful for testing.
variables:
  conf-local: |
    --disable-umockdev

sources:
  - kind: git_tag
    url: gnome:libgudev.git
    ref: 232-6-g1a0d84217294bb356d6b4df9366ef921a590d421
