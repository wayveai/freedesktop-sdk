kind: manual

depends:
- filename: bootstrap-import.bst

config:
  install-commands:
  - |
    mkdir -p "%{install-root}%{includedir}"
    mv "ladspa.h.txt" "%{install-root}%{includedir}/ladspa.h"

sources:
- kind: remote
  url: https://www.ladspa.org/ladspa_sdk/ladspa.h.txt
  ref: c72ceb7383f159a944bfe80b1b155795857026aea1155dbe4ecf1664354320ad
