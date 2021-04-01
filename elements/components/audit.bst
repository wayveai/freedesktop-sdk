kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

variables:
  conf-local: >-
    --without-python
    --without-python3
    --without-golang
    --enable-systemd
    --disable-zos-remote

config:
  install-commands:
    (>):
    - |
      install -Dm644 freedesktop-sdk/tmpfiles-audit.conf \
                     "%{install-root}%{indep-libdir}/tmpfiles.d/audit.conf"

sources:
- kind: git_tag
  url: github:linux-audit/audit-userspace.git
  track: master
  track-extra:
  - '2.8_maintenance'
  ref: v3.0.1-0-g46cb7d92443c9ec7b3af15fb0baa65f65f6415d3
- kind: local
  path: files/audit/tmpfiles-audit.conf
  directory: freedesktop-sdk
