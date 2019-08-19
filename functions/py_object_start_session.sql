CREATE OR REPLACE FUNCTION py_object_start_session()
  RETURNS VOID
AS $$

import pickle

GD['pickle'] = pickle
GD['_PY_OBJECTS'] = {}

$$
LANGUAGE plpython3u;
