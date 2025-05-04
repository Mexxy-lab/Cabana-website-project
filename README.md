
# Welcome to CICD Project for NETFLIX clone app in React

This is a CICD project for deploying a Pythom web app.

## Steps to Deploy a Python web app using Docker file

- Steps

- Created a docker file for the project

- Determined the entry point to be the settings.py file since its a Django/python application. When containerizing a Python web application, you need to determine which port the application listens on. The port is specified within your Python code and is often defined in a web framework like Flask or Django.

- If the Python web application is built using a specific framework or library, consult its documentation to find information about how to configure the port. Frameworks like Flask and Django provide documentation on how to set port numbers.

- Once you've identified the port within your code, you can set the same port when running your Docker container. In the Dockerfile, you have to expose and publish the port to make it accessible from the host machine.

- Settings.py file - What it entails

## The Django settings.py file contains various configurations for your Django project. Some important configurations to note include

- SECRET_KEY: This is a security-sensitive setting that should be kept secret. It's used for cryptographic signing and should not be shared publicly.

- DEBUG: When DEBUG is set to True, Django will run in debug mode, providing detailed error pages for debugging. In a production environment, you should set this to False.

- ALLOWED_HOSTS: This is a list of strings representing the host/domain names that this Django site can serve. You have it set as [3000], but typically, you would specify a domain name or IP address, like ALLOWED_HOSTS = ['yourdomain.com'].

- INSTALLED_APPS: This is a list of all the applications that are enabled in your Django project. In this case, it includes the 'website' app.

- DATABASES: You've configured a MySQL database as your database engine. Ensure that you have the MySQL server running with the specified credentials and database name.

- AUTH_PASSWORD_VALIDATORS: These are the validators used for validating user passwords.

- LANGUAGE_CODE and TIME_ZONE: These settings define the language and time zone for your project.

- USE_I18N and USE_TZ: These settings control internationalization and time zone support in your project.

- STATIC_URL and STATICFILES_DIRS: These settings are for configuring static files (CSS, JavaScript, images) in your project. Static files are typically collected and served using a web server or middleware.

- LOGIN_REDIRECT_URL: This specifies where users should be redirected after a successful login. In your case, it's set to 'admi'.

- Overall, the settings.py file is a central configuration file for your Django project, and the settings you've provided should work for development purposes. However, for production, be sure to change DEBUG and configure ALLOWED_HOSTS properly. Additionally, ensure that your MySQL server is set up correctly and running.

- Created a MySQL container also using below commands, since we need to also access the Database

```bash
docker pull mysql | Used to pull the mysql base image
```

```bash
docker run -d --name mysql-container -e MYSQL_ROOT_PASSWORD=mekulus -p 3306:3306 mysql:latest | Used to create container with pw as mekulus, and container name as mysql-container. Tagged latest
```

```bash
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' mysql-container | Used to get IP of the container to connect to it via terminal
```

```bash
docker exec -it mysql-container mysql -u root -p | Used to connect to the server. Would prompt for password 
```

```bash
CREATE DATABASE mysql_container; | Create Database name and update your settings.py file with new name 
```

```bash
python manage.py migrate | Used to migrate the tables. This command will create the necessary tables in your database
```
