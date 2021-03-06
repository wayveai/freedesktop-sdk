#!/usr/bin/env python3
'''Takes a source-url manifest as generated by the url_manifest plugin (in the
form of a json file), and for each source it adds a new field containing the
appropriate url for a the download mirror.
(The url_manifest plugin ought to generate this field itself,
but unfortunately it can't do that without using protected functions.)

Mostly exists so that get_manifest_with_mirrors() can be imported into
check_mirrors.py, but can also run as a standalone script.'''

import json
import argparse
from ruamel.yaml import YAML
import mirror_management as mm

DEFAULT_OUTPUT_FILENAME = 'url-manifest-with-mirrors.json'

def main():
    '''takes in an "url manifest without mirrors" json file,
    and produces an "url manifest with mirrors" json file.'''
    arg_parser = argparse.ArgumentParser()
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
    args = arg_parser.parse_args()

    manifest = get_manifest_with_mirrors(args.manifest_file, args.mirror_aliases_file)

    with open('url-manifest-with-mirrors.json', mode='w') as output_file:
        json.dump(manifest, output_file, indent=2)

def get_manifest_with_mirrors(manifest_filepath, mirror_aliases_file_path):
    '''Combines everything into one function, for ease of use.'''
    with open(manifest_filepath, mode='r') as input_manifest_file:
        manifest = json.load(input_manifest_file)
    mirror_alias_dict = get_mirror_alias_dict(mirror_aliases_file_path)
    update_manifest_with_mirrors(manifest, mirror_alias_dict)
    return manifest

def get_mirror_alias_dict(mirror_path):
    '''Collects the mirror alias information from a yaml file, and parses it
    into the format we need'''
    yaml = YAML(typ='safe')
    with open(mirror_path, mode='r') as mirror_file:
        mirror_list = yaml.load(mirror_file)['mirrors']
    # mirror_list contains dictionaries with groups of mirror-aliases
    # each dict has format {'name':<name>, 'aliases':<alias_dict>}
    # an alias_dict has the format {'alias1':['url', 'url'...], 'alias2':['url', 'url'...]...}
    # we need to combine all the alias_dicts into a single alias_dict
    mirror_alias_dict = {}
    for mirror_group_dict in mirror_list:
        m_dict = mirror_group_dict['aliases']
        for alias, url_list in m_dict.items():
            if alias not in mirror_alias_dict.keys():
                mirror_alias_dict[alias] = url_list
            else:
                mirror_alias_dict[alias].extend(url_list)
    return mirror_alias_dict

def update_manifest_with_mirrors(manifest, mirror_alias_dict):
    '''Iterates through a source_url_manifest file, and adds the appropriate
    mirror url as a field'''
    for element in manifest:
        for source in element['sources']:
            source['mirror_url'] = None
            if (
                    source['source_url'].startswith(mm.MIRROR_GROUP_URL)
                    or source['source_url'].startswith(mm.TAR_URL_PREFIX)
            ):
                # If the original source URL is already a file or repo from our gitlab
                # mirrors, then just copy it as the mirror url
                # (We have at least one source like this: iana-config)
                source['mirror_url'] = source['source_url']
            elif source['alias']:
                #if the url has an alias recognised by project conf:
                rest_of_url = source['raw_url'].split(':', 1)[1]
                mirror_url_parts = mirror_alias_dict.get(source['alias'], [])
                mirror_urls = [url_part + rest_of_url for url_part in mirror_url_parts]
                for mirror_url in mirror_urls:
                    # There may be more than one mirror defined
                    # We only want ones that have the appropriate start
                    if (
                            mirror_url.startswith(mm.MIRROR_GROUP_URL)
                            or mirror_url.startswith(mm.TAR_URL_PREFIX)
                    ):
                        source['mirror_url'] = mirror_url

if __name__ == "__main__":
    main()
