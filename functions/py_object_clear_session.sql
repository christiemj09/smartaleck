CREATE OR REPLACE FUNCTION py_object_clear_session()
  RETURNS VOID
AS $$

GD['_PY_OBJECTS'] = {}

$$
LANGUAGE plpython3u;
