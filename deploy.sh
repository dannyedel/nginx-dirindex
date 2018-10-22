#!/bin/bash

set -evx

rsync -rvPhlt --checksum dirindex.css danny-edel.de:public_html/css/
rsync -rvPhlt --checksum dirindex.xslt danny-edel.de:
ssh root@danny-edel.de systemctl reload nginx
