using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FirstApplication.Controllers
{
    public class HomeController
    {
        public double Add(double num1, double num2)
        {
            return num1 + num2;
        }
    }
}