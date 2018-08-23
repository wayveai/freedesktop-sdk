kind: manual

depends:
  - filename: bootstrap-import.bst
  - filename: base/python3.bst
    type: build

config:
  build-commands:
    - |
      python3 generate.py

  install-commands:
    - |
      install -D -m644 -t "%{install-root}%{sysconfdir}" protocols services

sources:
  - kind: remote
    url: https://www.iana.org/assignments/protocol-numbers/protocol-numbers-1.csv
    ref: e349d6d155b946d566e34ffdc0958bc5f103c9d8fd1023ebed1b0870907abca5

  - kind: remote
    url: https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.csv
    ref: 00db03d9ede0088bd1e7fa071a635164e11c195ed3b937387a2c24b028b8d690

  - kind: local
    path: files/iana-config
