kind: manual

depends:
- bootstrap-import.bst

config:
  install-commands:
  - install -Dm644 profile '%{install-root}%{sysconfdir}/profile'
  - install -Dm644 dot-profile '%{install-root}%{sysconfdir}/skel/.profile'
  - install -Dm644 dot-bashrc '%{install-root}%{sysconfdir}/skel/.bashrc'

  - install -Dm644 dot-profile '%{install-root}/root/.profile'
  - install -Dm644 dot-bashrc '%{install-root}/root/.bashrc'

sources:
- kind: local
  path: files/bash-config/profile
- kind: local
  path: files/bash-config/dot-profile
- kind: local
  path: files/bash-config/dot-bashrc
