#!/bin/bash

# copy from remote to local
# from remote folder inos to local folder ~/wayne/inos
rsync -razP --delete waynelai@100.10.1.102:~/testbed/inos  ~/wayne
