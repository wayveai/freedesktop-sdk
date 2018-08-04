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
  - kind: tar
    url: https://cmake.org/files/v3.12/cmake-3.12.0.tar.gz
    ref: d0781a90f6cdb9049d104ac16a150f9350b693498b9dea8a0331e799db6b9d69
