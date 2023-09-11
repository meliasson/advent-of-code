# Initialize Oh My Posh.
oh-my-posh init pwsh | Invoke-Expression

# Let Oh My Posh use posh-git.
$env:POSH_GIT_ENABLED = $true
