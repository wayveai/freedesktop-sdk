kind: autotools

depends:
- filename: bootstrap-import.bst

sources:
- kind: git_tag
    # gperf 3.1 make libcap fail to build
  url: https://git.savannah.gnu.org/git/gperf.git
  track: master
  ref: 2adc7253aef58fdafa6cd9bddf740611c64ba582   # v3.0.4
