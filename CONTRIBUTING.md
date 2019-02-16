# Contributing

Current target branch: 18.08
Look [here](https://gitlab.com/freedesktop-sdk/freedesktop-sdk/wikis/release) for more information about branching

This document outlines the basic guidelines before contributing to freedesktop-sdk. If you want to contribute to this project please follow the steps below.

In order to contribute your first patch, you will need to follow these steps:
1. [Create a gitlab account](#create-a-gitlab-account)
2. [Clone our gitlab repo](#clone-our-gitlab-repo)
3. [Make a local branch](#make-a-local-branch)
4. [Make your changes in the branch](#make-your-changes-in-the-branch)
5. [Request developer access to the freedesktop-sdk repo](#request-developer-access-to-the-freedesktop-sdk-repo)
6. [Push your changes to the remote](#push-your-changes-to-the-remote)
7. [Open a merge request](#open-a-merge-request)

Additionally you can [test your changes](#testing-locally) locally using our Makefile

You can ask questions or contact us over at #freedesktop-sdk on [Freenode](https://webchat.freenode.net/), or our [mailing list](https://lists.freedesktop.org/mailman/listinfo/freedesktop-sdk).

Let's go through each step in more detail:
## Create a gitlab account
Simply click "sign in/register" in the top right corner and fill in the form.

## Clone our gitlab repo
Open a terminal and type:
```
git clone https://gitlab.com/freedesktop-sdk/freedesktop-sdk
```
If you have an SSH key associated with your gitlab account you can alternatively type
```
git clone git@gitlab.com:freedesktop-sdk/freedesktop-sdk
```
to avoid having to type your password when pushing.

Please make sure that your git is connected with your email and name using
```
git config user.name "MY_NAME"
git config user.email "MY_EMAIL@example.com"
```

There are also many GUI git interfaces, such as integration with IDEs and github's UI, however running through all of these alternative methods would be a mammoth task. Feel free to add instructions for your personal preferred git workflow.

## Make a local branch
[//]: # (If someone knows a better way to do this please tell me)
Make sure you're within the `freedesktop-sdk` directory and use the command
```
git checkout 18.08
```
to make sure you're branching from the current release branch (we develop and bug fix on this branch too). Now run
```
git checkout -b my-branch-name
```
Your branch should be named something suitable for the changes you will be making. We also usually include our gitlab username in the branch name as `username/suitable-branch-name`

## Make your changes in the branch
Create the necessary changes to fix your bug/add your feature.

When writing commit messages follow these rules:
1. Separate subject from body with a blank line - This makes your commit easier to read
2. Limit the subject line to 50 characters - Subject lines should be short and to the point
3. Capitalise the subject line - This is stylistic, but makes things clearer
4. Do not end the subject line with a period - Trailing punctuation is an unnecessary waste of space
5. Use the imperative case in the subject line i.e. As an instruction (e.g. Clean up x.bst) - This makes it clearer what your patch does
6. Wrap the body at 72 characters - This makes reading your messages easier for people with small displays
7. Use the body to explain what and why, rather than how - When looking through the git history at changes it may not be obvious *why* a change was implemented, making code impossible to maintain

For more information on git commit messages see [this guide](https://chris.beams.io/posts/git-commit/#seven-rules/).

## When modifying a git source
We use tools to track versions/security vulnerabilities, this requires us to
track the exact version number we are using.

Freedesktop-sdk does not utilise a traditional sha format, we combine
the version number, number of commits from the tag(HEAD) and then the sha,
which is easier to parse and automate.

When modifying a "ref" (bst sha) for a git source, you need to generate a new
ref format for the new version, this is possible by running:

```
git describe --tags --long --abbrev=40

```

Which should produce something like:

```
freedesktop-sdk-18.08.18-116-g30eb35057d1e2b0beb539b92d3af6708c252d21b

```

This ref clearly states the project version in a human readable format, whilst
also making it easier to regex/automate the parsing of the version by other
tools.


## Request developer access to the freedesktop-sdk repo
Go to our gitlab [project page](https://gitlab.com/freedesktop-sdk/freedesktop-sdk) and click the "Request Developer Access" button near the top of the page. One of the maintainers will review your request. Developer access allows you to push directly to our repo, enabling a simpler "push and merge request" workflow instead of using the github "fork and pull request" workflow.
This has the added benefit of allowing you to use our CI, which is equipped with runners for aarch64, armv7, i686 and x86_64 architectures.

## Push your changes to the remote
Run the following commands:

```
git push --set-upstream origin my-branch-name
```
Your branch will now begin going through our CI runners, which build the SDK on multiple architectures to ensure that your changes have not caused a break anywhere. Additionally it will check for ABI changes.

It is also good practice to rebase your changes before pushing (so that your commits are on top of the target branch), to do this run
```
git rebase origin/18.08
```
while your branch is checked out. This may require you to force-push your branch, to do this add the `-f` switch to the git push command.

## Open a merge request
Navigate to the [New Merge Request Page](https://gitlab.com/freedesktop-sdk/freedesktop-sdk/merge_requests/new) on our gitlab, add your branch as the source branch and 18.08 as the target branch.
Once your MR is open it will be reviewed before merging. Once it passes our CI and any discussions are resolved, it will be assigned to our merge bot, which will continually rebase onto the latest commit in 18.08 until it merges your branch.

Congratulations, you are now a freedesktop-sdk contributor!

## Testing locally
If you want to test your changes locally then you will need to first install [BuildStream](https://buildstream.build). The installation instructions can be found [here](https://buildstream.build/install.html). Note that we use buildstream version 1.2.4, so ensure you use this version too.

We also use some plugins from the [bst-external](https://gitlab.com/BuildStream/bst-external) repository. To install these run the following commands:
```
git clone https://gitlab.com/BuildStream/bst-external
pip3 install --user -e ./bst-external
```

Additionally Makefile uses some utilities from [flatpak](https://flatpak.org/setup) and flatpak-builder, and will be required for testing fully.

We currently use version 0.5 of bst-external, but you can reasonably assume that we are using the latest commit of master in this repository.

After making your changes you can use the Makefile to test. Ensure you are in the root `freedesktop-sdk/` directory, where the Makefile is located. You can use the Makefile to:

| Action                                 | Command                |
| -------------------------------------- | ---------------------- |
| Build the Project                      | `make build`           |
| Export the runtimes to a repo          | `make export`          |
| Check no dev files in Platform         | `make check-dev-files` |
| Test basic applications                | `make test-apps`       |
| Remove runtime repo (from make export) | `make clean-repo`      |
| Remove checked out runtimes            | `make clean-runtime`   |
| Both the above at once                 | `make clean`           |

**NOTE:** You must run `make export` *before* running `make test-apps`

There are additionally several variables a user can define to customise the build:

| Variable        | Effect                                                                          | Default Value |
| --------------- | ------------------------------------------------------------------------------- | ------------- |
| BRANCH          | Export as flatpak runtime with branch BRANCH (i.e. org.freedesktop.Sdk//BRANCH) | "18.08"       |
| ARCH            | Export as flatpak with architecture ARCH                                        | system arch   |
| REPO            | The local flatpak repo to export to                                             | "repo/"       |
| RUNTIMES        | The runtimes/extensions to be exported                                          | all runtimes  |
| CHECKOUT_ROOT   | The location to checkout runtimes from bst checkout                             | "runtimes/"   |
