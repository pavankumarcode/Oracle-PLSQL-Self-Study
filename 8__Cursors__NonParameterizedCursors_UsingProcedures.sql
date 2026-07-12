------------------------------------------CURSORS - BEGIN -------------------------------------------
--Youtube Tutorial : [https://www.youtube.com/watch?v=6eeoPeiDBmY&list=PLiLpmqwkwkCvIUXoBNkEQEgI-ftOvXf38&index=17]

--NON PARAMETRIZED CURSOR - Procedure.
--drop procedure myFirstCursor
create or replace procedure myFirstCursor
as
eid number;
fname system.employees.first_name%type;
sal system.employees.salary%type;

cursor employeeCursor is select employee_id, first_name, salary from system.employees
order by employee_id;

begin
    
    open employeeCursor;
    
    loop
        fetch employeeCursor into eid, fname, sal;
        
        exit when employeeCursor%notfound;
        
        dbms_output.put_line('Row Count ['|| employeeCursor%rowcount ||'] Employee ID['||eid||'] First Name ['||fname||'], Salary['||sal||']');
    end loop;
    
    
    close employeeCursor;
end;
--End Procedure.



set serveroutput on
declare

begin
myFirstCursor();
end;



------------------------------------------CURSORS -   END -------------------------------------------