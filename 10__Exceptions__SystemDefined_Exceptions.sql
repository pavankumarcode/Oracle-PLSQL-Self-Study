


------------------------------------------EXCEPTIONS - BEGIN -------------------------------------------
--YouTube Turorial Link: [https://www.youtube.com/watch?v=1UYxHgIzrNU&list=PLiLpmqwkwkCvIUXoBNkEQEgI-ftOvXf38&index=20]

--SOME Examples of SYSTEM DEFINED EXCEPTIONS.


--drop procedure if exists learnSystemDefinedExceptions;
create or replace procedure learnSystemDefinedException(eid in number)
as

fname varchar2(50);
sal number;

begin

    select first_name, salary into fname, sal
    from system.employees
    where employee_id = eid
    ;
    
    exception
    when no_data_found then
        dbms_output.put_line('Encountered Exception - NO DATA FOUND');
        dbms_output.put_line(dbms_utility.format_error_stack);
        dbms_output.put_line(dbms_utility.format_error_backtrace);
    when too_many_rows then
        dbms_output.put_line('Encountered Exception - TOO MANY RECORDS');
        dbms_output.put_line(dbms_utility.format_error_stack);
        dbms_output.put_line(dbms_utility.format_error_backtrace);
    when others then
        dbms_output.put_line('Encountered Unknown Exception');
        dbms_output.put_line(dbms_utility.format_error_stack);
        dbms_output.put_line(dbms_utility.format_error_backtrace);

end;




set serveroutput on
declare
eid number := 100;

begin
learnSystemDefinedException(100);   -- No Error
learnSystemDefinedException(10000); -- No Data Found
learnSystemDefinedException(1000); -- TOO Many Records -- To get this comment out the where clause in the procedure, recompile the procedure and run this.
end;
------------------------------------------EXCEPTIONS -   END -------------------------------------------

