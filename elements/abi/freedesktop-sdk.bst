kind: junction

config:
  options:
    bootstrap_build_arch: "%{sandbox_arch}"
    target_arch: "%{arch}"

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: release/21.08
  ref: freedesktop-sdk-21.08.12-0-ge6c396ab53fb0920c05bbc703d83ce4180642fb0
