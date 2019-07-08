kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{libdir}/libfdk-aac.so"
      rm -r "%{install-root}%{includedir}"
      rm -r "%{install-root}%{libdir}/pkgconfig"

sources:
- kind: git_tag
  url: git://people.freedesktop.org/~wtay/fdk-aac
  track: fedora
  ref: 455feca42c8e1576fbc836f5b613295847a670ed
