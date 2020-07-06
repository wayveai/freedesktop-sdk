kind: filter

build-depends:
- components/systemd-base.bst

runtime-depends:
- components/systemd-libs.bst
- components/libgpg-error.bst
- components/linux-pam.bst
- components/kmod.bst
- components/systemd-manifest.bst
- components/gnu-efi-maybe.bst
- components/tzdata.bst
- components/shadow.bst
- components/util-linux.bst
- components/kbd.bst
- components/cryptsetup.bst

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
