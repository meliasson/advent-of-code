Set-StrictMode -Version 'Latest'

function Get-Day2Part1 {
    param(
        $Path
    )

    function Get-MaxNumberOfCubesRevealed {
        param(
            $Color,
            $Game
        )

        ($game |
            Select-String -Pattern "\d+ $Color" -AllMatches |
            Select-Object -ExpandProperty 'Matches' |
            ForEach-Object { [int]($_ -split ' ')[0] } |
            Measure-Object -Maximum).Maximum
    }

    $games = Get-Content -Path $Path
    $possibleGames = @()
    for ($i = 0; $i -lt $games.Count; $i++) {
        $maxRedCubeCount = Get-MaxNumberOfCubesRevealed -Color 'red' -Game $games[$i]
        $maxGreenCubeCount = Get-MaxNumberOfCubesRevealed -Color 'green' -Game $games[$i]
        $maxBlueCubeCount = Get-MaxNumberOfCubesRevealed -Color 'blue' -Game $games[$i]

        if ($maxRedCubeCount -le 12 -and
            $maxGreenCubeCount -le 13 -and
            $maxBlueCubeCount -le 14) {
            $possibleGames += $i + 1
        }
    }
    ($possibleGames | Measure-Object -Sum).Sum
}

$exportModuleMemberArgs = @{
    Function = (
        'Get-Day2Part1'
    )
}
Export-ModuleMember @exportModuleMemberArgs
