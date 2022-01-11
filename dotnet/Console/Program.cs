using System.Reflection;

using Year2021;

class Program
{
    static int Main(string[] args)
    {
        if (args.Length < 3)
        {
            var error = "Error: year, day, and part arguments required.";
            Console.WriteLine(error);
            var usage = "Usage: dotnet run --project Console/Console.csproj <year> <day> <part>";
            Console.WriteLine(usage);
            var example = "Example: dotnet run --project Console/Console.csproj Year2021 Day1 Part2";
            Console.WriteLine(example);
            return 1;
        }

        var yearArg = args[0];
        var dayArg = args[1];
        var partArg = args[2];

        Assembly calendar = Assembly.Load(yearArg);
        // It's interesting that we get a "Converting null literal
        // or possible null value to non-nullable type" warning when
        // telling `GetType` to throw if type isn't found. `GetType`
        // should have attributes for null-state static analysis? To
        // get rid of the warning, we resort to our own null check
        // for now.
        Type day = calendar.GetType($"{yearArg}.{dayArg}"/*, true*/) ??
            throw new Exception(
                $"Failed to get {yearArg}.{dayArg}. Not implemented?"
            );

        var input = System.IO.File.ReadLines($"{yearArg}/{dayArg}Input");
        MethodInfo inputParser = day.GetMethod("ParseInput") ??
            throw new Exception(
                $"Failed to get {yearArg}.{dayArg}.ParseInput. Not implemented?"
            );
        var parsedInput = inputParser.Invoke(null, new object[] { input }) ??
            throw new Exception("Parser returned null.");

        MethodInfo solver = day.GetMethod($"Solve{partArg}") ??
            throw new Exception(
                $"Failed to get {yearArg}.{dayArg}.{partArg}. Not implemented?"
            );
        var result = solver.Invoke(null, new object[] { parsedInput }) ??
            throw new Exception("Solver returned null.");
        Console.WriteLine(result);

        return 0;
    }
}
