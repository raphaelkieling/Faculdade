using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using aulaOO.Models;

namespace aulaOO.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            Cliente cliente1 = new Cliente("Raphael",123);
            Cliente cliente2 = new Cliente("Crud",142214);

            CartaoDeCredito cCredito1 = new CartaoDeCredito(1,123,new DateTime(),cliente1);
            CartaoDeCredito cCredito2 = new CartaoDeCredito(2,123,new DateTime(),cliente2);

            Agencia agencia1 = new Agencia(2);
            Agencia agencia2 = new Agencia(3);

            Conta conta1 = new Conta(1,200);

            ViewBag.conta  = conta1;

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
