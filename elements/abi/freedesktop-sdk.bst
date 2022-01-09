kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{arch}"

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: release/20.08
  # Fix me to track tags after 20.08 has done a release
  track-tags: false
  ref: freedesktop-sdk-20.08.16-71-g84c5123b2feac6aad90fe2ef747360567faf5dc0
