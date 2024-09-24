#!/bin/sh

ssh root@192.168.125.255 <<EOF
  cd devops/blogprojectdrf
  git pull 
  source env/bin/activate
  ./manage.py migrate
  sudo systemctl restart nginx
  sudo service gunicorn restart
  sudo service nginx restart
  exit
EOF