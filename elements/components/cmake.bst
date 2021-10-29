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
  url: kitware:cmake.git
  track: master
  match:
  - v3.20.*
  exclude:
  - v*-rc*
  ref: v3.20.6-0-g0d3bfda22ad3327a7921caa464741394d58f3d34
- kind: patch
  path: patches/cmake/cmake-nolib64.patch
