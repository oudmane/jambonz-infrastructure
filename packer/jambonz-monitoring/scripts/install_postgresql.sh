#!/bin/bash

if [ "$1" == "yes" ]; then

DB_USER=$2
DB_PASS=$3

sudo apt-get update
sudo apt-get install -y postgresql
sudo systemctl daemon-reload
sudo systemctl enable postgresql
sudo systemctl restart postgresql

sudo -u postgres psql -c "CREATE DATABASE homer_config;"
sudo -u postgres psql -c "CREATE DATABASE homer_data;"
sudo -u postgres psql -c "CREATE ROLE ${DB_USER} WITH SUPERUSER LOGIN PASSWORD '$DB_PASS';"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE homer_config to ${DB_USER};"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE homer_data to ${DB_USER};"

fi