kind: junction

config:
  options:
    bootstrap_build_arch: "%{arch}"
    target_arch: "arm"

sources:
- kind: git
  url: https://gitlab.com/freedesktop-sdk/freedesktop-sdk.git
  track: master
  ref: c909327f14c64d631ffaa02f36422eb929adc1c3
