kind: autotools
description: GNU awk

depends:
- filename: bootstrap/gawk-build-deps.bst
  type: build
- filename: bootstrap/glibc.bst
  type: runtime

(@): elements/bootstrap/include/target.yml

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{bindir}"/gawk-*

    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: git_tag
  url: savannah:gawk.git
  track: master
  track-extra:
  - gawk-5.1-stable
  exclude:
  - '*-docs'
  ref: gawk-5.1.1-0-g2b1fffef190f46f6c0da770bba2745f6574bebca
