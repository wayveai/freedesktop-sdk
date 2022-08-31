kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: release/22.08
  ref: freedesktop-sdk-22.08rc.3-38-ge3dfccec98c2a8ad6b5c3d076a33c176d989b38f
