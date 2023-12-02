function Get-Priority {
    param(
        $ItemType
    )

    $priority = @{
        a = 1
        b = 2
        c = 3
        d = 4
        e = 5
        f = 6
        g = 7
        h = 8
        i = 9
        j = 10
        k = 11
        l = 12
        m = 13
        n = 14
        o = 15
        p = 16
        q = 17
        r = 18
        s = 19
        t = 20
        u = 21
        v = 22
        w = 23
        x = 24
        y = 25
        z = 26
    }
    $result = $priority.$ItemType
    if (-not ($ItemType -ceq $ItemType.ToLower())) {
        $result += 26
    }
    $result
}

function Get-Day3Part1 {
    param(
        $Path
    )

    $rucksacks = Get-Content -Path $Path
    $rucksackPartitions = foreach ($rucksack in $rucksacks) {
        , ($rucksack.Substring(0, $rucksack.Length / 2),
            $rucksack.Substring($rucksack.Length / 2))
    }
    $commonItemTypes = foreach ($partition in $rucksackPartitions) {
        foreach ($item in $partition[0].ToCharArray()) {
            if ($partition[1].Contains([string]$item)) {
                [string]$item
                break
            }
        }
    }
    $itemPriorities = foreach ($itemType in $commonItemTypes) {
        Get-Priority -ItemType $itemType
    }
    ($itemPriorities | Measure-Object -Sum).Sum
}

function Get-Day3Part2 {
    param(
        $Path
    )

    $rucksacks = Get-Content -Path $Path
    $rucksackPartitions = for ($i = 0; $i -lt $rucksacks.Length; $i += 3) {
        , ($rucksacks[$i .. ($i + 2)])
    }
    $commonItemTypes = foreach ($partition in $rucksackPartitions) {
        foreach ($item in $partition[0].ToCharArray()) {
            if ($partition[1].Contains([string]$item) -and
                $partition[2].Contains([string]$item)) {
                [string]$item
                break
            }
        }
    }
    $itemPriorities = foreach ($itemType in $commonItemTypes) {
        Get-Priority -ItemType $itemType
    }
    ($itemPriorities | Measure-Object -Sum).Sum
}

$exportModuleMemberArgs = @{
    Function = (
        'Get-Day3Part1',
        'Get-Day3Part2'
    )
}
Export-ModuleMember @exportModuleMemberArgs
