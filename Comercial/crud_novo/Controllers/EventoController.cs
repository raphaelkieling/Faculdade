using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using crud_pessoa.Models;

namespace crud_pessoa.Controllers
{
    public class EventoController : Controller
    {
        EventoRepository _repository = new EventoRepository();

        public IActionResult Index()
        {
            var evento =_repository.GetAll();
            return View(evento);
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Evento evento)
        {
            _repository.Create(evento);
            return RedirectToAction("Index");
        }
        
        public IActionResult Delete(int id){
            this._repository.Delete(id);

            return RedirectToAction("Index");
        }
    }
}
