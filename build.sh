#!/bin/sh

# Builder of rpm

VERSION=$(python setup.py --version)

python setup.py sdist
mkdir -p $PWD/rpmbuild/SOURCES \
         $PWD/rpmbuild/SPECS

sed "s/^Version:.*/Version: $VERSION/" nagios-plugin-notebooks.spec > $PWD/rpmbuild/SPECS/nagios-plugin-notebooks.spec

mv dist/nagios_plugin_notebooks-$VERSION.tar.gz $PWD/rpmbuild/SOURCES/

rpmbuild -ba  --define="_topdir $PWD/rpmbuild"  $PWD/rpmbuild/SPECS/nagios-plugin-notebooks.spec
