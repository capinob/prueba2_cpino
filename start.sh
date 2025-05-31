#!/bin/bash

# Inicia Apache en segundo plano
service apache2 start

# Inicia Nagios en primer plano
/usr/local/nagios/bin/nagios /usr/local/nagios/etc/nagios.cfg
