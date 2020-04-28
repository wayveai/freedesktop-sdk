kind: manual

build-depends:
- bootstrap-import.bst
- components/m4.bst

runtime-depends:
- components/systemd.bst
- components/ostree.bst

variables:
  (@):
  - ostree-config.yml

config:
  build-commands:
  - |
    m4 -DOSTREE_REMOTE_URL="%{ostree-remote-url}" \
      freedesktop-sdk.conf.in >freedesktop-sdk.conf

  install-commands:
  - mkdir %{install-root}/boot
  - mkdir %{install-root}/efi
  - mkdir %{install-root}/etc
  - mkdir %{install-root}/mnt
  - mkdir %{install-root}/run
  - mkdir %{install-root}/opt
  - mkdir %{install-root}/sys
  - mkdir %{install-root}/tmp
  - mkdir %{install-root}/dev
  - mkdir %{install-root}/proc

  - mkdir -p "%{install-root}/sysroot"
  - ln -s sysroot/ostree "%{install-root}/ostree"
  # Though we use /var/home in /etc/passwd and this symlink should
  # be useless removing this symlink breaks --filesystem=host on
  # flatpak.
  - ln -s var/home "%{install-root}/home"
  - ln -s var/roothome "%{install-root}/root"
  - ln -s run/media "%{install-root}/media"

  - install -Dm644 -t "%{install-root}/usr/lib/tmpfiles.d" ostree.conf
  - install -Dm644 -t "%{install-root}/etc/pki/ostree" fdsdk.gpg
  - install -Dm644 -t "%{install-root}/etc/ostree/remotes.d" freedesktop-sdk.conf

sources:
- kind: local
  path: files/vm/ostree-config

public:
  bst:
    integration-commands:
    # /etc/default/useradd is provided by freedesktop-sdk.bst's
    # components/shadow.bst. In non OSTree configuration it should
    # stay /home. So we have to adjust the value of HOME in OSTree
    # configurations only.
    #
    # Even though we have a symlink /home -> var/home, we should not
    # define home directory. The real root filesystem (which is
    # /sysroot) is not mounted as recursive shared on OSTree.  When
    # the home directory in /etc/passwd is defined to use the symlink,
    # then mounts in home are mounted on this /sysroot instead of
    # /var.  That means that the mount does not propagate in Flatpak
    # applications. This breaks Flatpak Builder and BuildStream which
    # require fuse mounts.
    - |
      if [ -f /etc/default/useradd ]; then
        sed -i 's,HOME=/home,HOME=/var/home,' /etc/default/useradd
      fi
