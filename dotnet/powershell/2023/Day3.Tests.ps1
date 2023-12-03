Set-StrictMode -Version 'Latest'

BeforeAll {
    Import-Module -Force "$PSScriptRoot/Day3.psm1"

    function Get-PuzzleInput {
        @(
            '467..114..'
            '...*......'
            '..35..633.'
            '......#...'
            '617*......'
            '.....+.58.'
            '..592.....'
            '......755.'
            '...$.*....'
            '.664.598..'
        )
    }
}

Describe 'Day 3' {
    It 'part 1' {
        Mock -ModuleName 'Day3' Get-Content -MockWith {
            Get-PuzzleInput
        } -ParameterFilter {
            $Path -eq './path-to-input-file'
        }

        $result = Get-Day3Part1 -Path './path-to-input-file'

        $result | Should -Be 4361
    }

    It 'part 2' {
        Mock -ModuleName 'Day3' Get-Content -MockWith {
            Get-PuzzleInput
        } -ParameterFilter {
            $Path -eq './path-to-input-file'
        }

        $result = Get-Day3Part2 -Path './path-to-input-file'

        $result | Should -Be 467835
    }
}
