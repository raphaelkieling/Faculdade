using System.Collections.Generic;

namespace novo_exercicio.Models
{
     interface IContaDeLuzRepository
    {
        void Create(ContaDeLuz contaDeLuz);
        void Delete(int id);
        List<ContaDeLuz> GetAll();
        ContaDeLuz GetById(int id);
        ContaDeLuz Update(ContaDeLuz ContaDeLuz);
    }
}