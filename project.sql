create schema example;

create or replace function example.sum(a int, b int) returns int as $$
    begin 
        return a + b;
    end;
$$ language plpgsql;