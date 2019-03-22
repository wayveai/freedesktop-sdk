# If Cargo.lock file is not provided, generate it:
# cargo generate-lockfile
# Then run this script into the source directory. It will generate
# file "sources.yml", to insert into .bst element.

import pytoml
import json
import os

with open('Cargo.lock', 'r') as f:
    lock = pytoml.load(f)

with open('sources.yml', 'wb') as sources:
    metadata = lock['metadata']
    for package in lock['package']:
        name = package['name']
        version = package['version']
        if 'source' not in package:
            continue
        source = package['source']
        hash = metadata['checksum {} {} ({})'.format(name, version, source)]
        lines = ['- kind: crate',
                 '  url: https://static.crates.io/crates/{name}/{name}-{version}.crate'.format(name = name, version = version),
                 '  ref: {}'.format(hash)]
        sources.write(('\n'.join(lines) + '\n').encode('ascii'))
