CREATE OR REPLACE FUNCTION py_args_from(relname text, arg_names text[])
  RETURNS py_arg[]
AS $$
BEGIN
    
    DROP TABLE IF EXISTS tmp_py_args CASCADE;
    
    EXECUTE FORMAT('
        CREATE TEMPORARY TABLE tmp_py_args AS
            SELECT
                row(name, obj)::py_arg AS arg
            FROM
                %I
            WHERE
                name = ANY(%L)
    ', relname, arg_names);
    
     RETURN array_agg(arg) FROM tmp_py_args;       

END;
$$
LANGUAGE plpgsql;
