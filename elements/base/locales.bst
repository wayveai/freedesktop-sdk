kind: script

depends:
- filename: bootstrap-import.bst
  type: build
- filename: base/gzip.bst
  type: build
- filename: base/supported-locales.bst
  type: build

config:
  commands:
  - |
    [ -d /tmp/usr/lib/locale ] || mkdir -p /tmp/usr/lib/locale
    mkdir -p %{install-root}/usr/lib/locale

    while read name encoding; do
      case "${name}" in
        en_US.UTF-8)
          continue
          ;;
      esac
      command="localedef --prefix=/tmp --no-archive -i ${name%%.*} -f ${encoding} ${name}"
      echo "Generating ${name}"
      ${command}
    done <%{datadir}/i18n/SUPPORTED
    mv /tmp/usr/lib/locale/* %{install-root}/usr/lib/locale/
