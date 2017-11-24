using System;

namespace api
{
    public class Cliente
    {
        int id;
        string nome;

        public Cliente(int pId, string pNome)
        {
            this.id = pId;
            this.nome = pNome;
        }
    }
}
