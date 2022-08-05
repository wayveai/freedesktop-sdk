kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: release/22.08
  ref: freedesktop-sdk-22.08rc.1-1-g64966c41ca229d39a770eb9245b1cbfc7122a53f
