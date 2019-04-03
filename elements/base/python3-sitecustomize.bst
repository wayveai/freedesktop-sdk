kind: manual
depends:
- filename: bootstrap-import.bst
- filename: base/python3.bst

config:
  install-commands:
  - |
    install -m 644 -D python3-sitecustomize.py "%{install-root}%{indep-libdir}/python3.7/sitecustomize.py"
    python3 -m compileall "%{install-root}%{indep-libdir}/python3.7/sitecustomize.py"
    python3 -O -m compileall "%{install-root}%{indep-libdir}/python3.7/sitecustomize.py"
    python3 -OO -m compileall "%{install-root}%{indep-libdir}/python3.7/sitecustomize.py"

sources:
- kind: local
  path: files/python3-sitecustomize.py
