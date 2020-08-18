kind: manual

build-depends:
- bootstrap-import.bst

config:
  install-commands:
  - install -d "%{install-root}%{debugdir}"
  - ln -sr "%{install-root}/app/lib/debug" "%{install-root}%{debugdir}/app"

public:
  bst:
    split-rules:
      debug: []
