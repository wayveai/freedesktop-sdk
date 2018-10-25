kind: manual
depends:
- filename: bootstrap-import.bst
- filename: base/python3.bst

config:
  install-commands:
  - |
    install -m 644 -D python3-usercustomize.py "%{install-root}%{indep-libdir}/python3.7/usercustomize.py"
    python3 -m compileall "%{install-root}%{indep-libdir}/python3.7/usercustomize.py"
    python3 -O -m compileall "%{install-root}%{indep-libdir}/python3.7/usercustomize.py"
    python3 -OO -m compileall "%{install-root}%{indep-libdir}/python3.7/usercustomize.py"

sources:
- kind: local
  path: files/python3-usercustomize.py
