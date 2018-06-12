kind: collect-integration

config:
  script-path: "%{libexecdir}/freedesktop-post.sh"

depends:
- filename: desktop.bst
  type: build
- filename: base/man-db-generate.bst
  type: build
