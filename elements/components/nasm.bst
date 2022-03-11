kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/asciidoc.bst
- components/groff.bst
- components/xmlto.bst
- components/docbook-xml.bst
- components/docbook-xsl.bst
- components/libxslt.bst

variables:
  # Build script generates sources and if build-dir is used
  # it tries to generate them in directories that do not
  # exist
  build-dir: ''

depends:
- bootstrap-import.bst

config:
  build-commands:
    (>):
    - make manpages

sources:
- kind: git_tag
  url: repo_or_cz:nasm.git
  track: master
  exclude:
  - nasm-*rc*
  ref: nasm-2.15.01-0-gf0dc62c6a680a3cad5baa39a05c88716fb181806
- kind: patch
  path: patches/nasm/nasm-disable-werror-attributes.patch
