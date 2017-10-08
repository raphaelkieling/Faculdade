using crud_pessoa.Models;
using Microsoft.EntityFrameworkCore;

namespace crud_novo.Models
{
    public class DataContext:DbContext
    {
        public DataContext(DbContextOptions<DataContext> options):base(options){

        }

        public DbSet<Evento> Evento{get;set;}
    }
}