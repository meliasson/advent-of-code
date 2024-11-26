#!/bin/bash

# Setup PowerShell profile.
mkdir -p /root/.config/powershell
cp ./.devcontainer/powershell-profile.ps1 \
    /root/.config/powershell/Microsoft.PowerShell_profile.ps1
cp ./.devcontainer/powershell-profile.ps1 \
    /root/.config/powershell/Microsoft.VSCode_profile.ps1

# Make sure that VS Code is Git editor so we don't get trapped in GNU
# nano or similar.
if [ "$(git config core.editor)" != 'code --wait' ]; then
    git config --global core.editor 'code --wait'
fi

# Let's take a walk on the wild side and trust PSGallery.
pwsh -NoProfile -Command "Set-PSRepository -Name PSGallery -InstallationPolicy Trusted"

# Install posh-git so we get Git tab completion.
pwsh -NoProfile -Command "Install-Module -Name posh-git -Repository PSGallery"

# Install Oh My Posh so we, like Scott Hanselman, will love our prompts.
# Since we don't like to be administators on our machines, we pick a
# theme that doesn't require installation of additional fonts.
apt update && apt install unzip
curl -s https://ohmyposh.dev/install.sh | bash -s -- -d /usr/local/bin
mkdir -p /root/.oh-my-posh/themes
cp ./.devcontainer/oh-my-posh-theme.json /root/.oh-my-posh/themes/minimal.json

# Install CSharpier to save brainpower. (By reducing decision fatigue,
# kind of like Steve Jobs did with clothing, right?) And who knows,
# maybe we'll end up with a codebase that's uniform and easy to read.
dotnet tool install csharpier -g
