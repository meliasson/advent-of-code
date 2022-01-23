namespace Year2021;

record Instruction(string Direction, int Amount);
record State(int X, int Y);

public static class Day2
{
    public static int SolvePart1(string[] course) => course
        .Select((instruction) => ParseInstruction(instruction))
        .Aggregate(
            new State(0, 0),
            (state, instruction) => AddInstruction(state, instruction),
            (finalState) => finalState.X * finalState.Y);

    private static Instruction ParseInstruction(string instruction)
    {
        var parts = instruction.Split();
        var direction = parts[0];
        var amount = int.Parse(parts[1]);
        return new Instruction(direction, amount);
    }

    private static State AddInstruction(State state, Instruction instruction) => instruction.Direction switch
    {
        "forward" => state with { X = state.X + instruction.Amount },
        "down" => state with { Y = state.Y + instruction.Amount },
        "up" => state with { Y = state.Y - instruction.Amount },
        _ => throw new Exception(),
    };
}
