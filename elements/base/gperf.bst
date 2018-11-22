kind: autotools

depends:
- filename: bootstrap-import.bst

sources:
- kind: git_tag
    # gperf 3.1 make libcap fail to build
  url: savannah:gperf.git
  track: master
  ref: v3.0.4-0-g2adc7253aef58fdafa6cd9bddf740611c64ba582 
