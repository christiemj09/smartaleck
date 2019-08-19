-- user-defined type for Python objects.

DROP TYPE IF EXISTS py_object CASCADE;

CREATE TYPE py_object AS (
    id BIGINT
);
