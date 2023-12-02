Set-StrictMode -Version 'Latest'

function Get-Day2Part1 {
    param(
        $Path
    )

    $games = Get-Content -Path $Path
    $possibleGames = @()
    for ($i = 0; $i -lt $games.Count; $i++) {
        $maxCubeCount = Get-MaxCubeCount -Game $games[$i]
        if ($maxCubeCount.Red -le 12 -and
            $maxCubeCount.Green -le 13 -and
            $maxCubeCount.Blue -le 14) {
            $possibleGames += $i + 1
        }
    }
    ($possibleGames | Measure-Object -Sum).Sum
}

function Get-Day2Part2 {
    param(
        $Path
    )

    $games = Get-Content -Path $Path
    $powerOfGames = @()
    for ($i = 0; $i -lt $games.Count; $i++) {
        $maxCubeCount = Get-MaxCubeCount -Game $games[$i]
        $powerOfGames += $maxCubeCount.Red * $maxCubeCount.Green * $maxCubeCount.Blue

    }
    ($powerOfGames | Measure-Object -Sum).Sum
}

function Get-MaxCubeCount {
    param(
        $Game
    )

    @{
        Red   = Get-MaxCubeCountForColor -Color 'red' -Game $Game
        Green = Get-MaxCubeCountForColor -Color 'green' -Game $Game
        Blue  = Get-MaxCubeCountForColor -Color 'blue' -Game $Game
    }
}

function Get-MaxCubeCountForColor {
    param(
        $Color,
        $Game
    )

    ($Game |
        Select-String -Pattern "\d+ $Color" -AllMatches |
        Select-Object -ExpandProperty 'Matches' |
        ForEach-Object { [int]($_ -split ' ')[0] } |
        Measure-Object -Maximum).Maximum
}

$exportModuleMemberArgs = @{
    Function = (
        'Get-Day2Part1',
        'Get-Day2Part2'
    )
}
Export-ModuleMember @exportModuleMemberArgs
