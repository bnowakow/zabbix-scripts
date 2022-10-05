#!/bin/bash

python2 zabbix.template.export.py --url http://192.168.1.49:10211 --user='Admin' --password="$(cat .password)" --template='All'
# TODO figure out how to download only my templates (i.e. using tag) in above --template argument. As workaround deleting other templates
find templates -type f -not -name 'bnowakow*' -delete

if ! git status | grep 'nothing to commit' >/dev/null; then 
    git status
    git commit -am "update on $(date)"
    git push
fi

