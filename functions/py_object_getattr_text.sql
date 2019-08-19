CREATE OR REPLACE FUNCTION py_object_getattr_text(obj py_object, attr TEXT)
  RETURNS TEXT
AS $$

return getattr(GD['_PY_OBJECTS'][obj['id']], attr)

$$
LANGUAGE plpython3u;
