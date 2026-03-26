#!/bin/bash

read -p "Gateway (host.company.org): " gateway
read -p "Username (name@company.org): " username
read -p "vpn-slice args (host1.org host2.org 10.40.0.0/24): " hosts

prelogin=$(openconnect \
  --protocol="gp" \
  --usergroup="gateway" \
  ${gateway})

url=$(echo ${prelogin} | sed "s/.*data:text\/html;base64,//")
url="data:text/html;base64,${url}"

echo "---"
echo ${url}
echo "---"

if [ "$(uname)" == "Darwin" ]; then
  open -a "Safari" "${url}"
else
  echo "0. Copy the 'data:text/html;base64,*' string above and paste it into a browser" 
fi

echo "1. Complete 2FA authentication in the browser" 
echo "2. Inspect source of 'Login Successful!' page"
echo "3. Copy the contents of <prelogin-cookie> element"
echo "4. Paste the cookie and press enter to continue"

echo "NB! If prompted for password, enter your local password (sudo)"

sudo openconnect --protocol=gp \
  --user="${username}" \
  --usergroup="gateway:prelogin-cookie" \
  --script="vpn-slice ${hosts}" \
  --passwd-on-stdin \
  ${gateway}
