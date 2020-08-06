kind: manual

build-depends:
- components/go-stage1.bst

depends:
- bootstrap-import.bst

variables:
  optimize-debug: "false"

environment:
  GOROOT_BOOTSTRAP: /usr/local/go
  GOARCH: "%{go-arch}"
  GOHOSTARCH: "%{go-arch}"

config:
  build-commands:
  - |
    cd src
    bash make.bash

  install-commands:
  - |
    install -Dm755 -t "%{install-root}%{libdir}/go" VERSION
    install -Dm755 -t "%{install-root}%{libdir}/go/bin" bin/*

    mkdir -p "%{install-root}%{libdir}/go/pkg"
    for i in pkg/include pkg/linux_* pkg/tool; do
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
  track: release-branch.go1.14
  match:
  - 'go*'
  exclude:
  - '*rc*'
  - '*beta*'
  ref: go1.14.6-0-gedfd6f28486017dcb136cd3f3ec252706d4b326e
