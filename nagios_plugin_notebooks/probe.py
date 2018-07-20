import argparse
import sys
from urlparse import urljoin

import requests
from requests.exceptions import ConnectionError, HTTPError

def status2code(status):
    code_map = {
        'OK': 0,
        'WARNING': 1,
        'CRITICAL': 2,
    }
    return code_map.get(status.upper(), 2)


def get_notebook_status(status_url):
    import logging
    logging.basicConfig(level=logging.DEBUG)
    try:
        r = requests.get(status_url,
                         headers={'accept': 'application/json'})
        r.raise_for_status()
        status = r.json()
        print "%s: %s" % (status['code'], status['msg'])
        return status2code(status['code'])
    except (ConnectionError, HTTPError) as e:
        print "CRITICAL: Unable to get status, %s" % e.message
        return status2code('CRITICAL')


def main():
    parser = argparse.ArgumentParser(
        description='Nagios plugin for EGI Notebooks',
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
        fromfile_prefix_chars='@',
        conflict_handler="resolve",
    )

    parser.add_argument(
        '--url',
        default='http://localhost/',
        help=('URL of the the EGI notebooks endpoint'))
        
    parser.add_argument(
        '--status-path',
        default='services/status/',
        help=('Path in the endpoint for the monitoring service'))

    opts = parser.parse_args()
    status_url = opts.url
    if not status_url.endswith('/'):
        status_url = status_url + '/'
    sys.exit(get_notebook_status(urljoin(status_url, opts.status_path)))
