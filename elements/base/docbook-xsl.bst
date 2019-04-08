kind: manual

depends:
- filename: bootstrap-import.bst
- filename: base/libxml2.bst
- filename: base/docbook-xml.bst
  type: runtime
- filename: base/clean-xml-catalog.bst
  type: runtime

variables:
  data: '%{datadir}/xml/docbook/xml/xsl-stylesheets'

config:
  install-commands:
  - |
    set -e

    install -d -m0755 "%{install-root}%{data}"
    cp -R catalog.xml VERSION assembly common eclipse fo highlighting html htmlhelp \
          images javahelp lib manpages profiling roundtrip slides template \
          website xhtml* "%{install-root}%{data}"

    install -D -m0644 -t "%{install-root}%{data}/epub" epub/*.xsl
    install -D -m0644 -t "%{install-root}%{data}/epub3" epub3/*.*

    ln -s VERSION "%{install-root}%{data}/VERSION.xsl"

    install -D -m0644 -t "%{install-root}%{datadir}/doc/docbook-xsl" README RELEASE-NOTES* NEWS*

public:
  bst:
    integration-commands:
    - |
      set -e

      [ -f "%{sysconfdir}/xml/catalog" ] || xmlcatalog --noout --create "%{sysconfdir}/xml/catalog"
      add_main() {
        xmlcatalog --noout --add "$1" "$2" "file://%{data}/catalog.xml" "%{sysconfdir}/xml/catalog"
      }

      add_main delegateURI "http://docbook.sourceforge.net/release/xsl/"
      add_main delegateSystem "http://docbook.sourceforge.net/release/xsl/"

sources:
- kind: tar
  url: sourceforge_download:docbook/docbook-xsl-1.79.1.tar.bz2
  ref: 725f452e12b296956e8bfb876ccece71eeecdd14b94f667f3ed9091761a4a968
- kind: patch
  strip-level: 2
  path: patches/docbook-xsl/docbook-xsl-non-recursive_string_subst.patch
