# ansible-postgresql-cluster
Ansible automation for deploying a PostgreSQL cluster with streaming replication on Rocky Linux (a Red Hat-compatible distribution). This project provides end-to-end orchestration of control and database nodes, including passwordless SSH setup, secure user and privilege configuration, streaming replication between master and replica nodes, automated failover checks, and robust backup and data loading capabilities.

## Features
- Automated setup of:
  - Control node and 4 managed nodes
  - devops user for passwordless SSH and sudo access
  - Hostname resolution across all nodes
  - PostgreSQL installation and configuration
  - Streaming replication setup
- Inventory-driven node management
- Built for **Rocky Linux** environments

## Cluster Architecture
                           +--------------------+
                           |   Control Node     |
                           |  (Ansible Master)  |
                           | control.example.com|
                           +--------------------+
                                     |
+---------------+----------------+----------------+----------------+
|  PostgreSQL   |  PostgreSQL    |  PostgreSQL    |  PostgreSQL    |
|   Master      |   Slave        |   Slave        |   Slave        |
|   mhost1      |   mhost2       |   mhost3       |   mhost4       |
+---------------+----------------+----------------+----------------+
