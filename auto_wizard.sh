#!/bin/bash
service postgresql-9.6 start
/bin/sleep 5
KYLO_WIZARD=$(expect -c "
set timeout 10
spawn /opt/kylo/setup/setup-wizard.sh
expect \"Would you like to install the database scripts to a local database instance? Please enter y/n:\"
send \"y\r\"
log_file -a output.log
expect \"1) MySQL\r2) PostgresSQL\r\"
send \"2\r\"
expect \"Please enter the database hostname or IP, hit Enter for 'localhost'\r\"
send \"127.0.0.1\r\"
expect \"Please enter the database ADMIN username\r\"
send \"kylo\r\"
expect \"Please enter the database ADMIN password\r\"
send \"kylo\r\"
expect \"Would you like me to install a local elasticsearch instance? Please enter y/n:\"
send \"y\r\"
expect \"Would you like me to install a local activemq instance?  Please enter y/n:\"
send \"y\r\"
expect \"Would you like me to install a local nifi instance? Please enter y/n:\"
send \"y\r\"
expect \"4) Java is already setup. No changes necessary\r\"
send \"4\r\"

log_file -a output.log

set timeout -1
expect \"Installation Complete\r\"
log_file -a output.log
")

echo "$KYLO_WIZARD"echo "$KYLO_WIZARD"
