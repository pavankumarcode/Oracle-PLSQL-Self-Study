
select employee_id, salary from employees where employee_id=100
--update system.employees set salary = 24000 where employee_id = 100;

--Update Salary based on the input percentage for a specific Employee.



--drop procedure if exists updateSalary
create or replace procedure updateSalary(eid in number, percentage in number, updatedSalary out number)
as
salary number;
newSalary number;

begin

    select salary into salary from system.employees where employee_id = eid;
    
    newSalary := salary + ((salary*percentage)/100);
    
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