/*
  This guide helps manage and monitor a PostgreSQL streaming replication setup across multiple nodes.
*/

/*
  PostgreSQL streaming replication health check
  Purpose: Ensure replication is functioning correctly and WAL lag is within acceptable limits.
  Usage: Run in psql as the postgres user
  Command: sudo -iu postgres psql -f check_replication.sql
*/

-- On Master (mhost1)
SELECT client_addr, state, sync_state FROM pg_stat_replication;
SELECT pg_current_wal_lsn();
SELECT datname, oid FROM pg_database WHERE datname = 'postgres';
SELECT oid, * FROM pg_tablespace;
SELECT * FROM pg_replication_slots;
SELECT redo_lsn, slot_name, restart_lsn,
       round((redo_lsn - restart_lsn)/1024/1024/1024, 2) AS behind
FROM pg_control_checkpoint(), pg_replication_slots;

-- On Replica (mhost2, mhost3, mhost4)
/*
  Run separately on each replica host
  Usage: Run in psql as the postgres user
  Command: sudo -iu postgres psql -f check_replication.sql
*/
SELECT pg_is_in_recovery();

/*
  This file is used as a base and can optionally be split into:
  - check_master.sql
  - check_replica.sql
*/
