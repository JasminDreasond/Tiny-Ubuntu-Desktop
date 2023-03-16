https://support.plesk.com/hc/en-us/articles/115003321434-How-to-enable-remote-access-to-PostgreSQL-databases-hosted-in-Plesk

https://www.postgresql.org/download/linux/ubuntu/
# Install

## Create the file repository configuration:
    sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

## Import the repository signing key:
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

## Update the package lists:
    sudo apt-get update

## Install the latest version of PostgreSQL.
### 1. If you want a specific version, use 'postgresql-12' or similar instead of 'postgresql':
    sudo apt-get -y install postgresql

# Configuration

## 2. Connect to the server via SSH.

    psql -V
    psql (PostgreSQL) 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

In this example, PosgreSQL release version is 14, so the installation path will be /etc/postgresql/14/.

## 3. Modify postgresql.conf:

### 3.1. Open the file /etc/postgresql/14/main/postgresql.conf in a text editor. In this example, we are using the vi editor:

    vi /etc/postgresql/14/main/postgresql.conf

### 3.2. Add the following line at the end of the file:

    listen_addresses = '*'

### 3.3. Save the changes and close the file.

## 4. Modify pg_hba.conf:

### 4.1. Open the file /etc/postgresql/14/main/pg_hba.conf in a text editor:

    vi /etc/postgresql/14/main/pg_hba.conf

### 4.2. Add the following line at the end of the file:

    host samerole all 203.0.113.2/32 md5

where:

203.0.113.2/32 - a remote IP address from which connection is allowed. To allow connections from any IP address, specify 0.0.0.0/0.
md5 - authentication method, which requires the client to supply a double-MD5-hashed password for authentication. To learn more about authentication methods, visit this PostgreSQL documentation page.

### 4.3. Save the changes and close the file.

Restart PostgreSQL service to apply the changes:

    service postgresql restart