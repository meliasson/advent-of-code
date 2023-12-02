Set-StrictMode -Version 'Latest'

BeforeAll {
    Import-Module -Force "$PSScriptRoot/Day2.psm1"

    function Get-PuzzleInput {
        @(
            'Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green'
            'Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue'
            'Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red'
            'Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red'
            'Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green'
        )
    }
}

Describe 'Day 2' {
    It 'part 1' {
        Mock -ModuleName 'Day2' Get-Content -MockWith {
            Get-PuzzleInput
        } -ParameterFilter {
            $Path -eq './path-to-input-file'
        }

        $result = Get-Day2Part1 -Path './path-to-input-file'

        $result | Should -Be 8
    }

    It 'part 2' {
        Mock -ModuleName 'Day2' Get-Content -MockWith {
            Get-PuzzleInput
        } -ParameterFilter {
            $Path -eq './path-to-input-file'
        }

        $result = Get-Day2Part2 -Path './path-to-input-file'

        $result | Should -Be 2286
    }
}
