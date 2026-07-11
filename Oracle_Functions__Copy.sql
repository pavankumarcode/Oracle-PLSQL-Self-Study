/*PLSQL Self Study*/

/*
select * from system.departments;
select * from system.locations;
select * from system.jobs;
select * from system.employees;
select * from system.regions;
select * from system.countries;

select A.*, B.region_name from countries A join regions B on A.region_id = B.region_id
*/

--select first_name || last_name from system.employees where employee_id = 100;

SET SERVEROUTPUT ON

DECLARE

Employee_id number := 100;
EmployeeName varchar2(50);

BEGIN

-- The client prompts for input here
--Employee_id := &enter_a_employee_Id; 
--DBMS_OUTPUT.PUT_LINE(Employee_id);
select first_name || last_name into EmployeeName from system.employees where employee_id = 100;

DBMS_OUTPUT.PUT_LINE('My Hello World Program ');
--DBMS_OUTPUT.put_line('My age is ['|| v_user_num ||']');
DBMS_OUTPUT.put_line('Employee name ['|| EmployeeName ||'] Employee ID ['|| Employee_id ||']');

END;
/



set serveroutput on

declare
var1 number := 5;
var2 number := 10;

BooleanVarTrue boolean := True;
BooleanVarFalse boolean := False;

begin
dbms_output.put_line('************AIRTHIMITIC OPERATORS - BEGIN ***************');
dbms_output.put_line('Variable 1 [' || var1 || ']. Variable 2 [' || var2 ||'].');
dbms_output.put_line('Addition [' || (var1 + var2) ||']');
dbms_output.put_line('Substraction [' || (var1 - var2) ||']');
dbms_output.put_line('Multiplication ['||(var1 * var2) ||']');
dbms_output.put_line('Division[' ||(var1/var2) ||']');
dbms_output.put_line('Exponent[' ||(var1**var2) ||']');
dbms_output.put_line('************AIRTHIMITIC OPERATORS -   END ***************');

/*
PL SQL does not print Boolean value in Print. Commenting this section.
dbms_output.put_line('************LOGICAL OPERATORS - BEGIN ***************');
dbms_output.put_line('Variable 1 [' || BooleanVarTrue || ']. Variable 2 [' || BooleanVarFalse ||'].');
dbms_output.put_line('AND [' || (BooleanVarTrue AND BooleanVarFalse) ||']');
dbms_output.put_line('OR [' || (BooleanVarTrue OR BooleanVarFalse) ||']');
dbms_output.put_line('NOT of True ['||(NOT BooleanVarTrue) ||']');
dbms_output.put_line('NOT of AND ['||(NOT BooleanVarFalse) ||']');

dbms_output.put_line('************LOGICAL OPERATORS -   END ***************');
*/


dbms_output.put_line('************LOGICAL OPERATORS - BEGIN ***************');
dbms_output.put_line('Variable 1 [' || BooleanVarTrue || ']. Variable 2 [' || BooleanVarFalse ||'].');
dbms_output.put_line('AND [' || (BooleanVarTrue AND BooleanVarFalse) ||']');
dbms_output.put_line('OR [' || (BooleanVarTrue OR BooleanVarFalse) ||']');
dbms_output.put_line('NOT of True ['||(NOT BooleanVarTrue) ||']');
dbms_output.put_line('NOT of AND ['||(NOT BooleanVarFalse) ||']');

dbms_output.put_line('************LOGICAL OPERATORS -   END ***************');

end;
/






set serveroutput on

declare


begin

dbms_output.put_line('************COMPARISON OPERATORS - BEGIN ***************');
dbms_output.put_line('************COMPARISON OPERATORS -   END ***************');
end;
/

-----------------------------------------------------------------



















select * from dual






select * from system.employees;

select employee_id, first_name, salary from system.employees;





------------------------------------------LOOPS - BEGIN -------------------------------------------
--BASIC LOOP

set serveroutput on

declare
countVar number :=1;

begin

    loop
        dbms_output.put_line('Value of Count is ['|| countVar ||']');
        countVar := countVar + 1;
        
        if (countVar > 10) then
            dbms_output.put_line('Value of Count is ['|| countVar ||'], Exiting Loop');
            exit;
        end if;
    end loop;
    
    dbms_output.put_line('Out of Loop.');
end;


--FOR LOOP

set serveroutput on

declare
countVar number;

begin

    for countVar in 1..10
        loop
        dbms_output.put_line('Value of Count is ['|| countVar ||']');
        end loop;

end;


--FOR Loop call Procedure to print the Salary based on Employee ID.
set serveroutput on
declare
eid number;
begin

for eid in 100..200
    loop
    Proc_ifElseBlock(eid);
    end loop;
end;


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



------------------------------------------CURSORS - BEGIN -------------------------------------------
--NON PARAMETRIZED CURSOR - Simple PL SQL Block
select * from employees order by employee_id;

set serveroutput on

declare
eid number;
fname system.employees.first_name%type;
sal system.employees.salary%type;

cursor employeeCursor is select employee_id, first_name, salary from employees
--where employee_id = 100
order by employee_id;

begin
    /*
    if (employeeCursor%isopen) then
        dbms_output.put_line('employeeCursor%isopen is True');
    else
        dbms_output.put_line('employeeCursor%isopen is False');
    end if;
    */ 
    open employeeCursor;
    dbms_output.put_line('Cursor Opened');

    /*
    if (employeeCursor%isopen) then
        dbms_output.put_line('employeeCursor%isopen is True');
    else
        dbms_output.put_line('employeeCursor%isopen is False');
    end if;
    */
    
    loop
        fetch employeeCursor into eid, fname, sal;
        
        exit when employeeCursor%notfound;
        
        /*
        if (employeeCursor%found) then
            dbms_output.put_line('employeeCursor%found is True');
        else
            dbms_output.put_line('employeeCursor%found is False');
        end if;

        if (employeeCursor%notfound) then
            dbms_output.put_line('employeeCursor%notfound is True');
        else
            dbms_output.put_line('employeeCursor%notfound is False');
        end if;
        */
        
        dbms_output.put_line('Row Count ['|| employeeCursor%rowcount ||'] Employee ID['||eid||'] First Name ['||fname||'], Salary['||sal||']');
        
    
    end loop;
    
    close employeeCursor;
    dbms_output.put_line('Cursor Closed');
    
    /*
    if (employeeCursor%isopen) then
        dbms_output.put_line('employeeCursor%isopen is True');
    else
        dbms_output.put_line('employeeCursor%isopen is False');
    end if;
    */
end;


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

declare

begin
myFirstCursor();
end;





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


declare
d_id number := 100;
begin
myParametrizedCursor(d_id);
end;


------------------------------------------CURSORS -   END -------------------------------------------




------------------------------------------TEMPLATE - BEGIN -------------------------------------------
------------------------------------------TEMPLATE -   END -------------------------------------------


