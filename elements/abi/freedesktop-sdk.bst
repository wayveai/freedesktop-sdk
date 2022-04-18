kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{arch}"

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: release/20.08
  ref: freedesktop-sdk-20.08.19-18-g5c4f015d79789faa692ad84a40dbc54b107df55a
