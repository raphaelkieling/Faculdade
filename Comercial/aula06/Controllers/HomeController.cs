using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using aula06.Models;

namespace aula06.Controllers
{
    public class HomeController : Controller
    {
        public string Index()
        {
            Paciente jaozinho = 
                new Paciente("Joao da silta",10,13);

            return jaozinho.nome + " tem "+ jaozinho.idade;
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
