kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/avahi.bst
- components/systemd.bst

depends:
- components/cups-daemon-only.bst
- components/dejavu-fonts.bst
- components/ghostscript.bst
- components/jpeg.bst
- components/lcms.bst
- components/libpng.bst
- components/libtiff.bst
- components/mutool.bst
- components/poppler.bst
- components/qpdf.bst
- components/dbus.bst

variables:
  # There's a related Python script which opens files assuming no build-dir
  build-dir: ''

sources:
- kind: git_tag
  url: github:OpenPrinting/cups-filters.git
  track: master
  ref: release-1-27-5-0-geae766df3267608844fa7809ece38a3922b3e070
