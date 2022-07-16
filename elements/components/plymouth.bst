kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/docbook-xsl.bst
- components/libxslt.bst
- components/docbook-xml.bst

depends:
- bootstrap-import.bst
- components/pango.bst
- components/gtk3.bst
- components/libdrm.bst
- components/systemd.bst


variables:
  conf-local: >-
    --with-logo="%{datadir}/pixmaps/freedesktop-sdk-40.png"
    --with-runtimedir="/run"

config:
  install-commands:
    (<):
    - |
      install -d "%{install-root}/var/run"
      install -d "%{install-root}/var"

    (>):
    - |
      install -Dm644 -t "%{install-root}%{datadir}/pixmaps" freedesktop-sdk/freedesktop-sdk-40.png
    - |
      install -Dm644 -t "%{install-root}%{datadir}/plymouth" freedesktop-sdk/plymouthd.defaults
    - |
      install -Dm644 freedesktop-sdk/freedesktop-sdk-40.png "%{install-root}%{datadir}/plymouth/themes/spinner/watermark.png"
    - |
      mv %{install-root}/var/run %{install-root}/run

sources:
- kind: git_tag
  url: freedesktop:plymouth/plymouth.git
  track: main
  ref: 22.02.122-0-g27764b2a2c2e21ad988cae01dc59d4bb78e5c1dc
- kind: local
  path: files/plymouth
  directory: freedesktop-sdk
