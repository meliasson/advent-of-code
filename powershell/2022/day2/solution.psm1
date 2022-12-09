function Get-Day2Part1 {
    param(
        $Path
    )

    $rules = @{
        'A X' = 4
        'B X' = 1
        'C X' = 7
        'A Y' = 8
        'B Y' = 5
        'C Y' = 2
        'A Z' = 3
        'B Z' = 9
        'C Z' = 6
    }
    (
        Get-Content -Path $Path |
            ForEach-Object {
                $rules.$_
            } |
            Measure-Object -Sum
    ).Sum
}

function Get-Day2Part2 {
    param(
        $Path
    )

    $rules = @{
        'A X' = 3
        'B X' = 1
        'C X' = 2
        'A Y' = 4
        'B Y' = 5
        'C Y' = 6
        'A Z' = 8
        'B Z' = 9
        'C Z' = 7
    }
    (
        Get-Content -Path $Path |
            ForEach-Object {
                $rules.$_
            } |
            Measure-Object -Sum
    ).Sum
}

$exportModuleMemberArgs = @{
    Function = (
        'Get-Day2Part1',
        'Get-Day2Part2'
    )
}
Export-ModuleMember @exportModuleMemberArgs
