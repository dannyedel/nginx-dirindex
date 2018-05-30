#!/bin/bash

set -evx

scp dirindex.css danny-edel.de:public_html/css/
scp dirindex.xslt danny-edel.de:
ssh root@danny-edel.de systemctl reload nginx
