kind: script

public:
  bst:
    integration-commands:
    - |
      systemd-firstboot --root-password root --locale en_US.UTF-8 --timezone UTC

      # systemd-firstboot generates /etc/shadow with no permission
      chmod 400 /etc/shadow
