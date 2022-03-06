kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/systemd.bst
- components/gtk-doc.bst
- components/gobject-introspection.bst
- components/cmake.bst
- components/polkit.bst
- components/help2man.bst
- components/liberation-fonts.bst

depends:
- components/fwupd-efi-maybe.bst
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
- components/libsmbios-maybe.bst
- components/gnu-efi-maybe.bst

variables:
  plugin_dell: 'false'
  plugin_msr: 'false'
  plugin_uefi_capsule: 'false'
  efi_binary: 'false'
  (?):
  - target_arch in ["arm", "aarch64"]:
      plugin_uefi_capsule: 'true'
      efi_binary: 'true'
  - target_arch in ["i686", "x86_64"]:
      plugin_dell: 'true'
      plugin_msr: 'true'
      plugin_uefi_capsule: 'true'
      efi_binary: 'true'

  meson-local: >-
    -Ddocs=gtkdoc
    -Dplugin_dell=%{plugin_dell}
    -Dplugin_msr=%{plugin_msr}
    -Dplugin_uefi_capsule=%{plugin_uefi_capsule}
    -Defi_binary=%{efi_binary}

sources:
- kind: git_tag
  url: github:fwupd/fwupd.git
  track: master
  track-extra:
  - 1_4_X
  ref: 1.4.8-0-g0bb9d418a51d45b7e7c911fccc2eec04cfe44f4f
