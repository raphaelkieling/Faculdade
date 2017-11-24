using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using crud_pessoa.Models;
using crud_novo.Models;

namespace crud_pessoa.Controllers
{
    public class EventoController : Controller
    {
        private readonly IEventoRepository _eventoRepository;
        public EventoController(IEventoRepository eventoRepository)
        {
            this._eventoRepository = eventoRepository;
        }
        public IActionResult Index()
        {
            var evento =_eventoRepository.GetAll();
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
            _eventoRepository.Create(evento);
            return RedirectToAction("Index");
        }
        
        public IActionResult Delete(int id){
            _eventoRepository.Delete(id);
            return RedirectToAction("Index");
        }

        public IActionResult UpdatePage(int id) {
            var evento = _eventoRepository.GetById(1);
            ViewBag.evento = evento;
            return View();
        }
    }
}
