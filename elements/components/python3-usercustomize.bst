kind: manual
depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst

config:
  install-commands:
  - |
    LIBDEST="$(python3 -c "import sysconfig; print(sysconfig.get_path('stdlib'))")"
    install -m 644 -D python3_usercustomize.py "%{install-root}${LIBDEST}/usercustomize.py"
    python3 -m compileall "%{install-root}${LIBDEST}/usercustomize.py"
    python3 -O -m compileall "%{install-root}${LIBDEST}/usercustomize.py"
    python3 -OO -m compileall "%{install-root}${LIBDEST}/usercustomize.py"

sources:
- kind: local
  path: files/python3_usercustomize.py
