using System.Collections.Generic;
using crud_novo.Models;
using System.Linq;

namespace crud_pessoa.Models
{
    public class EventoRepository : IEventoRepository
    {
        private readonly DataContext _context;

        public EventoRepository(DataContext context){
            this._context = context;
        }

        public void Create(Evento evento)
        {
            this._context.Evento.Add(evento);
            this._context.SaveChanges();
        }

        public void Delete(int id)
        {
            var evento = this._context.Evento.Where(eventos => eventos.id == id).FirstOrDefault();
            this._context.Evento.Remove(evento);
            this._context.SaveChanges();
        }

        public void Update(Evento evento)
        {
            var first = this._context.Evento.Where(eventos => eventos.id == evento.id).FirstOrDefault();
            first.name = evento.name;
            first.address = evento.address;
            first.numeroAproximado = evento.numeroAproximado;
            this._context.SaveChanges();
        }

        public Evento GetById(int id)
        {
            return this._context.Evento.Find(id);
        }

        public List<Evento> GetAll()
        {
            return this._context.Evento.ToList();
        }
    }
}