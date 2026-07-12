--YouTube Tutorial link: [youtube.com/watch?v=8V-TQ442IJk&list=PLiLpmqwkwkCvIUXoBNkEQEgI-ftOvXf38&index=16&pp=iAQB]





------------------------------------------LOOPS - BEGIN -------------------------------------------



--WHILE LOOP
set serveroutput on

declare
countVar number := 1;

begin

while(countVar <=10)
    loop
    dbms_output.put_line('While Loop - Value of Count is ['|| countVar ||']');
    countVar := countVar + 1;
    end loop;

end;


------------------------------------------LOOPS - END   -------------------------------------------

