kind: manual

depends:
- filename: bootstrap-import.bst

variables:
  fontdir: '%{install-root}%{datadir}/fonts'
  confdir: '%{install-root}%{sysconfdir}/fonts'

config:
  install-commands:
  - |
    install -d -m0755 "%{confdir}/conf.avail" "%{confdir}/conf.d" "%{fontdir}/dejavu"
    install -p -m0644 ttf/*.ttf %{fontdir}/dejavu
    for i in fontconfig/*.conf; do
      install -p -m0644 "$i" "%{confdir}/conf.avail"
      ln -s "../conf.avail/$(basename "$i")" "%{confdir}/conf.d/$(basename "$i")"
    done

sources:
- kind: tar
  url: sourceforge:projects/dejavu/files/dejavu/2.37/dejavu-fonts-ttf-2.37.tar.bz2
  ref: fa9ca4d13871dd122f61258a80d01751d603b4d3ee14095d65453b4e846e17d7
