--   __  __      _   _               _ _____ 
--  |  \/  |    | | | |             | | ____|
--  | \  / | ___| |_| |__   ___   __| | |__  
--  | |\/| |/ _ \ __| '_ \ / _ \ / _` |___ \ 
--  | |  | |  __/ |_| | | | (_) | (_| |___) |
--  |_|  |_|\___|\__|_| |_|\___/ \__,_|____/ 

























-- Simple query:
select * from dual;

























-- Simple Method5 example:
select * from table(m5('select * from dual'));
























-- Advantages:
-- 1. Performance
-- 2. Interface
-- 3. Relational Data
-- 4. Easy Administration
-- 5. Security
-- 6. Exceptions and Metadata

























-- Results, metadata, and errors:
select * from m5_results;
select * from m5_metadata;
select * from m5_errors;

























-- Run as a Procedure:
begin
	m5_proc(
		p_targets => 'not_a_real_database_name',
		p_code	=>
		q'[
			begin
				for old_passwords in
				(
					--Active user accounts that haven't changed their password in the 60 days.
					select 'alter user "'||dba_users.username||'" account lock ' v_sql
					from dba_users
					join sys.user$
						on dba_users.username = sys.user$.name
					where
						--Active.  "Expired" accounts can still logon.
						account_status in ('EXPIRED', 'EXPIRED(GRACE) ' , 'OPEN')
						--User account.
						and profile in ('PROFILE1', 'PROFILE2')
						--Password has not been changed in the past 60 days.
						and sysdate >= ptime + 61
				) loop
					execute immediate old_passwords.v_sql;
				end loop;
				dbms_output.put_line('Done');
			end;
		]'
	);
end;
/
























-- Define Targets:

-- Simple Targets:
select * from table(m5('alter user some_user account lock', 'db1,QA,server1,ACME,DEV%5'));

-- Complex Targets:
select * from table(m5('alter user some_made_up_username account lock', q'[select database_name from m5_database where ...]'));
select * from table(m5('alter user some_made_up_username account lock', '$asm'));





























-- Table name:
begin
	m5_proc(
		p_code => 'select sysdate the_date, sum(bytes)/1024/1024/1024 gb from dba_segments',
		p_targets => '%dv01',
		p_table_name => 'qa_segment_sizes1'
	);
end;
/



























-- Table exists action:
begin
	m5_proc(
		p_code => 'select sysdate the_date, sum(bytes)/1024/1024/1024 gb from dba_segments',
		p_targets => '%dv01',
		p_table_name => 'qa_segment_sizes1',
		p_table_exists_action => 'APPEND'
	);
end;
/


























-- Asynchronous:
begin
	m5_proc(
		p_targets => '%dv01',
		p_table_name => 'v_last_days_sample_counts',
		p_table_exists_action => 'DROP',
		p_asynchronous => false,
		p_code => q'<
			select username, count(*) total
			from gv$active_session_history
			join dba_users on gv$active_session_history.user_id = dba_users.user_id
			where sample_time > sysdate - interval '1' hour
			group by username
		>'
	);
end;
/

























-- Find missing index:
select * from table(m5(q'[
	select count(*)
	from dba_indexes
	where owner = 'SOME_USER'
		and index_name = 'SOME_INDEX'	
]'));

























-- Find excessive recycle bin objects:
select * from table(m5('select count(*) from dba_recyclebin'));

























-- Thanks for watching!
select
q'[

  __  __      _   _               _ _____        _____ _ _   _           _           _       
 |  \/  |    | | | |             | | ____|      / ____(_) | | |         | |         (_)      
 | \  / | ___| |_| |__   ___   __| | |__       | |  __ _| |_| |__  _   _| |__        _  ___  
 | |\/| |/ _ \ __| '_ \ / _ \ / _` |___ \      | | |_ | | __| '_ \| | | | '_ \      | |/ _ \ 
 | |  | |  __/ |_| | | | (_) | (_| |___) |  _  | |__| | | |_| | | | |_| | |_) |  _  | | (_) |
 |_|  |_|\___|\__|_| |_|\___/ \__,_|____/  (_)  \_____|_|\__|_| |_|\__,_|_.__/  (_) |_|\___/ 


]'
from dual;








