CREATE OR REPLACE FUNCTION py_object_getattr_obj(obj py_object, attr TEXT)
  RETURNS py_object
AS $$

object_at_attr = getattr(GD['_PY_OBJECTS'][obj['id']], attr)
obj_id = id(object_at_attr)
GD['_PY_OBJECTS'][obj_id] = object_at_attr
return {'id': obj_id}

$$
LANGUAGE plpython3u;
