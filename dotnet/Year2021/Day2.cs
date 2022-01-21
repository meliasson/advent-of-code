namespace Year2021;

public readonly struct PositionDelta
{
    public PositionDelta(int x, int y)
    {
        X = x;
        Y = y;
    }

    public int X { get; }
    public int Y { get; }
}

public class Day2
{
    public static int SolvePart1(string[] course)
    {
        var position = course
            .Select((instruction) => ParseInstruction(instruction))
            .Aggregate(new PositionDelta(0, 0), (result, next) => AddPositionDeltas(result, next));
        return position.X * position.Y;
    }

    private static PositionDelta ParseInstruction(string instruction)
    {
        var instructionParts = instruction.Split();
        var direction = instructionParts[0];
        var amount = Int32.Parse(instructionParts[1]);
        switch (direction)
        {
            case "forward":
                return new PositionDelta(amount, 0);
            case "down":
                return new PositionDelta(0, amount);
            case "up":
                return new PositionDelta(0, -amount);
            default:
                throw new Exception("Darn!");
        }
    }

    private static PositionDelta AddPositionDeltas(PositionDelta p1, PositionDelta p2)
    {
        return new PositionDelta(p1.X + p2.X, p1.Y + p2.Y);
    }
}
