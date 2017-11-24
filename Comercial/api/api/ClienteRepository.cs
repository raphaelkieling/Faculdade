using System.Collections.Generic;
using api;

public class ClienteRepository
{
    public List<Cliente> getAll()
    {
        var list =  new List<Cliente>();

        list.Add(new Cliente(1,"Raphael"));
        list.Add(new Cliente(2,"Diego"));
        list.Add(new Cliente(3,"Damião"));
        list.Add(new Cliente(4,"Geromel"));

        return list;
    }
}