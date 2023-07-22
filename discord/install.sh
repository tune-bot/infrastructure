#!/bin/bash

rm -rf discord
git clone https://github.com/tune-bot/discord.git

if grep -q BOT_TOKEN infrastructure/discord/vars.env; then
    read -p "Enter Discord Bot Token: " BOT_TOKEN
    sed -i "s|BOT_TOKEN|$BOT_TOKEN|g" infrastructure/discord/vars.env
fi

echo "#!/bin/bash" > bin/discord
echo "source infrastructure/discord/vars.env" >> bin/discord
echo "source infrastructure/database/vars.env" >> bin/discord
echo "cd discord && go run ." >> bin/discord
chmod a+rx bin/discord