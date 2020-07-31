# EGI noteboks plugin for nagios

This is a simple probe that contacts a EGI Notebooks endpoint
to get the latest status report of the service and return OK, CRITICAL or WARNING accordingly.

## Usage

```
$ egi-notebooks-probe -h
usage: egi-notebooks-probe [-h] [-t TIMEOUT] [--url URL]
                           [--status-path STATUS_PATH] [-v] [-H HOST]
                           [-p PORT]

Nagios plugin for EGI Notebooks

optional arguments:
  -h, --help            show this help message and exit
  -t TIMEOUT, --timeout TIMEOUT
                        Timeout in seconds of the probe (default: 10)
  --url URL             URL of the the EGI notebooks endpoint (default: None)
  --status-path STATUS_PATH
                        Path in the endpoint for the monitoring service
                        (default: services/status/)
  -v, --verbose         Be verbose (default: False)
  -H HOST, --host HOST  Host to be checked (default: None)
  -p PORT, --port PORT  Port to be checked (default: 443)
```
