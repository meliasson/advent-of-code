function Get-CaloriesPerElf {
    param(
        $Path
    )

    $result = @(0)
    Get-Content -Path $Path |
        ForEach-Object {
            [int]$_
        } |
        ForEach-Object {
            if ($_) {
                # Add calories for existing elf.
                $result[-1] += $_
            } else {
                # Add new elf.
                $result += $_
            }

        }
    $result
}

function Get-Day1Part1 {
    param(
        $Path
    )

    (
        Get-CaloriesPerElf -Path $Path |
            Sort-Object -Descending |
            Select-Object -First 1 |
            Measure-Object -Sum
    ).Sum
}

function Get-Day1Part2 {
    param(
        $Path
    )

    (
        Get-CaloriesPerElf -Path $Path |
            Sort-Object -Descending |
            Select-Object -First 3 |
            Measure-Object -Sum
    ).Sum
}

$exportModuleMemberArgs = @{
    Function = (
        'Get-Day1Part1',
        'Get-Day1Part2'
    )
}
Export-ModuleMember @exportModuleMemberArgs
