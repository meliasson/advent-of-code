using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Year2021Test;

[TestClass]
public class Day1Test
{
    [TestMethod]
    public void SolvePart1_TestSample_ReturnsNrOfDepthIncreases()
    {
        int[] input = new int[] { 199, 200, 208, 210, 200, 207, 240, 269, 260, 263 };

        var result = Year2021.Day1.SolvePart1(input);

        Assert.AreEqual(7, result);
    }

    [TestMethod]
    public void SolvePart2_TestSample_ReturnsNrOfDepthIncreases()
    {
        int[] input = new int[] { 199, 200, 208, 210, 200, 207, 240, 269, 260, 263 };

        var result = Year2021.Day1.SolvePart2(input);

        Assert.AreEqual(5, result);
    }
}
