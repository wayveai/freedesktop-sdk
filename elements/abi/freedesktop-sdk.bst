kind: junction

config:
  options:
    bootstrap_build_arch: "%{bootstrap_build_arch}"
    target_arch: "%{target_arch}"

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: release/22.08
  ref: freedesktop-sdk-22.08rc.3-28-g2cf629c2696155bed4d1319f498cdd7f20bdca7b
