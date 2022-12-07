using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Year2021Test;

[TestClass]
public class Day2Test
{
    [TestMethod]
    public void SolvePart1_TestSample_ReturnsHorizontalPositionMultipliedWithDepth()
    {
        string[] input = new string[] { "forward 5", "down 5", "forward 8", "up 3", "down 8", "forward 2" };

        var result = Year2021.Day2.SolvePart1(input);

        Assert.AreEqual(150, result);
    }

    [TestMethod]
    public void SolvePart2_TestSample_ReturnsNrOfDepthIncreases()
    {
        string[] input = new string[] { "forward 5", "down 5", "forward 8", "up 3", "down 8", "forward 2" };

        var result = Year2021.Day2.SolvePart2(input);

        Assert.AreEqual(900, result);
    }
}
