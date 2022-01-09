using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Year2021Test;

[TestClass]
public class Day1Test
{
    [TestMethod]
    public void SolvePart1_OnlyIncreasingDepths_ReturnsNrOfDepthIncreases()
    {
        int[] input = new int[] { 1, 3, 100 };

        var result = Year2021.Day1.SolvePart1(input);

        Assert.AreEqual(2, result);
    }
}
