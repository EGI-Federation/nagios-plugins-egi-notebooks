PKGNAME=nagios_plugins_egi_notebooks
SPECFILE=nagios-plugins-egi-notebooks.spec
FILES=Makefile ${SPECFILE}

PKGVERSION=$(shell python setup.py --version)
RPM_SOURCES=$(shell rpm --eval '%{_sourcedir}')

dist:
	rm -rf dist
	sed -i "s/^Version:.*/Version: ${PKGVERSION}/" ${SPECFILE}
	python setup.py sdist
	mv dist/${PKGNAME}-${PKGVERSION}.tar.gz .
	rm -rf dist

srpm: dist
	rpmbuild -ts ${PKGNAME}-${PKGVERSION}.tar.gz

rpm: dist
	rpmbuild -ta ${PKGNAME}-${PKGVERSION}.tar.gz

clean:
	rm -rf dist
	rm *.rpm
	rm *.tar.gz
