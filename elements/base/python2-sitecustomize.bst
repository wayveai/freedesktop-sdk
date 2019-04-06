kind: manual
depends:
- filename: bootstrap-import.bst
- filename: base/python2.bst

config:
  install-commands:
  - |
    install -m 644 -D python2-sitecustomize.py "%{install-root}%{indep-libdir}/python2.7/sitecustomize.py"
    python2 -m compileall "%{install-root}%{indep-libdir}/python2.7/sitecustomize.py"
    python2 -O -m compileall "%{install-root}%{indep-libdir}/python2.7/sitecustomize.py"
    python2 -OO -m compileall "%{install-root}%{indep-libdir}/python2.7/sitecustomize.py"

sources:
- kind: local
  path: files/python3-sitecustomize.py
