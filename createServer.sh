#!bash

#1 Epel Release

echo "Would you like to install Epel Release? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
        sudo yum install epel-release -y
else
        echo "Stopped by user"
fi

#1.2 Vim

echo "Would you like to install Vim? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
        sudo yum install vim -y
else
        echo "Stopped by user"
fi

#1.3 Git

echo "Would you like to install Git? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
        sudo yum install git -y
else
        echo "Stopped by user"
fi


#2 Nginx

echo "Would you like to install Nginx? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
      sudo yum install nginx -y
else
        echo "Stopped by user"
fi

#3 Nginx Activate

echo "Would you activate to Nginx? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
    sudo systemctl start nginx
else
        echo "Stopped by user"
fi

#4 Enable nginx

echo "Would you enable startup to Nginx? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
    sudo systemctl enable nginx
else
        echo "Stopped by user"
fi

#5 MariaDB

echo "Would you install MariaDB? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
    sudo yum install mariadb-server mariadb -y
else
        echo "Stopped by user"
fi

#6 systemctl MariaDB

echo "Would you systemctl MariaDB? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
  sudo systemctl start mariadb
else
        echo "Stopped by user"
fi

#7 systemctl MariaDB

echo "Would you systemctl MariaDB? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
  sudo systemctl start mariadb
else
        echo "Stopped by user"
fi

#8 PHP7

echo "Would you install PHP repos? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
  wget http://rpms.remirepo.net/enterprise/remi-release-7.rpm
  rpm -Uvh remi-release-7.rpm
else
        echo "Stopped by user"
fi

#9 PHP7

echo "Would you enable PHP repos? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
  yum install yum-utils -y
yum-config-manager --enable remi-php71
else
        echo "Stopped by user"
fi

#10 PHP7

echo "Would you install PHP? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
yum --enablerepo=remi,remi-php71 install php-fpm php-common -y
else
        echo "Stopped by user"
fi

#11 PHP7

echo "Would you install PHP modules? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
yum --enablerepo=remi,remi-php71 install php-opcache php-pecl-apcu php-cli php-pear php-pdo php-mysqlnd php-pgsql php-pecl-mongodb php-pecl-redis php-pecl-memcache php-pecl-memcached php-gd php-mbstring php-mcrypt php-xml -y
else
        echo "Stopped by user"
fi

#12 PHP7

echo "Would you install zip PHP modules? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
yum install zip unzip php7.1-zip -y
else
        echo "Stopped by user"
fi


#13 Config nginx

echo "Would you config create laravel config file? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
echo "server {
    listen       80;
    server_name  SERVER_IP;
    root   /usr/share/nginx/LARAVEL_FOLDER/public;
    index index.php index.html index.htm;

    location / {
        try_files "\$uri" "\$uri/" /index.php?"\$query_string";
    }
    error_page 404 /404.html;
    error_page 500 502 503 504 /50x.html;
    location = /50x.html {
        root /usr/share/nginx/html;
    }

    location ~ \.php$ {
    try_files "\$uri" =404;
    fastcgi_pass unix:/var/run/php-fpm/php-fpm.sock;
    fastcgi_index index.php;
    fastcgi_param SCRIPT_FILENAME "\$document_root$fastcgi_script_name";
    include fastcgi_params;
}
}" > /etc/nginx/conf.d/default.conf
else
        echo "Stopped by user"
fi

#14 Config nginx

echo "Would you edit php.ini? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
 sed -i '39 c\listen = /var/run/php-fpm/php-fpm.sock' /etc/php-fpm.d/www.conf
 sed -i '23 c\user = nginx' /etc/php-fpm.d/www.conf
 sed -i '24 c\group = nginx' /etc/php-fpm.d/www.conf
 sed -i '49 c\listen.owner = nginx' /etc/php-fpm.d/www.conf
 sed -i '50 c\listen.group = nginx' /etc/php-fpm.d/www.conf

else
        echo "Stopped by user"
fi

#14.1 Restart Services

echo "Would you Restart services? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

systemctl restart nginx
systemctl start php-fpm.service
systemctl enable php-fpm.service

else
        echo "Stopped by user"
fi

#15 Composer

echo "Would you install Composer? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
  php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
  php composer-setup.php
  php -r "unlink('composer-setup.php');"

else
        echo "Stopped by user"
fi

#16 Bash Profile

echo "Would you update bash profile? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then

  sed -i '12 c\alias composer="php /root/composer.phar"' .bash_profile
  sed -i '13 c\alias ALIAS="cd /usr/share/nginx/LARAVEL_FOLDER"' .bash_profile
  sed -i '14 c\alias refbash="source ~/.bash_profile"' .bash_profile
else
        echo "Stopped by user"
fi

#16 Git Clone

echo "Would you clone git repo? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
cd /usr/share/nginx/
else
        echo "Stopped by user"
fi

#16.1 Git Clone

echo "Would you clone git repo? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
git clone https://USER:PASSWORD@github.com/USER/REPO.git
else
        echo "Stopped by user"
fi

#17 Install Instance

echo "Would you like to install laravel instance? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
cd /usr/share/nginx/LARAVEL_FOLDER
else
        echo "Stopped by user"
fi

#17.1 Install Instance

echo "Would you like to update composer dependencies? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
cp .env.example .env
else
        echo "Stopped by user"
fi

#17.2 Install Instance

echo "Would you like to update composer dependencies? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
composer update
else
        echo "Stopped by user"
fi

#17.3 Install Instance

echo "Would you like to generate key for instance? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
php artisan key:generate
else
        echo "Stopped by user"
fi

#18 Set Permissions

echo "Would you like to set permissions? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
cd ..
sudo chown nginx:nginx -R LARAVEL_FOLDER/
cd LARAVEL_FOLDER/
sudo chmod -R o+w storage/
else
        echo "Stopped by user"
fi
