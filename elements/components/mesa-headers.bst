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
    GLES2/gl2.h
    GLES2/gl2ext.h
    GLES2/gl2platform.h
    GLES3/gl3.h
    GLES3/gl31.h
    GLES3/gl32.h
    GLES3/gl3ext.h
    GLES3/gl3platform.h
    KHR/khrplatform.h
    vulkan/vulkan_intel.h
    GL/gl.h
    GL/glext.h
    GL/glcorearb.h
    GL/gl_mangle.h
    GL/glx.h
    GL/glxext.h
    GL/glx_mangle.h
    GL/internal/dri_interface.h
    EGL/egl.h
    EGL/eglext.h
    EGL/eglextchromium.h
    EGL/eglmesaext.h
    EGL/eglplatform.h
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
    cat <<\EOF >gl.pc
    prefix=%{prefix}
    libdir=%{libdir}
    includedir=%{includedir}

    Name: gl
    Description: Mesa OpenGL Library
    Version: %{version}
    Libs: -lGL
    Cflags: -I${includedir}
    EOF
    install -Dm644 gl.pc "%{install-root}%{libdir}/pkgconfig/gl.pc"

  - |
    cat <<\EOF >egl.pc
    prefix=%{prefix}
    libdir=%{libdir}
    includedir=%{includedir}

    Name: egl
    Description: Mesa EGL library
    Version: %{version}
    Libs: -lEGL
    Cflags: -I${includedir}
    EOF
    install -Dm644 egl.pc "%{install-root}%{libdir}/pkgconfig/egl.pc"

  - |
    cat <<\EOF >glesv2.pc
    prefix=%{prefix}
    libdir=%{libdir}
    includedir=%{includedir}

    Name: glesv2
    Description: Mesa OpenGL ES 2.0 library
    Version: %{version}
    Libs: -lGLESv2
    Cflags: -I${includedir}
    EOF
    install -Dm644 glesv2.pc "%{install-root}%{libdir}/pkgconfig/glesv2.pc"

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
