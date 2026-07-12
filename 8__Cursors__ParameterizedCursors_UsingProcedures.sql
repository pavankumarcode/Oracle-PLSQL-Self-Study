------------------------------------------CURSORS - BEGIN -------------------------------------------
--Youtube Tutorial : [https://www.youtube.com/watch?v=6eeoPeiDBmY&list=PLiLpmqwkwkCvIUXoBNkEQEgI-ftOvXf38&index=17]


--PARAMETRIZED CURSOR - Procedure.
select * from system.employees;
select employee_id, first_name, salary, department_id from system.employees
order by employee_id;

--drop procedure myParametrizedCursor
create or replace procedure myParametrizedCursor(d_id in number)
as
eid number;
fname system.employees.first_name%type;
sal system.employees.salary%type;
deptid system.employees.department_id%type;

cursor employeeDetails is select employee_id, first_name, salary, department_id from system.employees
where department_id = d_id
order by employee_id;

begin

    open employeeDetails;
    
    loop
        fetch employeeDetails into eid, fname, sal, deptid;
        
        exit when employeeDetails%notfound;
        
        dbms_output.put_line('Row Count ['|| employeeDetails%rowcount ||'] DeptID['||deptid ||'] Employee ID['||eid||'] First Name ['||fname||'], Salary['||sal||']');
        
        end loop;
    
    close employeeDetails;

end;


set serveroutput on
declare
d_id number := 100;
begin
myParametrizedCursor(d_id);
end;


------------------------------------------CURSORS -   END -------------------------------------------