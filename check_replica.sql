/*
  Usage (local):
    sudo -iu postgres psql -f path_to/check_replica.sql

  Or remotely:
    ssh mhost2 "sudo -iu postgres psql -f path_to/check_replica.sql"
    ssh mhost3 "sudo -iu postgres psql -f path_to/check_replica.sql"
    ssh mhost4 "sudo -iu postgres psql -f path_to/check_replica.sql"
*/

-- PostgreSQL Streaming Replication Check (Replica)
SELECT pg_is_in_recovery();
