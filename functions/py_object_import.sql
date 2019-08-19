CREATE OR REPLACE FUNCTION py_object_import(module TEXT)
  RETURNS py_object
AS $$

from importlib import import_module

module_obj = import_module(module)
obj_id = id(module_obj)
GD['_PY_OBJECTS'][obj_id] = module_obj
return {'id': obj_id}

$$
LANGUAGE plpython3u;
