kind: manual

depends:
- filename: bootstrap-import.bst

config:
  install-commands: 
  - |
    mkdir --parents %{install-root}%{includedir}
    cp -r CL/ %{install-root}%{includedir}

sources:
- kind: git
  url: github:KhronosGroup/OpenCL-Headers.git
  ref: 40c5d226c7c0706f0176884e9b94b3886679c983
