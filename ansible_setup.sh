ansible all -m ping
ansible-playbook setup.yml --check --diff --ask-vault-pass --become -K
# ansible-playbook site.yml --check --diff -vvvv