kind: manual

depends:
- filename: bootstrap-import.bst
- filename: base/python3.bst
  type: build
- filename: base/perl.bst
  type: build

config:
  install-commands:
  - |
    DESTDIR="%{install-root}" ./install-dicts.py */dictionaries.xcu

  - |
    ln -s hunspell "%{install-root}%{datadir}/myspell"

sources:
- kind: git_tag
  url: libreoffice:dictionaries.git
  track: master
  ref: libreoffice-6.1.4.1-0-g65a6c5b70d5235d13a4956ce29dd00dd4386edd9
- kind: local
  path: files/dictionaries/install-dicts.py
- kind: local
  path: files/dictionaries/th_gen_idx.pl
