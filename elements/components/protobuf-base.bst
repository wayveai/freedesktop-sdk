kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

(@):
- elements/include/protobuf-source.yml

public:
  cpe:
    name: protobuf
