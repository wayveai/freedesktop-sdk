## Creating mirrors - using the script

### Basic Background
We've decided to create and maintain download mirrors for the URL sources used
in the freedesktop-sdk project, and we've written several scripts to manage the
process.

As part of the nightly scheduled CI pipeline, there will be a job running the
script `check_mirrors.py`. `check_mirrors` will generate a manifest of all the
relevant source URLs, and then check whether a download mirror exists for each
source. That script outputs a list of any sources that aren't mirrored, in a
file called `mirror_problem_list.json`
At that point, if there are any unmirrored sources, the script
`create_mirrors_from_problem_list.py` needs to be downloaded and run on a PC.
It will read the json file, and create the mirrors.

**NOTE** - *When a job fails because of unmirrored sources, it doesn't mean that
there is anything wrong with the freedesktop-sdk repository itself, it only
means that the appropriate mirrors don't exist yet. The download mirrors are
separate Gitlab projects (hosted in the same gitlab group). The issue is
resolved by creating new download mirrors, and doesn't generally require making
any changes to the freedesktop-sdk project itself.*

### If You're Reading This
This document assumes that a Gitlab CI job has been run for the freedesktop-sdk
project, and the job failed because the `check_mirrors` script detected
unmirrored sources. This usually means that someone has added a new url source
to the freedesktop-sdk repo, and that there isn't (yet) a download mirror for
that source.

This document also assumes that you have the appropriate permissions/privileges
to create new download mirrors in the freedesktop-sdk group. If you don't have
the appropriate permissions, then you probably don't need to be reading this;
someone who does have permissions will probably resolve the issue soon.

In the Job Artifacts, you should find (possibly amongst other files):
  1. This file
  2. `unmirrored_sources_list.json` (a machine-readable list of the download
mirrors that need to be created)
  3. `create_mirrors_from_problem_list.py` (the script that reads the json file
and then creates the mirrors)

Save the script and the json file to your computer, and run the script.

When you run the script, it will look for the json file in the current working
directory. (If you didn't save the json file to the current working directory,
you can specify a different path using the -p option on the command line.) The
script then iterates through the list, creating mirrors as needed. There will
be a prompt before each mirror, displaying the relevant information and asking
if you would like to proceed (prompts can be disabled from the command line with
the '--automatic' option).

For git repository mirrors, confirming the prompt will immediately create the
mirror on the gitlab servers. For one-file sources (tarballs, crates etc.)
confirming the prompt means that the source will be downloaded and committed
locally. These commits are then all pushed to the remote server in a single
batch at the end of the script.

If you ask the script to create a mirror that already exists, it will report
that the mirror exists, and will not try to recreate it or overwrite it. This
means that there won't be any conflicts if two people both try to create the
missing mirrors. Sometimes, the same source will be listed more than once in the
json file (usually because it appears in more than one element). This also
doesn't cause any errors or conflicts, the script simply creates the mirror
once, and then reports that the mirror 'already exists', and does not try to
create it a second time.

For more information, see the documentation provided in the script. The script
has a help option (`create_mirrors_from_problem_list.py -h`), and fairly
detailed docstrings.

After the new mirrors have been created, and if you have the right permissions,
you may wish to go back to Gitlab and re-run the original CI job. If so,
there's no need to create a new pipeline, just click on 're-run' and the job
will repeat the same checks, which should now pass.

### Requirements
* Running the script
  - Requires the python gitlab library. (Can be installed with `pip install
    python-gitlab`)
  - Requires a Gitlab API access token (see script help for more detail)
* Creating download mirrors for git repos
  - Requires Maintainer status in the Gitlab project group
    (freedesktop-sdk/mirrors)
  - Uses the API access token (as described above) to authenticate with Gitlab.
* Creating download mirrors for file sources (zip, tarball, cargo crate, etc)
  - Requires Maintainer access to the tarball-lfs-mirror project
  - Requires either an existing local copy of the tarball-lfs repository, or
    enough space to download a new copy (several gigabytes).
  - If you're downloading a fresh copy of the repository, then the script
    will use the access token to authenticate with Gitlab, as above.
  - (However, if you have an existing copy, then this part of the script will
    ignore the access token, because the script assumes that you've already
    configured your local copy to authenticate in an appropriate way.)

Author: douglaswinship@codethink.co.uk
