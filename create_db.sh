#!/bin/bash

DB_NAME=$1

if [ -z "$DB_NAME" ]; then
    echo "Usage: ./create_db.sh <dbname>"
    exit 1
fi

DB_USER="${DB_NAME}_user"

DB_PASS=$(openssl rand -base64 12)

sudo -u postgres psql <<EOF
CREATE DATABASE $DB_NAME;
CREATE USER $DB_USER WITH ENCRYPTED PASSWORD '$DB_PASS';
GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;
EOF

echo "================================="
echo "Database Created Successfully"
echo "Database Name : $DB_NAME"
echo "Username      : $DB_USER"
echo "Password      : $DB_PASS"
echo "================================="
