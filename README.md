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

## Manuel steps on remote machine


Login via SSH
```shell
ssh -i ~/.ssh/id_hetzner_late_night root@116.203.129.190
```

Start vncserver
```shell
vncserver
```

## Setup VNC Viewer on local Machine

Open SSH tunnel
```shell
ssh -i ~/.ssh/id_hetzner_late_night root@116.203.129.190 -L 5901:127.0.0.1:5901 -N
```

Connect with VNCViewer to `localhost:5901`.

## Further step on Remote Machine

Start Google Browser

```shell
google-chrome --no-sandbox
```

Install Jitsi-Pop Extension, that is located in `root/jitsi-pop`.

Configure OBS

```shell
obs
```
