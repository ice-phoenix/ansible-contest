# Ansible playbooks

You need to install `vagrant`. Then:

```
python3 -m venv venv
. venv/bin/activate
pip3 install -r requirements.txt
```

## NFS

The `app` role assumes the directory `/var/persistent` exists and is
owned by the current user.

## Celery worker

The `celery` role assumes that the ansible playbook directory (i.e. this
directory) contains:

* `icfpcontest2019.jar`
* `problems/`
* `blocks/`

## Run

```
vagrant up
```

To run for AWS:

```
ansible-playbook aws-fleet.yml
```

## AWS Dynamic Inventory

From the `contrib` folder, copy the `ec2.py` script to `/etc/ansible/hosts` and
`chmod +x` it. Also copy `ec2.ini` to `/etc/ansible/ec2.ini`.

Create a file `cred.sh`:

```
export AWS_ACCESS_KEY_ID='abc123'
export AWS_SECRET_ACCESS_KEY='abc123'
```

Before running ansible:
`source cred.sh`

We are using the `ami-08d658f84a6d84a80` Ubuntu Server 18.04 LTS image.

## SQlite Web

```
pip install sqlite-web
sudo -u grading sqlite_web -P -H 0.0.0.0 /webapps/icfpcontest2019/db/app.db