kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/pango.bst
- filename: components/gtk3.bst
- filename: components/libdrm.bst
- filename: components/systemd.bst
- filename: components/libxslt.bst
  type: build
- filename: components/docbook-xsl.bst
  type: build
- filename: components/docbook-xml.bst
  type: build

variables:
  conf-local: >-
    --with-logo="%{datadir}/pixmaps/freedesktop-sdk-40.png"

config:
  install-commands:
    (<):
    - |
      install -d "%{install-root}/run"
      install -d "%{install-root}/var"
      ln -s ../run "%{install-root}/var/run"

    (>):
    - |
      install -Dm644 -t "%{install-root}%{datadir}/pixmaps" freedesktop-sdk/freedesktop-sdk-40.png
    - |
      install -Dm644 -t "%{install-root}%{datadir}/plymouth" freedesktop-sdk/plymouthd.defaults
    - |
      install -Dm644 freedesktop-sdk/freedesktop-sdk-40.png "%{install-root}%{datadir}/plymouth/themes/spinner/watermark.png"

sources:
- kind: git_tag
  url: freedesktop:plymouth/plymouth.git
  track: main
  ref: 22.02.122-0-g27764b2a2c2e21ad988cae01dc59d4bb78e5c1dc
- kind: local
  path: files/plymouth
  directory: freedesktop-sdk
