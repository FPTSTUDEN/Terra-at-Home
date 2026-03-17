#!/bin/bash
source creds.env
ACCESS_TOKEN=$(curl -s https://api.tailscale.com/api/v2/oauth/token \
  -d "grant_type=client_credentials" \
  -d "client_id=$clientId" \
  -d "client_secret=$clientSecret" | jq -r '.access_token')
targetname="devops-lab"
curl -s "https://api.tailscale.com/api/v2/tailnet/$tailnet/devices" -H "Authorization: Bearer $ACCESS_TOKEN" |jq -r '.devices[] |  "\(.id) \(.name)"' |
  while read id name; do
    if [[ $name = *"$targetname"* ]]
    then
    #   echo $name $id " includes " $name " in its name - getting rid of it"
      echo ${name:0:3}" includes " $targetname " in its name - getting rid of it"
      curl -s -X DELETE "https://api.tailscale.com/api/v2/device/$id" -H "Authorization: Bearer $ACCESS_TOKEN"
    else
      echo ${name:0:3}" does not have that string in its name, keeping it"
    fi
  done

# ansible all -m ping
ansible-playbook setup.yml -u ubuntu --become --ask-vault-pass
# ansible-playbook site.yml --check --diff -vvvv