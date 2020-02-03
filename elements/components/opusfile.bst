kind: autotools

depends:
- bootstrap-import.bst
- components/opus.bst
- components/libogg.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/git-minimal.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libopusfile.so'
        - '%{libdir}/libopusurl.so'

sources:
- kind: git_tag
  url: xiph:opusfile.git
  track: master
  ref: v0.11-0-gb7c2ed3bafd9b08cd5d276894ca18fb58bcbfbc9
