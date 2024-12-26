#!/bin/bash

export FOO=bar
pip install -r requirements.txt
fastapi run listenserver.py

python set_secret_key.py
zsh ~/.zshrc