FROM quay.io/ceph/ceph:v19
RUN dnf install -y python-pip python

RUN curl -sL -o /tmp/ceph-nagios-plugins.zip https://github.com/ceph/ceph-nagios-plugins/archive/refs/heads/master.zip && \
    unzip /tmp/ceph-nagios-plugins.zip -d /tmp/ && \
    mv /tmp/ceph-nagios-plugins-master/src /plugins && \
    rm /tmp/ceph-nagios-plugins.zip

# patch scripts
RUN sed -i "s/one_line = err.split('\\\\n')\[0\]/one_line = err.decode('utf-8').split('\\\\n')\[0\]/" /plugins/*
