kind: meson

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-meson.bst

variables:
  extlibdir: "%{libdir}/openh264/extra"
  meson-local: "--libdir=%{extlibdir}"

config:
  install-commands:
    (>):
    - |
      mv "%{install-root}%{extlibdir}/pkgconfig/" "%{install-root}%{libdir}"

    - |
      cp -P %{install-root}%{extlibdir}/libopenh264.so* %{install-root}%{libdir}

    - |
      rm %{install-root}%{extlibdir}/libopenh264.a

    - |
      ln -srL %{install-root}%{libdir}/libopenh264.so %{install-root}%{libdir}/libopenh264.so.5 

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{extlibdir}/libopenh264.so'
        - '%{libdir}/libopenh264.so'

sources:
- kind: git_tag
  url: github:endlessm/noopenh264.git
  track: master
  track-tags: false
  ref: Version_2.0.0-2-g7ccc8e60480656cf86cc7a811e2f44bdbcf66abe
- kind: patch
  path: patches/noopenh264/make-version-same-as-actual-lib.patch
- kind: patch
  path: patches/noopenh264/0001-Update-headers-for-OpenH264-2.1.0.patch
- kind: patch
  path: patches/noopenh264/0001-Patch-soname-to-6.patch
