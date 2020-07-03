kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/systemd.bst
- components/gtk-doc.bst
- components/gobject-introspection.bst
- components/git-minimal.bst
- components/cmake.bst
- components/polkit.bst
- components/help2man.bst
- components/liberation-fonts.bst

depends:
- components/glib.bst
- components/libgudev.bst
- components/libxmlb.bst
- components/libjcat.bst
- components/libarchive.bst
- components/libsoup.bst
- components/gcab.bst
- components/efivar.bst
- components/tpm2-tss.bst
- components/cairo.bst
- components/pygobject.bst
- components/genpeimg.bst
- components/pango.bst
- components/pycairo.bst
- components/python3-pil.bst
- components/libsmbios.bst

sources:
- kind: git_tag
  url: https://github.com/fwupd/fwupd.git
  track: master
  track-extra:
  - 1_4_X
  ref: 1.4.4-0-g938df7b93a92a102332e854d63d0bb44052e643a
