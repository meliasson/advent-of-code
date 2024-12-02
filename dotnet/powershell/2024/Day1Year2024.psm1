Set-StrictMode -Version 'Latest'

function Get-Day1Part1Year2024 {
    $lists = Get-Content -Path "$PSScriptRoot/Day1Year2024.input"

    $firstList = $lists | ForEach-Object { ($_ -split '   ')[0] } | Sort-Object
    $secondList = $lists | ForEach-Object { ($_ -split '   ')[1] } | Sort-Object

    $distances = for ($i = 0; $i -lt $firstList.Length; $i++) {
        [math]::Abs($firstList[$i] - $secondList[$i])
    }

    ($distances | Measure-Object -Sum).Sum
}

$exportModuleMemberArgs = @{
    Function = (
        'Get-Day1Part1Year2024'
    )
}
Export-ModuleMember @exportModuleMemberArgs
