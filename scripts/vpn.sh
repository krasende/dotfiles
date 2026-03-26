#!/bin/bash

if [[ $UID != 0 ]]; then
  echo "Try: sudo $0 $*"
  exit 1
fi

read -p "Gateway (host.company.org): " gateway
read -p "Username (name@company.org): " username
read -p "vpn-slice args (host1.org host2.org 10.40.0.0/24): " hosts

prelogin=$(openconnect \
  --protocol="gp" \
  --usergroup="gateway" \
  ${gateway})

url=$(echo ${prelogin} | sed "s/.*data:text\/html;base64,//")
url="data:text/html;base64,${url}"

echo ${url}
open -a "Safari" "${url}"

echo "1. Complete 2FA authentication in the browser" 
echo "2. Inspect source of 'Login Successful!' page"
echo "3. Copy the contents of <prelogin-cookie> element"
echo "4. Paste the cookie and press enter to continue"

sudo openconnect --protocol=gp \
  --user="${username}" \
  --usergroup="gateway:prelogin-cookie" \
  --script="vpn-slice ${hosts}" \
  --passwd-on-stdin \
  ${gateway}
