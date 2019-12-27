using System;
using FirstApplication.Controllers;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace BasicTest
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            HomeController controller = new HomeController();
            double res = controller.Add(10, 10);
            Assert.AreEqual(res, 20);
        }
    }
}
