
--drop procedure if exists find_largest;
create or replace procedure find_largest(x in number, y in number, z out number)
as

begin
    if x > y then
        z := x;
    else
        z := y;
    end if;
end;


set serveroutput on
declare
a number := 100;
b number := 20;
c number;

begin
    find_largest(a,b, c);
    dbms_output.put_line(c);
end;
