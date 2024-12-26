#!/bin/bash

# Set secret key to /tmp/secret
python $CODESPACE_VSCODE_FOLDER/set_secret_key.py

nohup fastapi run $CODESPACE_VSCODE_FOLDER/listenserver.py &

# open listenserver port 8000 publicly
gh codespace ports visibility 8000:public -c $CODESPACE_NAME