#!/bin/bash
echo $HOME
printf "#####\nINSTALLING NODEJS\n#####"

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash
sudo apt-get install nodejs
mkdir ~/.npm-global
npm config set prfix '~/.npm-global'
printf "#### \n SET NPM CONFIG \n ####\n"
echo "export PATH=~/.npm-global/bin:$PATH" >> ~/.profile

sudo apt-get install sqlite3
sudo apt update
sudo apt install -y nginx

sudo ufw allow 'Nginx Full'
sudo ufw allow 'OpenSSH'
sudo ufw allow 22/tcp
sudo ufw enable
sudo ufw status

cd ~
git clone https://github.com/clementsjj/strapsby.git

# Remove default nginx configuration
sudo rm /etc/nginx/nginx.conf
sudo rm -rf /etc/nginx/sites-enabled
sudo rm -rf /etc/nginx/sites-available

# Copy over new configs
cp ~/strapsby/server/anastasia/config/nginx.conf /etc/nginx/nginx.conf
cp ~/strapsby/server/anastasia/config/default.conf /etc/nginx/conf.d/default.conf

mkdir ~/www
mkdir ~/share

cp ~/strapsby/server/anastasia/config/www/index.html ~/www/index.html
