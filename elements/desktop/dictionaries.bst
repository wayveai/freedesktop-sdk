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
  url: freedesktop-old:libreoffice/dictionaries.git
  track: master
  ref: libreoffice-6.1.3.2-0-g7780e6815d92b4cbec5dcd1f77f1a1eb5bfc45c0
- kind: local
  path: files/dictionaries/install-dicts.py
- kind: local
  path: files/dictionaries/th_gen_idx.pl
