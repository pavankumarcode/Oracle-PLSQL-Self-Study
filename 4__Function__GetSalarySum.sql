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
lowthreshold number := 6000;
begin

    --totSal := getSalarySum;
    --dbms_output.put_line('Total Salary is ['|| totSal ||']');
    totSal := getSalarySum(lowthreshold, total);
    dbms_output.put_line('Total Salary greater than ['|| lowthreshold ||'] is ['|| totSal ||'] In OUT Variable ['||total||'].');
    
end;
/