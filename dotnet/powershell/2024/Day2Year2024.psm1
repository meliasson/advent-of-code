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

function Get-Day2Part2Year2024 {
    $reports = Get-Content -Path "$PSScriptRoot/Day2Year2024.input"
    $reportResult = foreach ($rawReport in $reports) {
        $report = $rawReport -split ' ' | ForEach-Object { [int]$_ }

        $reportVariations = for ($i = 0; $i -lt $report.Length; $i++) {
            if ($i -eq 0) {
                , $report[1..($report.Length - 1)]
            } elseif ($i -eq ($report.Length - 1)) {
                , $report[0..($report.Length - 2)]
            } else {
                , ($report[0..($i - 1)] + $report[($i + 1)..($report.Length - 1)])
            }
        }

        $reportVariationResults = foreach ($reportVariation in $reportVariations) {
            $shouldIncrease = $null
            $levelResult = for ($i = 0; $i -lt $reportVariation.Length - 1; $i++) {
                if ($i -eq 0) {
                    $shouldIncrease = $reportVariation[$i] -lt $reportVariation[$i + 1]
                }

                $diff = if ($shouldIncrease) {
                    $reportVariation[$i + 1] - $reportVariation[$i]
                } else {
                    $reportVariation[$i] - $reportVariation[$i + 1]
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
        if ('safe' -in $reportVariationResults) {
            'safe'
        } else {
            'unsafe'
        }
    }
    ($reportResult | Where-Object { $_ -eq 'safe' }).Count
}

$exportModuleMemberArgs = @{
    Function = (
        'Get-Day2Part1Year2024',
        'Get-Day2Part2Year2024'
    )
}
Export-ModuleMember @exportModuleMemberArgs
