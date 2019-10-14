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
- filename: components/kmod.bst
  type: runtime
- filename: components/systemd-manifest.bst
  type: runtime
- filename: components/gnu-efi-maybe.bst
  type: runtime
config:
  exclude:
  - systemd-libs

  include-orphans: True

public:
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
