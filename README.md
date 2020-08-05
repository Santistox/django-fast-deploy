# How to fast deploy or create your django project

This guide was made for and tested on Linux version [Ubuntu 16.04 LTS](https://releases.ubuntu.com/16.04/)

### Deploy

1. Update and upgrade your server package control manager:

    `$> sudo apt-get update -y && sudo apt-get upgrade -y`

2. Clone or transfer your project (for example [my simple project](https://github.com/Santistox/onlineshop)):

    `$> git clone https://github.com/Santistox/onlineshop.git`

3. Clone django-fast-deploy:

    `$> git clone https://github.com/Santistox/django-fast-deploy.git deployment`

4. Go to deployment directory and run script:

    `$> cd deployment && bash install.sh`

5. Follow the instructions that the script sends and answer them correctly.


The project was successfully launched!


***


### May be helpful

* [How to install update on your project](https://github.com/Santistox/django-fast-deploy/wiki/Update-project)

* [List of common errors and their solutions](https://github.com/Santistox/django-fast-deploy/wiki/Django-Fast-Deploy-Errors)

* [Have suggestions for improvement or a problem](https://github.com/Santistox/django-fast-deploy/issues)


***

### Thanks
Thank you for your attention to my project, it motivates me to develop tools for easier developer work.