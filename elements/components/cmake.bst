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
  ref: v3.20.4-0-gb61fe6a831c72050c3a4f830445f98696b0cedf7
- kind: patch
  path: patches/cmake/cmake-nolib64.patch
