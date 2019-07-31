kind: filter

depends:
- filename: components/systemd-base.bst
  type: build
- filename: components/systemd-libs.bst
  type: runtime
- filename: components/libgpg-error.bst
  type: runtime
- filename: components/linux-pam.bst
  type: runtime
- filename: components/dbus.bst
  type: runtime
config:
  exclude:
  - systemd-libs

  include-orphans: True

public:
# cpe metadata should be written in
# elements/components/systemd-libs.bst

  bst:
    integration-commands:
    - |
      systemd-hwdb --usr update

    split-rules:
      runtime:
        (>):
        - '%{indep-libdir}/environment.d/**'
        - '%{indep-libdir}/kernel/**'
        - '%{indep-libdir}/modprobe.d/**'
        - '%{indep-libdir}/sysctl.d/**'
        - '%{indep-libdir}/systemd/**'
        - '%{indep-libdir}/sysusers.d/**'
        - '%{indep-libdir}/tmpfiles.d/**'
        - '%{indep-libdir}/udev/**'
        - '%{datadir}/bash-completion/**'
        - '%{datadir}/dbus-1/**'
        - '%{datadir}/factory/**'
        - '%{datadir}/polkit-1/**'
        - '%{datadir}/systemd/**'
        - '%{datadir}/zsh/**'
        - '%{sysconfdir}/**'
        - '%{localstatedir}/**'
