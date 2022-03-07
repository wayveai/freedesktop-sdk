kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/libxslt.bst
- components/docbook-xsl.bst

depends:
- components/gnutls.bst
- components/jpeg.bst

variables:
  # This build system has sha256 verification of output from autogen
  # which breaks build-dir. It's not possible to redirect checksums
  # to anoher directory
  build-dir: ''

config:
  configure-commands:
    (<):
    - rm configure

sources:
- kind: git_tag
  url: github:qpdf/qpdf.git
  track: master
  ref: release-qpdf-10.0.1-0-g821a70185135df50a28ad92733f82fbe5b562556
- kind: patch
  path: patches/qpdf/root-tar.patch
