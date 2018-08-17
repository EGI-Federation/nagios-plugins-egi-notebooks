#!/bin/sh

# Builder of rpm
# Run it as
# docker run -it -v $PWD:/nagios-plugin-notebooks centos:6 /nagios-plugin-notebooks/build.sh

yum install -q -y epel-release
yum install -q -y rpm-build epel-rpm-macros python-pbr git

cd $(dirname $0)

make rpm

mv /root/rpmbuild/RPMS/noarch/* .
