@echo off
echo Setup Start
timeout /t 3

echo create custom Files ...
REM Generiere die config.json-Datei
echo {>"config.json"
echo   "clientId": "000000000000000000",>>"config.json"
echo   "guildId": "000000000000000000",>>"config.json"
echo   "token": "YOUR_TOKEN_PLS_KEEP_SECRET">>"config.json"
echo }>>"config.json"

REM Erstelle die dev.db-Datei
type nul >"dev.db"

echo delete initial Folder and Files ...
del /q "package.json" "package-lock.json"
rmdir /s /q "node_modules"

echo editing NPM Files ...
@echo off
(
  echo {
  echo   "name": "discord-bot",
  echo   "version": "1.0.0",
  echo   "description": "discord.js v14",
  echo   "main": "index.js",
  echo   "scripts": {
  echo     "cmdd": "node ./scripts/cmd-d.js",
  echo     "cmdg": "node ./scripts/cmd-g.js",
  echo     "cmds": "node ./scripts/cmd-s.js",
  echo     "test": "nodemon"
  echo   },
  echo   "repository": {
  echo     "type": "git",
  echo     "url": "INSERT_YOUR_GIT_URL_HERE"
  echo   },
  echo   "author": "YOUR_NAME",
  echo   "license": "ISC",
  echo   "dependencies": {
  echo     "discord.js": "^14.11.0",
  echo     "forever": "^4.0.3",
  echo     "prisma": "^5.0.0"
  echo   }
  echo }
) > "package.json"


echo ---------------------------
echo ---------------------------
echo DONE BUT PLS insert you Data in config.json and package.json.
echo AFTER THIS run $npm i nodemon -g
echo You can manage Commands for your Bot with the cmd... Commands in package.json if you run $npm run cmd...
echo HAvE FuN!
echo ---------------------------
echo ---------------------------
echo after timeout 20 sec the setup will install the packages and than close
timeout /t 20
npm i discord.js forever prisma

