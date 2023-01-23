# tune-bot infrastructure
scripts for creating the servers, and database

This repository should be located at `~/tune-bot/infrastructure`.

First you need to enter the database credentials you'll use to connect to the database in `database/vars.env`.


setup the repo
```
mkdir -p ~/tune-bot
cd ~/tune-bot
git clone https://github.com/tune-bot/infrastructure.git
```

refresh the repo
```
cd ifrastructure
git stash
git pull
cd ..
```

create all infrastructure
```
sudo ./infrastructure/install.sh
```
