kind: manual

depends:
- filename: bootstrap-import.bst
- filename: components/libxml2.bst
- filename: components/docbook-xml.bst
  type: runtime
- filename: components/clean-xml-catalog.bst
  type: runtime

variables:
  data: '%{datadir}/xml/docbook/xml/xsl-stylesheets'

config:
  install-commands:
  - |
    set -e

    install -v -m755 -d "%{install-root}%{data}"

    cp -v -R VERSION assembly common eclipse epub epub3 fo highlighting  \
             html htmlhelp images javahelp lib manpages params profiling \
             roundtrip slides template tests webhelp website xhtml*      \
        "%{install-root}%{data}"

    ln -s VERSION "%{install-root}%{data}/VERSION.xsl"

    install -v -m644 -D README "%{install-root}%{data}/README.txt"
    install -v -m644 RELEASE-NOTES* NEWS* "%{install-root}%{data}"

public:
  bst:
    integration-commands:
    - |
      set -e

      [ -f "%{sysconfdir}/xml/catalog" ] || xmlcatalog --noout --create "%{sysconfdir}/xml/catalog"
      add_main() {
        xmlcatalog --noout --add "$1" "$2" "file://%{data}" "%{sysconfdir}/xml/catalog"
      }

      add_main rewriteSystem "http://docbook.sourceforge.net/release/xsl/1.79.2"
      add_main rewriteURI "http://docbook.souceforge.net/release/xsl/1.79.2"
      add_main rewriteSystem "http://docbook.sourceforge.net/release/xsl/current"
      add_main rewriteURI "http://docbook.sourceforge.net/release/xsl/current"

sources:
- kind: tar
  url: github_files:docbook/xslt10-stylesheets/releases/download/release/1.79.2/docbook-xsl-1.79.2.tar.gz
  ref: 966188d7c05fc76eaca115a55893e643dd01a3486f6368733c9ad974fcee7a26
- kind: patch
  strip-level: 2
  path: patches/docbook-xsl/docbook-xsl-non-recursive_string_subst.patch
