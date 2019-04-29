kind: script

depends:
  - filename: bootstrap-import.bst
    type: build

config:
  commands:
    - install -D -t "%{install-root}%{debugdir}%{libdir}" "%{debugdir}%{libdir}/"ld-*.so.debug

public:
  bst:
    split-rules:
      debug: []
