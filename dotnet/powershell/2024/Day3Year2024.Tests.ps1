Set-StrictMode -Version 'Latest'

BeforeAll {
    Import-Module -Force "$PSScriptRoot/Day3Year2024.psm1"

    function Get-PuzzleInput {
        'xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))'
    }
}

Describe 'Day 3' {
    It 'part 1' {
        Mock -ModuleName 'Day3Year2024' -CommandName Get-Content -MockWith {
            Get-PuzzleInput
        }

        $result = Get-Day3Part1Year2024

        $result | Should -Be 161
    }
}
