Set-StrictMode -Version 'Latest'

function Get-Day2Part1Year2024 {
    $reports = Get-Content -Path "$PSScriptRoot/Day2Year2024.input"
    $reportResult = foreach ($rawReport in $reports) {
        $report = $rawReport -split ' ' | ForEach-Object { [int]$_ }
        $shouldIncrease = $null
        $levelResult = for ($i = 0; $i -lt $report.Length - 1; $i++) {
            if ($i -eq 0) {
                $shouldIncrease = $report[$i] -lt $report[$i + 1]
            }

            $diff = if ($shouldIncrease) {
                $report[$i + 1] - $report[$i]
            } else {
                $report[$i] - $report[$i + 1]
            }

            if ($diff -in @(1, 2, 3)) {
                'safe'
            } else {
                'unsafe'
            }
        }
        if ('unsafe' -in $levelResult) {
            'unsafe'
        } else {
            'safe'
        }
    }
    ($reportResult | Where-Object { $_ -eq 'safe' }).Count
}

$exportModuleMemberArgs = @{
    Function = (
        'Get-Day2Part1Year2024'
    )
}
Export-ModuleMember @exportModuleMemberArgs
