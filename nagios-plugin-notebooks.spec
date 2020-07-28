#
# nagios-plugin-notebooks RPM
#

%{!?python_sitelib: %global python_sitelib %(%{__python} -c "from distutils.sysconfig import get_python_lib; print get_python_lib()")}

Summary: Nagios plugin for EGI notebooks
Name: nagios-plugin-notebooks 
Version: 0.1.0
Release: 1%{?dist}
Group: Applications/Internet
License: ASL 2.0
URL: https://github.com/EGI-Foundation/nagios-plugin-notebooks
Source: nagios_plugin_notebooks-%{version}.tar.gz

BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
BuildRequires: python-setuptools
BuildRequires: python-pbr
BuildRequires: git
Requires: python
Requires: python-requests
Requires: python-argparse
BuildArch: noarch

%description
Nagios plugins for monitoring EGI notebooks

%prep
%setup -q -n nagios_plugin_notebooks-%{version}

%build

%install
rm -rf $RPM_BUILD_ROOT
python setup.py install --root $RPM_BUILD_ROOT

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
%{python_sitelib}/nagios_plugin_notebooks*
/usr/bin/egi-notebooks-probe

%changelog
* Fri Jul 20 2018 Enol Fernandez <enol.fernandez@egi.eu> 0.2.4
- Provide build in CentOS 7 (Enol Fernandez)

* Fri Jul 20 2018 Enol Fernandez <enol.fernandez@egi.eu> 0.1.0
- Initial release (Enol Fernandez)
