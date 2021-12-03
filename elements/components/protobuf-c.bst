kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/protobuf.bst

sources:
- kind: tar
  url: github_files:protobuf-c/protobuf-c/releases/download/v1.4.0/protobuf-c-1.4.0.tar.gz
  ref: 26d98ee9bf18a6eba0d3f855ddec31dbe857667d269bc0b6017335572f85bbcb
