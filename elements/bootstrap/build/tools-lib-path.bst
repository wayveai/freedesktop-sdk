kind: stack

variables:
  prefix: '%{tools}'
  lib: lib

public:
  bst:
    integration-commands:
    - |
      echo "%{libdir}" >>/etc/ld.so.conf

    - |
      ldconfig
