


------------------------------------------EXCEPTIONS - BEGIN -------------------------------------------
--YouTube Turorial Link: [https://www.youtube.com/watch?v=1UYxHgIzrNU&list=PLiLpmqwkwkCvIUXoBNkEQEgI-ftOvXf38&index=20]

--USER DEFINED EXCEPTIONS.
--drop procedure if exists learnUserDefinedException;
create or replace procedure learnUserDefinedException
as

userDefinedException exception;

eid number;
fname varchar2(50);
sal number;

cursor employeeRecord is select employee_id, first_name, salary from system.employees;

begin

    open employeeRecord;
    
        loop
            fetch employeeRecord into eid, fname, sal;
            exit when employeeRecord%notfound;
            
            if (eid = 200) then
                dbms_output.put_line('Raising User Defined Exception');
                raise userDefinedException;
            else
                dbms_output.put_line('Hello ['||fname||'].');
            end if;
            
        end loop;
        
        exception 
        when userDefinedException then
            dbms_output.put_line('Caught the User Defined Exception');
            dbms_output.put_line(dbms_utility.format_error_stack);
            dbms_output.put_line(dbms_utility.format_error_backtrace);
    
    close employeeRecord;


end;




set serveroutput on
declare
begin
learnUserDefinedException;
end;

------------------------------------------EXCEPTIONS -   END -------------------------------------------


