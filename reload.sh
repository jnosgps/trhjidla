#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m'
echo
echo
echo -e "\t${GREEN}Reloading (no static dir updates or migrations)${NC}"
echo
echo -e "${GREEN}GIT:${NC}"
echo
git pull
./rundebug.sh