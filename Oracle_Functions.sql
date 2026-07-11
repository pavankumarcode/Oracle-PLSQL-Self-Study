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


--drop procedure if exists myfirstprocedure
create or replace procedure myfirstprocedure
as
var1 number :=10;
begin

dbms_output.put_line('This is my first proceduce, variable value ['||var1 ||']');
end;
/

begin
myfirstprocedure;
end;


select * from user_source
select * from all_procedures

SELECT version FROM v$instance;



-----------------------------------------------------------------

create or replace procedure find_largest(x in number, y in number, z out number)
as

begin
    if x > y then
        z := x;
    else
        z := y;
    end if;
end;


declare
a number := 100;
b number := 20;
c number;

begin
    find_largest(a,b, c);
    dbms_output.put_line(c);
end;




select employee_id, salary from employees where employee_id=100
--update system.employees set salary = 24000 where employee_id = 100;

--Update Salary based on the input percentage for a specific Employee.

create or replace procedure updateSalary(eid in number, percentage in number, updatedSalary out number)
as
salary number;
newSalary number;

begin

    select salary into salary from system.employees where employee_id = eid;
    
    newSalary := salary - ((salary*percentage)/100);
    
    update system.employees set salary = newSalary where employee_id = eid;

    updatedSalary := newSalary;
end;



declare
updatedSalary number;
eid number;
sal number;

begin
   
    select employee_id, salary into eid, sal from employees where employee_id=100;
    dbms_output.put_line('Eid ['|| eid || '] Before Salary ['|| sal ||'].');
    
    updateSalary(100,10, updatedSalary);
    
    select employee_id, salary into eid, sal from employees where employee_id=100;
    dbms_output.put_line('Eid ['|| eid || '] Before Salary ['|| sal ||'].');
    
end;
/










select sum(salary) from system.employees;




--drop function if exists getSalarySum;
create or replace function getSalarySum(lowerThreshold in number, total IN OUT number)
return number
as
totalSalary number;

begin
    select sum(salary) into totalSalary from system.employees where salary >=lowerThreshold ;
    total := totalSalary;
    
    return totalSalary;
end;


set serveroutput on
declare

totSal number;
total number;
lowthreshold number := 6;
begin

    --totSal := getSalarySum;
    --dbms_output.put_line('Total Salary is ['|| totSal ||']');
    totSal := getSalarySum(lowthreshold, total);
    dbms_output.put_line('Total Salary greater than ['|| lowthreshold ||'] is ['|| totSal ||'] In OUT Variable ['||total||'].');
    
end;
/



select * from dual

/*
Difference Functions and Procedures.

Functions can be called in select queries, Procedures cannot.
Functions can be called from a procedure, not vice versa.
Function does not have try catch block.
Function can return values, procedures cannot.
Function cannot make DML statements, procedures can.
Function get complied for ever call, not procedures.
A function always returns value, not a procedure.
Fucntions cannot handle transactions, procedures can.

*/




select * from system.employees;

select employee_id, first_name, salary from system.employees;


------------------------------------------IF ELSE BLOCK - BEGIN -------------------------------------------
--drop procedure Proc_ifElseBlock
create or replace procedure Proc_ifElseBlock(employeeid number)
as
eid number;
fname varchar2(50);
sal number;

begin

    select employee_id, first_name, salary into eid, fname, sal
    from system.employees where employee_id = employeeid;
    --dbms_output.put_line('Employee ID['||eid||'] First Name ['||fname||'], Salary['||sal||']');
    --dbms_output.new_line;
    
    
    if (sal <=2000) then
        dbms_output.put_line(fname || ', Your Salary is less than 2000, EmployeeId ['|| eid ||'].');
    elsif (sal >2000 and sal <5000) then
        dbms_output.put_line(fname || ', Your Salary is Between 2000 and 5000, EmployeeId ['|| eid ||'].');
    elsif (sal >5000 and sal <7000) then
        dbms_output.put_line(fname || ', Your Salary is Between 5000 and 7000, EmployeeId ['|| eid ||'].');
    elsif (sal >7000 and sal <9000) then
        dbms_output.put_line(fname || ', Your Salary is Between 7000 and 9000, EmployeeId ['|| eid ||'].');
    elsif (sal >9000 and sal <10000) then
        dbms_output.put_line(fname || ', Your Salary is Between 9000 and 10000, EmployeeId ['|| eid ||'].');
    else
        dbms_output.put_line(fname || ', Your Salary is Greater then 10000, EmployeeId ['|| eid ||'].');
    end if;

end;




set serveroutput on

declare
eid number := 176;

begin
    Proc_ifElseBlock(eid);
end;
/
------------------------------------------IF ELSE BLOCK - END -------------------------------------------



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


