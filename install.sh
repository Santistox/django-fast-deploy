#!/bin/bash
base_python_interpreter=""
project_domain=""
project_path=""
settings_file_path=""

# request for the path to the interpreter
read -p "Python interpreter (/home/www/.python/bin/python3.6):" base_python_interpreter

# request a site domain
read -p "Your domain (mywebsite.com): " project_domain

# request project path
read -p "Your project path (/home/<user>/<project>) " project_path

# request settings.py path
read -p "Your settings.py file path (/home/<user>/<project>/<django_app_name>/settings.py) " settings_file_path


# create virtual environment
`$base_python_interpreter -m venv ../venv/.

# activate virtual environment
source ../venv/bin/activate

# create directories
mkdir $project_path/deploy
mkdir $project_path/deploy/nginx
mkdir $project_path/deploy/systemd
mkdir $project_path/deploy/gunicorn

# copy deployment files to project
cp nginx/site.conf $project_path/deploy/nginx/
cp systemd/gunicorn.service $project_path/deploy/systemd/
cp gunicorn/empty $project_path/deploy/gunicorn/

# go to the project directory
cd $project_path/

# install pip upgrades
pip install --upgrade pip

# install project requirements.txt
pip install -r requirements.txt

# install gunicorn to project
pip install gunicorn

# set up settings for nginx gunicorn
sed -i "s~dbms_template_path~$project_path~g" nginx/site.conf systemd/gunicorn.service
sed -i "s~dbms_template_domain~$project_domain~g" nginx/site.conf $settings_file_path

# linking to settings files
sudo ln -s $project_path/deploy/nginx/site.conf /etc/nginx/sites-enabled/
sudo ln -s $project_path/deploy/systemd/gunicorn.service /etc/systemd/system/

# reload systemd manager configuration
sudo systemctl daemon-reload

# start gunicorn
sudo systemctl start gunicorn

# run gunicorn on system startup
sudo systemctl enable gunicorn

# restart nginx
sudo service nginx restart
