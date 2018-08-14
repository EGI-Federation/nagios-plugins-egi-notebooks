# EGI noteboks plugin for nagios

This is a simple probe that contacts a EGI Notebooks endpoint
to get the latest status report of the service and return OK, CRITICAL or WARNING accordingly.

## Usage

```
egi-notebooks-probe [-h] [--url URL] [--status-path STATUS_PATH]

Nagios plugin for EGI Notebooks

optional arguments:
  -h, --help            show this help message and exit
  --url URL             URL of the the EGI notebooks endpoint (default:
                        http://localhost/)
  --status-path STATUS_PATH
                        Path in the endpoint for the monitoring service
                        (default: services/status/)
```
