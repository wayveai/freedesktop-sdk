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
  ref: v3.14.5-0-gf3e9a6ff62f6f58cd661dd447c22a01c50f6f4ad
- kind: patch
  path: patches/cmake/cmake-nolib64.patch
