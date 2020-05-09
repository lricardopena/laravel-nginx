# Laravel and NGINX
This project is how to setup Laravel and NGINX on ubuntu and an empty Laravel project using PHP 7.4. Here we assume that youy can ba able to run the command "composer" and you have NGINX installed in your computer.


## First Clone the repository or download the files
You can download on a folder when you want to create the project.

## Modify the example.conf file
You need to open this file and modify the line 5 (<YOUR PUBLIC FOLDER POINT TO INDEX>) and put where it will be you file "index" of you Laravel aplication, for example, if you are running the script on the folder "/var/www/html" and your application is going to be "appexample", then you need to replace by /var/www/html/appexample/public
  
After that, you need to modifify the line 9, here you need to put the URL that you want to access to your app, for example if you want to access to your app by the URL "http://www.appexample.test" then you need to replace <DOMAIN_INDEX> by "appexample.test" in the file example.conf.
  
## Create the Laravel project and configure NGINX

You can run the file 'set_project_laravel_NGINX.sh' sending as first parameter the name of your application to create by laravel and as second parameter the URL to access to the app (without www.), for example if you want to name to your app as "appexample" and you want to access by http://www.appexample.test, then you need to run the following commands:
```
chmod +x set_project_laravel_NGINX.sh
./set_project_laravel_NGINX.sh appexample appexample.test
```
And these commands will generate the laravel app and configure the NGINX.

If you don't want to run this script you can check it and run line by line and replace "$0" by the name of your app and "$1" by the URL.

## Configure the Hosts
Now you need to configure the file /etc/hosts and you can do it running the following command
```
sudo nano /etc/hosts
```
and adding to the file the following:
127.0.0.1     <URL>
 where <URL> it is the URL of your app, for example if you want to access by http://www.appexample.test, then you need to add
 
 127.0.0.1    appexample.test
 
 To the hosts file.
