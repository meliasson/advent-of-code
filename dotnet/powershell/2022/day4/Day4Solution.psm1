Set-StrictMode -Version 'Latest'

function Get-Day4Part1 {
    param(
        $Path
    )

    $assignmentPairs = Get-Content -Path $Path

    $counter = 0
    foreach ($pair in $assignmentPairs) {
        $null = $pair -match '(\d+)-(\d+),(\d+)-(\d+)'

        $firstStart = [int]$matches[1]
        $firstEnd = [int]$matches[2]
        $secondStart = [int]$matches[3]
        $secondEnd = [int]$matches[4]

        $firsContainsSecond = $firstStart -le $secondStart -and $firstEnd -ge $secondEnd
        $secondContainsFirst = $secondStart -le $firstStart -and $secondEnd -ge $firstEnd
        if ($firsContainsSecond -or $secondContainsFirst) {
            $counter++
        }
    }
    $counter
}

function Get-Day4Part2 {
    param(
        $Path
    )

    $assignmentPairs = Get-Content -Path $Path

    $counter = 0
    foreach ($pair in $assignmentPairs) {
        $null = $pair -match '(\d+)-(\d+),(\d+)-(\d+)'

        $firstStart = [int]$matches[1]
        $firstEnd = [int]$matches[2]
        $secondStart = [int]$matches[3]
        $secondEnd = [int]$matches[4]

        $firstStartInSecond = $firstStart -ge $secondStart -and $firstStart -le $secondEnd
        $firstEndInSecond = $firstEnd -ge $secondStart -and $firstEnd -le $secondEnd
        $secondStartInFirst = $secondStart -ge $firstStart -and $secondStart -le $firstEnd
        $secondEndInFirst = $secondEnd -ge $firstStart -and $secondEnd -le $firstEnd
        if ($firstStartinSecond -or
            $firstEndInSecond -or
            $secondStartInFirst -or
            $secondEndInFirst) {
            $counter++
        }
    }
    $counter
}

$exportModuleMemberArgs = @{
    Function = (
        'Get-Day4Part1',
        'Get-Day4Part2'
    )
}
Export-ModuleMember @exportModuleMemberArgs
