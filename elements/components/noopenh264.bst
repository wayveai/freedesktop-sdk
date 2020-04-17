kind: meson

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build

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
