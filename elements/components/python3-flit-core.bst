kind: manual

depends:
- components/python3.bst

variables:
  command-subdir: flit_core

config:
  build-commands:
  -  python -m flit_core.wheel
  install-commands:
  - |
    PLATLIB=$(python -c "print(__import__('sysconfig').get_path('platlib'))")
    mkdir -p %{install-root}$PLATLIB
    python bootstrap_install.py dist/*.whl --installdir %{install-root}$PLATLIB
    python3 -m compileall -o 0 -o 1 -o 2 "%{install-root}$PLATLIB"

(@):
- elements/include/flit-source.yml
