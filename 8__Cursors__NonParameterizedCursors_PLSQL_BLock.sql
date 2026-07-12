

------------------------------------------CURSORS - BEGIN -------------------------------------------
--Youtube Tutorial : [https://www.youtube.com/watch?v=6eeoPeiDBmY&list=PLiLpmqwkwkCvIUXoBNkEQEgI-ftOvXf38&index=17]


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


------------------------------------------CURSORS -   END -------------------------------------------
