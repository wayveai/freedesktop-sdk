kind: manual

depends:
- filename: bootstrap-import.bst

variables:
  fontdir: '%{install-root}%{datadir}/fonts'
  confdir: '%{install-root}%{sysconfdir}/fonts'

config:
  install-commands:
  - |
    install -d -m0755 "%{confdir}/conf.avail" "%{confdir}/conf.d" "%{fontdir}/liberation-fonts"
    install -p -m0644 fonts/*.ttf "%{fontdir}/liberation-fonts"
    for i in config/liberation-fonts-*.conf; do
      install -p -m0644 "$i" "%{confdir}/conf.avail/59-$(basename "$i")"
      ln -s "../conf.avail/59-$(basename "$i")" "%{confdir}/conf.d/59-$(basename "$i")"
    done

sources:
- kind: tar
  url: github_files:liberationfonts/liberation-fonts/files/6418984/liberation-fonts-ttf-2.1.4.tar.gz
  ref: 26f85412dd0aa9d061504a1cc8aaf0aa12a70710e8d47d8b65a1251757c1a5ef
  directory: fonts
- kind: local
  path: files/font-conf/liberation-fonts
  directory: config
