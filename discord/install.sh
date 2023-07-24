#!/bin/bash

rm -rf discord
git clone https://github.com/tune-bot/discord.git

mkdir -p bin
echo "#!/bin/bash" > bin/discord
echo "bash infrastructure/util/golang.sh" >> bin/discord
echo "source infrastructure/discord/vars.env" >> bin/discord
echo "source infrastructure/database/vars.env" >> bin/discord
echo "cd discord && go run ." >> bin/discord
chmod a+rx bin/discord