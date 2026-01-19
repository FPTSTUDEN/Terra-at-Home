
- printf "YOUR_CLIENT_ID" | docker secret create tsclientId -
- ...
- docker stack deploy -c compose.yml tsdproxy
