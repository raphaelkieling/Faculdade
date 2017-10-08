using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using injecao.Models;

namespace injecao.Controllers
{
    public class HomeController : Controller
    {
        public readonly IRenderSingleton singleton0;
        public readonly IRenderSingleton singleton1;

        public readonly IRenderScope scoped1;
        public readonly IRenderScope scoped2;
        public readonly IRenderTransient transient1;
        public readonly IRenderTransient transient2;
        public HomeController(
            IRenderSingleton singleton0,
            IRenderSingleton singleton1,
            IRenderScope scoped1,
            IRenderScope scoped2,
            IRenderTransient transient1,
            IRenderTransient transient2
        ){
            this.singleton0 = singleton0;
            this.singleton1 = singleton1;
            this.scoped1 = scoped1;
            this.scoped2 = scoped2;
            this.transient1 = transient1;
            this.transient2 = transient2;
        }
        public IActionResult Index()
        {
            ViewBag.Singletons = new string[2]
            {
                singleton0.GetGuidNow.ToString(),
                singleton1.GetGuidNow.ToString()
            };

            ViewBag.Scopeds = new string[2]
            {
                scoped1.GetGuidNow.ToString(),
                scoped2.GetGuidNow.ToString()
            };

            ViewBag.Transient = new string[2]
            {
                transient1.GetGuidNow.ToString(),
                transient2.GetGuidNow.ToString()
            };
            return View();
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
