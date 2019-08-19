-- user-defined type for Python function arguments.

DROP TYPE IF EXISTS py_arg CASCADE;

CREATE TYPE py_arg AS (
    key text,
    val py_object
);
