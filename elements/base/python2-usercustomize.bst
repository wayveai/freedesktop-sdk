kind: manual
depends:
- filename: bootstrap-import.bst
- filename: base/python2.bst

config:
  install-commands:
  - |
    install -m 644 -D python3-usercustomize.py "%{install-root}%{indep-libdir}/python2.7/usercustomize.py"
    python2 -m compileall "%{install-root}%{indep-libdir}/python2.7/usercustomize.py"
    python2 -O -m compileall "%{install-root}%{indep-libdir}/python2.7/usercustomize.py"
    python2 -OO -m compileall "%{install-root}%{indep-libdir}/python2.7/usercustomize.py"

sources:
- kind: local
  path: files/python3-usercustomize.py
