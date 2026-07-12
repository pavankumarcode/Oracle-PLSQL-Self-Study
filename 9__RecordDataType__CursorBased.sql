------------------------------------------RECORD DATA TYPE - BEGIN -------------------------------------------

--Youtube Tutorial : [https://www.youtube.com/watch?v=IGNmTgpYOrk&list=PLiLpmqwkwkCvIUXoBNkEQEgI-ftOvXf38&index=19]


--CURSOR BASED RECORD DATA TYPE
--drop procedure if exists procedureLearnCursorBasedRecordDataType
create or replace procedure procedureLearnCursorBasedRecordDataType
as

cursor employeeRecordCursor is select * from employees;

employeeRecord employeeRecordCursor%rowtype;

begin
    open employeeRecordCursor;
        loop
            fetch employeeRecordCursor into employeeRecord;
            exit when employeeRecordCursor%notfound;
            dbms_output.put_line('Row Count ['|| employeeRecordCursor%rowcount ||'] DeptID['||employeeRecord.department_id ||'] Employee ID['||employeeRecord.employee_id||'] First Name ['||employeeRecord.first_name||'], Salary['||employeeRecord.salary||']');
        end loop;
    close employeeRecordCursor;
end;


set serveroutput on
declare

begin
procedureLearnCursorBasedRecordDataType();
end;

------------------------------------------RECORD DATA TYPE -   END -------------------------------------------