function Get-Day4Part1 {
    param(
        $Path
    )
}

function Get-Day4Part2 {
    param(
        $Path
    )
}

$exportModuleMemberArgs = @{
    Function = (
        'Get-Day4Part1',
        'Get-Day4Part2'
    )
}
Export-ModuleMember @exportModuleMemberArgs
