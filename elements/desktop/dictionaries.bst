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
  ref: 7677ed84b627563072214fb4e6c5a53c65bd5a07   #6.0.5.2
- kind: local
  path: files/dictionaries/install-dicts.py
- kind: local
  path: files/dictionaries/th_gen_idx.pl
