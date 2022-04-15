kind: junction

config:
  options:
    bootstrap_build_arch: "%{sandbox_arch}"
    target_arch: "%{arch}"

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: release/21.08
  ref: freedesktop-sdk-21.08.12-104-gd8f264038589e7a8351c72bafa2f852004e83c47
