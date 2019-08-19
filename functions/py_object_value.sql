CREATE OR REPLACE FUNCTION py_object_value(obj py_object)
  RETURNS TEXT
AS $$

return GD['_PY_OBJECTS'][obj['id']]

$$
LANGUAGE plpython3u;
