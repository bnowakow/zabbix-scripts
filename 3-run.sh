#!/bin/bash

cd /mnt/MargokPool/home/sup/code/zabbix-scripts

port=10211
# TMP ports changed when load balancer isn't working
port=37220
python2 zabbix.template.export.py --url http://192.168.0.20:$port --user='Admin' --password="$(cat .password)" --template='All'
python2 zabbix.template.export.py --url http://192.168.0.20:$port --user='Admin' --password="$(cat .password)" --template='All' --type='host' --out-dir='hosts'

# TODO figure out how to download only my templates (i.e. using tag) in above --template argument. As workaround deleting other templates
find templates -type f -not -name 'bnowakow*' -delete

if ! git status | grep 'nothing to commit' > /dev/null; then 
    git status
    git add --all
    git commit -am "update on $(date)"
fi

if git status | grep 'branch is ahead' > /dev/null; then 
    git status
    git push
fi

