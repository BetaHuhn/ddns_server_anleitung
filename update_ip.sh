IP=$(curl -s https://betahuhn.de/ip | jq -r '.ip')
curl -u username:password https://betahuhn.de:2000/?myip=$IP
echo " "
