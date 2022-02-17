#!/bin/bash
set -e

exec supervisord -c /etc/supervisor/supervisord.conf
