kind: manual

depends:
- filename: bootstrap-import.bst
  type: build

- filename: extensions/mesa/mesa.bst
  type: runtime

config:
  install-commands:
  - |
    for i in vulkan/icd.d glvnd/egl_vendor.d OpenCL/vendors lib/dri \
             lib/d3d vulkan/explicit_layer.d vulkan/implicit_layer.d; do
      mkdir -p "%{install-root}%{libdir}/GL/$(dirname "${i}")"
      ln -rs "%{install-root}%{libdir}/GL/default/${i}" "%{install-root}%{libdir}/GL/${i}"
    done

public:
  bst:
    integration-commands:
    - |
      echo "%{libdir}/GL/default/lib" >>/etc/ld.so.conf

    - |
      ldconfig
