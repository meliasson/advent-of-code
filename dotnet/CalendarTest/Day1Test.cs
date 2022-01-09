using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace CalendarTest;

[TestClass]
public class Day1Test
{
    [TestMethod]
    public void SolvePart1_OnlyIncreasingDepths_ReturnsNrOfDepthIncreases()
    {
        int[] input = new int[] { 1, 3, 100 };

        var result = Calendar.Day1.SolvePart1(input);

        Assert.AreEqual(2, result);
    }
}
