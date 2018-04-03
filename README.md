# freedesktop-sdk

The freedesktop-sdk is a project that provides Platform and SDK runtimes for [flatpak](https://flatpak.org) apps and runtimes based on freedesktop modules.

It's being built with [Buildstream](https://gitlab.com/BuildStream/buildstream), with multi-architecture support out of the box.

This project is still in the beta stage, so we have no official stable release yet.

# Usage

Currently the freedesktop-sdk is meant to be used as the base for all Flatpak applications.

So you simply need to point your Flatpak build to our release server http://cache.sdk.freedesktop.org/releases/.

Located here you should find releases built for multiple architectures (aarch64, i586, x86_64).

The current set of commands to run your application with 1.8 (unstable) are:

Install the new runtime from remote:
```
  flatpak remote-add --if-not-exists --user --no-gpg-verify freedesktop-sdk https://cache.sdk.freedesktop.org/releases/
  flatpak install --user freedesktop-sdk runtime/org.freedesktop.Sdk//unstable
  flatpak install --user freedesktop-sdk runtime/org.freedesktop.Platform//unstable
```
Once this has been installed, you then need to change the:

```
  "runtime-version": stable
```
To

```
  "runtime-version": unstable
```

Build and run your flatpak app as normal:
```
  flatpak-builder build_folder org.app.json
  flatpak-builder --run build_folder org.app.json
```


## Building the runtime locally

If you wish to build locally, you must have BuildStream installed and a local instance of [libostree](https://ostree.readthedocs.io/) on your machine.

```
- cd "${CI_PROJECT_DIR}"/sdk
    - ${BST} -o target_arch "${ARCH}" build all.bst

    - echo "Export runtimes to a ostree repo"
    - mkdir runtimes
    - |
      for runtime in sdk platform; do
        bst -o target_arch "${ARCH}" checkout "${runtime}.bst" "runtimes/${runtime}";
      done
    - cd ${CI_PROJECT_DIR}

    - echo "Use flatpak builder to export the runtimes to a ostree repo"
    - dnf install -y flatpak flatpak-builder
    - export FLATPAK_USER_DIR="${PWD}/tmp-flatpak"
    - flatpakarch="${ARCH/i586/i386}"
    - flatpak build-export --arch=${ARCH} --files=files repo/ sdk/runtimes/sdk unstable;
    - flatpak build-export --arch=${ARCH} --files=files repo/ sdk/runtimes/platform unstable;

    - echo "Locally install generated flatpak runtimes"
    - flatpak remote-add --if-not-exists --user --no-gpg-verify test-repo repo/
    - flatpak install --arch="${flatpakarch}" --user test-repo runtime/org.freedesktop.Sdk//unstable
    - flatpak install --arch="${flatpakarch}" --user test-repo runtime/org.freedesktop.Platform//unstable

    - echo "Build basic flatpak app"
    - flatpak-builder --arch="${flatpakarch}" build_folder tests/org.flatpak.Hello.json

    - echo "Run basic application"
    - flatpak-builder --arch="${flatpakarch}" --run build_folder tests/org.flatpak.Hello.json hello.sh
```

The build is configured to pull from our remote artifact cache, meaning you should not have to build
anything locally, only if buildstream detects any custom changes/additions locally will you have to
rebuild, and even then buildstream is smart enough to figure out what actually *needs* to be re-built
instead of re-building everything.


These instructions for building can be found in the projects Gitlab-CI file.

# Structure
Current directory structure is:

 - bootstrap
 - sdk
   - plugins

The bootstrap folder includes a set of instructions to bootstrap a minimal sysroot, used to build all the freedesktop flatpak runtimes in the sdk folder.

The sdk folder contains the elements to build the freedesktop-sdk flatpak runtimes.

The plugins directory, is a custom directory needed to host our custom Buildstream [plugins](https://buildstream.gitlab.io/buildstream/pluginindex.html#plugins)

# Contributing

Finally if you would like to contribute or suggest any improvements to the bootstrap/SDK, please submit an MR.

In the future we are going to configure the CI to allow users to push/test their fixes/improvements automatically across all supported platforms.

If you would like to ask any questions on how to use/improve this project, you will find us over at #freedesktop-sdk on Freenode, and we have a mailing list https://lists.freedesktop.org/mailman/listinfo/freedesktop-sdk.
