Set-StrictMode -Version 'Latest'

function Get-Day3Part1Year2024 {
    Get-Content -Path "$PSScriptRoot/Day3Year2024.input" -Raw |
        Select-String -Pattern 'mul\((\d*),(\d*)\)' -AllMatches |
        Select-Object -ExpandProperty 'Matches' |
        ForEach-Object {
            [int]$_.Groups[1].Value * [int]$_.Groups[2].Value
        } |
        Measure-Object -Sum |
        Select-Object -ExpandProperty 'Sum'
}

function Get-Day3Part2Year2024 {
    $enabled = $true
    Get-Content -Path "$PSScriptRoot/Day3Year2024.input" -Raw |
        Select-String -Pattern "mul\((\d*),(\d*)\)|(do\(\))|(don\'t\(\))" -AllMatches |
        Select-Object -ExpandProperty 'Matches' |
        ForEach-Object {
            if ($_.Groups[0].Value -eq 'do()') {
                $enabled = $true
                0
            } elseif ($_.Groups[0].Value -eq "don't()") {
                $enabled = $false
                0
            } elseif ($enabled) {
                [int]$_.Groups[1].Value * [int]$_.Groups[2].Value
            }
        } |
        Measure-Object -Sum |
        Select-Object -ExpandProperty 'Sum'
}

$exportModuleMemberArgs = @{
    Function = (
        'Get-Day3Part1Year2024',
        'Get-Day3Part2Year2024'
    )
}
Export-ModuleMember @exportModuleMemberArgs
