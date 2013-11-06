#!/usr/bin/env bash
echo "Updating packages..."
apt-get update

echo "Installing apt-add-repository"
apt-get install -y python-software-properties

echo "Adding ppa:pitti/postgresql ppa:rwky/redis ppa:nginx/stable ppa:chris-lea/node.js"
apt-add-repository -y ppa:pitti/postgresql
apt-add-repository -y ppa:rwky/redis
apt-add-repository -y ppa:nginx/stable
apt-add-repository -y ppa:chris-lea/node.js

echo "Updating packages..."
apt-get update

echo "Installing postgresql-9.2 redis-server nodejs nginx ruby1.9.3"
apt-get install -y postgresql-9.2 redis-server nodejs nginx ruby1.9.3

echo "Creating postgres roles via create_role.sql"
su postgres
psql -f /vagrant/create_role.sql
exit
