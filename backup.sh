#!/bin/bash

# Database credentials
user="feras"
password="charizard"
host="localhost"
db_name="mydatabase"

# Other options
backup_path="/path/to/your/home/_backup/mysql"
date=$(date +"%d-%b-%Y")

# Set default file permissions
umask 177

# Dump database into SQL file
mysqldump --user=$user --password=$password --host=$host $db_name > $backup_path/$db_name-$date.sql

# Delete files older than 30 days
find $backup_path/* -mtime +7 -exec rm {} \;
