Set-StrictMode -Version 'Latest'

BeforeAll {
    Import-Module -Force "$PSScriptRoot/Day4Year2024.psm1"

    function Get-PuzzleInput {

    }
}

Describe 'Day 4' {
    It 'part 1' {
        Mock -ModuleName 'Day4Year2024' -CommandName Get-Content -MockWith {
            'MMMSXXMASM'
            'MSAMXMSMSA'
            'AMXSXMAAMM'
            'MSAMASMSMX'
            'XMASAMXAMM'
            'XXAMMXXAMA'
            'SMSMSASXSS'
            'SAXAMASAAA'
            'MAMMMXMMMM'
            'MXMXAXMASX'
        }

        $result = Get-Day4Part1Year2024

        $result | Should -Be 18
    }
}
