kind: stack

(@):
- elements/extensions/mesa/config.yml

public:
  bst:
    integration-commands:
    - |
      echo "%{libdir}" >>/etc/ld.so.conf
      ldconfig
