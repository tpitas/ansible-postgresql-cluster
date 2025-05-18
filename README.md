# ansible-postgresql-cluster
Ansible automation for deploying a PostgreSQL cluster with streaming replication on Rocky Linux. Includes setup of control and managed nodes, passwordless SSH, user privilege configuration, and cluster orchestration.

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
