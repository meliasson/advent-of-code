namespace Calendar;
public class Day1
  {
    public static int[] ParseInput(IEnumerable<String> input)
    {
        return input.Select(depth => int.Parse(depth)).ToArray();
    }

    public static int SolvePart1(int[] depths)
    {
        return depths
            .Skip(1)
            .Select((x, i) => x > depths[i])
            .Count(x => x);
    }

    public static int SolvePart2(int[] depths)
    {
        return depths
            .Skip(3)
            .Select((x, i) => x > depths[i])
            .Count(x => x);
    }
}
