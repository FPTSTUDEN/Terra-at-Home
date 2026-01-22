<img alt="earth-chan" src=".misc\earth-chan-with-watering-can-v0-f0616jur8mab1.webp" width=30% height=30%>

# Terra at Home

The Mother repository for my server's deployments and self-hosted apps

## Features

### Secured networking

- **Tailscale**  - secured VPN for devices
- **TSDProxy** - Tailscale domain names for containerised services

### Containerised app stacks

- **NextCloud stack** - Cloud storage & cross-device file syncthing
- Other apps:
  - Obsidian

### Automated scripts

#### Secret-checker scripts

- **Sensitivity Finder Script** - sensfind.sh
  - finds and lists seemlingly sensitive files (.env, .key, .pem, .crt).
  - ./sensfind.sh directory-name
  - pipe-able to senscheck.sh
- **Sensitivity Check Script** - senscheck.sh
  - Scans for common sensitive data patterns and file permissions
  - ./senscheck.sh file1 file2 ...

## Implementation

### Docker secrets

- docker secret rm tsclientSecret
- printf "YOUR_CLIENT_ID" | docker secret create tsclientId -

- docker service create --name temp-alpine --secret tsclientSecret alpine:latest cat /run/secrets/tsclientSecret

### Core proxy: TSDProxy

#### Debugging

- docker compose logs -f --tail 100

#### Normal update

- docker service update --force -d tsdproxy_tsdproxy

#### Cleanup & Restart

- docker volume rm tsdproxy_datadir
- docker stack rm tsdproxy
- docker stack deploy -c compose.yaml tsdproxy
