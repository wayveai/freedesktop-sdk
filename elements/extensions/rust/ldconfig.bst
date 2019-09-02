kind: stack

variables:
  prefix: /usr/lib/sdk/rust
  lib: lib

public:
  bst:
    integration-commands:
    - |
      echo "%{libdir}" >>/etc/ld.so.conf

    - |
      ldconfig
