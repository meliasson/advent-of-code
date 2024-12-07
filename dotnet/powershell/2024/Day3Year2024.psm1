Set-StrictMode -Version 'Latest'

function Get-Day3Part1Year2024 {
    Get-Content -Path "$PSScriptRoot/Day3Year2024.input" -Raw |
        Select-String -Pattern 'mul\((\d*),(\d*)\)' -AllMatches |
        Select-Object -ExpandProperty 'Matches' |
        ForEach-Object {
            Write-Host ($_ | Out-String)
            [int]$_.Groups[1].Value * [int]$_.Groups[2].Value
        } |
        Measure-Object -Sum |
        Select-Object -ExpandProperty 'Sum'
}

$exportModuleMemberArgs = @{
    Function = (
        'Get-Day3Part1Year2024'
    )
}
Export-ModuleMember @exportModuleMemberArgs
