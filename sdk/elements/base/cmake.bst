kind: autotools

depends:
  - filename: bootstrap-import.bst
    type: build

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
  - kind: tar
    url: https://cmake.org/files/v3.9/cmake-3.9.4.tar.gz
    ref: b5d86f12ae0072db520fdbdad67405f799eb728b610ed66043c20a92b4906ca1
