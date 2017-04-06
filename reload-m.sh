#!/bin/bash

git pull
python manage.py makemigrations
python manage.py migrate
./rundebug.sh