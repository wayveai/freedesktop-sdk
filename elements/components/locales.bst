kind: script

depends:
- filename: bootstrap-import.bst
  type: build
- filename: components/gzip.bst
  type: build
- filename: components/supported-locales.bst
  type: build

environment:
  MAXJOBS: "%{max-jobs}"

environment-nocache:
- MAXJOBS  

config:
  commands:
  - |
    mkdir -p %{install-root}/usr/lib/locale

    grep -v -e "en_US.UTF-8" -e "C.UTF-8" %{datadir}/i18n/SUPPORTED | xargs -P $MAXJOBS -n 2 bash -c 'echo "Generating ${0}"; \
    localedef --prefix=%{install-root} --no-archive -i ${0%%.*} -f ${1} ${0}'


public:
  bst:
    split-rules:
      locale:
        (>):
        - "%{indep-libdir}/locale"
        - "%{indep-libdir}/locale/**"
