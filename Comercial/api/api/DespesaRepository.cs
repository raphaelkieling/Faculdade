using System.Collections.Generic;
using api;

public class DespesaRepository
{
    public List<Despesa> getAll()
    {
        var list = new List<Despesa>();

        list.Add(new Despesa());

        return list;
    }


}