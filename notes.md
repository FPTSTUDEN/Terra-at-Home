Your playbook has become: true, but if your ubuntu user requires a password for sudo, Ansible won’t escalate unless you run with -K (prompt for sudo password).

Without escalation, the apt/package module runs as the unprivileged ubuntu user, which can’t install packages. Ansible then reports “ok” because it didn’t detect a change, but nothing was installed.

One-line command: ```ansible web_servers -m apt -a "name=samba state=present update_cache=yes" -u ubuntu --become -K```

```bash
ansible-playbook setup.yml -u ubuntu --become -K
```
