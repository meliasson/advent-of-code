$profileDir = '/home/vscode/.config/powershell'

# Create profile.
$regularProfile = 'Microsoft.PowerShell_profile.ps1'
$regularProfilePath = Join-Path $profileDir $regularProfile
$null = New-Item -Path $regularProfilePath -ItemType File -Force

# Make PowerShell extension use profile.
$extensionProfile = 'Microsoft.VSCode_profile.ps1'
$extensionProfilePath = Join-Path $profileDir $extensionProfile
$symbolicLinkArgs = @{
    ItemType = 'SymbolicLink'
    Path     = $extensionProfilePath
    Target   = $regularProfilePath
    Force    = $true
}
$null = New-Item @symbolicLinkArgs

# Switch to Oh My Posh prompt.
$contentArgs = @{
    Path  = $regularProfilePath
    Value = 'oh-my-posh init pwsh | Invoke-Expression'
}
Add-Content @contentArgs
