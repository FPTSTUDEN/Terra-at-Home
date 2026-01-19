<img src=".misc\earth-chan-with-watering-can-v0-f0616jur8mab1.webp" width=30% height=30%>

# Terra at Home
The Mother repository for my server's deployments and self-hosted apps

## Setup guide

### Basic commands
#### Secret management
- docker secret rm tsclientSecret
- printf "YOUR_CLIENT_ID" | docker secret create tsclientId -
#### Deployment
##### Normal update
- docker service update --force tsdproxy_tsdproxy
##### Cleanup & Restart
- docker volume rm tsdproxy_datadir
- docker stack rm tsdproxy
- docker stack deploy -c compose.yaml tsdproxy
