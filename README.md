# LaravelInstance Setup

## Script let's you to create all dependencies for laravel with nginx and PHP 7

### What Script Does ?
This bash script only works with Centos and simply it will install some dependencies such as vim(favorite text editor),git(if you haven't installed yet), nginx (for reverse proxy), mariadb, php 7.1 with modules, creates nginx config file for laravel folder, edits php-fpm.sock for nginx, composer, updates bash_profile for composer and easy access for your laravel folder, clones laravel instance from your git repo, installs laravel with dependencies and generates key for your application and lastly it will set up all permissions for nginx to process laravel.

### Usage 
Clone this repo to your root folder edit with your favorite text editor

Change 155th line  ```root   /usr/share/nginx/LARAVEL_FOLDER/public; ``` with your laravel folder name

Change 230th line ``` sed -i '13 c\alias ALIAS="cd /usr/share/nginx/LARAVEL_FOLDER"' .bash_profile ```with your alias and laravel folder this setting lets you to access in your terminal by typing your alias just for ease.

Change 251st line ```git clone https://USER:PASSWORD@github.com/USER/REPO.git ``` with your github critentials 
Change 261st line ```cd /usr/share/nginx/LARAVEL_FOLDER``` with your laravel folder
Change 302nd and 303rd  lines with your laravel folder

### Contribution

Feel free to fork this repo.
