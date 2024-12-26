#!/bin/bash

RUNME_CLI_VERSION=3.10.2
pip install -r $CODESPACE_VSCODE_FOLDER/requirements.txt

mkdir runme
cd runme
wget -O runme_linux_x86_64.tar.gz https://download.stateful.com/runme/$RUNME_CLI_VERSION/runme_linux_x86_64.tar.gz
tar -xvf runme_linux_x86_64.tar.gz
sudo mv runme /usr/local/bin
cd ..
rm -rf runme