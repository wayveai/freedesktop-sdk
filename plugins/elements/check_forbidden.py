import os
from buildstream import Element, ElementError, Scope

class CheckForbiddenElement(Element):

    def configure(self, node):
        self.node_validate(node, [
            'forbidden'
        ])

        self.forbidden = set(self.node_get_member(node, list, 'forbidden'))

    def preflight(self):
        pass

    def get_unique_key(self):
        return {}

    def configure_sandbox(self, sandbox):
        pass

    def _find_bad_dependencies(self, elt, traversed):
        if elt in traversed:
            return False
        traversed.add(elt)
        bad = False
        for dep in elt.dependencies(Scope.RUN, recurse=False):
            if self._find_bad_dependencies(dep, traversed):
                self.warn('{} depends on {}'.format(elt, dep))
                bad = True
        if elt.name in self.forbidden:
            bad = True
        return bad

    def stage(self, sandbox):
        traversed = set()
        if self._find_bad_dependencies(self, traversed):
            raise ElementError("Some elements were forbidden")

    def assemble(self, sandbox):
        return os.sep

def setup():
    return CheckForbiddenElement
