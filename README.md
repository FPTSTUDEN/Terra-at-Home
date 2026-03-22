<img alt="pixel cover" src=".misc/Pixel_ (21).jpg" width=100%>

<!-- ![GitHub Copilot](https://img.shields.io/badge/github_copilot-8957E5?style=for-the-badge&logo=github-copilot&logoColor=white)
![Google Gemini](https://img.shields.io/badge/google%20gemini-8E75B2?style=for-the-badge&logo=google%20gemini&logoColor=white)
![ChatGPT](https://img.shields.io/badge/chatGPT-74aa9c?style=for-the-badge&logo=openai&logoColor=white) -->

# Terra at Home

> <img align="right" alt="earth-chan" src=".misc\earth-chan-with-watering-can-v0-f0616jur8mab1.webp" width=25% height=25%>
<!-- <div> -->
> "**Terra**", or **Earth**, is the Third planet of the Solar System, the only one known so far to **harbor life**.

Similarly, "**Terra at Home**" - the resemblance of my DevOps environment as Code - shall be the place that **brings life** to my server and my programming journey.
<!-- </div> -->

**Skills I learned**

![Ansible](https://img.shields.io/badge/ansible-%231A1918.svg?style=for-the-badge&logo=ansible&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![Wireguard](https://img.shields.io/badge/wireguard-%2388171A.svg?style=for-the-badge&logo=wireguard&logoColor=white)
![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white)

![Bash Script](https://img.shields.io/badge/bash_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)
![Redis](https://img.shields.io/badge/redis-%23DD0031.svg?style=for-the-badge&logo=redis&logoColor=white)

## TO-DO

- [x] video to .MOV auto-converter cause I'm using Iphone... (Watchdog container with FFmpeg /~~Synced local folder -lambda-> .MOV -?-> VM hard disk~~)
- [ ] What to do with AWS localstack (also, local or VM??)
- [ ] Nextcloud
- [ ] Ansible "Cron Job" inside the VM that automatically backs up important files from the VM's disk into that persistent folder
- [ ] Fully automated app stack setup
- [ ] Formatting this file to look cooler...

- [ ] Container security

## Features

This project automates a high-performance DevOps environment using Terraform, Ansible, and Multipass on a Windows host.

### Architecture

#### IaC 🌳

- Hyper-V (with Multipass) as hypervisor
- Terraform for VM lifecycle and hardware provisioning

#### CM ⚙️

- Ansible for service configuration (Samba, Tailscale, Docker)

#### Networking 🛜

- Hybrid Mesh VPN (Tailscale) with a static Internal Switch bridge
- **TSDProxy** - Tailscale domain names for containerised services

### App stack

- **NextCloud stack** - Cloud storage & cross-device file syncthing
- Other apps:
  - Obsidian

### Scripts

#### Server management

- ```manage.ps1``` as a dashboard to quickly manage infrastructure's lifecycle
- ```setup.sh``` as an automated cleanup & service configuration script

#### Misc

- **Sensitivity Finder**
  - ```./sensfind.sh directory-name```
  - finds and lists seemlingly sensitive files (.env, .key, .crt...), pipe-able to ```senscheck.sh```
- **Sensitivity Check**
  - ```./senscheck.sh file1 file2 ...```
  - Scans for common sensitive data patterns and file permissions

## Commands guide

Refer to [commands.md](./commands.md)

## Image Credits

- [Cute Earth-chan illustration by k030](https://www.deviantart.com/k030/art/Earth-Chan-731945867)
- [Beautiful pixel art wallpaper by Norma2D](https://norma-2d.itch.io/pixel-art-wallpaper)


[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
[contributors-url]: https://github.com/FPTSTUDEN/Terra-at-Home/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=for-the-badge
[forks-url]: https://github.com/FPTSTUDEN/Terra-at-Home/network/members
[stars-shield]: https://img.shields.io/github/stars/othneildrew/Best-README-Template.svg?style=for-the-badge
[stars-url]: https://github.com/FPTSTUDEN/Terra-at-Home/stargazers
[issues-shield]: https://img.shields.io/github/issues/othneildrew/Best-README-Template.svg?style=for-the-badge
[issues-url]: https://github.com/FPTSTUDEN/Terra-at-Home/issues
