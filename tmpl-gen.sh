#!/bin/bash

# Sys env / paths / etc
# -------------------------------------------------------------------------------------------\
PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
SCRIPT_PATH=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)

# Define the variables with values you want replaced
STATUS_URI="foobar"
MONITOR_IP="192.168.1.1"

function render_template() {
  eval "echo \"$(cat $1)\""
}
function generate_httpd_conf {
  render_template $SCRIPT_PATH/templates/httpd.conf.tmpl > $SCRIPT_PATH/generated/httpd.conf
  if [[ -f $SCRIPT_PATH/generated/httpd.conf ]]; then
  	echo "Generated HTTPD template - $SCRIPT_PATH/generated/httpd.conf"
  fi
}

generate_httpd_conf