Set-StrictMode -Version 'Latest'

function Get-Day5Part1 {
    # Get input.
    $almanac = Get-Content -Path 'Day5.input'
    $first, $rest = $almanac

    # Parse seeds.
    $seeds = $first |
        Select-String -Pattern '\d+' -AllMatches |
        Select-Object -ExpandProperty 'Matches' |
        Select-Object -ExpandProperty 'Value' |
        ForEach-Object { [long]$_ }

    # Parse maps.
    $maps = for ($i = 0; $i -lt $rest.Length; $i++) {
        if (-not $rest[$i].EndsWith(':')) {
            continue
        }
        $map = for ($j = $i + 1; $j -lt $rest.Length -and $rest[$j]; $j++) {
            $lineContent = $rest[$j] -split ' '
            @{
                DestinationRangeStart = [long]$lineContent[0]
                SourceRangeStart      = [long]$lineContent[1]
                RangeLength           = [long]$lineContent[2]
            }
        }
        , $map
    }

    # Calculate location numbers by traversing maps.
    $results = $seeds
    foreach ($map in $maps) {
        $handled = 1..($results.Length) | ForEach-Object { $false }
        foreach ($line in $map) {
            for ($i = 0; $i -lt $results.Length; $i++) {
                if ($handled[$i]) {
                    continue
                }
                if ($results[$i] -ge $line.SourceRangeStart -and
                    $results[$i] -lt $line.SourceRangeStart + $line.RangeLength) {
                    $results[$i] = $results[$i] - ($line.SourceRangeStart - $line.DestinationRangeStart)
                    $handled[$i] = $true
                }
            }
        }
    }

    # Pick lowest location number.
    $results | Measure-Object -Minimum | Select-Object -ExpandProperty 'Minimum'
}

function Get-Day5Part2 {
    # Get input.
    $almanac = Get-Content -Path 'Day5.input'
    $first, $rest = $almanac

    # Parse seeds.
    $seedRanges = $first |
        Select-String -Pattern '\d+' -AllMatches |
        Select-Object -ExpandProperty 'Matches' |
        Select-Object -ExpandProperty 'Value' |
        ForEach-Object { [long]$_ }
    $seeds = for ($i = 0; $i -lt $seedRanges.Length - 1; $i += 2) {
        # Works for test case.
        # [long]$seedRanges[$i]..($seedRanges[$i] + $seedRanges[$i + 1] - 1)
        for ($j = 0; $j -lt $seedRanges[$i + 1]; $j++) {
            $seedRanges[$i] + $j
        }
    }

    # Parse maps.
    $maps = for ($i = 0; $i -lt $rest.Length; $i++) {
        if (-not $rest[$i].EndsWith(':')) {
            continue
        }
        $map = for ($j = $i + 1; $j -lt $rest.Length -and $rest[$j]; $j++) {
            $lineContent = $rest[$j] -split ' '
            @{
                DestinationRangeStart = [long]$lineContent[0]
                SourceRangeStart      = [long]$lineContent[1]
                RangeLength           = [long]$lineContent[2]
            }
        }
        , $map
    }

    # Calculate location numbers by traversing maps.
    $results = $seeds
    foreach ($map in $maps) {
        $handled = 1..($results.Length) | ForEach-Object { $false }
        foreach ($line in $map) {
            for ($i = 0; $i -lt $results.Length; $i++) {
                if ($handled[$i]) {
                    continue
                }
                if ($results[$i] -ge $line.SourceRangeStart -and
                    $results[$i] -lt $line.SourceRangeStart + $line.RangeLength) {
                    $results[$i] = $results[$i] - ($line.SourceRangeStart - $line.DestinationRangeStart)
                    $handled[$i] = $true
                }
            }
        }
    }

    # Pick lowest location number.
    $results | Measure-Object -Minimum | Select-Object -ExpandProperty 'Minimum'
}

$exportModuleMemberArgs = @{
    Function = (
        'Get-Day5Part1',
        'Get-Day5Part2'
    )
}
Export-ModuleMember @exportModuleMemberArgs
