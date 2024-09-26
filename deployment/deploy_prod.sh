#!/bin/sh
ssh -o StrictHostKeyChecking=no denis@192.168.121.101 <<EOF
  sudo -su root <<EOC
    cd /root/drfblogproject
    git pull
    source /opt/envs/drfblogproject/bin/activate
    pip install -r requirements.txt
    ./manage.py makemigrations
    ./manage.py migrate --run-syncdb
    sudo service gunicorn restart
    sudo service nginx restart
    exit
  EOC
EOF
