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
  exclude:
  - v*-rc*
  ref: v3.18.4-0-g3cc3d42aba879fff5e85b363ae8f21386a3f9f9b
- kind: patch
  path: patches/cmake/cmake-nolib64.patch
