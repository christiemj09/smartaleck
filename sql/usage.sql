-- Usage so far

SELECT workon('smartaleck');

CREATE TEMPORARY TABLE python (
    id SERIAL PRIMARY KEY,
    name TEXT,
    obj py_object
);

SELECT py_object_start_session();

-- SELECT (py_object_getattr(obj, 'ONE')).* AS v(value INT) FROM python;
-- ^^ This works, but having to specify types is a pain. How does the JSON
--    data type do it?

-- https://www.postgresql.org/docs/11/functions-json.html#FUNCTIONS-JSON-OP-TABLE
-- ^^ Looks like they just return text and rely on the user to do the conversion

-- Get a reference to an imported module
INSERT INTO python (name, obj)
VALUES ('attributes', py_object_import('attributes'));

SELECT * FROM python;

-- Access attributes of that module
SELECT
    obj ->> 'TWO' AS "TWO"
FROM
    python
WHERE
    name = 'attributes';
-- This works; cool!

-- Store references to Python object attributes
INSERT INTO python (name, obj)
SELECT
    'THREE',
    obj -> 'THREE'
FROM
    python
WHERE
    name = 'attributes';

SELECT * FROM python;

-- Dereference a Python object
SELECT
    (@obj)::INTEGER
FROM
    python
WHERE
    name = 'THREE';

-- Call a function with simple arguments (e.g. strings, integers, ...)
SELECT
    @(obj -> 'py_add' ** '{"a": 2, "b": 3}') AS res
FROM
    python
WHERE
    name = 'attributes';

-- Call a function with complex arguments (e.g. any Python object)
INSERT INTO python(name, obj)
SELECT
    'a',
    obj -> 'TWO'
FROM
    python
WHERE
    name = 'attributes';

INSERT INTO python(name, obj)
SELECT
    'b',
    obj -> 'THREE'
FROM
    python
WHERE
    name = 'attributes';

SELECT
    @(obj -> 'py_add' ** py_args_from('python', array['a', 'b'])) AS res
FROM
    python
WHERE
    name = 'attributes';