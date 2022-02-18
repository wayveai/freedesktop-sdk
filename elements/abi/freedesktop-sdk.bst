kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{arch}"

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: release/20.08
  ref: freedesktop-sdk-20.08.18-34-g812ea2c27fb86e76a4f08554817c96ca83fbc6ed
