#!/bin/bash

count=$(command -v openconnect vpn-slice | wc -l)
if (( ${count} != 2 )); then 
  echo "openconnect or vpn-slice not found"
  exit 1
fi

read -p "Gateway (host.company.org): " gateway
read -p "Username (name@company.org): " username
read -p "vpn-slice args (host1.org host2.org 10.40.0.0/24): " hosts

prelogin=$(openconnect \
  --protocol="gp" \
  --usergroup="gateway" \
  ${gateway})

url=$(echo ${prelogin} | grep -o "data:text/html;base64,.*")
if [[ ! ${url} ]]; then
  echo "${prelogin}"
  exit 1
fi

if [[ "$(uname)" == "Darwin" ]]; then
  open -a "Safari" "${url}" || echo "${url}"
else
  echo "${url}"
fi

echo "0. Copy the 'data:text/html;base64,*' string above and paste it into a browser" 
echo "1. Complete 2FA authentication in the browser" 
echo "2. Inspect source of 'Login Successful!' page"
echo "3. Copy the contents of <prelogin-cookie> element"
echo "4. Paste the cookie when prompted and press enter to continue"

echo "NB! The next command runs with sudo and may prompt you for a password"

sudo openconnect --protocol=gp \
  --user="${username}" \
  --usergroup="gateway:prelogin-cookie" \
  --script="vpn-slice ${hosts}" \
  ${gateway}
