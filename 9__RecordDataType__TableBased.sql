------------------------------------------RECORD DATA TYPE - BEGIN -------------------------------------------

--Youtube Tutorial : [https://www.youtube.com/watch?v=IGNmTgpYOrk&list=PLiLpmqwkwkCvIUXoBNkEQEgI-ftOvXf38&index=19]

--TABLE BASED RECORD DATA TYPE
--drop procedure if exists procedureLearnTableBasedRecordDataType
create or replace procedure procedureLearnTableBasedRecordDataType
as

tableBasedRecord system.employees%rowtype;
eidCounter number;

begin

    for eidCounter in 100..200
    loop
        select * into tableBasedRecord from system.employees where employee_id = eidCounter;
        dbms_output.put_line('Row Count ['|| eidCounter ||'] DeptID['||tableBasedRecord.department_id ||'] Employee ID['||tableBasedRecord.employee_id||'] First Name ['||tableBasedRecord.first_name||'], Salary['||tableBasedRecord.salary||']');
    end loop;

end;


set serveroutput on
declare

begin
procedureLearnTableBasedRecordDataType();
end;



------------------------------------------RECORD DATA TYPE -   END -------------------------------------------