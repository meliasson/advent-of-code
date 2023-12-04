Set-StrictMode -Version 'Latest'

function Get-Day4Part1 {
    Get-Content -Path 'Day4.input' | 
        ForEach-Object {
            @{
                winningNumbers = $_.Substring($_.IndexOf(':') + 1, $_.IndexOf('|') - $_.IndexOf(':') - 1).Trim().Split(' ', [System.StringSplitOptions]::RemoveEmptyEntries)
                myNumbers      = $_.Substring($_.IndexOf('|') + 1, $_.Length - $_.IndexOf('|') - 1).Trim().Split(' ', [System.StringSplitOptions]::RemoveEmptyEntries)
            }
        } | 
        ForEach-Object {
            $myNrOfWinners = 0
            foreach ($myNumber in $_.myNumbers) {
                if ($myNumber -in $_.winningNumbers) {
                    $myNrOfWinners += 1
                }
            }
            $myNrOfWinners
        } | 
        ForEach-Object {
            $_ -eq 0 ? 0 : [Math]::Pow(2, $_ - 1)
        } | 
        Measure-Object -Sum |
        Select-Object -ExpandProperty 'Sum'
}

function Get-Day4Part2 {
    $tmp = Get-Content -Path 'Day4.input' | 
        ForEach-Object {
            @{
                winningNumbers = $_.Substring($_.IndexOf(':') + 1, $_.IndexOf('|') - $_.IndexOf(':') - 1).Trim().Split(' ', [System.StringSplitOptions]::RemoveEmptyEntries)
                myNumbers      = $_.Substring($_.IndexOf('|') + 1, $_.Length - $_.IndexOf('|') - 1).Trim().Split(' ', [System.StringSplitOptions]::RemoveEmptyEntries)
            }
        } | 
        ForEach-Object {
            $myNrOfWinners = 0
            foreach ($myNumber in $_.myNumbers) {
                if ($myNumber -in $_.winningNumbers) {
                    $myNrOfWinners += 1
                }
            }
            @{
                copies  = 1
                matches = $myNrOfWinners
            }
        }

    for ($i = 0; $i -lt $tmp.Count; $i++) {
        for ($j = $i + 1; $j -le $tmp[$i].matches + $i; $j++) {
            $tmp[$j].copies += 1 * $tmp[$i].copies
        }
    }

    $tmp | 
        ForEach-Object { $_.copies } | 
        Measure-Object -Sum | 
        Select-Object -ExpandProperty 'Sum'
}

$exportModuleMemberArgs = @{
    Function = (
        'Get-Day4Part1',
        'Get-Day4Part2'
    )
}
Export-ModuleMember @exportModuleMemberArgs
