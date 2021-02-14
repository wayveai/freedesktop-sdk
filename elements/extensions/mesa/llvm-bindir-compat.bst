kind: stack

(@):
- elements/extensions/mesa/config.yml

public:
  bst:
    integration-commands:
    - |
      for name in %{bindir}/*
      do
      ln -sf %{bindir}/$(basename ${name}) /usr/bin/
      done
