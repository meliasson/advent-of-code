#!/bin/bash

# Install Oh My Posh.
curl -s https://ohmyposh.dev/install.sh | sudo bash -s

# Set pwsh as default shell.
sudo chsh vscode -s \"$(which pwsh)\"

# Setup PowerShell profile
pwsh ./.devcontainer/setup-powershell-profile.ps1
