# late-night-studio-setup

## Setup Cloud infrastructure

Tested with Terraform 0.14.4

```
terraform init
terraform apply -var="hcloud_token=..."
terraform destroy -var="hcloud_token=..."
```
API Token is needed by terraform.
You set the token via variable `hcloud_token`


## Run Ansible
```
export HCLOUD_TOKEN="..."
ansible-playbook --private-key=/home/sparsick/.ssh/id_hetzner_ansible_test -i inventory/test.hcloud.yml setup-tomcat.yml
```
Ansible needs also a configured API Token via system environment `HCLOUD_TOKEN`.
