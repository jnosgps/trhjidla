#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m'
echo
echo
echo -e "\t${GREEN}Reloading with migrations${NC}"

echo
echo -e "${GREEN}GIT:${NC}"
echo

git pull

echo
echo -e "${GREEN}MAKE-MIGRATIONS[django]:${NC}"
echo

python manage.py makemigrations

echo
echo -e "${GREEN}MIGRATE[django]:${NC}"
echo

python manage.py migrate

./rundebug.sh