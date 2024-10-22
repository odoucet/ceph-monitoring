Ceph monitoring
===============

A docker image with :
- Docker image [ceph:v19](https://quay.io/repository/ceph/ceph?tab=tags&tag=latest)
- [ceph-nagios-plugins](https://github.com/ceph/ceph-nagios-plugins/tree/master)
- Python3

Update
------
```bash
docker build -t odoucet/ceph-monitoring:latest .
docker push odoucet/ceph-monitoring:latest
```

Usage
-----
```bash
docker run --rm -ti -v /path/to/ceph.keyring/:/auth:ro -v /etc/ceph:/etc/ceph:ro odoucet/ceph-monitoring /plugins/check_ceph_health --id nagios --keyring /auth/ceph.client.nagios.keyring --cluster xxxx
```