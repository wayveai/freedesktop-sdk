kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/docbook-xsl.bst
  type: build
- filename: components/docbook-xml.bst
  type: build
- filename: components/libxslt.bst
  type: build
- filename: components/xz.bst

variables:
  conf-local: |
    --with-xz \
    --with-zlib \
    --enable-tools

config:
  install-commands:
    (>):
    - |
      for tool in insmod rmmod lsmod modprobe modinfo depmod; do
        ln -s kmod "%{install-root}%{bindir}/${tool}"
      done

sources:
- kind: git_tag
  url: kernel:utils/kernel/kmod/kmod.git
  track: master
  ref: v27-0-g819a125ca756003dce2d11624035b7fb605a8e99
