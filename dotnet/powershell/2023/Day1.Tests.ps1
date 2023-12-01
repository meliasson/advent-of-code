Set-StrictMode -Version 'Latest'

BeforeAll {
    Import-Module -Force "$PSScriptRoot/Day1.psm1"
}

Describe 'Day 1' {
    It 'part 1' {
        Mock -ModuleName 'Day1' Get-Content -MockWith {
            @(
                '1abc2'
                'pqr3stu8vwx'
                'a1b2c3d4e5f'
                'treb7uchet'
            )
        } -ParameterFilter {
            $Path -eq './path-to-input-file'
        }

        $result = Get-Day1Part1 -Path './path-to-input-file'

        $result | Should -Be 142
    }

    It 'part 2' {
        Mock -ModuleName 'Day1' Get-Content -MockWith {
            @(
                'two1nine'
                'eightwothree'
                'abcone2threexyz'
                'xtwone3four'
                '4nineeightseven2'
                'zoneight234'
                '7pqrstsixteen'
            )
        } -ParameterFilter {
            $Path -eq './path-to-input-file'
        }

        $result = Get-Day1Part2 -Path './path-to-input-file'

        $result | Should -Be 281
    }
}
