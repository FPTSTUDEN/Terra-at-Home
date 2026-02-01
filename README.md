![GitHub Copilot](https://img.shields.io/badge/github_copilot-8957E5?style=for-the-badge&logo=github-copilot&logoColor=white)
![Google Gemini](https://img.shields.io/badge/google%20gemini-8E75B2?style=for-the-badge&logo=google%20gemini&logoColor=white)
![ChatGPT](https://img.shields.io/badge/chatGPT-74aa9c?style=for-the-badge&logo=openai&logoColor=white)

# Terra at Home
> <img align="right" alt="earth-chan" src=".misc\earth-chan-with-watering-can-v0-f0616jur8mab1.webp" width=25% height=25%>
<!-- <div> -->
The resemblance of my entire server's **configuration, deployments and app stack** in one centralised repository

> "Terra", or Earth, is the third planet of the Solar System, the only one known so far to harbor life. 
<!-- </div> -->

**Featuring...**

![Ansible](https://img.shields.io/badge/ansible-%231A1918.svg?style=for-the-badge&logo=ansible&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![Wireguard](https://img.shields.io/badge/wireguard-%2388171A.svg?style=for-the-badge&logo=wireguard&logoColor=white)
![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white)

![Bash Script](https://img.shields.io/badge/bash_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)
![Redis](https://img.shields.io/badge/redis-%23DD0031.svg?style=for-the-badge&logo=redis&logoColor=white)
![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)

## TO-DO
- Formatting this file to look cooler...
- Fully automated app stack setup with Ansible
- IaC with Terraform (need a provider somehow) 

## Features list

### Secured networking

- **Tailscale**  - secured VPN for devices
- **TSDProxy** - Tailscale domain names for containerised services

### Containerised app stacks

- **NextCloud stack** - Cloud storage & cross-device file syncthing
- Other apps:
  - Obsidian

### Automated scripts

#### Secret-checker scripts

- **Sensitivity Finder**
  - ```./sensfind.sh directory-name```
  - finds and lists seemlingly sensitive files (.env, .key, .crt...), pipe-able to ```senscheck.sh```
- **Sensitivity Check**
  - ```./senscheck.sh file1 file2 ...```
  - Scans for common sensitive data patterns and file permissions

## Reminders

### Ignoring perm changes on windows
```
git config core.filemode false
```

### Docker secrets

```bash
docker secret rm tsclientSecret
printf "YOUR_CLIENT_ID" | docker secret create tsclientId -

docker service create --name temp-alpine --secret tsclientSecret alpine:latest cat /run/secrets/tsclientSecret
```

### Core proxy: TSDProxy

#### Debugging

```bash
docker compose logs -f --tail 100
```

#### Normal update

```bash
- docker service update --force -d tsdproxy_tsdproxy
```

#### Cleanup & Restart

```bash
- docker volume rm tsdproxy_datadir
- docker stack rm tsdproxy
- docker stack deploy -c compose.yaml tsdproxy
```



[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
[contributors-url]: https://github.com/FPTSTUDEN/Terra-at-Home/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=for-the-badge
[forks-url]: https://github.com/FPTSTUDEN/Terra-at-Home/network/members
[stars-shield]: https://img.shields.io/github/stars/othneildrew/Best-README-Template.svg?style=for-the-badge
[stars-url]: https://github.com/FPTSTUDEN/Terra-at-Home/stargazers
[issues-shield]: https://img.shields.io/github/issues/othneildrew/Best-README-Template.svg?style=for-the-badge
[issues-url]: https://github.com/FPTSTUDEN/Terra-at-Home/issues
