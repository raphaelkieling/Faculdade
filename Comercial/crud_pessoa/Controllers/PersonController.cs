using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using crud_pessoa.Models;

namespace crud_pessoa.Controllers
{
    public class PersonController : Controller
    {
        PersonRepository _repository = new PersonRepository();
        public IActionResult Index()
        {
            var people =_repository.GetAll();
            return View(people);
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Person person)
        {
            _repository.Create(person);
            return RedirectToAction("Index");
        }
        public IActionResult Delete(int id){
            this._repository.Delete(id);

            return RedirectToAction("Index");
        }
    }
}
