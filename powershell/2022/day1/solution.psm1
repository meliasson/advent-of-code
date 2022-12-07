function Get-CaloriesPerElf {
    param(
        $Path
    )

    $elves = @(0)
    Get-Content -Path $Path |
        ForEach-Object {
            [int]$_
        } |
        ForEach-Object {
            if ($_) {
                $elves[-1] += $_
            } else {
                $elves += $_
            }

        }
    $elves
}

function Get-Day1Part1 {
    param(
        $Path
    )

    Get-CaloriesPerElf -Path $Path |
        Sort-Object -Descending |
        Select-Object -First 1 |
        Measure-Object -Sum
}

function Get-Day1Part2 {
    param(
        $Path
    )

    Get-CaloriesPerElf -Path $Path |
        Sort-Object -Descending |
        Select-Object -First 3 |
        Measure-Object -Sum
}

$exportModuleMemberArgs = @{
    Function = (
        'Get-Day1Part1',
        'Get-Day1Part2'
    )
}
Export-ModuleMember @exportModuleMemberArgs
