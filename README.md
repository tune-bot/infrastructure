# tune-bot infrastructure
Scripts for installing the Tunebot services.

This repository should be located at `~/tune-bot/infrastructure`. 

You will need your database credentials and Discord API token.

## How to Install
1. Setup the repo:
    ```
    mkdir -p ~/tune-bot
    cd ~/tune-bot
    git clone https://github.com/tune-bot/infrastructure.git
    ```

2. In `~/tune-bot/infrastructure`, create the environment variable files: `touch database.env discord.env`

3. Add your credentials by putting the following text in their respective files:

    `database.env`:
    ```
    export DB_USER=<database user>
    export DB_PASS=<database password>
    export DB_HOST=<database host IP>
    ```

    `discord.env`:
    ```
    export DISCORD_TOKEN=<Discord API token>
    ```

4. Refresh the repo:
    ```
    cd infrastructure
    git stash
    git pull
    cd ..
    ```

5. Create all infrastructure:
    ```
    sudo bash infrastructure/install.sh
    ```

6. You will then have executables in `~/tune-bot/bin` which can be executed like this:

    ```
    cd ~/tune-bot
    sudo bin/core
    sudo bin/api
    sudo bin/bot
    ```

7. (Optional) Update credentials and tokens as needed by modifying the environment variables in `~/tune-bot/vars`. Services will automatically install updates.
 