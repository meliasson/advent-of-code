#!/bin/bash

# Set up PowerShell profile.
mkdir -p /home/vscode/.config/powershell
cp ./.devcontainer/PowerShellProfile.ps1 \
    /home/vscode/.config/powershell/Microsoft.PowerShell_profile.ps1
ln -s /home/vscode/.config/powershell/Microsoft.PowerShell_profile.ps1 \
    /home/vscode/.config/powershell/Microsoft.VSCode_profile.ps1

# Avoid get trapped in GNU nano or similar.
if [ "$(git config core.editor)" != 'code --wait' ]; then
    git config core.editor 'code --wait'
fi

# Get Git tab completion.
pwsh -NoProfile -Command "Set-PSRepository -Name PSGallery -InstallationPolicy Trusted"
pwsh -NoProfile -Command "Install-Module -Name posh-git -Repository PSGallery"
pwsh -NoProfile -Command "Set-PSRepository -Name PSGallery -InstallationPolicy Untrusted"

# Install Oh My Posh.
curl -s https://ohmyposh.dev/install.sh | sudo bash -s

# Set pwsh as default shell.
sudo chsh vscode -s \"$(which pwsh)\"

# Install Pester so we can run PowerShell tests.
pwsh -NoProfile -Command "Set-PSRepository -Name PSGallery -InstallationPolicy Trusted"
pwsh -NoProfile -Command "Install-Module -Name Pester -Repository PSGallery"
pwsh -NoProfile -Command "Set-PSRepository -Name PSGallery -InstallationPolicy Untrusted"
