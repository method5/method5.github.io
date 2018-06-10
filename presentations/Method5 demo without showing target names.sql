--------------------------------------------------------------------------------
--Method5 live demo for presentations.
--(Normally these statements would include a simpler "select *", but I used
-- some extra code to hide the target names.)
--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
--#1: Simple function.
--------------------------------------------------------------------------------

select ora_hash(database_name), startup_time
from table(m5('select startup_time from v$instance', 'dev,qa'));



--------------------------------------------------------------------------------
--#2: Simple procedure.  First gather the data asynchronously.
--------------------------------------------------------------------------------

begin
  m5_proc(
    p_code                => q'[ begin dbms_output.put_line('Hello, World!'); end; ]',
    p_targets             => 'dev,qa',
    p_table_name          => 'test_data',
    p_table_exists_action => 'drop',
    p_asynchronous        => true,
    p_run_as_sys          => false
  );
end;
/


--Then check the results, metadata, and errors.
select ora_hash(database_name) database_name, to_char(result) result
from m5_results
order by database_name;

select *
from m5_metadata
order by date_started;

select ora_hash(database_name) database_name, ora_hash(db_link_name) db_link_name, date_error, error_stack_and_backtrace
from m5_errors
order by database_name;



--------------------------------------------------------------------------------
--#3: Shell script.
--------------------------------------------------------------------------------

select ora_hash(host_name) host_name, line_number, output
from table(m5('#!/bin/ksh' || chr(10) || 'df -h|grep /tmp;', 'qa'));



--------------------------------------------------------------------------------
--#4: Global data dictionary - DBA_USERS.
--------------------------------------------------------------------------------

select ora_hash(database_name) database_name
from m5_dba_users
where username = 'SYSTEM'
order by database_name;



--------------------------------------------------------------------------------
--#5: Global data dictionary - V$PARAMETER.
--------------------------------------------------------------------------------

select ora_hash(database_name), display_value
from m5_v$parameter
where name = 'resumable_timeout'
order by database_name;

