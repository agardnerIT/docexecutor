import secrets
import os

# This script runs autonomously at startup
# A user should never have to manually run this script
# Generate a random, URL safe
# 8 byte string and append it to the end of ~/.zshrc
# post-create.sh then sources that file
# So the new env var should be available via `printenv`
# and the secret is never persisted to disk
# The user will be asked to retrieve this random value: `printenv | grep SECRET_KEY`
# and use this to "authenticate" the browser docs
# to this codespace

current_user = os.environ.get("USER","")
if current_user == "":
    exit

value = f"echo SECRET_KEY={secrets.token_urlsafe(8)}\n"

with open(file=f"/home/{current_user}/.bashrc", mode="a") as secret_file:
    secret_file.write(value)