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
  ref: v3.0-0-gea8dbab9e0fb3fb2507ac5b8dc792ef32a97c87e
- kind: local
  path: files/audit/tmpfiles-audit.conf
  directory: freedesktop-sdk
