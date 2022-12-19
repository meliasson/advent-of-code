BeforeAll {

    Import-Module "$PSScriptRoot/Day3Solution.psm1"

    function Get-PuzzleInput {
        @(
            'vJrwpWtwJgWrhcsFMMfFFhFp'
            'jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL'
            'PmmdzqPrVvPwwTWBwg'
            'wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn'
            'ttgJtRGJQctTZtZT'
            'CrZsJsPPZsGzwwsLwLmpwMDw'
        )
    }
}

Describe 'Day 3' {
    It 'part 1' {
        Mock -ModuleName 'Day3Solution' Get-Content -MockWith {
            Get-PuzzleInput
        } -ParameterFilter {
            $Path -eq './path-to-input-file'
        }

        $result = Get-Day3Part1 -Path './path-to-input-file'

        $result | Should -Be 157
    }

    It 'part 2' {
        Mock -ModuleName 'Day3Solution' Get-Content -MockWith {
            Get-PuzzleInput
        } -ParameterFilter {
            $Path -eq './path-to-input-file'
        }

        $result = Get-Day3Part2 -Path './path-to-input-file'

        $result | Should -Be 70
    }
}
