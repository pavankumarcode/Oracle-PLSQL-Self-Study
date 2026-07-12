--YouTube Tutorial link: [youtube.com/watch?v=8V-TQ442IJk&list=PLiLpmqwkwkCvIUXoBNkEQEgI-ftOvXf38&index=16&pp=iAQB]





------------------------------------------LOOPS - BEGIN -------------------------------------------




--FOR LOOP
set serveroutput on

declare
countVar number;

begin

    for countVar in 1..10
        loop
        dbms_output.put_line('For Loop - Value of Count is ['|| countVar ||']');
        end loop;

end;




--FOR Loop call Procedure to print the Salary based on Employee ID.
set serveroutput on
declare
eid number;
begin

dbms_output.put_line('For Loop - Using Procedure - Begin');

for eid in 100..200
    loop
    Proc_ifElseBlock(eid); -- We created this in the IF Else session, if you missed this, the definiton is provided at the end of this file.
    end loop;
dbms_output.put_line('For Loop - Using Procedure - End');

end;



------------------------------------------LOOPS - END   -------------------------------------------









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

