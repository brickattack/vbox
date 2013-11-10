#!/usr/bin/env bash
echo "Updating packages..."
sudo apt-get update

echo "Installing apt-add-repository"
sudo apt-get install -y python-software-properties

echo "Adding ppa:pitti/postgresql ppa:rwky/redis ppa:nginx/stable ppa:chris-lea/node.js"
sudo apt-add-repository -y ppa:pitti/postgresql
sudo apt-add-repository -y ppa:rwky/redis
sudo apt-add-repository -y ppa:nginx/stable
sudo apt-add-repository -y ppa:chris-lea/node.js

echo "Updating packages..."
sudo apt-get update

echo "Installing postgresql-9.2 postgresql-client-9.2 postgresql-contrib-9.2"
sudo apt-get install -y postgresql-9.2 postgresql-client-9.2 postgresql-contrib-9.2

echo "Installing postgresql-server-dev-9.2 libpq-dev"
sudo apt-get install -y postgresql-server-dev-9.2 libpq-dev

echo "Updating password for user 'postgres'"
su postgres -c "psql -c \"alter user postgres with password 'postgres';\""

echo "Installing redis-server"
sudo apt-get install -y redis-server

echo "Installing nodejs"
sudo apt-get install -y nodejs

echo "Installing nginx"
sudo apt-get install -y nginx 

echo "Installing build-essential"
sudo apt-get install -y build-essential

echo "Installing ruby1.9.3"
sudo apt-get install ruby1.9.1 ruby1.9.1-dev \
  rubygems1.9.1 irb1.9.1 ri1.9.1 rdoc1.9.1 \
  build-essential libopenssl-ruby1.9.1 libssl-dev zlib1g-dev
sudo update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby1.9.1 400 \
  --slave   /usr/share/man/man1/ruby.1.gz ruby.1.gz \
    /usr/share/man/man1/ruby1.9.1.1.gz \
  --slave   /usr/bin/ri ri /usr/bin/ri1.9.1 \
  --slave   /usr/bin/irb irb /usr/bin/irb1.9.1 \
  --slave   /usr/bin/rdoc rdoc /usr/bin/rdoc1.9.1

echo "Installing imagemagick"
sudo apt-get install -y imagemagick

echo "Creating postgres roles via create_role.sql..."
su postgres -c "psql -f /vagrant/create_role.sql"