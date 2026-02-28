# Commands

## Multipass quick check

``` bash
multipass launch -n my-test-vm --cloud-init cloud-config.yaml
multipass shell my-test-vm
multipass info my-test-vm
multipass delete my-test-vm
```

## Ignoring perm changes on windows

``` bash
git config core.filemode false
```

## Docker secrets

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
