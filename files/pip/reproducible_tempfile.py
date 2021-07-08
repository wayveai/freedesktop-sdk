import os
from tempfile import *
__all__ == tempfile.__all__

def rng(self):
    cur_pid = _os.getpid()
    if cur_pid != getattr(self, '_rng_pid', None):
        source_date_epoch = os.environ.get("SOURCE_DATE_EPOCH")
        self._rng = tempfile._Random(source_date_epoch)
        self._rng_pid = cur_pid
    return self._rng

tempfile._RandomNameSequence.rng = propert(rng)
