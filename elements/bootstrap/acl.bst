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
  ref: v2.2.53-0-g65ff056ac4c25141cc06e484bce040635e4abd3d
