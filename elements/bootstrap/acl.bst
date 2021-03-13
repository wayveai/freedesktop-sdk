kind: autotools

depends:
- filename: bootstrap/acl-build-deps.bst
  type: build
- filename: bootstrap/attr.bst
  type: runtime

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libattr.so'
        - '%{libdir}/libacl.so'
        - '%{libexecdir}/libacl.so'

(@): elements/bootstrap/include/target.yml

config:
  configure-commands:
    (<):
    - ./autogen.sh

sources:
- kind: git_tag
  url: savannah:acl.git
  track: master
  ref: v2.3.0-0-g3ba70ac91d2662e4c4401743e3d32a4913419716
