CREATE OR REPLACE FUNCTION py_object_call(obj py_object, py_args py_arg[])
  RETURNS py_object
AS $$

# Invoke a Python object's __call__ method on some keyword arguments.

obj_at_id = GD['_PY_OBJECTS'][obj['id']]
kwargs = {
    arg['key']: GD['_PY_OBJECTS'][arg['val']['id']]
    for arg in py_args
}
val = obj_at_id(**kwargs)
GD['_PY_OBJECTS'][id(val)] = val
return {'id': id(val)}

$$
LANGUAGE plpython3u;
