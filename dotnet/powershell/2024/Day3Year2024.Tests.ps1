Set-StrictMode -Version 'Latest'

BeforeAll {
    Import-Module -Force "$PSScriptRoot/Day3Year2024.psm1"

    function Get-PuzzleInput {

    }
}

Describe 'Day 3' {
    It 'part 1' {
        Mock -ModuleName 'Day3Year2024' -CommandName Get-Content -MockWith {
            'xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))'
        }

        $result = Get-Day3Part1Year2024

        $result | Should -Be 161
    }

    It 'part 2' {
        Mock -ModuleName 'Day3Year2024' -CommandName Get-Content -MockWith {
            "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"
        }

        $result = Get-Day3Part2Year2024

        $result | Should -Be 48
    }
}
