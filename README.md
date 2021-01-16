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


## Software Provisioning

Requirements for master node:
* hcloud-python >= 1.0.0

```shell
pip install hcloud
```

Tested with Ansible 2.9.6

```
export HCLOUD_TOKEN="..."
ansible-playbook --private-key=/home/sparsick/.ssh/id_hetzner_late_night -i inventory/test.hcloud.yml setup-late-night-studio.yml --extra-vars "vncserver_password=aNewPassword"
```
Ansible needs also a configured API Token via system environment `HCLOUD_TOKEN`.


## Setup VNC Viewer on local Machine

```shell
ssh -i ~/.ssh/id_hetzner_late_night root@116.203.129.190 -L 5901:127.0.0.1:5901 -N
```
