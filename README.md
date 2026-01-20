<img src=".misc\earth-chan-with-watering-can-v0-f0616jur8mab1.webp" width=30% height=30%>

# Terra at Home
The Mother repository for my server's deployments and self-hosted apps

## Setup guide

### Basic commands
#### Secret management
- docker secret rm tsclientSecret
- printf "YOUR_CLIENT_ID" | docker secret create tsclientId -

- docker service create --name temp-alpine --secret tsclientSecret alpine:latest cat /run/secrets/tsclientSecret

- docker compose logs -f --tail 100
#### Deployment
##### Normal update
- docker service update --force -d tsdproxy_tsdproxy
##### Cleanup & Restart
- docker volume rm tsdproxy_datadir
- docker stack rm tsdproxy
- docker stack deploy -c compose.yaml tsdproxy
