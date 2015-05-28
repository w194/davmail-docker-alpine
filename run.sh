#!/bin/bash

docker run -p 127.0.0.1:1025:1025 -p 127.0.0.1:1143:1143 -v ~/.davmail:/etc/davmail --user="davmail" -t -i -d widder/davmail
