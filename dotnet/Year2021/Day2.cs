namespace Year2021;

public readonly struct Instruction
{
    public Instruction(int x, int y)
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
        var startingPoint = new Instruction(0, 0);
        var position = course
            .Select((instruction) => ParseInstruction(instruction))
            .Aggregate(startingPoint, (result, next) => AddInstructions(result, next));
        return position.X * position.Y;
    }

    private static Instruction ParseInstruction(string instruction)
    {
        var instructionParts = instruction.Split();
        var direction = instructionParts[0];
        var amount = Int32.Parse(instructionParts[1]);
        switch (direction)
        {
            case "forward":
                return new Instruction(amount, 0);
            case "down":
                return new Instruction(0, amount);
            case "up":
                return new Instruction(0, -amount);
            default:
                throw new Exception("Darn!");
        }
    }

    private static Instruction AddInstructions(Instruction p1, Instruction p2)
    {
        return new Instruction(p1.X + p2.X, p1.Y + p2.Y);
    }
}
