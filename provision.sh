#! /usr/bin/env bash

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y autoremove
sudo apt-get -y clean

echo -e "\n====> installing mysql\n"

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get install -y mysql-server

# make sure curl is installed
echo -e "\n====> make sure curl is installed\n"
sudo apt-get install curl


echo -e "\n====> installing rvm\n"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash
echo progress-bar >> ~/.curlrc
source /home/vagrant/.rvm/scripts/rvm

echo -e "\n====> installing ruby 1.8.7-p374\n"
rvm install 1.8.7-p374
rvm use --default 1.8.7-p374
echo -e "\n====> installing rubygems 1.3.6\n"
gem update --system 1.3.6

echo -e "\n====> instaling mysql gem dependencies\n"
sudo apt-get install -y libmysqlclient-dev
echo -e "\n====> installing nokogiri dependencies\n"
sudo apt-get install -y build-essential patch libxml2-dev libxslt-dev

gem install bundler -v 1.12.5

cd /app
bundle install

rake db:create
rake db:migrate

