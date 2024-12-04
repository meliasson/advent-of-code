Set-StrictMode -Version 'Latest'

BeforeAll {
    Import-Module -Force "$PSScriptRoot/Day2Year2024.psm1"

    function Get-PuzzleInput {
        @(
            '7 6 4 2 1'
            '1 2 7 8 9'
            '9 7 6 2 1'
            '1 3 2 4 5'
            '8 6 4 4 1'
            '1 3 6 7 9'
        )
    }
}

Describe 'Day 2' {
    It 'part 1' {
        Mock -ModuleName 'Day2Year2024' -CommandName Get-Content -MockWith {
            Get-PuzzleInput
        }

        $result = Get-Day2Part1Year2024

        $result | Should -Be 2
    }
}
