#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m'
echo
echo
echo -e "\t${GREEN}Reloading with static files${NC}"

echo
echo -e "${GREEN}GIT:${NC}"
echo

git pull

echo
echo -e "${GREEN}COLLECT-STATIC[django]:${NC}"
echo
python manage.py collectstatic

./rundebug.sh