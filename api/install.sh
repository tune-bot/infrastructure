#!/bin/bash

rm -rf api
git clone https://github.com/tune-bot/api.git

echo "#!/bin/bash" > bin/api
echo "bash infrastructure/util/gopath.sh" >> bin/api
echo "source infrastructure/database/vars.env" >> bin/api
echo "cd api && go run ." >> bin/api
chmod a+rx bin/api