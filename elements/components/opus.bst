kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/git-minimal.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libopus.so'
  cpe:
    vendor: opus-codec

sources:
- kind: git_tag
  url: xiph:opus.git
  track: master
  ref: v1.3.1-0-ge85ed7726db5d677c9c0677298ea0cb9c65bdd23
