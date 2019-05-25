# Ansible playbooks

## NFS

The `app` role assumes the directory `/var/persistent` exists and is
owned by the current user.

## Celery worker

The `celery` role assumes that the ansible playbook directory (i.e. this
directory) contains:

* `icfpcontest2019.jar`
* `problems/`

# Run

```
vagrant up
```