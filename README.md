# tune-bot infrastructure
scripts for creating the servers, and database

This repository should be located at `~/tune-bot/infrastructure`.

First you need to enter the database credentials you'll use to connect to the database in `database/vars.env`:
```
export DB_USER=<database user>
export DB_PASS=<database password>
export DB_HOST=<database host IP>
```


You will also need to enter the discord bot authentication token in `discord/vars.env`:
```
export DISCORD_TOKEN=<Discord API token>
```


Setup the repo:
```
mkdir -p ~/tune-bot
cd ~/tune-bot
git clone https://github.com/tune-bot/infrastructure.git
```

Refresh the repo:
```
cd ifrastructure
git stash
git pull
cd ..
```

Create all infrastructure:
```
sudo bash infrastructure/install.sh
```

You will then have executables in `~/tune-bot/bin` which can execute each service like this:

```
cd ~/tune-bot
sudo bin/database &
sudo bin/api &
sudo bin/discord &
```
