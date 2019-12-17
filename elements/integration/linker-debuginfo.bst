kind: script

depends:
  - filename: bootstrap-import.bst
    type: build

config:
  commands:
    - install -D -t "%{install-root}%{debugdir}%{libdir}" "%{debugdir}%{libdir}/"ld-*.so.debug
    - install -D -t "%{install-root}%{debugdir}/dwz/bootstrap/glibc.bst/" "%{debugdir}/dwz/bootstrap/glibc.bst"/*
    - ln -sr "%{install-root}/app/lib/debug" "%{install-root}%{debugdir}/app"

public:
  bst:
    split-rules:
      debug: []
