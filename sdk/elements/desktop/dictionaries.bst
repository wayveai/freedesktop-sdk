kind: manual

depends:
  - filename: base.bst
    type: build

config:
  install-commands:
    - |
      DESTDIR="%{install-root}" ./install-dicts.py */dictionaries.xcu

    - |
      ln -s hunspell "%{install-root}%{datadir}/myspell"

sources:
  - kind: git
    url: https://anongit.freedesktop.org/git/libreoffice/dictionaries.git
    ref: c0379d0ff639cf4a51244011a944f862703b92df
    track: libreoffice-5.4.1.1
  - kind: local
    path: files/dictionaries/install-dicts.py
  - kind: local
    path: files/dictionaries/th_gen_idx.pl
