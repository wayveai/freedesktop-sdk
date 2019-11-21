kind: meson

depends:
- filename: bootstrap-import.bst
- filename: desktop/cairo.bst
- filename: desktop/harfbuzz.bst
- filename: desktop/fontconfig.bst
- filename: desktop/gobject-introspection.bst
  type: build
- filename: base/buildsystem-meson.bst
  type: build
- filename: base/which.bst
  type: build
- filename: desktop/fribidi.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpango-1.0.so'
        - '%{libdir}/libpangoft2-1.0.so'
        - '%{libdir}/libpangocairo-1.0.so'

  cpe:
    patches:
    - CVE-2019-1010238

# Those are the defaults which we explicitly match.
variables:
  meson-local: |
   -Denable_docs=false \
   -Dgir=true

config:
  install-commands:
    (>):
    - |
      rm -rf "%{install-root}%{libexecdir}/installed-tests"
      rm -rf "%{install-root}%{datadir}/installed-tests"

sources:
- kind: git_tag
  url: gnome:pango.git
  track: master
  ref: 1.43.0-0-g26f1135f374f3ad5eb963dcdf016542fbbda361b
- kind: patch
  path: patches/pango/pango-Make-gobject-2.0-a-non-private-requirement.patch
- kind: patch
  path: patches/pango/bidi-Be-safer-against-bad-input.patch
