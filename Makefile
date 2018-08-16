PKGNAME=nagios_plugins_egi_notebooks
SPECFILE=nagios-plugins-egi-notebooks.spec
FILES=Makefile ${SPECFILE}

PKGVERSION=$(shell python setup.py --version)
RPM_SOURCES=$(shell rpm --eval '%{_sourcedir}')

dist:
	rm -rf dist
	python setup.py sdist

spec: dist
	sed -i "s/^Version:.*/Version: ${PKGVERSION}/" ${SPECFILE}

srpm: spec
	cp dist/${PKGNAME}-${PKGVERSION}.tar.gz ${RPM_SOURCES}
	rpmbuild -bs --define='dist .el6' ${SPECFILE}

rpm: spec
	mv dist/${PKGNAME}-${PKGVERSION}.tar.gz ${RPM_SOURCES}
	rpmbuild -ba ${SPECFILE}

sources: dist

clean:
	rm -rf dist
