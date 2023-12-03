Set-StrictMode -Version 'Latest'

BeforeAll {
    Import-Module -Force "$PSScriptRoot/Day3.psm1"
}

Describe 'Day 3' {
    It 'part 1' {
        Mock -ModuleName 'Day3' Get-Content -MockWith {
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
        } -ParameterFilter {
            $Path -eq './path-to-input-file'
        }

        $result = Get-Day3Part1 -Path './path-to-input-file'

        $result | Should -Be 4361
    }
}
