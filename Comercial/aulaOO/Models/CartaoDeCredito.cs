using System;
namespace aulaOO.Models
{
    public class CartaoDeCredito
    {
        public CartaoDeCredito(int id, int numero, DateTime dataValidade, Cliente cliente)
        {
            this.Id = id;
            this.Numero = numero;
            this.DataValidade = dataValidade;
            this.cliente = cliente;

        }
        public int Id { get; set; }
        public int Numero { get; set; }
        public DateTime DataValidade { get; set; }

        public Cliente cliente { get; set; }


    }
}