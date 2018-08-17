PKGNAME=nagios_plugins_egi_notebooks
SPECFILE=nagios-plugins-egi-notebooks.spec
FILES=Makefile ${SPECFILE}

PKGVERSION=$(shell python setup.py --version)
RPM_SOURCES=$(shell rpm --eval '%{_sourcedir}')

sources:
	rm -rf dist
	python setup.py sdist
	mkdir -p ${RPM_SOURCES}
	cp dist/${PKGNAME}-${PKGVERSION}.tar.gz ${RPM_SOURCES}
	sed -i "s/^Version:.*/Version: ${PKGVERSION}/" ${SPECFILE}
	rm -rf dist

srpm: sources
	rpmbuild -bs --define='dist .el6' ${SPECFILE}

rpm: sources
	rpmbuild -ba ${SPECFILE}

clean:
	rm -rf dist
