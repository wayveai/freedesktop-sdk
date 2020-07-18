kind: manual
description: GNU config scripts

depends:
- filename: bootstrap/build/base-sdk.bst
  type: build

sources:
- kind: git_tag
  url: savannah:config.git
  track: master
  ref: 2593751ef276497e312d7c4ce7fd049614c7bf80
# No tags exist, track HEAD of the branch

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
