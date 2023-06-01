SET lines 2000 pages 15000
col host_name                format a20
col instance_name            format a15 
alter session set nls_date_format='MON/DD/YYYY HH24:MI:SS';
set termout off
set echo on
select (select host_name from v$instance) host_name,
(select instance_name from v$instance) instance_name,
(select sysdate from dual) Run_Time
from dual;
SELECT USERNAME, ACCOUNT_STATUS, LOCK_DATE, EXPIRY_DATE FROM DBA_USERS;
SELECT * FROM DBA_USERS_WITH_DEFPWD;
SELECT * FROM DBA_SYS_PRIVS;
SELECT * FROM DBA_TAB_PRIVS;
SELECT * FROM DBA_ROLE_PRIVS;
select * from v$pwfile_users;
select username, SYSDBA from v$pwfile_users;
select username, SYSOPER from v$pwfile_users;
select username, SYSBACKUP from v$pwfile_users;
select username, SYSDG from v$pwfile_users;
select username, SYSKM from v$pwfile_users;
select username, SYSRAC from v$pwfile_users;
select text "Verify Function" from dba_source 
where owner ='SYS' and type ='FUNCTION'
and name in ('DBAAS_VERIFY_FUNCTION','DEFAULT','MGMT_PASS_VERIFY','MGMT_INTERNAL_PASS_VERIFY',
'ORA12C_STIG_VERIFY_FUNCTION','ORA12C_STRONG_VERIFY_FUNCTION','VERIFY_FUNCTION','VERIFY_FUNCTION_11G',
'VERIFY_FUNCTION_11G_BSWH','VERIFY_PASSWORD');
