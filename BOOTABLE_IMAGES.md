# Bootable images

If an application built against Freedesktop SDK needs to be
distributed as a bootable image rather than using Flatpak, Snap or
OCI, we provide example of images showing ways to implement different
features.

Those examples are available in `elements/vm`. They all use Dracut as
initramfs generator, and SystemD as init system. Downstream projects
can of course implement their own initramfs or init.

These example images are tested on QEMU.

All the demo images have user `root` and password `root`.

## Legacy bios

The `vm/minimal/bios.bst` provides an example image booting with
Syslinux.

```
bst build vm/minimal/bios.bst
bst checkout vm/minimal/bios.bst checkout
```

Then you can use `checkout/disk.img` QEMU.

## EFI

The `vm/minimal/efi.bst` provides an example image booting with
SystemD boot loader on EFI.


```
bst build vm/minimal/efi.bst
bst checkout vm/minimal/efi.bst checkout
```

Then you can use `checkout/disk.img` QEMU with EDKII.

## QEMU + 9p

This method does not use either an image file nor a bootloader. This
can be useful for application using a virtual machine as an
alternative to containers.

`vm/minimal/virt.bst` provides the root file system.

`vm/boot/virt.bst` provides the kernel and initramfs.

The kernel should be passed as parameter to QEMU with `-kernel` and
the initramfs with `-initrd`. Some parameter to the kernel need to be
passed with `-append`. Here are the required kernel paramters.

```
root=virtfs rootflags=trans=virtio,version=9p2000.L rw
```

Because Dracut mounts 9p root named `virtfs`, this has to be used as
mount tagfor the virtfs parameter, e.g. `-virtfs
local,mount_tag=virtfs,path=<path>`.

It is possible to run the demo with `make run-vm`.

## OSTree update

Before building the demo image, some configuration is needed.

Create file `files/vm/ostree-config/fdsdk.gpg` containing the public
key for the repository.

Create `ostree-config.yml` to contain something like:

```
ostree-remote-url: "http://url/to/repo"
ostree-branch: "the-branch-name"
```

`vm/minimal-ostree/repo.bst` provides a single commit OSTree
repository. This repository can be checked out and committed into a
final OSTree repository with history using `ostree commit
--tree=ref=<commit>`.

`utils/update-repo.sh` provide an example of how manage an OSTree
repository.

To build a bootable image, once a repository is available locally
at `ostree-repo`, just track and build `vm/minimal-ostree/image.bst`.

The image contains eos-updater. To update, just run `eos-updater-ctl update`.

All this process is done automatically with:

* `make ostree-server` to start a OSTree server.
* `make update-ostree` to create a new commit.
* `make run-ostree-vm` to run the a virtual machine.
