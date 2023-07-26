#!/bin/bash
echo "Setup Start"
sleep 3

echo "create custom Files ..."

# Generiere die config.json-Datei
echo '{
  "clientId": "000000000000000000",
  "guildId": "000000000000000000",
  "token": "YOUR_TOKEN_PLS_KEEP_SECRET"
}' > "config.json"

# Erstelle die dev.db-Datei
touch "dev.db"

echo "delete initial Folder and Files ..."
rm -f "package.json" "package-lock.json"
rm -rf "node_modules"

echo "editing NPM Files ..."
(
  echo '{
  "name": "discord-bot",
  "version": "1.0.0",
  "description": "discord.js v14",
  "main": "index.js",
  "scripts": {
    "cmdd": "node ./scripts/cmd-d.js",
    "cmdg": "node ./scripts/cmd-g.js",
    "cmds": "node ./scripts/cmd-s.js",
    "test": "nodemon"
  },
  "repository": {
    "type": "git",
    "url": "INSERT_YOUR_GIT_URL_HERE"
  },
  "author": "YOUR_NAME",
  "license": "ISC",
  "dependencies": {
    "discord.js": "^14.11.0",
    "forever": "^4.0.3",
    "prisma": "^5.0.0"
  }
}'
) > "package.json"

echo "----------------------------"
echo "----------------------------"
echo "DONE BUT PLS insert you Data in config.json and package.json."
echo "AFTER THIS run npm i nodemon -g"
echo "You can manage Commands for your Bot with the cmd... Commands in package.json if you run npm run cmd..."
echo "HAVE FUN!"
echo "----------------------------"
echo "----------------------------"
echo "after sleep 20 sec the setup will install the packages and then close"
sleep 20

npm i discord.js forever prisma
