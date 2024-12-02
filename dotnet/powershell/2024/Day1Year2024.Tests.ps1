Set-StrictMode -Version 'Latest'

BeforeAll {
    Import-Module -Force "$PSScriptRoot/Day1Year2024.psm1"

    function Get-PuzzleInput {
        @(
            '3   4'
            '4   3'
            '2   5'
            '1   3'
            '3   9'
            '3   3'
        )
    }
}

Describe 'Day 1' {
    It 'part 1' {
        Mock -ModuleName 'Day1Year2024' -CommandName Get-Content -MockWith {
            Get-PuzzleInput
        }

        $result = Get-Day1Part1Year2024

        $result | Should -Be 11
    }

    It 'part 2' {
        Mock -ModuleName 'Day1Year2024' -CommandName 'Get-Content' -MockWith {
            Get-PuzzleInput
        }

        $result = Get-Day1Part2Year2024

        $result | Should -Be 31
    }
}
