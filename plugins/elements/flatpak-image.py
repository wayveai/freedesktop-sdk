import os
from buildstream import utils
from buildstream import Element, ElementError, Scope
import configparser

class FlatpakImageElement(Element):
    def configure(self, node):
        self.node_validate(node, [
            'directory', 'include', 'exclude', 'metadata'
        ])
        self.directory = self.node_subst_member(node, 'directory')
        self.include = self.node_get_member(node, list, 'include')
        self.exclude = self.node_get_member(node, list, 'exclude')
        self.metadata = configparser.ConfigParser()
        metadata_dict = {}
        for section, pairs in node.get('metadata').items():
            if not section.startswith('__bst'):
                section_dict = {}
                for key in pairs.keys():
                    if not key.startswith('__bst'):
                        section_dict[key] = self.node_subst_member(pairs, key)
                metadata_dict[section] = section_dict

        self.metadata.read_dict(metadata_dict)

    def preflight(self):
        runtime_deps = list(self.dependencies(Scope.RUN, recurse=False))
        if runtime_deps:
            raise ElementError("{}: Only build type dependencies supported by flatpak-image elements"
                               .format(self))

        sources = list(self.sources())
        if sources:
            raise ElementError("{}: flatpak-image elements may not have sources".format(self))

    def get_unique_key(self):
        key = {}
        key['directory'] = self.directory
        key['include'] = sorted(self.include)
        key['exclude'] = sorted(self.exclude)
        key['metadata'] = self.metadata
        return key

    def configure_sandbox(self, sandbox):
        pass

    def stage(self, sandbox):
        pass

    def assemble(self, sandbox):
        self.stage_sources(sandbox, 'input')

        basedir = sandbox.get_directory()
        allfiles = os.path.join(basedir, 'buildstream', 'allfiles')
        reldirectory = os.path.relpath(self.directory, '/')
        subdir = os.path.join(allfiles, reldirectory)
        installdir = os.path.join(basedir, 'buildstream', 'install')
        filesdir = os.path.join(installdir, 'files')
        stagedir = os.path.join(os.sep, 'buildstream', 'allfiles')

        os.makedirs(allfiles, exist_ok=True)
        os.makedirs(filesdir, exist_ok=True)
        if self.metadata.has_section('Application'):
            os.makedirs(os.path.join(installdir, 'export'), exist_ok=True)

        with self.timed_activity("Creating flatpak image", silent_nested=True):
            self.stage_dependency_artifacts(sandbox, Scope.BUILD,
                                            path=stagedir,
                                            include=self.include,
                                            exclude=self.exclude)
            utils.link_files(subdir, filesdir)

        metadatafile = os.path.join(installdir, 'metadata')
        with open(metadatafile, "w") as m:
            self.metadata.write(m)
        return os.path.join(os.sep, 'buildstream', 'install')

def setup():
    return FlatpakImageElement
