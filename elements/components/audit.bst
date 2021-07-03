kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  conf-local: >-
    --without-python
    --without-python3
    --without-golang
    --enable-systemd
    --disable-zos-remote
  local_flags: -fcommon

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
  ref: v3.0.2-0-g40312ddee3035d13e287355544cd7bd7e49b5499
- kind: local
  path: files/audit/tmpfiles-audit.conf
  directory: freedesktop-sdk
