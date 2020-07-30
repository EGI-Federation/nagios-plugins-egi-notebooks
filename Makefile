PKGNAME=nagios_plugins_egi_notebooks
SPECFILE=nagios-plugins-egi-notebooks.spec
FILES=Makefile ${SPECFILE}
build=$(shell pwd)/rpmbuild


PKGVERSION=$(shell python setup.py --version)

dist:
	sed -i "s/^Version:.*/Version: ${PKGVERSION}/" ${SPECFILE}
	python setup.py sdist

srpm: dist
	rpmbuild -ts --define='_topdir ${build}' dist/${PKGNAME}-${PKGVERSION}.tar.gz

rpm: dist
	rpmbuild -ta --define='_topdir ${build}' dist/${PKGNAME}-${PKGVERSION}.tar.gz

clean:
	rm -rf dist
	rm -rf ${build}
