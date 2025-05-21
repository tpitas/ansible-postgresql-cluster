/*
  Usage (local):
    sudo -iu postgres psql -f path_to/check_master.sql

  Or remotely:
    ssh mhost1 "sudo -iu postgres psql -f path_to/check_master.sql"
*/

-- PostgreSQL Streaming Replication Check (Master)

SELECT client_addr, state, sync_state FROM pg_stat_replication;
SELECT pg_current_wal_lsn();
SELECT datname, oid FROM pg_database WHERE datname = 'postgres';
SELECT oid, * FROM pg_tablespace;
SELECT * FROM pg_replication_slots;
SELECT redo_lsn, slot_name, restart_lsn,
       round((redo_lsn - restart_lsn)/1024/1024/1024, 2) AS behind
FROM pg_control_checkpoint(), pg_replication_slots;
