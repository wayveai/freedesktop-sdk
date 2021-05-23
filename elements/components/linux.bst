kind: make
description: Linux kernel configured for use in virtual machines.

depends:
- components/kmod.bst

build-depends:
- bootstrap-import.bst
- components/bison.bst
- components/flex.bst
- components/bc.bst
- components/gzip.bst
- components/rsync.bst

variables:
  bootdir: /boot
  kernel_arch: '%{arch}'
  src-arch: '%{kernel_arch}'
  image-name: '$(make -s image_name)'
  (?):
  - target_arch == "x86_64":
      src-arch: x86
  - target_arch == "aarch64":
      kernel_arch: arm64
      # The default image file is not EFI compatible
      image-name: arch/arm64/boot/Image
  - target_arch == "i686":
      src-arch: x86
      kernel_arch: i386
  - target_arch == "ppc64le":
      kernel_arch: powerpc
  - target_arch == "riscv64":
      kernel_arch: riscv
      image-name: arch/riscv/boot/Image

environment:
  ARCH: '%{kernel_arch}'
  # compile.h has hardcoded timestamp, let's seed it
  KBUILD_BUILD_TIMESTAMP: 'Thu Nov 10 15:00:00 UTC 2011'

config:
  configure-commands:
  - |
    # Generate the default kernel config for the target architecture
    make defconfig

  - |
    # Modify the kernel config for additional features

    # Kernel Config Options
    scripts/config -e DEVTMPFS
    scripts/config -e CGROUPS
    scripts/config -e INOTIFY_USER
    scripts/config -e SIGNALFD
    scripts/config -e TIMERFD
    scripts/config -e EPOLL
    scripts/config -e NET
    scripts/config -e SYSFS
    scripts/config -e PROC_FS
    scripts/config -e FHANDLE

    # Kernel crypto/hash API
    scripts/config -e CRYPTO_AES
    scripts/config -e CRYPTO_ARC4
    scripts/config -e CRYPTO_CBC
    scripts/config -e CRYPTO_CMAC
    scripts/config -e CRYPTO_DES
    scripts/config -e CRYPTO_ECB
    scripts/config -e CRYPTO_HMAC
    scripts/config -e CRYPTO_MD4
    scripts/config -e CRYPTO_MD5
    scripts/config -e CRYPTO_SHA256
    scripts/config -e CRYPTO_SHA512
    scripts/config -e CRYPTO_USER_API_HASH
    scripts/config -e CRYPTO_USER_API_SKCIPHER
    scripts/config -e CRYPTO_XTS

    # udev will fail to work with legacy sysfs
    scripts/config -d SYSFS_DEPRECATED

    # Boot is very slow with systemd when legacy PTYs are present
    scripts/config -d LEGACY_PTYS
    scripts/config -d LEGACY_PTY_COUNT

    # Legacy hotplug confuses udev
    scripts/config --set-str UEVENT_HELPER_PATH ""

    # Userspace firmware loading not supported
    scripts/config -d FW_LOADER_USER_HELPER

    # Some udev/virtualization requires
    scripts/config -e DMIID

    # Support for some SCSI devices serial number retrieval
    scripts/config -e BLK_DEV_BSG

    # Required for PrivateNetwork= in service units
    scripts/config -e NET_NS
    scripts/config -e USER_NS

    # Required for 9p support
    scripts/config -e NET_9P
    scripts/config -e NET_9P_VIRTIO
    scripts/config -e 9P_FS
    scripts/config -e 9P_FS_POSIX_ACL
    scripts/config -e 9P_FS_SECURITY
    scripts/config -e VIRTIO_PCI

    # Strongly Recommended
    scripts/config -e IPV6
    scripts/config -e AUTOFS4_FS
    scripts/config -e TMPFS_XATTR
    scripts/config -e TMPFS_POSIX_ACL
    scripts/config -e EXT4_FS_POSIX_ACL
    scripts/config -e EXT4_FS_SECURITY
    scripts/config -e SECCOMP
    scripts/config -e SECCOMP_FILTER
    scripts/config -e CHECKPOINT_RESTORE

    # Required for CPUShares= in resource control unit settings
    scripts/config -e CGROUP_SCHED
    scripts/config -e FAIR_GROUP_SCHED

    # Required for CPUQuota= in resource control unit settings
    scripts/config -e CFS_BANDWIDTH

    # Required for IPAddressDeny=, IPAddressAllow= in resource control unit settings
    scripts/config -e CGROUP_BPF

    # For UEFI systems
    scripts/config -e EFIVAR_FS
    scripts/config -e EFI_PARTITION
    scripts/config -e EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER

    # RT group scheduling (effectively) makes RT scheduling unavailable for userspace
    scripts/config -d RT_GROUP_SCHED

    # Required for 3D acceleration in virtual machines
    scripts/config -e DRM_VIRTIO_GPU
    scripts/config -m DRM_VMWGFX

    # Required for systemd-nspawn
    scripts/config -e DEVPTS_MULTIPLE_INSTANCES

    # Sound with QEMU
    scripts/config -e SND_HDA_GENERIC

    # Required for live boot
    scripts/config -m SQUASHFS
    scripts/config -m SQUASHFS_ZLIB
    scripts/config -m DM_SNAPSHOT
    scripts/config -m OVERLAY_FS

    # Some useful drivers when running as virtual machine
    scripts/config -m VIRTIO_BALLOON
    scripts/config -m VIRTIO_INPUT
    scripts/config -e VIRTIO_PMEM
    scripts/config -e VIRTIO_NET
    scripts/config -e VIRTIO_BLK
    scripts/config -e SCSI_VIRTIO
    scripts/config -e VIRTIO_IOMMU

    scripts/config -e BLK_MQ_VIRTIO
    scripts/config -m VIRTIO_CONSOLE
    scripts/config -e HW_RANDOM_VIRTIO
    scripts/config -m VIRTIO_MMIO
    scripts/config -m CRYPTO_DEV_VIRTIO

    # Input
    scripts/config -e INPUT_EVDEV
    scripts/config -e INPUT_TOUCHSCREEN
    scripts/config -e INPUT_TABLET

    # needed by spice-vdagent
    scripts/config -m VIRTIO_VSOCKETS
    scripts/config -m INPUT_UINPUT

    # for virtualbox
    scripts/config -m VBOXGUEST

    # For wireless networks
    scripts/config -e WIRELESS
    scripts/config -m CFG80211
    scripts/config -e CFG80211_WEXT
    scripts/config -e MAC80211
    scripts/config -e NETDEVICES
    scripts/config -e WLAN

    # Wifi hardware
    scripts/config -m IWLWIFI
    scripts/config -m IWLMVM
    scripts/config -m IWLDVM
    scripts/config -m ATH9K
    scripts/config -m ATH10K
    scripts/config -m ATH10K_PCI
    scripts/config -m RTW88
    scripts/config -e RTW88_8822BE
    scripts/config -e RTW88_8822CE
    scripts/config -e WLAN_VENDOR_ATH

    # Ethernet hardware
    scripts/config -m IGB

    # Common DRM drivers
    scripts/config -m DRM_NOUVEAU
    scripts/config -m DRM_RADEON
    scripts/config -m DRM_AMDGPU
    scripts/config -e DRM_AMD_DC
    scripts/config -e DRM_AMD_DC_DCN
    scripts/config -e DRM_AMD_DC_HDCP
    case "%{arch}" in
      x86_64|i686)
        scripts/config -m DRM_I915
        scripts/config -m DRM_GMA500
        scripts/config -m DRM_GMA600
        scripts/config -m DRM_GMA3600
        ;;
      aarch64|arm)
        ;;
    esac

    # FUSE
    scripts/config -m FUSE_FS
    scripts/config -m CUSE

    # iSCSI
    scripts/config -e SCSI_LOWLEVEL
    scripts/config -m ISCSI_TCP
    scripts/config -m SCSI_ISCSI_ATTRS

    # Encrypted disks
    scripts/config -m DM_CRYPT

    # USB audio
    scripts/config -m SND_USB_AUDIO

    # Common USB webcams
    scripts/config -e MEDIA_SUPPORT
    scripts/config -e MEDIA_USB_SUPPORT
    scripts/config -e MEDIA_CAMERA_SUPPORT
    scripts/config -m USB_VIDEO_CLASS
    scripts/config -m USB_GSPCA_BENQ
    scripts/config -m USB_GSPCA_CONEX
    scripts/config -m USB_GSPCA_CPIA1
    scripts/config -m USB_GSPCA_DTCS033
    scripts/config -m USB_GSPCA_ETOMS
    scripts/config -m USB_GSPCA_FINEPIX
    scripts/config -m USB_GSPCA_JEILINJ
    scripts/config -m USB_GSPCA_JL2005BCD
    scripts/config -m USB_GSPCA_KINECT
    scripts/config -m USB_GSPCA_KONICA
    scripts/config -m USB_GSPCA_MARS
    scripts/config -m USB_GSPCA_MR97310A
    scripts/config -m USB_GSPCA_NW80X
    scripts/config -m USB_GSPCA_OV519
    scripts/config -m USB_GSPCA_OV534
    scripts/config -m USB_GSPCA_OV534_9
    scripts/config -m USB_GSPCA_PAC207
    scripts/config -m USB_GSPCA_PAC7302
    scripts/config -m USB_GSPCA_PAC7311
    scripts/config -m USB_GSPCA_SE401
    scripts/config -m USB_GSPCA_SN9C2028
    scripts/config -m USB_GSPCA_SN9C20X
    scripts/config -m USB_GSPCA_SONIXB
    scripts/config -m USB_GSPCA_SONIXJ
    scripts/config -m USB_GSPCA_SPCA500
    scripts/config -m USB_GSPCA_SPCA501
    scripts/config -m USB_GSPCA_SPCA505
    scripts/config -m USB_GSPCA_SPCA506
    scripts/config -m USB_GSPCA_SPCA508
    scripts/config -m USB_GSPCA_SPCA561
    scripts/config -m USB_GSPCA_SPCA1528
    scripts/config -m USB_GSPCA_SQ905
    scripts/config -m USB_GSPCA_SQ905C
    scripts/config -m USB_GSPCA_SQ930X
    scripts/config -m USB_GSPCA_STK014
    scripts/config -m USB_GSPCA_STK1135
    scripts/config -m USB_GSPCA_STV0680
    scripts/config -m USB_GSPCA_SUNPLUS
    scripts/config -m USB_GSPCA_T613
    scripts/config -m USB_GSPCA_TOPRO
    scripts/config -m USB_GSPCA_TOUPTEK
    scripts/config -m USB_GSPCA_TV8532
    scripts/config -m USB_GSPCA_VC032X
    scripts/config -m USB_GSPCA_VICAM
    scripts/config -m USB_GSPCA_XIRLINK_CIT
    scripts/config -m USB_GSPCA_ZC3XX

    # NVME disks
    scripts/config -m BLK_DEV_NVME
    scripts/config -m NVME_HWMON

    # Memory card readers
    scripts/config -m MISC_RTSX_PCI
    scripts/config -m MMC
    scripts/config -m MMC_BLOCK
    scripts/config -m MMC_REALTEK_PCI

    # Bluetooth
    scripts/config -e BT
    scripts/config -m BT_HCIBTUSB

    # Sound for HDA
    scripts/config -m SND_HDA_INTEL
    scripts/config -e SND_HDA_RECONFIG
    scripts/config -e SND_HDA_INPUT_BEEP
    scripts/config -e SND_HDA_PATCH_LOADER
    scripts/config -m SND_HDA_CODEC_REALTEK
    scripts/config -m SND_HDA_CODEC_ANALOG
    scripts/config -m SND_HDA_CODEC_SIGMATEL
    scripts/config -m SND_HDA_CODEC_VIA
    scripts/config -m SND_HDA_CODEC_HDMI
    scripts/config -m SND_HDA_CODEC_CIRRUS
    scripts/config -m SND_HDA_CODEC_CONEXANT
    scripts/config -m SND_HDA_CODEC_CA0110
    scripts/config -m SND_HDA_CODEC_CA0132
    scripts/config -e SND_HDA_CODEC_CA0132_DSP
    scripts/config -m SND_HDA_CODEC_CMEDIA
    scripts/config -m SND_HDA_CODEC_SI3054

    # HID drivers
    scripts/config -m HID_MULTITOUCH
    scripts/config -m HID_GENERIC
    scripts/config -m I2C_HID

    # CPU support
    scripts/config -e PINCTRL
    case "%{arch}" in
      x86_64|i686)
        # pinctrl_amd might not work as module if it is loaded to late
        scripts/config -e PINCTRL_AMD
        scripts/config -e AMD_IOMMU_V2
        scripts/config -e X86_AMD_PLATFORM_DEVICE
        ;;
    esac

    # I2C/SMBus
    case "%{arch}" in
      x86_64|i686)
        scripts/config -m I2C_PIIX4
        scripts/config -m I2C_DESIGNWARE_PLATFORM
        scripts/config -m MFD_INTEL_LPSS_PCI
        scripts/config -m MFD_INTEL_LPSS_ACPI
      ;;
    esac

    # USB Network interfaces
    scripts/config -m USB_NET_DRIVERS
    scripts/config -m USB_USBNET
    scripts/config -m USB_NET_CDCETHER
    scripts/config -m USB_NET_CDC_SUBSET
    scripts/config -m USB_NET_RNDIS_HOST
    scripts/config -m USB_RTL8150
    scripts/config -m USB_RTL8152

    # Required by podman
    scripts/config -m TUN
    scripts/config -e CGROUP_HUGETLB
    scripts/config -e CGROUP_PIDS
    scripts/config -e CPUSETS
    scripts/config -e MEMCG
    scripts/config -e CGROUP_SCHED
    scripts/config -e BLK_CGROUP

    # KVM
    case "%{arch}" in
      x86_64|i686)
        scripts/config -m KVM
        scripts/config -m KVM_INTEL
        scripts/config -m KVM_AMD
        ;;
      aarch64)
        scripts/config -m KVM
        ;;
    esac

    # Useful filesystems
    for fs in XFS BTRFS EXFAT VFAT F2FS ISO9660; do
      [ $(scripts/config -s "${fs}_FS") != n ] || scripts/config -m "${fs}_FS"
    done
    for fs in XFS BTRFS F2FS; do
      scripts/config -e "${fs}_FS_POSIX_ACL"
    done
    scripts/config -e FS_ENCRYPTION

    # Needed for FAT filesystems
    scripts/config -e NLS_CODEPAGE_437
    scripts/config -e NLS_ISO8859_1

    # RISC-V qemu virtual machine
    case "%{arch}" in
      riscv*)
        scripts/config -e SOC_VIRT
        ;;
    esac

    # Initramfs
    scripts/config -e BLK_DEVTMPFS
    scripts/config -e BLK_DEV_INITRD
        for comp in GZIP BZIP2 LZMA XZ LZO LZ4 ZSTD; do
      scripts/config -e RD_${comp}
    done
    scripts/config -d DEBUG_BLOCK_EXT_DEVT

    # Compressed firmware
    scripts/config -e FW_LOADER_COMPRESS

  - |
    yes '' | make -j1 oldconfig

  install-commands:
  - |
    install -Dm644 "%{image-name}" '%{install-root}%{bootdir}/vmlinuz'
    install -Dm644 System.map '%{install-root}%{bootdir}/System.map'
    install -Dm644 .config '%{install-root}%{bootdir}/config'
    make -j1 INSTALL_MOD_PATH='%{install-root}%{prefix}' modules_install

  - |
    release=$(make -s kernelrelease)
    targetdir="%{install-root}%{prefix}/src/linux-${release}"

    rm "%{install-root}%{indep-libdir}/modules/${release}"/{source,build}

    to_copy=(
      Makefile
      Module.symvers
      .config
      "arch/%{src-arch}/include"
      "arch/%{src-arch}/Makefile"
      scripts
      include
    )
    if [ "$(scripts/config -s STACK_VALIDATION)" = y ]; then
      to_copy+=(tools/objtool/objtool)
    fi
    for file in "${to_copy[@]}"
    do
      targetfile="${targetdir}/${file}"
      dir="$(dirname "${targetfile}")"
      [ -d "${dir}" ] || install -d "${dir}"
      rsync -a "${file}" "${targetfile}"
    done

    ln -sr "${targetdir}" "%{install-root}%{indep-libdir}/modules/${release}/source"
    ln -sr "${targetdir}" "%{install-root}%{indep-libdir}/modules/${release}/build"

  (?):
  - target_arch in ["aarch64", "arm"]:
      install-commands:
        (>):
        - |
          make -j1 INSTALL_DTBS_PATH='%{install-root}%{bootdir}/dtbs' dtbs_install

public:
  bst:
    integration-commands:
    - |
      cd '%{indep-libdir}/modules'
      for version in *; do
        depmod -b '%{prefix}' -a "$version";
      done

    split-rules:
      devel:
        (>):
        - '%{bootdir}/System.map'

(@):
- elements/include/linux.yml
