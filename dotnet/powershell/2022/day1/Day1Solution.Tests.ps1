BeforeAll {
    Import-Module "$PSScriptRoot/Day1Solution.psm1"

    function Get-PuzzleInput {
        @(
            '1000'
            '2000'
            '3000'
            ''
            '4000'
            ''
            '5000'
            '6000'
            ''
            '7000'
            '8000'
            '9000'
            ''
            '10000'
        )
    }
}

Describe 'Day 1' {
    It 'part 1' {
        Mock -ModuleName 'Day1Solution' Get-Content -MockWith {
            Get-PuzzleInput
        } -ParameterFilter {
            $Path -eq './path-to-input-file'
        }

        $result = Get-Day1Part1 -Path './path-to-input-file'

        $result | Should -Be 24000
    }

    It 'part 2' {
        Mock -ModuleName 'Day1Solution' Get-Content -MockWith {
            Get-PuzzleInput
        } -ParameterFilter {
            $Path -eq './path-to-input-file'
        }

        $result = Get-Day1Part2 -Path './path-to-input-file'

        $result | Should -Be 45000
    }
}
