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

INSERT INTO python (name, obj)
VALUES ('attributes', py_object_import('attributes'));

SELECT * FROM python;

SELECT
    obj ->> 'TWO' AS "TWO"
FROM
    python
WHERE
    name = 'attributes';
-- This works; cool!

INSERT INTO python (name, obj)
SELECT
    'THREE',
    obj -> 'THREE'
FROM
    python
WHERE
    name = 'attributes';

SELECT * FROM python;

SELECT
    (@obj)::INTEGER
FROM
    python
WHERE
    name = 'THREE';

SELECT
    @(obj -> 'py_add' ** '{"a": 2, "b": 3}') AS res
FROM
    python
WHERE
    name = 'attributes';
