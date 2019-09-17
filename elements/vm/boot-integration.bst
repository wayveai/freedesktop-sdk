kind: script

public:
  bst:
    integration-commands:
    - |
      systemd-firstboot --root-password root --locale en_US.UTF-8 --timezone UTC --setup-machine-id
      systemctl preset-all

      # systemd-firstboot generates /etc/shadow with no permission
      chmod 400 /etc/shadow

    - |
      cat > /etc/shells << EOF
      # Valid user shells
      /bin/sh
      /bin/bash
      EOF
