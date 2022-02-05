kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{arch}"

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: release/20.08
  ref: freedesktop-sdk-20.08.17-77-g2300ee8063fee9ca54fbc8fc238f90b8e34b7530
