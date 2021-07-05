kind: manual
description: GNU config scripts

variables:
  tools: /cross
  toolchain-prefixes: >-
    %{tools}
    /usr
    %{prefix}

depends:
- filename: bootstrap/build/base-sdk.bst
  type: build

sources:
- kind: git_tag
  url: savannah:config.git
  track: master
  ref: 805517123cbfe33d17c989a18e78c5789fab0437
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
