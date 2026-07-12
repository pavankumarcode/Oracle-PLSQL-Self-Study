------------------------------------------RECORD DATA TYPE - BEGIN -------------------------------------------

--Youtube Tutorial : [https://www.youtube.com/watch?v=IGNmTgpYOrk&list=PLiLpmqwkwkCvIUXoBNkEQEgI-ftOvXf38&index=19]

--USER DEFINED RECORD DATA TYPE
--drop procedure if exists procedureLearnUserDefinedRecordDataType
create or replace procedure procedureLearnUserDefinedRecordDataType
as


type userDefinedRecord is record
(eid number,
fname varchar2(50),
sal number
);

UDRecord userDefinedRecord;
counter number;

cursor employeeRecordCursor is select employee_id, first_name, salary into UDRecord from system.employees;

begin

--This can be done in both Table based or Cursor Based, below given is the Table Based implementation.
    for counter in 100..200
    loop
        select employee_id, first_name, salary into UDRecord from system.employees where employee_id = counter;
        dbms_output.put_line('Row Count ['|| counter ||'] Employee ID['||UDRecord.eid||'] First Name ['||UDRecord.fname||'], Salary['||UDRecord.sal||']');
    end loop;


--Below given is the Cursor Based implementation.

    open employeeRecordCursor;
    
    loop
        fetch employeeRecordCursor into UDRecord;
        exit when employeeRecordCursor%notfound;
        dbms_output.put_line('Row Count ['|| employeeRecordCursor%rowcount ||'] Employee ID['||UDRecord.eid||'] First Name ['||UDRecord.fname||'], Salary['||UDRecord.sal||']');
    end loop;
    
    close employeeRecordCursor;


end;



set serveroutput on
declare
begin
procedureLearnUserDefinedRecordDataType();
end;



------------------------------------------RECORD DATA TYPE -   END -------------------------------------------