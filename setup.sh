ansible all -m ping
ansible-playbook setup.yml -u ubuntu --become --ask-vault-pass
# ansible-playbook site.yml --check --diff -vvvv