kind: script

build-depends:
- sdk-image.bst
- integration/sdk-integration.bst

config:
  commands:
  - '%{libexecdir}/freedesktop-post.sh'
