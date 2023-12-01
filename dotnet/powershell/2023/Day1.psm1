Set-StrictMode -Version 'Latest'

function Get-Day1Part1 {
    param(
        $Path
    )

    $calibrationDocument = Get-Content -Path $Path
    $sum = 0
    foreach ($line in $calibrationDocument) {
        $digits = $line -replace '\D'
        $sum += $digits[0] + $digits[-1]
    }
    $sum
}

$exportModuleMemberArgs = @{
    Function = (
        'Get-Day1Part1'
    )
}
Export-ModuleMember @exportModuleMemberArgs
