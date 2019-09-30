kind: manual

depends:
- filename: bootstrap-import.bst
  type: build
- filename: components/libglvnd.bst
  type: runtime

(@):
- elements/include/mesa.yml


variables:
  headers: >-
    vulkan/vulkan_intel.h
    EGL/eglextchromium.h
    EGL/eglmesaext.h
    d3dadapter/present.h
    d3dadapter/d3dadapter9.h
    d3dadapter/drm.h

config:
  install-commands:
  - |
    for header in %{headers}; do
      install -Dm644 "include/${header}" "%{install-root}%{includedir}/${header}"
    done

  - |
    cat <<\EOF >dri.pc
    prefix=%{prefix}
    libdir=%{libdir}

    dridriverdir=%{libdir}/GL/lib/dri

    Name: dri
    Description: Direct Rendering Infrastructure
    Version: %{version}
    EOF
    install -Dm644 dri.pc "%{install-root}%{libdir}/pkgconfig/dri.pc"

  - |
    cat <<\EOF >d3d.pc
    prefix=%{prefix}
    includedir=${prefix}/include

    moduledir=%{libdir}/GL/lib/d3d

    Name: d3d
    Description: Native D3D driver modules
    Version: 1.0.0
    Requires.private: libdrm >=  2.4.98
    Cflags: -I${includedir}
    EOF
    install -Dm644 d3d.pc "%{install-root}%{libdir}/pkgconfig/d3d.pc"

public:
  bst:
    split-rules:
      devel:
        - '/**'
