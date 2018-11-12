kind: manual
description: GNU config scripts

depends:
- filename: dependencies/base-sdk.bst

sources:
- kind: git_tag
  url: savannah:config.git
  track: master
  ref: c003e5cb947924ca5edd25c3b840aaa373c66b28

config:
  install-commands:
  - |
    install -d "%{install-root}%{sysroot}%{datadir}/gnu-config"
  - |
    install -m 0644 config.guess config.sub "%{install-root}%{sysroot}%{datadir}/gnu-config"
  - |
    install -m 0644 config.sub "%{install-root}%{sysroot}%{datadir}/gnu-config"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '**'
