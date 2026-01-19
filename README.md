<img src=".misc\earth-chan-with-watering-can-v0-f0616jur8mab1.webp" width=30% height=30%>

# Terra at Home
The Mother repository for my server's deployments and self-hosted apps

## Setup guide

### Basic commands
- printf "YOUR_CLIENT_ID" | docker secret create tsclientId -
- ...
- docker stack deploy -c compose.yml tsdproxy
