
--YouTube Tutorial Playlist: [https://www.youtube.com/playlist?list=PLiLpmqwkwkCvIUXoBNkEQEgI-ftOvXf38]



--drop procedure if exists myfirstprocedure
create or replace procedure myfirstprocedure
as
var1 number :=10;
begin

dbms_output.put_line('This is my first proceduce, variable value ['||var1 ||']');
end;
/



set serveroutput on
begin
myfirstprocedure;
end;


select * from user_source -- This is where all the procedures and functions are stored
select * from all_procedures

SELECT version FROM v$instance; -- this is to check the version of the Oracle DB.