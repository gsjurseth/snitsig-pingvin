#!/bin/bash

sudo apt install -y wget

wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -

echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.2 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list

sudo apt update
sudo apt install -y mongodb-org

sudo sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf

sudo systemctl restart mongod

mongo  --eval \
 'db.createUser( { user: "mongoadmin", pwd: "Il1k3Traf!k", roles: [ { role: "userAdminAnyDatabase", db: "admin" } ] })' admin

mongo -u mongoadmin -p 'Il1k3Traf!k' --eval \
  'db.createUser( { user: "appuser", pwd: "apppwd", roles:[ { role: "readWrite" , db:"appdb" } ] })' \
  admin

