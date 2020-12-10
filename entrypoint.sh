#!/bin/ash

# Make sure we're in the correct dir
cd /home/container/${PROJECT}

# Run npm i
echo ":/home/container/${PROJECT}$ npm i"
npm i

# Run BDS i
echo ":/home/container/${PROJECT}$ npx -c 'bdsx i -y'"
npx -c 'bdsx i -y'

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container/${PROJECT}$ ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}
