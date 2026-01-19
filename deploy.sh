#!/bin/bash
cd deploy
# docker stack deploy -c docker-compose.yml tsdproxy
docker service update --force tsdproxy_tsdproxy --detach
cd ..