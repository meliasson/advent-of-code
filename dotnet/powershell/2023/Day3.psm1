Set-StrictMode -Version 'Latest'

function Get-Day3Part1 {
    param(
        $Path
    )

    # Pad schematic so we won't have to check boundaries.
    $schematic = Get-Content -Path $Path
    for ($rowIndex = 0; $rowIndex -lt $schematic.Count; $rowIndex++) {
        $schematic[$rowIndex] = $schematic[$rowIndex].Padleft($schematic[$rowIndex].Length + 1, '.').PadRight($schematic[$rowIndex].Length + 2, '.')
    }
    $schematic = , ('.' * $schematic[0].Length) + $schematic
    $schematic += '.' * $schematic[0].Length

    # Get all numbers with index and length.
    $allNumbers = @()
    foreach ($row in $schematic) {
        $numbersInRow = $row |
            Select-String -Pattern '\d+' -AllMatches |
            Select-Object -ExpandProperty 'Matches' |
            Select-Object -Property 'Value', 'Index', 'Length'
        $allNumbers += , $numbersInRow
    }

    # Get part numbers.
    $partNumbers = @()
    for ($rowIndex = 1; $rowIndex -lt $schematic.Count - 1; $rowIndex++) {
        for ($colIndex = 1; $colIndex -lt $schematic[$rowIndex].Length - 1; $colIndex++) {
            if ($schematic[$rowIndex][$colIndex] -match '\d|\.') {
                continue
            }
            # $north
            foreach ($number in $allNumbers[$rowIndex - 1]) {
                if ($colIndex -ge $number.Index -and $colIndex -le $number.Index + $number.Length - 1 -and !($number | Get-Member 'Taken')) {
                    $number | Add-Member –MemberType NoteProperty –Name Taken –Value $true
                    $partNumbers += $number.Value
                }
            }
            # $northeast
            foreach ($number in $allNumbers[$rowIndex - 1]) {
                if ($colIndex + 1 -ge $number.Index -and $colIndex + 1 -le $number.Index + $number.Length - 1 -and !($number | Get-Member 'Taken')) {
                    $number | Add-Member –MemberType NoteProperty –Name Taken –Value $true
                    $partNumbers += $number.Value
                }
            }
            # $east
            foreach ($number in $allNumbers[$rowIndex]) {
                if ($colIndex + 1 -ge $number.Index -and $colIndex + 1 -le $number.Index + $number.Length - 1 -and !($number | Get-Member 'Taken')) {
                    $number | Add-Member –MemberType NoteProperty –Name Taken –Value $true
                    $partNumbers += $number.Value
                }
            }
            # $southeast
            foreach ($number in $allNumbers[$rowIndex + 1]) {
                if ($colIndex + 1 -ge $number.Index -and $colIndex + 1 -le $number.Index + $number.Length - 1 -and !($number | Get-Member 'Taken')) {
                    $number | Add-Member –MemberType NoteProperty –Name Taken –Value $true
                    $partNumbers += $number.Value
                }
            }
            # $south = $schematic[$rowIndex + 1][$colIndex]
            foreach ($number in $allNumbers[$rowIndex + 1]) {
                if ($colIndex -ge $number.Index -and $colIndex -le $number.Index + $number.Length - 1 -and !($number | Get-Member 'Taken')) {
                    $number | Add-Member –MemberType NoteProperty –Name Taken –Value $true
                    $partNumbers += $number.Value
                }
            }
            # $southwest
            foreach ($number in $allNumbers[$rowIndex + 1]) {
                if ($colIndex - 1 -ge $number.Index -and $colIndex - 1 -le $number.Index + $number.Length - 1 -and !($number | Get-Member 'Taken')) {
                    $number | Add-Member –MemberType NoteProperty –Name Taken –Value $true
                    $partNumbers += $number.Value
                }
            }
            # $west
            foreach ($number in $allNumbers[$rowIndex]) {
                if ($colIndex - 1 -ge $number.Index -and $colIndex - 1 -le $number.Index + $number.Length - 1 -and !($number | Get-Member 'Taken')) {
                    $number | Add-Member –MemberType NoteProperty –Name Taken –Value $true
                    $partNumbers += $number.Value
                }
            }
            # $northwest
            foreach ($number in $allNumbers[$rowIndex - 1]) {
                if ($colIndex - 1 -ge $number.Index -and $colIndex - 1 -le $number.Index + $number.Length - 1 -and !($number | Get-Member 'Taken')) {
                    $number | Add-Member –MemberType NoteProperty –Name Taken –Value $true
                    $partNumbers += $number.Value
                }
            }
        }
    }
    ($partNumbers | Measure-Object -Sum).Sum
}

$exportModuleMemberArgs = @{
    Function = (
        'Get-Day3Part1'
    )
}
Export-ModuleMember @exportModuleMemberArgs
