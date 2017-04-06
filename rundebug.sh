#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m'
echo
echo
echo -e "\t${GREEN}Starting debug server [test.trhjidla.cz:80]${NC}"
echo

python manage.py runserver test.trhjidla.cz:80