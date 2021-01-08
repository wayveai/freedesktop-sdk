kind: autotools

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/docbook-xsl.bst
- components/docbook-xml.bst
- components/libxslt.bst

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
  ref: v28-0-g1ccfe994287119cc6cef37a7ca4c529d89de4b95
