#!/bin/sh

# Builder of rpm
# Run it as
# docker run -it -v $PWD:/nagios-plugin-notebooks centos:6 /nagios-plugin-notebooks/build.sh

yum install -y epel-release
yum install -y rpm-build epel-rpm-macros python-pbr git

cd nagios-plugin-notebooks/

VERSION=$(python setup.py --version)

python setup.py sdist
mkdir -p /root/rpmbuild/SOURCES \
         /root/rpmbuild/SPECS

sed "s/^Version:.*/Version: $VERSION/" nagios-plugin-notebooks.spec > /root/rpmbuild/SPECS/nagios-plugin-notebooks.spec

mv dist/nagios_plugin_notebooks-$VERSION.tar.gz /root/rpmbuild/SOURCES/

rpmbuild -ba  /root/rpmbuild/SPECS/nagios-plugin-notebooks.spec
mv /root/rpmbuild/RPMS/noarch/* .
