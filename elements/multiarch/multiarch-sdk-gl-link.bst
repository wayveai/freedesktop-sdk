kind: script

build-depends:
- bootstrap-import.bst

(?):
- target_arch == "i686":
    config:
      commands:
      - install -dm755 "%{install-root}%{libdir}"
      - ln -s /app/%{lib}/GL "%{install-root}%{libdir}/GL"
