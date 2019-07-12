kind: manual

depends:
- filename: bootstrap-import.bst

config:
  install-commands:
  - |
    mkdir --parents %{install-root}%{includedir}
    cp -r CL/ %{install-root}%{includedir}

sources:
- kind: git_tag
  url: github:KhronosGroup/OpenCL-Headers.git
  track: master
  ref: c5a4bbeabb10d8ed3d1c651b93aa31737bc473dd
