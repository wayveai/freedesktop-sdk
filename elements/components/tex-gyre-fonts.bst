kind: manual

depends:
- filename: bootstrap-import.bst

variables:
  fontdir: '%{install-root}%{datadir}/fonts'
  confdir: '%{install-root}%{sysconfdir}/fonts'

# PostScript font replacements available under the GUST Font License
# which is approved as Libre by the Fedora Project.
#
# Font-config is directly included in 30-metric-aliases.conf which declares these
# fonts as aliases for PostScript fonts.

config:
  install-commands:
  - |
    install -d -m 0755 "%{confdir}/conf.avail" "%{confdir}/conf.d" "%{fontdir}/tex-gyre"
    install -p -m 0644 ./*.otf "%{fontdir}/tex-gyre"

  - |
    install -m 0644 -p "config/30-tex-gyre.conf" "%{confdir}/conf.avail/30-tex-gyre.conf"; \
    ln -s "../conf.avail/30-tex-gyre.conf" "%{confdir}/conf.d/30-tex-gyre.conf"

sources:
- kind: zip
  url: http://www.gust.org.pl/projects/e-foundry/tex-gyre/whole/tg2_501otf.zip
  ref: d7f8be5317bec4e644cf16c5abf876abeeb83c43dbec0ccb4eee4516b73b1bbe
- kind: local
  path: files/font-conf/tex-gyre
  directory: config
