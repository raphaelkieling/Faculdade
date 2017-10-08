using System.Collections.Generic;

namespace crud_pessoa.Models
{
    public class EventoRepository
    {
        public static List<Evento> eventos = new List<Evento>();

        public EventoRepository(){
            if(eventos.Count == 0)
                this.Fill();
        }
        public void Fill()
        {
            eventos.Add(new Evento(1,"Raphael","asdsa","321321",2));
            eventos.Add(new Evento(1,"Raphael","asdsa","321321",2));
            eventos.Add(new Evento(1,"Raphael","asdsa","321321",2));
            eventos.Add(new Evento(1,"Raphael","asdsa","321321",2));
            eventos.Add(new Evento(1,"Raphael","asdsa","321321",2));
            eventos.Add(new Evento(1,"Raphael","asdsa","321321",2));
            eventos.Add(new Evento(1,"Raphael","asdsa","321321",2));
            eventos.Add(new Evento(1,"Raphael","asdsa","321321",2));
            eventos.Add(new Evento(1,"Raphael","asdsa","321321",2));
        }
        public void Create(Evento evento)
        {
            eventos.Add(evento);
        }

        public void Delete(int id)
        {
            Evento toDelete = eventos.Find(a=>a.id == id);
            eventos.Remove(toDelete);
        }

        public void Update(Evento eventos)
        {

        }

        public Evento GetById(int id)
        {
            return null;
        }

        public List<Evento> GetAll()
        {
            return eventos;
        }

    }
}