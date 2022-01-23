namespace Year2021;

record Instruction(string Direction, int Amount);
record State(int X, int Y);
record State2(int X, int Y, int Aim);

public static class Day2
{
    public static int SolvePart1(string[] course) => course
        .Select((instruction) => ParseInstruction(instruction))
        .Aggregate(
            new State(0, 0),
            (state, instruction) => AddInstruction(state, instruction),
            (finalState) => finalState.X * finalState.Y);

    public static int SolvePart2(string[] course) => course
        .Select((instruction) => ParseInstruction(instruction))
        .Aggregate(
            new State2(0, 0, 0),
            (state, instruction) => AddInstruction2(state, instruction),
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

    private static State2 AddInstruction2(State2 state, Instruction instruction) => instruction.Direction switch
    {
        "forward" => state with { X = state.X + instruction.Amount, Y = state.Y + state.Aim * instruction.Amount },
        "down" => state with { Aim = state.Aim + instruction.Amount },
        "up" => state with { Aim = state.Aim - instruction.Amount },
        _ => throw new Exception(),
    };
}
