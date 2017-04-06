#!/bin/bash

git pull
python manage.py collectstatic
./rundebug.sh