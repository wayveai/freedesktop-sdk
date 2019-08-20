kind: manual

depends:
- filename: bootstrap/build/base-sdk.bst
  type: build
- filename: bootstrap/gnu-config.bst
  type: build

(@): elements/bootstrap/include/build.yml

variables:
  prefix: '%{tools}'

config:
  build-commands:
  - |
    gcc ${CFLAGS} ${LDFLAGS} -Wall -o identify-elf identify_elf.c

  install-commands:
  - |
    install -Dm755 identify-elf "%{install-root}%{bindir}/identify-elf"

sources:
- kind: local
  path: files/identify_elf/identify_elf.c
