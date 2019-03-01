kind: filter

depends:
- filename: desktop/systemd-base.bst
  type: build
- filename: desktop/libsystemd.bst
  type: runtime
- filename: base/libgpg-error.bst
  type: runtime
- filename: desktop/dbus.bst
  type: runtime

config:
  exclude:
  - libsystemd

  include-orphans: True

public:
  cpe:
    vendor: 'freedesktop'
    product: 'systemd'
    version: '241'

  bst:
    integration-commands:
    - |
      systemd-hwdb --usr update

    split-rules:
      devel:
        (>):
        - '%{libdir}/libudev.so'

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
