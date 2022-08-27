kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: release/22.08
  ref: freedesktop-sdk-22.08rc.3-2-g48bdbaeeb7e2b3f1426125f8531d212c6de8e0bd
