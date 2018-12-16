kind: manual
description: Linux kernel configured for use in virtual machines.

depends:
- filename: bootstrap-import.bst
  type: build
- filename: base/bison.bst
  type: build
- filename: base/flex.bst
  type: build
- filename: base/openssl.bst
  type: build
- filename: base/bc.bst
  type: build
- filename: base/gzip.bst
  type: build

variables:
  (?):
  - target_arch == "aarch64":
      kernel_arch: arm64
  - target_arch == "i686":
      kernel_arch: i386
  - target_arch != "aarch64" and target_arch != "i686":
      kernel_arch: '%{arch}'

config:
  configure-commands:
  # Modify kernel config for systemd

  # Kernel Config Options
  - scripts/config -e DEVTMPFS
  - scripts/config -e CGROUPS
  - scripts/config -e INOTIFY_USER
  - scripts/config -e SIGNALFD
  - scripts/config -e TIMERFD
  - scripts/config -e EPOLL
  - scripts/config -e NET
  - scripts/config -e SYSFS
  - scripts/config -e PROC_FS
  - scripts/config -e FHANDLE

  # Kernel crypto/hash API
  - scripts/config -e CRYPTO_USER_API_HASH
  - scripts/config -e CRYPTO_HMAC
  - scripts/config -e CRYPTO_SHA256

  # udev will fail to work with legacy sysfs
  - scripts/config -d SYSFS_DEPRECATED

  # Legacy hotplug confuses udev
  - scripts/config --set-str UEVENT_HELPER_PATH ""

  # Userspace firmware loading not supported
  - scripts/config -d FW_LOADER_USER_HELPER

  # Some udev/virtualization requires 
  - scripts/config -e DMIID

  # Support for some SCSI devices serial number retrieval
  - scripts/config -e BLK_DEV_BSG

  # Required for PrivateNetwork= in service units
  - scripts/config -e NET_NS
  - scripts/config -e USER_NS

  # Strongly Recommended
  - scripts/config -e IPV6
  - scripts/config -e AUTOFS4_FS
  - scripts/config -e TMPFS_XATTR
  - scripts/config -e TMPFS_POSIX_ACL
  - scripts/config -e EXT4_FS_POSIX_ACL
  - scripts/config -e XFS_POSIX_ACL
  - scripts/config -e BTRFS_FS_POSIX_ACL
  - scripts/config -e SECCOMP
  - scripts/config -e SECCOMP_FILTER
  - scripts/config -e CHECKPOINT_RESTORE

  # Required for CPUShares= in resource control unit settings
  - scripts/config -e CGROUP_SCHED
  - scripts/config -e FAIR_GROUP_SCHED
  
  # Required for CPUQuota= in resource control unit settings
  - scripts/config -e CFS_BANDWIDTH

  # Required for IPAddressDeny=, IPAddressAllow= in resource control unit settings
  - scripts/config -e CGROUP_BPF

  # For UEFI systems
  - scripts/config -e EFIVAR_FS
  - scripts/config -e EFI_PARTITION

  # RT group scheduling (effectively) makes RT scheduling unavailable for userspace
  - scripts/config -d RT_GROUP_SCHED

  # Required for systemd-nspawn
  - scripts/config -e DEVPTS_MULTIPLE_INSTANCES

  # Required for 3D acceleration in qemu
  - scripts/config -e CONFIG_DRM_VIRTIO_GPU

  build-commands:
  - make ARCH="%{kernel_arch}" $MAKEFLAGS

  install-commands:
  - mkdir -p "%{install-root}"/boot
  - make INSTALL_PATH="%{install-root}"/boot install
  - make INSTALL_MOD_PATH="%{install-root}" modules_install

public:
  bst:
    integration-commands:
    - |
      if type depmod &> /dev/null; then
        cd /usr/lib/modules
        for version in *; do
          depmod -a "$version";
        done
      fi

sources:
- kind: tar
  url: https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.19.26.tar.xz
  ref: bec45f66c94739596f2bbc35e89de7a2cbd407cf63b537970b52ab117db747fc
- kind: local
  path: files/kernel/.config
