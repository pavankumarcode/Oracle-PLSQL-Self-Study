--YouTube Tutorial link: [youtube.com/watch?v=8V-TQ442IJk&list=PLiLpmqwkwkCvIUXoBNkEQEgI-ftOvXf38&index=16&pp=iAQB]





------------------------------------------LOOPS - BEGIN -------------------------------------------
--BASIC LOOP

set serveroutput on

declare
countVar number :=1;

begin

    loop
        dbms_output.put_line('Basic Loop - Value of Count is ['|| countVar ||']');
        countVar := countVar + 1;
        
        if (countVar > 10) then
            dbms_output.put_line('Basic Loop - Value of Count is ['|| countVar ||'], Exiting Loop');
            exit;
        end if;
    end loop;
    
    dbms_output.put_line('Out of Loop.');
end;

------------------------------------------LOOPS - BEGIN -------------------------------------------



