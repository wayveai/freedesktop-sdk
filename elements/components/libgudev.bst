kind: autotools

depends:
- filename: bootstrap-import.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/glib.bst
- filename: components/util-linux.bst
- filename: components/systemd-libs.bst
- filename: components/gtk-doc.bst
  type: build

# umockdev depends on vala and is recursively dependent on libgudev.
# Only useful for testing.
variables:
  conf-local: |
    --disable-umockdev

sources:
- kind: git_tag
  url: gnome:libgudev.git
  track: master
  ref: 233-0-gf76d04cbb66f9c0ef7f744ebc12f0336a4dc9170
