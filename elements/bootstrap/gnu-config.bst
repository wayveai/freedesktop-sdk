kind: manual
description: GNU config scripts

depends:
- filename: bootstrap/build/base-sdk.bst
  type: build

sources:
- kind: git_tag
  url: savannah:config.git
  track: master
  ref: f83dbaa146823950ddcb783d01667328571a2444

config:
  install-commands:
  - |
    install -d "%{install-root}%{datadir}/gnu-config"
  - |
    install -m 0644 config.guess config.sub "%{install-root}%{datadir}/gnu-config"
  - |
    install -m 0644 config.sub "%{install-root}%{datadir}/gnu-config"

public:
  bst:
    split-rules:
      runtime: []
      devel:
        (>):
        - '**'
