kind: manual

build-depends:
- bootstrap/go-build-deps.bst

(@):
- elements/bootstrap/include/target.yml

variables:
  optimize-debug: "false"
  compress-debug: "false"

environment:
  GOROOT_BOOTSTRAP: /usr/local/go
  GOARCH: "%{go-arch}"
  GOHOSTARCH: "%{build-go-arch}"
  CC: gcc
  CC_FOR_TARGET: '%{triplet}-gcc'
  CXX_FOR_TARGET: '%{triplet}-g++'
  # We cannot bootstrap a full go compiler on same arch as target
  # See https://github.com/golang/go/issues/25177
  CGO_ENABLED: '0'

config:
  build-commands:
  - |
    cd src
    bash make.bash

  install-commands:
  - |
    install -Dm755 -t "%{install-root}%{libdir}/go" VERSION
    if [ -d bin/linux_%{go-arch} ]; then
      install -Dm755 -t "%{install-root}%{libdir}/go/bin" bin/linux_%{go-arch}/*
    else
      install -Dm755 -t "%{install-root}%{libdir}/go/bin" bin/*
    fi

    mkdir -p "%{install-root}%{libdir}/go/pkg"
    for i in pkg/include pkg/linux_%{go-arch} pkg/tool; do
      cp -r "${i}" "%{install-root}%{libdir}/go/pkg/"
    done

    for i in api misc src test; do
      cp -r "${i}" "%{install-root}%{libdir}/go/"
    done

  - |
    chmod -x "%{install-root}%{libdir}/go/src/runtime/pprof/testdata"/test*

  - |
    mkdir -p "%{install-root}%{bindir}/"
    for i in "%{install-root}%{libdir}/go/bin"/*; do
      ln -sr "${i}" "%{install-root}%{bindir}/"
    done

  - |
    find "%{install-root}%{libdir}/go/src" -perm -111 -type f -exec chmod 0644 {} ";"

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/go/src/**"
        - "%{libdir}/go/src"

sources:
- kind: git_tag
  url: github:golang/go.git
  track: release-branch.go1.16
  match:
  - 'go*'
  exclude:
  - '*rc*'
  - '*beta*'
  ref: go1.16.9-0-gc580180744e60d6c84fc0b59d634fcff01290780
