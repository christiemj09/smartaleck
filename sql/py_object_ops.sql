CREATE OPERATOR ->> (
    leftarg = py_object,
    rightarg = text,
    function = py_object_getattr_text
);

CREATE OPERATOR -> (
    leftarg = py_object,
    rightarg = text,
    function = py_object_getattr_obj
);

CREATE OPERATOR @ (
    rightarg = py_object,
    function = py_object_value
);

CREATE OPERATOR ** (
    leftarg = py_object,
    rightarg = json,
    function = py_object_call_kwargs
);
