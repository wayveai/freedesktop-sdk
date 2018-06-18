kind: autotools

depends:
  - filename: bootstrap-import.bst

sources:
  - kind: tar
    # gperf 3.1 make libcap fail to build
    url: https://ftp.gnu.org/gnu/gperf/gperf-3.0.4.tar.gz
    ref: 767112a204407e62dbc3106647cf839ed544f3cf5d0f0523aaa2508623aad63e
