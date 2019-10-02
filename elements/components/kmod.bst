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
    --with-rootlibdir=%{indep-libdir} \
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
  url: https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git
  track: master
  ref: v26-0-g58133a96c894c043e48c74ddf0bfe8db90bac62f
