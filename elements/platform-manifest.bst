kind: collect_manifest

depends:
  - filename: desktop-platform.bst
    type: build
  - filename: bootstrap-manifest.bst
    junction: bootstrap-junction.bst
    type: build

config:
  path: "/usr/manifest.json"
