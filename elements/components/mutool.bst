kind: make

build-depends:
- components/pkg-config.bst

depends:
- components/curl.bst
- components/freetype.bst
- components/harfbuzz.bst
- components/jpeg.bst
- components/openjpeg.bst
#- components/lcms.bst

variables:
  make-args: >-
    prefix="%{prefix}"
    bindir="%{bindir}"
    libdir="%{libdir}"
    incdir="%{includedir}"
    mandir="%{mandir}"
    docdir="%{docdir}"
    build=release
    USE_SYSTEM_LIBS=yes
    USE_SYSTEM_JBIG2DEC=no
    USE_SYSTEM_LCMS2=no

  optimize-debug: "false"

config:
  build-commands:
  - make %{make-args} build/release/mutool
  install-commands:
  - install -Dm755 -t "%{install-root}%{bindir}" build/release/mutool

sources:
- kind: git_tag
  url: ghostscript:mupdf.git
  track: master
  ref: 1.17.0-0-g96751b25462f83d6e16a9afaf8980b0c3f979c8b
- kind: git_module
  path: thirdparty/mujs
  url: ghostscript:mujs.git
  ref: 90aca80865e28a1b9be9bc5ef1118438f62e4f8f
- kind: git_module
  path: thirdparty/jbig2dec
  url: ghostscript:jbig2dec.git
  ref: 7e45faa81deadc4a3b4419a9e76a17782e8034f4
- kind: git_module
  path: thirdparty/lcms2
  url: ghostscript:thirdparty-lcms2.git
  ref: 05db680de2d7178be21450bc0cc909460c7d4aeb
