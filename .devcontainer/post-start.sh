#!/bin/bash

# Set secret key to /tmp/secret
python /workspaces/docexecutor/set_secret_key.py

nohup fastapi run /workspaces/docexecutor/listenserver.py > /dev/null &

# open listenserver port 8000 publicly
gh codespace ports visibility 8000:public -c $CODESPACE_NAME