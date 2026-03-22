# Commands

## Multipass

### Troubleshooting

#### For Multipass itself

```bash
multipass find
```

#### For VMs

``` bash
multipass launch -n my-test-vm --cloud-init cloud-config.yaml
multipass launch -n my-test-vm-2 --network "name=DevOps-Internal"
multipass shell my-test-vm
multipass info my-test-vm
multipass delete my-test-vm

last -n 5 -F
```

### Volumes

```bash
multipass set local.privileged-mounts=true
# multipass mount ./FileServerData prod-sim-01:/srv/storage

sudo e2label /dev/sdb lab_data

# 1. Create the filesystem (ONLY DO THIS ONCE)
sudo mkfs.ext4 /dev/sdb

# 2. Refresh blkid to confirm it's now visible
sudo blkid /dev/sdb

# 3. Mount it manually to test
sudo mount /dev/sdb /srv/storage
# 4. Refresh systemd
sudo systemctl daemon-reload
```

### Networking

#### Setup

```pwsh
New-VMSwitch -Name "DevOps-Internal" -SwitchType Internal
New-NetIPAddress -IPAddress 192.168.100.1 -PrefixLength 24 -InterfaceAlias "vEthernet (DevOps-Internal)"
```

```bash
multipass networks
# multipass list # also shows internal IPs
multipass info prod-sim-01
# multipass doesn't always automatically assign an IP to an Internal Switch (because there is no DHCP server on that virtual cable)
sudo ip addr add 192.168.1.100/24 dev eth1 # on WLAN
sudo ip addr add 192.168.100.10/24 dev eth1 # on DevOps-Internal
```

#### SSH

```bash
# Forgor the old identity first
ssh-keygen -f '~/.ssh/known_hosts' -R '192.168.100.10'
#  Then ssh
ssh -i ~/.ssh/id_multipass ubuntu@192.168.100.10 -o StrictHostKeyChecking=no
```

## Ignoring perm changes on windows

``` bash
git config core.filemode false
```

## Docker

### Docker Swarm

```bash
docker service ls

docker service ps nextcloud_db --no-trunc
docker service logs nextcloud_db
--tail 100

docker service inspect nextcloud_db
```

### Docker secrets

```bash
docker secret rm tsclientSecret
printf "YOUR_CLIENT_ID" | docker secret create tsclientId -

docker service create --name temp-alpine --secret tsclientSecret alpine:latest cat /run/secrets/tsclientSecret
```

## Core proxy: TSDProxy

### Debugging

```bash
docker compose logs -f --tail 100
```

### Normal update

```bash
- docker service update --force -d tsdproxy_tsdproxy
```

### Cleanup & Restart

```bash
- docker volume rm tsdproxy_datadir
- docker stack rm tsdproxy
- docker stack deploy -c compose.yaml tsdproxy
```
