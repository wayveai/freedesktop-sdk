kind: script

depends:
  - filename: bootstrap-import.bst
    type: build

config:
  commands:
    - install -D -t "%{install-root}%{debugdir}%{libdir}" "%{debugdir}%{libdir}/"ld-*.so.debug
    - install -D "%{debugdir}/dwz/bootstrap/glibc.bst/debug" "%{install-root}%{debugdir}/dwz/bootstrap/glibc.bst/debug"

public:
  bst:
    split-rules:
      debug: []
