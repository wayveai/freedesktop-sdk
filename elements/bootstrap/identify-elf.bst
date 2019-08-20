kind: manual

depends:
- filename: bootstrap/identify-elf-build-deps.bst
  type: build
- filename: bootstrap/glibc.bst
  type: runtime

(@): elements/bootstrap/include/target.yml

config:
  build-commands:
  - |
    %{host-triplet}-gcc ${CFLAGS} ${LDFLAGS} -Wall -o identify-elf identify_elf.c

  install-commands:
  - |
    install -Dm755 identify-elf "%{install-root}%{bindir}/identify-elf"

sources:
- kind: local
  path: files/identify_elf/identify_elf.c
