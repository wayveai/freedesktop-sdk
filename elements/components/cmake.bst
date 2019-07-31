kind: autotools

depends:
- filename: bootstrap-import.bst

config:
  configure-commands:
  - |
    echo 'list(INSERT CMAKE_SYSTEM_LIBRARY_PATH 0 "%{libdir}")' >>Modules/Platform/UnixPaths.cmake
    echo 'list(INSERT CMAKE_PLATFORM_IMPLICIT_LINK_DIRECTORIES 0 "%{libdir}")' >>Modules/Platform/UnixPaths.cmake

  - |
    mkdir %{builddir}
    cd %{builddir}
    ../configure --prefix=%{prefix}

sources:
- kind: git_tag
  url: https://gitlab.kitware.com/cmake/cmake
  track: master
  exclude:
  - v*-rc*
  ref: v3.15.1-0-gf43a7d76c737c5bb9b903a2b1be5186c081ec21e
- kind: patch
  path: patches/cmake/cmake-nolib64.patch
