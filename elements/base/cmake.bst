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
  ref: v3.13.1-0-g62942969062fcc9f24ca057b6983532a973cfad6
- kind: patch
  path: patches/cmake-nolib64.patch
