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
      rm %{install-root}%{libdir}/libopenh264.so
      rm %{install-root}%{extlibdir}/libopenh264.so
      rm -r %{install-root}%{includedir}
      rm -r %{install-root}%{libdir}/pkgconfig
      
sources:
- kind: git_tag
  url: github:endlessm/noopenh264.git
  track: master
  track-tags: false
  ref: Release_3.6.4-0-g73438577f0c9c228118e72437803e6426fa87ba2
- kind: patch
  path: patches/noopenh264/make-version-same-as-actual-lib.patch
- kind: patch
  path: patches/noopenh264/Update-to-openh264-2.0.0.patch
