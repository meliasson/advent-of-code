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

function Get-Day1Part2 {
    param(
        $Path
    )

    function Get-FirstDigit {
        param(
            $DigitDictionary,
            $Line
        )

        for ($i = 0; $i -lt $Line.Length; $i++) {
            $part = $line.Substring($i, $Line.Length - $i)
            foreach ($digit in $digitDictionary.Keys) {
                if ($part -match "^$digit") {
                    return $DigitDictionary.$digit
                }
            }
        }
    }

    function Get-LastDigit {
        param(
            $DigitDictionary,
            $Line
        )

        for ($i = $Line.Length - 1; $i -ge 0; $i--) {
            $part = $line.Substring(0, $i + 1)
            foreach ($digit in $digitDictionary.Keys) {
                if ($part -match "$digit$") {
                    return $DigitDictionary.$digit
                }
            }
        }
    }

    $calibrationDocument = Get-Content -Path $Path
    $digitDictionary = @{
        1     = '1'
        2     = '2'
        3     = '3'
        4     = '4'
        5     = '5'
        6     = '6'
        7     = '7'
        8     = '8'
        9     = '9'
        One   = '1'
        Two   = '2'
        Three = '3'
        Four  = '4'
        Five  = '5'
        Six   = '6'
        Seven = '7'
        Eight = '8'
        Nine  = '9'
    }
    $result = 0
    foreach ($line in $calibrationDocument) {
        $first = Get-FirstDigit -DigitDictionary $digitDictionary -Line $line
        $last = Get-LastDigit -DigitDictionary $digitDictionary -Line $line
        $result += $first + $last
    }
    $result
}

$exportModuleMemberArgs = @{
    Function = (
        'Get-Day1Part1',
        'Get-Day1Part2'
    )
}
Export-ModuleMember @exportModuleMemberArgs
