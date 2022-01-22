#!/usr/bin/env python3
'''Accesses a manifest of source URLs, generated by the url_manifest plugin,
then performs a series of tests to ensure that mirrors are defined and set up
correctly.

See describe_text, and the arg_parse help info, for more detail.'''


import argparse
import json
from os.path import abspath
import sys
import mirror_management as mm
import update_manifest_with_mirrors as um

DEFAULT_OUTPUT_FILENAME = "mirror_problem_list.json"

DESCRIBE_TEXT = '''
• Accesses a manifest of source URLs, generated by the url_manifest plugin,
then performs a series of tests to ensure that mirrors are defined and set up
correctly.
* Tests can be performed in any combination, as specified on the commandline.
(Only the specified tests will run. If no tests are specified, the script fails)
• At the end, the script outputs a json file with the list of any problems
discovered.

These tests relate to the download mirrors, which are set up to support the
sources used in the freedesktop-sdk project. Some of the tests ensure that the
mirrors are correctly defined in the freedesktop-sdk project. Others involve
testing that the mirrors themselves exist, and contain the required files or 
commits.

Specifically, at time of writing, these mirrors are hosted as follows:
    Gitlab instance:  ''' + mm.GITLAB_URL + '''
    Project group:    ''' + mm.MIRROR_GROUP_URL + '''
    Project group id: ''' + mm.MIRROR_GROUP_ID + '''
All of the various git repositories that we mirror, are hosted in this group
and its subgroups. We also have a single git LFS repo for hosting individual
file sources (tarballs, zip archives, rust crates and any other sources that
consist of a single file.)
    Git LFS repo:     ''' + mm.TAR_PROJECT_URL + '''
    Project id:       ''' + mm.TAR_PROJECT_ID + '''
These values are coded into the script, and will need to be changed
if we move the repository.
'''

def main():
    '''Collect command-line arguments, run the tests, and output results'''
    arg_parser = get_arg_parser()
    args = arg_parser.parse_args()

    tests_to_run = []
    tests_to_run += [mm.ALIAS_TEST_DICT] if args.alias_test else []
    tests_to_run += [mm.MIRROR_DEFINED_TEST_DICT] if args.mirror_defined_test else []
    tests_to_run += [mm.MIRROR_EXISTS_TEST_DICT] if args.existence_test else []
    tests_to_run += [mm.MIRROR_COMMIT_EXISTS_TEST_DICT] if args.mirror_commit_test else []

    if not tests_to_run:
        print("No tests to run. Please select at least one of '-a', '-d', '-e', or '-c'")
        print("Use '-h' to see help")
        sys.exit(1)

    ignore_dict = get_ignore_dict(args.ignore_file)
    manifest = um.get_manifest_with_mirrors(args.manifest_file, args.mirror_aliases_file)

    mirror_problems = []
    for test_dict in tests_to_run:
        mirror_problems += mm.test_sources(manifest, test_dict, args.verbose, ignore_dict)

    if args.output_file:
        if mirror_problems:
            print("Saving problem list to {}".format(abspath(args.output_file)))
        else:
            print("No problems identified. Saving empty list to " +
                  "{}".format(abspath(args.output_file)))
        with open(args.output_file, mode='w') as output_file:
            json.dump(mirror_problems, output_file, indent=2)
    if mirror_problems:
        sys.exit(1)

def get_ignore_dict(ignore_filename):
    '''The 'ignore' dictionary contains a list of sources, that should be
    ignored by the tests. This means we can suppress warnings about known
    issues, if we've decided we can't resolve them yet, or if we've
    implemented a workaround.'''
    if not ignore_filename:
        return {}
    with open(ignore_filename, mode='r') as ignore_file:
        return json.load(ignore_file)

def get_arg_parser():
    """Prepare the arg_parser object."""
    arg_parser = argparse.ArgumentParser(
        formatter_class=argparse.RawDescriptionHelpFormatter,
        description=DESCRIBE_TEXT
    )

    # Filename arguments
    arg_parser.add_argument(
        '-m', '--manifest_file', required=True,
        metavar='MANIFEST_FILENAME.json',
        help='the path to a json manifest file generated by the url_manifest plugin',
    )
    arg_parser.add_argument(
        '-M', '--mirror_aliases_file', required=True,
        metavar='MIRROR_ALIASES_FILENAME.yml',
        help='the path to a YAML file containing the mirror alias definitions',
    )
    arg_parser.add_argument(
        '-o', '--output_file', default=DEFAULT_OUTPUT_FILENAME,
        metavar='OUTPUT_FILENAME.json',
        help='The filename in which to save a json output manifest' +
        '\ndefaults to: {}'.format(DEFAULT_OUTPUT_FILENAME)
    )
    arg_parser.add_argument(
        '-i', '--ignore_file', default=None,
        metavar='IGNORE_FILE.json'
    )

    # Behavioural Arguments
    excl_group = arg_parser.add_mutually_exclusive_group()
    excl_group.add_argument(
        '-n', '--no_output', action='store_const', dest='output_file', const=None,
        help='do not save an output json file'
    )
    excl_group.add_argument(
        '-q', '--quiet', action='store_false', dest='verbose',
        help='do not print the list of problem aliases to stdout.'
    )

    # Tests_to_run arguments
    arg_parser.add_argument(
        '-a', '--alias_test', action='store_true',
        help='for each source url, check whether it uses a recognized alias',
    )
    arg_parser.add_argument(
        '-d', '--mirror_defined_test', action='store_true',
        help='for each source url, test whether there is a  mirror url defined for the source',
    )
    arg_parser.add_argument(
        '-e', '--existence_test', action='store_true',
        help='for each mirror-url, test whether the mirror actually exists on our gitlab server',
    )
    arg_parser.add_argument(
        '-c', '--mirror_commit_test', action='store_true',
        help='for each git source, test whether the ref commit actually exists in the mirror'
        + ' repository',
    )

    return arg_parser

if __name__ == "__main__":
    main()
