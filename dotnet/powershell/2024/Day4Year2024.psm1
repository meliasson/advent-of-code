Set-StrictMode -Version 'Latest'

function Get-Day4Part1Year2024 {
    $wordSearch = Get-Content -Path "$PSScriptRoot/Day4Year2024.input"

    $times = for ($i = 0; $i -lt $wordSearch.Length; $i++) {
        for ($j = 0; $j -lt $wordSearch[$i].Length; $j++) {
            # East.
            if ($j -lt $wordSearch[$i].Length - 3) {
                if ($wordSearch[$i][$j] -eq 'x' -and
                    $wordSearch[$i][$j + 1] -eq 'm' -and
                    $wordSearch[$i][$j + 2] -eq 'a' -and
                    $wordSearch[$i][$j + 3] -eq 's') {
                    1
                }
            }

            # West.
            if ($j -ge 3) {
                if ($wordSearch[$i][$j] -eq 'x' -and
                    $wordSearch[$i][$j - 1] -eq 'm' -and
                    $wordSearch[$i][$j - 2] -eq 'a' -and
                    $wordSearch[$i][$j - 3] -eq 's') {
                    1
                }
            }

            # North.
            if ($i -ge 3) {
                if ($wordSearch[$i][$j] -eq 'x' -and
                    $wordSearch[$i - 1][$j] -eq 'm' -and
                    $wordSearch[$i - 2][$j] -eq 'a' -and
                    $wordSearch[$i - 3][$j] -eq 's') {
                    1
                }
            }

            # South.
            if ($i -lt $wordSearch.Length - 3) {
                if ($wordSearch[$i][$j] -eq 'x' -and
                    $wordSearch[$i + 1][$j] -eq 'm' -and
                    $wordSearch[$i + 2][$j] -eq 'a' -and
                    $wordSearch[$i + 3][$j] -eq 's') {
                    1
                }
            }

            # South-east.
            if ($i -lt $wordSearch.Length - 3 -and $j -lt $wordSearch[$i].Length - 3) {
                if ($wordSearch[$i][$j] -eq 'x' -and
                    $wordSearch[$i + 1][$j + 1] -eq 'm' -and
                    $wordSearch[$i + 2][$j + 2] -eq 'a' -and
                    $wordSearch[$i + 3][$j + 3] -eq 's') {
                    1
                }
            }

            # South-west.
            if ($i -lt $wordSearch.Length - 3 -and $j -ge 3) {
                if ($wordSearch[$i][$j] -eq 'x' -and
                    $wordSearch[$i + 1][$j - 1] -eq 'm' -and
                    $wordSearch[$i + 2][$j - 2] -eq 'a' -and
                    $wordSearch[$i + 3][$j - 3] -eq 's') {
                    1
                }
            }

            # North-east.
            if ($i -ge 3 -and $j -lt $wordSearch[$i].Length - 3) {
                if ($wordSearch[$i][$j] -eq 'x' -and
                    $wordSearch[$i - 1][$j + 1] -eq 'm' -and
                    $wordSearch[$i - 2][$j + 2] -eq 'a' -and
                    $wordSearch[$i - 3][$j + 3] -eq 's') {
                    1
                }
            }

            # North-west.
            if ($i -ge 3 -and $j -ge 3) {
                if ($wordSearch[$i][$j] -eq 'x' -and
                    $wordSearch[$i - 1][$j - 1] -eq 'm' -and
                    $wordSearch[$i - 2][$j - 2] -eq 'a' -and
                    $wordSearch[$i - 3][$j - 3] -eq 's') {
                    1
                }
            }
        }
    }

    $times.Length
}

$exportModuleMemberArgs = @{
    Function = (
        'Get-Day4Part1Year2024'
    )
}
Export-ModuleMember @exportModuleMemberArgs
