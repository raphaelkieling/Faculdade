using Microsoft.EntityFrameworkCore;

namespace novo_exercicio.Models
{
    public class DbContexto : DbContext
    {
        public DbContexto(DbContextOptions<DbContexto> options):base(options)
        {}
        public DbSet<ContaDeLuz> ContaDeLuz { get; set; }
    }
}