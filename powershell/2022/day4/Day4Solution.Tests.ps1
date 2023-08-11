BeforeAll {
    Import-Module "$PSScriptRoot/Day4Solution.psm1"

    function Get-PuzzleInput {
        @(
            '2-4,6-8',
            '2-3,4-5',
            '5-7,7-9',
            '2-8,3-7',
            '6-6,4-6',
            '2-6,4-8'
        )
    }
}

Describe 'Day 4' {
    It 'part 1' {
        Mock -ModuleName 'Day4Solution' Get-Content -MockWith {
            Get-PuzzleInput
        } -ParameterFilter {
            $Path -eq './path-to-input-file'
        }

        $result = Get-Day4Part1 -Path './path-to-input-file'

        $result | Should -Be 'foo'
    }

    It 'part 2' {
        Mock -ModuleName 'Day4Solution' Get-Content -MockWith {
            Get-PuzzleInput
        } -ParameterFilter {
            $Path -eq './path-to-input-file'
        }

        $result = Get-Day4Part2 -Path './path-to-input-file'

        $result | Should -Be 'bar'
    }
}
