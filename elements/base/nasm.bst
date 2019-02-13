kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build

# We have to build in the source dir otherwise some perl scripts will fail
variables:
  builddir: ''

# Default install target requires manpages exist but we can't build them due to
# missing 'asciidoc' dependency
config:
  install-commands:
  - |
    install -m 755 -D -t "%{install-root}%{bindir}" nasm ndisasm

sources:
- kind: git_tag
  url: https://repo.or.cz/nasm.git
  track: master
  ref:  nasm-2.14.02-0-ga73b8be6f0f9e307e3c6131011a30f2fd5b00877
- kind: patch
  path: patches/nasm/nasm-disable-werror-attributes.patch
