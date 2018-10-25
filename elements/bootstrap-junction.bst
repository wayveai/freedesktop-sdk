kind: junction

sources:
- kind: local
  path: bootstrap

config:
  options:
    build_arch: '%{bootstrap_build_arch}'
    target_arch: '%{arch}'
