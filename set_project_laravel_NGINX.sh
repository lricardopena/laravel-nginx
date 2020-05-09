#!/bin/bash

# As first parameter you need to sen the name of the new project
# As second parameter you need to send the url (without www.), for example, example.test

# ========= Install PHP7.4 and all the thinks needed
sudo apt-get update && apt-get install php7.4-cli php7.4-curl php7.4-mysql php7.4-fpm php7.4-gd php7.4-xml php7.4-mbstring php7.4-zip php7.4-soap php7.4-dev -y

# ===== Set PHP 7.4 as default (we use /var/run/php/php7.4-fpm.sock in the configuration of NGINX, if you want to omit this part and use your other you are welcome, but you need to change the fpm in the configuration file
sudo update-alternatives --set php /usr/bin/php7.4

# ====== create the project and go to that folder =======
composer create-project --prefer-dist laravel/laravel $0
cd $0


# === Grant Permisions to storage
sudo chgrp -R www-data storage bootstrap/cache && chmod -R ug+rwx storage bootstrap/cache

# ====== Copy the config example to NGINX and put is as available =================
sudo cp example.conf /etc/nginx/sites-available/$1
sudo ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled/

# ==== Reaload NGINX and fpm ================
sudo systemctl reload nginx
sudo service php7.4-fpm restart