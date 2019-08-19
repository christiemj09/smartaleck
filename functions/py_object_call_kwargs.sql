CREATE OR REPLACE FUNCTION py_object_call_kwargs(obj py_object, kwargs_json json)
  RETURNS py_object
AS $$

# Invoke a Python object's __call__ method on some keyword arguments.

import json

obj_at_id = GD['_PY_OBJECTS'][obj['id']]
kwargs = json.loads(kwargs_json)
val = obj_at_id(**kwargs)
GD['_PY_OBJECTS'][id(val)] = val
return {'id': id(val)}

$$
LANGUAGE plpython3u;
