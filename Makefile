PKGNAME=nagios_plugins_notebooks
SPECFILE=nagios-plugins-notebooks.spec
FILES=Makefile ${SPECFILE} src

PKGVERSION=$(shell python setup.py --version)

dist:
	rm -rf dist
	python setup.py sdist
	mv dist/${PKGNAME}-${PKGVERSION}.tar.gz .
	rm -rf dist

srpm: dist
	rpmbuild -ts --define='dist .el6' ${PKGNAME}-${PKGVERSION}.tar.gz

rpm: dist
	rpmbuild -ta ${PKGNAME}-${PKGVERSION}.tar.gz

sources: dist

clean:
	rm -rf ${PKGNAME}-${PKGVERSION}.tar.gz
	rm -f MANIFEST
	rm -rf dist
