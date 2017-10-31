kind: script

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/gzip.bst
    type: build

config:
  commands:
    - |
      [ -d /usr/lib/locale ] || mkdir -p /usr/lib/locale
      # FIXME: Get a bus error on first call
      localedef -i en_US -f UTF-8 en_US.UTF-8 || localedef -i en_US -f UTF-8 en_US.UTF-8

    - |
      mkdir -p %{install-root}/usr/lib/locale
      install -D -m 0644 /usr/lib/locale/locale-archive %{install-root}/usr/lib/locale/locale-archive
