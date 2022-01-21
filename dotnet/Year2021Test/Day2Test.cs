using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Year2021Test;

[TestClass]
public class Day2Test
{
    [TestMethod]
    public void SolvePart1_TestSample_ReturnsHorizontalPositionMultipledWithDepth()
    {
        string[] input = new string[] { "forward 5", "down 5", "forward 8", "up 3", "down 8", "forward 2" };

        var result = Year2021.Day2.SolvePart1(input);

        Assert.AreEqual(150, result);
    }

    // [TestMethod]
    // public void SolvePart2_TestSample_ReturnsNrOfDepthIncreases()
    // {
    //     int[] input = new int[] { 199, 200, 208, 210, 200, 207, 240, 269, 260, 263 };

    //     var result = Year2021.Day1.SolvePart2(input);

    //     Assert.AreEqual(5, result);
    // }
}
