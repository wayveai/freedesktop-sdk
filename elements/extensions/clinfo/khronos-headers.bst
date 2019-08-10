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
  ref: 0d5f18c6e7196863bc1557a693f1509adfcee056
# No tags exist, track HEAD of the branch
