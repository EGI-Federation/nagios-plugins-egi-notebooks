#
# nagios-plugins-egi-notebooks RPM
#
Summary:       Nagios plugin for EGI notebooks
Name:          nagios-plugins-egi-notebooks
Version:       0.3.0
Release:       1%{?dist}
Group:         Applications/Internet
License:       ASL 2.0
URL:           https://github.com/EGI-Foundation/nagios-plugins-egi-notebooks
Source:        nagios_plugins_egi_notebooks-%{version}.tar.gz
BuildArch:     noarch
BuildRoot:     %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
BuildRequires: python3-devel
BuildRequires: pyproject-rpm-macros
BuildRequires: make
Requires:      python3-requests
Requires:      python3-six
BuildRequires: python3-wheel

%description
Nagios plugins for monitoring EGI notebooks

%prep
%setup -q -n nagios_plugins_egi_notebooks-%{version}

%build
%pyproject_wheel

%install
%pyproject_install
%pyproject_save_files '*' +auto

%clean
rm -rf $RPM_BUILD_ROOT

%files -f %{pyproject_files}

%changelog
* Wed Jun 12 2024 Enol Fernandez <enol.fernandez@egi.eu> 0.3.0
- Migrate to EL9 (Enol Fernandez)
* Thu Jul 30 2020 Enol Fernandez <enol.fernandez@egi.eu> 0.2.4
- Provide build in CentOS 7 (Enol Fernandez)
* Fri Nov 16 2018 Enol Fernandez <enol.fernandez@egi.eu> 0.2.3-1%{dist}
- Make code python3 compatible
- Log to stdoutput
- Add -H and -p options
* Tue Nov 13 2018 Enol Fernandez <enol.fernandez@egi.eu> 0.2.2-1%{dist}
- Add dependencies for SNI support
* Fri Aug 17 2018 Enol Fernandez <enol.fernandez@egi.eu> 0.2.1-1%{dist}
- Improve build to build from tar
* Thu Aug 16 2018 Enol Fernandez <enol.fernandez@egi.eu> 0.2.0-1%{dist}
- Adapt to ARGO probes requirements
* Fri Jul 20 2018 Enol Fernandez <enol.fernandez@egi.eu> 0.1.0
- Initial release (Enol Fernandez)
