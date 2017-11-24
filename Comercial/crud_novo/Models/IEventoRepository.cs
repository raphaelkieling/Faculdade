using System.Collections.Generic;
using crud_pessoa.Models;

namespace crud_novo.Models
{
    public interface IEventoRepository
    {
         Evento GetById(int id);
         List<Evento> GetAll();

         void Delete(int id);
         void Update(Evento evento);
         void Create(Evento evento);
    }
}