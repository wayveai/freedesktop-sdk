kind: import

description: |
  Early userland initialization script.

  This component installs a script at /init, which executed by Linux
  as the first thing to happen in userspace. You can install it to
  a different path as long as you pass `rdinit=` on the kernel commandline
  to specify the new path.

sources:
- kind: local
  path: files/initramfs-scripts
  directory: /
