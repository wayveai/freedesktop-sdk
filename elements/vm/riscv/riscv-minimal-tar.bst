kind: script

build-depends:
- vm/riscv/deploy.bst
- vm/riscv/riscv-minimal.bst

config:
  layout:
  - element: ''
    destination: '/genimage'
  - element: ''
    destination: '/tmp'
  - element: ''
    destination: '/sysroot'
  - element: 'vm/riscv/deploy.bst'
    destination: '/'
  - element: 'vm/riscv/riscv-minimal.bst'
    destination: '/sysroot'

  commands:
  - |
    prepare-image.sh \
       --sysroot /sysroot \
       --noboot \
       --rootpasswd "root"
  - |
    # empty machine id
    touch /sysroot/etc/machine-id
    # Create hosts file
    echo "127.0.0.1   localhost" > /sysroot/etc/hosts
    # SSH User
    echo "sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin" >> /sysroot/etc/passwd
    mkdir -p /sysroot/var/empty
    chmod 600 /sysroot/var/empty
    # sudo needs setuid
    chmod u+s /sysroot/usr/bin/sudo
  - |
    tar -C sysroot -pcf "%{install-root}/rootfs.tar" .

