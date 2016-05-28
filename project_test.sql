create or replace function example.test_sum() returns void as $$
    declare
        a        int;
        b        int;
        expected int;
    begin 

        FOR a, b, expected IN VALUES
            (0, 0, 0),
            (1, 1, 2),
            (2, 2, 4)
        LOOP
            PERFORM assert.equal(expected, example.sum(a, b));
        END LOOP;
    end;
$$ language plpgsql;