BeforeAll {
    Import-Module "$PSScriptRoot/Day2Solution.psm1"

    function Get-PuzzleInput {
        @(
            'A Y'
            'B X'
            'C Z'
        )
    }
}

Describe 'Day 2' {
    It 'part 1' {
        Mock -ModuleName 'Day2Solution' Get-Content -MockWith {
            Get-PuzzleInput
        }

        $result = Get-Day2Part1 -Path 'path'

        $result | Should -Be 15
    }

    It 'part 2' {
        Mock -ModuleName 'Day2Solution' Get-Content -MockWith {
            Get-PuzzleInput
        }

        $result = Get-Day2Part2 -Path 'path'

        $result | Should -Be 12
    }
}
