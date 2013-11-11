#!/usr/bin/env bash
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8
sudo dpkg-reconfigure locales

echo "************************************************************"
echo "Updating packages..."
echo "************************************************************"
sudo apt-get update

echo "************************************************************"
echo "Installing apt-add-repository"
echo "************************************************************"
sudo apt-get install -y python-software-properties

echo "************************************************************"
echo "Adding ppa:pitti/postgresql ppa:rwky/redis ppa:nginx/stable ppa:chris-lea/node.js"
echo "************************************************************"
sudo apt-add-repository -y ppa:pitti/postgresql
sudo apt-add-repository -y ppa:rwky/redis
sudo apt-add-repository -y ppa:nginx/stable
sudo apt-add-repository -y ppa:chris-lea/node.js

echo "************************************************************"
echo "Updating packages..."
echo "************************************************************"
sudo apt-get update

echo "************************************************************"
echo "Installing postgresql-9.2 postgresql-client-9.2 postgresql-contrib-9.2"
echo "************************************************************"
sudo apt-get install -y postgresql-9.2 postgresql-client-9.2 postgresql-contrib-9.2

echo "************************************************************"
echo "Installing postgresql-server-dev-9.2 libpq-dev"
echo "************************************************************"
sudo apt-get install -y postgresql-server-dev-9.2 libpq-dev

echo "************************************************************"
echo "Updating password for user 'postgres'"
echo "************************************************************"
su postgres -c "psql -c \"alter user postgres with password 'postgres';\""

echo "************************************************************"
echo "Creating postgres roles via /vagrant/create_role.sql"
echo "************************************************************"
su postgres -c "psql -f /vagrant/create_role.sql"

echo "************************************************************"
echo "Installing redis-server"
echo "************************************************************"
sudo apt-get install -y redis-server

echo "************************************************************"
echo "Installing nodejs"
echo "************************************************************"
sudo apt-get install -y nodejs

echo "************************************************************"
echo "Installing nginx"
echo "************************************************************"
sudo apt-get install -y nginx 

echo "************************************************************"
echo "Installing build-essential, chrpath, git, libssl, and libfontconfig1"
echo "************************************************************"
sudo apt-get install -y build-essential chrpath git-core libssl-dev libfontconfig1-dev

echo "************************************************************"
echo "Installing phantomjs - this may take a while (20+ min)"
echo "************************************************************"

git clone git://github.com/ariya/phantomjs.git
cd phantomjs
git checkout 1.9
sudo ./build.sh --confirm

# for ruby 2.0 http://www.ubuntuupdates.org/ppa/brightbox_ruby_ng_experimental
echo "************************************************************"
echo "Installing ruby1.9.3"
echo "************************************************************"
sudo apt-get install ruby1.9.1 ruby1.9.1-dev \
  rubygems1.9.1 irb1.9.1 ri1.9.1 rdoc1.9.1 \
  build-essential libopenssl-ruby1.9.1 libssl-dev zlib1g-dev
sudo update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby1.9.1 400 \
  --slave   /usr/share/man/man1/ruby.1.gz ruby.1.gz \
    /usr/share/man/man1/ruby1.9.1.1.gz \
  --slave   /usr/bin/ri ri /usr/bin/ri1.9.1 \
  --slave   /usr/bin/irb irb /usr/bin/irb1.9.1 \
  --slave   /usr/bin/rdoc rdoc /usr/bin/rdoc1.9.1

echo "************************************************************"
echo "Installing imagemagick"
echo "************************************************************"
sudo apt-get install -y imagemagick

echo "************************************************************"
echo "Installing ffmpeg and extras"
echo "************************************************************"
sudo apt-get install -y ffmpeg
sudo apt-get install -y libavcodec-extra-53 libavdevice-extra-53 libavfilter-extra-2 libavformat-extra-53 libavutil-extra-51 libpostproc-extra-52 libswscale-extra-2