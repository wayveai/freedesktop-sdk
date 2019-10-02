kind: stack

variables:
  prefix: "/usr/lib/%{gcc_triplet}/GL/default"
  lib: "lib"
  debugdir: "/usr/lib/debug"

public:
  bst:
    integration-commands:
    - |
      echo "%{libdir}" >>/etc/ld.so.conf
      ldconfig
