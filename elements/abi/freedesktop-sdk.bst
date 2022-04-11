kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{arch}"

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: release/20.08
  ref: freedesktop-sdk-20.08.19-0-g89ceb1fbf5b5624eb37c2b57571bb897db115057
